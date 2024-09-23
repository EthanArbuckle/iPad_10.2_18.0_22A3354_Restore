@implementation ASDTIOServiceID

- (id)initForIdentifier:(id)a3 andClientType:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  ASDTIOServiceID *v7;
  ASDTIOServiceID *v8;
  ASDTIOServiceID *v9;
  objc_super v11;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ASDTIOServiceID;
  v7 = -[ASDTIOServiceID init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    if (!v6)
    {
      v9 = 0;
      goto LABEL_6;
    }
    -[ASDTIOServiceID setIdentifier:](v7, "setIdentifier:", v6);
    -[ASDTIOServiceID setClientType:](v8, "setClientType:", v4);
  }
  v9 = v8;
LABEL_6:

  return v9;
}

+ (id)forIdentifier:(id)a3 andClientType:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  void *v7;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initForIdentifier:andClientType:", v6, v4);

  return v7;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[ASDTIOServiceID identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = v4 ^ -[ASDTIOServiceID clientType](self, "clientType");

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[ASDTIOServiceID identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initForIdentifier:andClientType:", v5, -[ASDTIOServiceID clientType](self, "clientType"));

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  ASDTIOServiceID *v4;
  ASDTIOServiceID *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  char v9;

  v4 = (ASDTIOServiceID *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[ASDTIOServiceID identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASDTIOServiceID identifier](v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqualToString:", v7))
      {
        v8 = -[ASDTIOServiceID clientType](self, "clientType");
        v9 = v8 == -[ASDTIOServiceID clientType](v5, "clientType");
      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v9 = 0;
        goto LABEL_12;
      }
      -[ASDTIOServiceID identifier](self, "identifier");
      v5 = (ASDTIOServiceID *)objc_claimAutoreleasedReturnValue();
      v9 = -[ASDTIOServiceID isEqualToString:](v5, "isEqualToString:", v4);
    }

  }
LABEL_12:

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[ASDTIOServiceID identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%u"), v4, -[ASDTIOServiceID clientType](self, "clientType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (unsigned)clientType
{
  return self->_clientType;
}

- (void)setClientType:(unsigned int)a3
{
  self->_clientType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
