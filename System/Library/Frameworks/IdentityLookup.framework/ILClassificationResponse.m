@implementation ILClassificationResponse

- (ILClassificationResponse)initWithClassificationAction:(ILClassificationAction)action
{
  ILClassificationResponse *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ILClassificationResponse;
  result = -[ILClassificationResponse init](&v5, sel_init);
  if (result)
    result->_action = action;
  return result;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  ILClassificationAction v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  v5 = -[ILClassificationResponse action](self, "action");
  -[ILClassificationResponse userInfo](self, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ILClassificationResponse userString](self, "userString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p action=%ld, userInfo=%@, userString=%@>"), v4, self, v5, v6, v7);
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
    && -[ILClassificationResponse isEqualToResponse:](self, "isEqualToResponse:", v4);

  return v5;
}

- (BOOL)isEqualToResponse:(id)a3
{
  id v4;
  ILClassificationAction v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  v4 = a3;
  v5 = -[ILClassificationResponse action](self, "action");
  if (v5 == objc_msgSend(v4, "action"))
  {
    -[ILClassificationResponse userInfo](self, "userInfo");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userInfo");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 | v7 && !objc_msgSend((id)v6, "isEqual:", v7))
    {
      v10 = 0;
    }
    else
    {
      -[ILClassificationResponse userString](self, "userString");
      v8 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "userString");
      v9 = objc_claimAutoreleasedReturnValue();
      if (v8 | v9)
        v10 = objc_msgSend((id)v8, "isEqual:", v9);
      else
        v10 = 1;

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  ILClassificationAction v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  v3 = -[ILClassificationResponse action](self, "action");
  -[ILClassificationResponse userInfo](self, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  -[ILClassificationResponse userString](self, "userString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ILClassificationResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  ILClassificationResponse *v18;
  ILClassificationResponse *v19;

  v4 = a3;
  NSStringFromSelector(sel_action);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", v5);

  v7 = (void *)MEMORY[0x24BDBCF20];
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_userInfo);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_opt_class();
  NSStringFromSelector(sel_userString);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = -[ILClassificationResponse initWithClassificationAction:](self, "initWithClassificationAction:", v6);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_userInfo, v14);
    objc_storeStrong((id *)&v19->_userString, v17);
  }

  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  ILClassificationAction v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = -[ILClassificationResponse action](self, "action");
  NSStringFromSelector(sel_action);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v5, v6);

  -[ILClassificationResponse userInfo](self, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_userInfo);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[ILClassificationResponse userString](self, "userString");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_userString);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, v9);

}

- (ILClassificationAction)action
{
  return self->_action;
}

- (NSString)userString
{
  return self->_userString;
}

- (void)setUserString:(NSString *)userString
{
  objc_setProperty_nonatomic_copy(self, a2, userString, 16);
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(NSDictionary *)userInfo
{
  objc_setProperty_nonatomic_copy(self, a2, userInfo, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_userString, 0);
}

@end
