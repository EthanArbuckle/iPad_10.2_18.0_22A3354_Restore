@implementation ILMessageFilterQueryResponse

- (ILMessageFilterQueryResponse)init
{
  -[ILMessageFilterQueryResponse setAction:](self, "setAction:", 0);
  -[ILMessageFilterQueryResponse setSubAction:](self, "setSubAction:", 0);
  return self;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  ILMessageFilterAction v5;
  ILMessageFilterSubAction v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  v5 = -[ILMessageFilterQueryResponse action](self, "action");
  v6 = -[ILMessageFilterQueryResponse subAction](self, "subAction");
  -[ILMessageFilterQueryResponse version](self, "version");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p action=%ld subAction=%ld version=%@>"), v4, self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[ILMessageFilterQueryResponse isEqualToQueryResponse:](self, "isEqualToQueryResponse:", v4);

  return v5;
}

- (BOOL)isEqualToQueryResponse:(id)a3
{
  id v4;
  ILMessageFilterAction v5;
  ILMessageFilterSubAction v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  v4 = a3;
  v5 = -[ILMessageFilterQueryResponse action](self, "action");
  if (v5 == objc_msgSend(v4, "action")
    && (v6 = -[ILMessageFilterQueryResponse subAction](self, "subAction"), v6 == objc_msgSend(v4, "subAction")))
  {
    -[ILMessageFilterQueryResponse version](self, "version");
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "version");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (v7 | v8) == 0;
    if (v8)
      v9 = objc_msgSend((id)v7, "isEqualToString:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  ILMessageFilterAction v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  v3 = -[ILMessageFilterQueryResponse action](self, "action");
  v4 = -[ILMessageFilterQueryResponse subAction](self, "subAction") ^ v3;
  -[ILMessageFilterQueryResponse version](self, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ objc_msgSend(v5, "hash");

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ILMessageFilterQueryResponse)initWithCoder:(id)a3
{
  id v4;
  ILMessageFilterQueryResponse *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSString *version;

  v4 = a3;
  v5 = -[ILMessageFilterQueryResponse init](self, "init");
  if (v5)
  {
    NSStringFromSelector(sel_action);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_action = objc_msgSend(v4, "decodeIntegerForKey:", v6);

    NSStringFromSelector(sel_subAction);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_subAction = objc_msgSend(v4, "decodeIntegerForKey:", v7);

    v8 = objc_opt_class();
    NSStringFromSelector(sel_version);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    version = v5->_version;
    v5->_version = (NSString *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  ILMessageFilterAction v5;
  void *v6;
  ILMessageFilterSubAction v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = -[ILMessageFilterQueryResponse action](self, "action");
  NSStringFromSelector(sel_action);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v5, v6);

  v7 = -[ILMessageFilterQueryResponse subAction](self, "subAction");
  NSStringFromSelector(sel_subAction);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v7, v8);

  -[ILMessageFilterQueryResponse version](self, "version");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_version);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, v9);

}

- (ILMessageFilterAction)action
{
  return self->_action;
}

- (void)setAction:(ILMessageFilterAction)action
{
  self->_action = action;
}

- (ILMessageFilterSubAction)subAction
{
  return self->_subAction;
}

- (void)setSubAction:(ILMessageFilterSubAction)subAction
{
  self->_subAction = subAction;
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
}

@end
