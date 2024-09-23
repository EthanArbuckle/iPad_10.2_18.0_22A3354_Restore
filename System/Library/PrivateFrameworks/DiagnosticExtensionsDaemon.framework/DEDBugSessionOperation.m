@implementation DEDBugSessionOperation

- (NSString)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v11.receiver = self;
  v11.super_class = (Class)DEDBugSessionOperation;
  -[DEDBugSessionOperation description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[DEDBugSessionOperation type](self, "type");
  if (v5 > 99)
  {
    switch(v5)
    {
      case 100:
        v6 = "Notify";
        goto LABEL_15;
      case 1000:
        v6 = "Finish";
        goto LABEL_15;
      case 2000:
        v6 = "Cancel";
        goto LABEL_15;
    }
LABEL_14:
    v6 = "Unknown";
    goto LABEL_15;
  }
  if (!v5)
  {
    v6 = "Kill";
    goto LABEL_15;
  }
  if (v5 == 1)
  {
    v6 = "Collect";
    goto LABEL_15;
  }
  if (v5 != 2)
    goto LABEL_14;
  v6 = "CollectDefer";
LABEL_15:
  -[DEDBugSessionOperation identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DEDBugSessionOperation options](self, "options");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ type: [%s] id: [%@] options: %@"), v4, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

+ (id)hashingKeyWithId:(id)a3 type:(int64_t)a4
{
  const char *v4;

  if (a4 > 99)
  {
    switch(a4)
    {
      case 100:
        v4 = "Notify";
        return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s(%@)"), v4, a3);
      case 1000:
        v4 = "Finish";
        return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s(%@)"), v4, a3);
      case 2000:
        v4 = "Cancel";
        return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s(%@)"), v4, a3);
    }
LABEL_14:
    v4 = "Unknown";
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s(%@)"), v4, a3);
  }
  if (!a4)
  {
    v4 = "Kill";
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s(%@)"), v4, a3);
  }
  if (a4 == 1)
  {
    v4 = "Collect";
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s(%@)"), v4, a3);
  }
  if (a4 != 2)
    goto LABEL_14;
  v4 = "CollectDefer";
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s(%@)"), v4, a3);
}

- (id)hashingKey
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[DEDBugSessionOperation identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hashingKeyWithId:type:", v4, -[DEDBugSessionOperation type](self, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DEDBugSessionOperation)initWithCoder:(id)a3
{
  id v4;
  DEDBugSessionOperation *v5;
  uint64_t v6;
  NSString *identifier;
  void *v8;
  uint64_t v9;
  NSDictionary *options;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DEDBugSessionOperation;
  v5 = -[DEDBugSessionOperation init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionOpID"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("sessionOpType"));
    +[DEDBugSessionOperation archivedClasses](DEDBugSessionOperation, "archivedClasses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("sessionOpOptions"));
    v9 = objc_claimAutoreleasedReturnValue();
    options = v5->_options;
    v5->_options = (NSDictionary *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[DEDBugSessionOperation identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("sessionOpID"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[DEDBugSessionOperation type](self, "type"), CFSTR("sessionOpType"));
  -[DEDBugSessionOperation options](self, "options");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("sessionOpOptions"));

}

+ (id)archivedClasses
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x24BDBCF20];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, objc_opt_class(), 0);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setOptions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end
