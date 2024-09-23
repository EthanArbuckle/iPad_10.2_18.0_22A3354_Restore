@implementation HFDifference

- (HFDifference)initWithKey:(id)a3 priority:(unint64_t)a4
{
  id v6;
  HFDifference *v7;
  uint64_t v8;
  NSString *key;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFDifference;
  v7 = -[HFDifference init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    key = v7->_key;
    v7->_key = (NSString *)v8;

    v7->_priority = a4;
  }

  return v7;
}

- (HFDifference)initWithKey:(id)a3
{
  return -[HFDifference initWithKey:priority:](self, "initWithKey:priority:", a3, 2);
}

+ (id)difference:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithKey:", v4);

  return v5;
}

+ (id)difference:(id)a3 priority:(unint64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithKey:", v6);

  objc_msgSend(v7, "setPriority:", a4);
  return v7;
}

+ (id)difference:(id)a3 priority:(unint64_t)a4 withBlock:(id)a5
{
  id v8;
  void *v9;

  v8 = a3;
  if ((*((unsigned int (**)(id))a5 + 2))(a5))
  {
    v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithKey:", v8);
    objc_msgSend(v9, "setPriority:", a4);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)withPriority:(unint64_t)a3
{
  void *v4;

  v4 = (void *)-[HFDifference copy](self, "copy");
  objc_msgSend(v4, "setPriority:", a3);
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HFDifference key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithKey:", v5);

  objc_msgSend(v6, "setPriority:", -[HFDifference priority](self, "priority"));
  -[HFDifference userInfo](self, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v6, "setUserInfo:", v8);

  return v6;
}

- (id)descriptionBuilder
{
  void *v3;
  unint64_t v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D519B8]), "initWithObject:", self);
  v4 = -[HFDifference priority](self, "priority") - 1;
  if (v4 > 3)
    v5 = CFSTR("none");
  else
    v5 = off_1EA728DC8[v4];
  -[HFDifference key](self, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v6, CFSTR("key"));

  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("priority"));
  -[HFDifference userInfo](self, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HFDifference userInfo](self, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendDictionarySection:withName:skipIfEmpty:", v8, CFSTR("userInfo"), 1);

  }
  return v3;
}

- (id)description
{
  void *v2;
  void *v3;

  -[HFDifference descriptionBuilder](self, "descriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_subclass_description
{
  return 0;
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (unint64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(unint64_t)a3
{
  self->_priority = a3;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
