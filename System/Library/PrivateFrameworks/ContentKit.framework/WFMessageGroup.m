@implementation WFMessageGroup

- (WFMessageGroup)initWithName:(id)a3 identifier:(id)a4
{
  id v7;
  id v8;
  WFMessageGroup *v9;
  uint64_t v10;
  NSString *name;
  uint64_t v12;
  NSString *identifier;
  WFMessageGroup *v14;
  void *v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFMessageGroup.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

  }
  v17.receiver = self;
  v17.super_class = (Class)WFMessageGroup;
  v9 = -[WFMessageGroup init](&v17, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v7, "copy");
    name = v9->_name;
    v9->_name = (NSString *)v10;

    v12 = objc_msgSend(v8, "copy");
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v12;

    v14 = v9;
  }

  return v9;
}

- (WFMessageGroup)initWithSpeakableString:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  WFMessageGroup *v8;
  void *v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFMessageGroup.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("speakableString"));

  }
  objc_msgSend(v5, "spokenPhrase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "vocabularyIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WFMessageGroup initWithName:identifier:](self, "initWithName:identifier:", v6, v7);

  return v8;
}

- (WFMessageGroup)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  WFMessageGroup *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[WFMessageGroup initWithName:identifier:](self, "initWithName:identifier:", v5, v6);

    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WFMessageGroup name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("name"));

  -[WFMessageGroup identifier](self, "identifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("identifier"));

}

- (id)wfSerializedRepresentation
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_new();
  -[WFMessageGroup name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("name"));

  -[WFMessageGroup identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v5, CFSTR("identifier"));

  return v3;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[WFMessageGroup identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[WFMessageGroup name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ objc_msgSend(v5, "hash") ^ 0xA709;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  WFMessageGroup *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;

  v4 = (WFMessageGroup *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[WFMessageGroup identifier](v4, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFMessageGroup identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);
      if ((v7 & 1) != 0)
        goto LABEL_4;
      -[WFMessageGroup identifier](v4, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v10 = 0;
LABEL_13:

        goto LABEL_14;
      }
      -[WFMessageGroup identifier](self, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
LABEL_4:
        -[WFMessageGroup name](v4, "name");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFMessageGroup name](self, "name");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqual:", v9);

        if ((v7 & 1) != 0)
        {
LABEL_14:

          goto LABEL_15;
        }
        v11 = 0;
      }
      else
      {
        v10 = 0;
      }

      v12 = 0;
      goto LABEL_13;
    }
    v10 = 0;
  }
LABEL_15:

  return v10;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)objectWithWFSerializedRepresentation:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  id v13;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_opt_class();
  v6 = v4;
  if (!v6)
  {
LABEL_12:
    v12 = 0;
    goto LABEL_17;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    getWFGeneralLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      v15 = 136315906;
      v16 = "WFEnforceClass";
      v17 = 2114;
      v18 = v6;
      v19 = 2114;
      v20 = (id)objc_opt_class();
      v21 = 2114;
      v22 = v5;
      v11 = v20;
      _os_log_impl(&dword_20BBAD000, v10, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v15, 0x2Au);

    }
    goto LABEL_12;
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("identifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v8;
      else
        v9 = 0;
    }
    else
    {
      v9 = 0;
    }
    v13 = v9;

    v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:identifier:", v7, v13);
  }
  else
  {
    v12 = 0;
  }

LABEL_17:
  return v12;
}

@end
