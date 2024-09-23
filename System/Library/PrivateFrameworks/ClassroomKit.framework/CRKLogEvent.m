@implementation CRKLogEvent

- (CRKLogEvent)init
{
  void *v3;
  CRKLogEvent *v4;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CRKLogEvent initWithName:date:userInfo:](self, "initWithName:date:userInfo:", CFSTR("NO NAME"), v3, 0);

  return v4;
}

- (CRKLogEvent)initWithName:(id)a3 date:(id)a4 userInfo:(id)a5
{
  id v9;
  id v10;
  id v11;
  CRKLogEvent *v12;
  uint64_t v13;
  NSString *name;
  uint64_t v15;
  NSDictionary *userInfo;
  void *v18;
  void *v19;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKLogEvent.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKLogEvent.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("date"));

LABEL_3:
  v20.receiver = self;
  v20.super_class = (Class)CRKLogEvent;
  v12 = -[CRKLogEvent init](&v20, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v9, "copy");
    name = v12->_name;
    v12->_name = (NSString *)v13;

    objc_storeStrong((id *)&v12->_date, a4);
    v15 = objc_msgSend(v11, "copy");
    userInfo = v12->_userInfo;
    v12->_userInfo = (NSDictionary *)v15;

  }
  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[CRKLogEvent name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[CRKLogEvent date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[CRKLogEvent userInfo](self, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[CRKLogEvent isEqualToEvent:](self, "isEqualToEvent:", v4);

  return v5;
}

- (BOOL)isEqualToEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  int v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  char v17;

  v4 = a3;
  if (v4)
  {
    -[CRKLogEvent name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5;
    v8 = v6;
    if (v7 | v8 && (v9 = objc_msgSend((id)v7, "isEqual:", v8), (id)v8, (id)v7, !v9))
    {
      v17 = 0;
    }
    else
    {
      -[CRKLogEvent date](self, "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v10;
      v13 = v11;
      if (v12 | v13
        && (v14 = objc_msgSend((id)v12, "isEqual:", v13), (id)v13, (id)v12, !v14))
      {
        v17 = 0;
      }
      else
      {
        -[CRKLogEvent userInfo](self, "userInfo");
        v15 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "userInfo");
        v16 = objc_claimAutoreleasedReturnValue();
        if (v15 | v16)
          v17 = objc_msgSend((id)v15, "isEqual:", v16);
        else
          v17 = 1;

      }
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[CRKLogEvent name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKLogEvent date](self, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKLogEvent userInfo](self, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { name = %@, date = %@, userInfo = %@ }>"), v4, self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CRKLogEvent name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("name"));

  -[CRKLogEvent date](self, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("date"));

  -[CRKLogEvent userInfo](self, "userInfo");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("userInfo"));

}

- (CRKLogEvent)initWithCoder:(id)a3
{
  id v4;
  CRKLogEvent *v5;
  void *v6;
  uint64_t v7;
  NSString *name;
  void *v9;
  uint64_t v10;
  NSDate *date;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSDictionary *userInfo;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)CRKLogEvent;
  v5 = -[CRKLogEvent init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("name"));
    v7 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v7;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("date"));
    v10 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v10;

    v26 = (void *)MEMORY[0x24BDBCF20];
    v25 = objc_opt_class();
    v24 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    objc_msgSend(v26, "setWithObjects:", v25, v24, v12, v13, v14, v15, v16, v17, v18, v19, objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("userInfo"));
    v21 = objc_claimAutoreleasedReturnValue();
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v21;

  }
  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
