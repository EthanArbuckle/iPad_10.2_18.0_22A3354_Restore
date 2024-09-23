@implementation WFVPNConfiguration

- (WFVPNConfiguration)initWithIdentifier:(id)a3 title:(id)a4 appDescriptor:(id)a5
{
  id v9;
  id v10;
  id v11;
  WFVPNConfiguration *v12;
  WFVPNConfiguration *v13;
  uint64_t v14;
  NSString *title;
  WFVPNConfiguration *v16;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)WFVPNConfiguration;
  v12 = -[WFVPNConfiguration init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    v14 = objc_msgSend(v10, "copy");
    title = v13->_title;
    v13->_title = (NSString *)v14;

    objc_storeStrong((id *)&v13->_appDescriptor, a5);
    v16 = v13;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  WFVPNConfiguration *v4;
  WFVPNConfiguration *v5;
  WFVPNConfiguration *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (WFVPNConfiguration *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[WFVPNConfiguration identifier](self, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFVPNConfiguration identifier](v6, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqual:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[WFVPNConfiguration identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)wfSerializedRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v12[0] = CFSTR("identifier");
  -[WFVPNConfiguration identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = CFSTR("title");
  v13[0] = v4;
  -[WFVPNConfiguration title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  -[WFVPNConfiguration appDescriptor](self, "appDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[WFVPNConfiguration appDescriptor](self, "appDescriptor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "serializedRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v10, CFSTR("appDescriptor"));

  }
  return v7;
}

- (WFVPNConfiguration)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  WFVPNConfiguration *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appDescriptor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[WFVPNConfiguration initWithIdentifier:title:appDescriptor:](self, "initWithIdentifier:title:appDescriptor:", v5, v6, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[WFVPNConfiguration identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[WFVPNConfiguration title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("title"));

  -[WFVPNConfiguration appDescriptor](self, "appDescriptor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("appDescriptor"));

}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (INAppDescriptor)appDescriptor
{
  return self->_appDescriptor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appDescriptor, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)objectWithWFSerializedRepresentation:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = (objc_class *)MEMORY[0x24BDD1880];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "objectForKey:", CFSTR("identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithUUIDString:", v7);

  objc_msgSend(v5, "objectForKey:", CFSTR("title"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("appDescriptor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9BD0]), "initWithSerializedRepresentation:", v10);
  else
    v11 = 0;
  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:title:appDescriptor:", v8, v9, v11);

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
