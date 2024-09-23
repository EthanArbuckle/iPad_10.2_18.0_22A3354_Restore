@implementation HMDTargetButtonConfiguration

- (HMDTargetButtonConfiguration)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMDTargetButtonConfiguration)initWithType:(int64_t)a3 identifier:(id)a4 name:(id)a5
{
  id v8;
  id v9;
  HMDTargetButtonConfiguration *v10;
  HMDTargetButtonConfiguration *v11;
  uint64_t v12;
  NSString *name;
  objc_super v15;

  v8 = a4;
  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDTargetButtonConfiguration;
  v10 = -[HMDTargetButtonConfiguration init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_type = a3;
    v10->_identifier = objc_msgSend(v8, "unsignedCharValue");
    v12 = objc_msgSend(v9, "copy");
    name = v11->_name;
    v11->_name = (NSString *)v12;

  }
  return v11;
}

- (id)buttonName
{
  int64_t v3;
  __CFString *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;

  if ((unint64_t)(-[HMDTargetButtonConfiguration type](self, "type") - 1) > 0xC)
  {
    -[HMDTargetButtonConfiguration name](self, "name");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v7 = CFSTR("Undefined");
    if (v5)
      v7 = (__CFString *)v5;
    v8 = v7;

  }
  else
  {
    v3 = -[HMDTargetButtonConfiguration type](self, "type");
    if ((unint64_t)(v3 - 1) > 0xC)
      v4 = CFSTR("Unknown");
    else
      v4 = off_24E77E048[v3 - 1];
    v8 = v4;
  }
  return v8;
}

- (id)description
{
  void *v3;
  unsigned int v4;
  int64_t v5;
  __CFString *v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = -[HMDTargetButtonConfiguration identifier](self, "identifier");
  v5 = -[HMDTargetButtonConfiguration type](self, "type");
  if ((unint64_t)(v5 - 1) > 0xC)
    v6 = CFSTR("Unknown");
  else
    v6 = off_24E77E048[v5 - 1];
  v7 = v4;
  v8 = v6;
  -[HMDTargetButtonConfiguration buttonName](self, "buttonName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("(%lu, %@, %@)"), v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)shortDescription
{
  void *v3;
  unsigned int v4;
  int64_t v5;
  __CFString *v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = -[HMDTargetButtonConfiguration identifier](self, "identifier");
  v5 = -[HMDTargetButtonConfiguration type](self, "type");
  if ((unint64_t)(v5 - 1) > 0xC)
    v6 = CFSTR("Unknown");
  else
    v6 = off_24E77E048[v5 - 1];
  v7 = v4;
  v8 = v6;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%lu/%@"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  HMDTargetButtonConfiguration *v4;
  HMDTargetButtonConfiguration *v5;
  HMDTargetButtonConfiguration *v6;
  HMDTargetButtonConfiguration *v7;
  int v8;
  int64_t v9;
  BOOL v10;

  v4 = (HMDTargetButtonConfiguration *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6 = v5;
      else
        v6 = 0;
      v7 = v6;

      if (v7
        && (v8 = -[HMDTargetButtonConfiguration identifier](self, "identifier"),
            v8 == -[HMDTargetButtonConfiguration identifier](v7, "identifier")))
      {
        v9 = -[HMDTargetButtonConfiguration type](self, "type");
        v10 = v9 == -[HMDTargetButtonConfiguration type](v7, "type");
      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  int64_t v3;

  v3 = -[HMDTargetButtonConfiguration type](self, "type");
  return -[HMDTargetButtonConfiguration identifier](self, "identifier") | (unint64_t)(v3 << 8);
}

- (unsigned)identifier
{
  return self->_identifier;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
