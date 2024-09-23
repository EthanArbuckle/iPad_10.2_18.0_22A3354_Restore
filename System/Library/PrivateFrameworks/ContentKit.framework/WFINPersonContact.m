@implementation WFINPersonContact

- (WFINPersonContact)initWithINPerson:(id)a3
{
  id v6;
  WFINPersonContact *v7;
  WFINPersonContact *v8;
  WFINPersonContact *v9;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFINPersonContact.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("person"));

  }
  v12.receiver = self;
  v12.super_class = (Class)WFINPersonContact;
  v7 = -[WFINPersonContact init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_person, a3);
    v9 = v8;
  }

  return v8;
}

- (id)wfName
{
  void *v2;
  void *v3;

  -[WFINPersonContact person](self, "person");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)wfSerializedRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  const __CFString *v11;
  void *v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDD9E00]);
  -[WFINPersonContact person](self, "person");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "encodeObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  if (v6)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("WFIsINPerson"));
    v11 = CFSTR("link.contentkit.contact");
    v12 = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    getWFWFContactLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[WFINPersonContact person](self, "person");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v14 = "-[WFINPersonContact wfSerializedRepresentation]";
      v15 = 2112;
      v16 = v9;
      _os_log_impl(&dword_20BBAD000, v8, OS_LOG_TYPE_ERROR, "%s Failed to JSON encode INPerson: %@", buf, 0x16u);

    }
    v7 = 0;
  }

  return v7;
}

- (WFINPersonContact)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  WFINPersonContact *v8;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_person);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[WFINPersonContact initWithINPerson:](self, "initWithINPerson:", v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WFINPersonContact person](self, "person");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_person);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, v5);

}

- (INPerson)person
{
  return self->_person;
}

- (void)setPerson:(id)a3
{
  objc_storeStrong((id *)&self->_person, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_person, 0);
}

+ (id)contactWithPerson:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithINPerson:", v4);

  return v5;
}

+ (id)objectWithWFSerializedRepresentation:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (objc_class *)MEMORY[0x24BDD9DF8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("link.contentkit.contact"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "decodeObjectOfClass:from:", objc_opt_class(), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(a1, "contactWithPerson:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
