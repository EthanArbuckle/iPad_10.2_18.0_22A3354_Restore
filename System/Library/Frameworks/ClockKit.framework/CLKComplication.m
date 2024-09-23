@implementation CLKComplication

+ (CLKComplication)complicationWithFamily:(int64_t)a3 descriptor:(id)a4
{
  id v5;
  CLKComplication *v6;
  uint64_t v7;
  NSString *identifier;
  uint64_t v9;
  NSDictionary *userInfo;
  uint64_t v11;
  CLKUserActivity *clkUserActivity;

  v5 = a4;
  v6 = objc_alloc_init(CLKComplication);
  v6->_family = a3;
  objc_msgSend(v5, "identifier");
  v7 = objc_claimAutoreleasedReturnValue();
  identifier = v6->_identifier;
  v6->_identifier = (NSString *)v7;

  objc_msgSend(v5, "userInfo");
  v9 = objc_claimAutoreleasedReturnValue();
  userInfo = v6->_userInfo;
  v6->_userInfo = (NSDictionary *)v9;

  objc_msgSend(v5, "clkUserActivity");
  v11 = objc_claimAutoreleasedReturnValue();

  clkUserActivity = v6->_clkUserActivity;
  v6->_clkUserActivity = (CLKUserActivity *)v11;

  return v6;
}

- (NSUserActivity)userActivity
{
  return -[CLKUserActivity userActivity](self->_clkUserActivity, "userActivity");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "family") == self->_family)
  {
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", self->_identifier);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  int64_t family;

  family = self->_family;
  return family + 13 * -[NSString hash](self->_identifier, "hash");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_QWORD *)(v5 + 16) = self->_family;
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[NSDictionary copyWithZone:](self->_userInfo, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  objc_storeStrong((id *)(v5 + 8), self->_clkUserActivity);
  return (id)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t family;
  id v5;
  id v6;

  family = self->_family;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", family, CFSTR("family"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userInfo, CFSTR("userInfo"));
  -[CLKUserActivity encodedUserActivity](self->_clkUserActivity, "encodedUserActivity");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("userActivity"));

}

- (CLKComplication)initWithCoder:(id)a3
{
  id v4;
  CLKComplication *v5;
  uint64_t v6;
  NSString *identifier;
  void *v8;
  uint64_t v9;
  NSDictionary *userInfo;
  void *v11;
  CLKUserActivity *v12;
  CLKUserActivity *clkUserActivity;

  v4 = a3;
  v5 = -[CLKComplication init](self, "init");
  if (v5)
  {
    v5->_family = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("family"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    +[CLKComplicationDescriptor allowedDictionaryClasses](CLKComplicationDescriptor, "allowedDictionaryClasses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("userInfo"));
    v9 = objc_claimAutoreleasedReturnValue();
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userActivity"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[CLKUserActivity initWithEncodedUserActivity:]([CLKUserActivity alloc], "initWithEncodedUserActivity:", v11);
    clkUserActivity = v5->_clkUserActivity;
    v5->_clkUserActivity = v12;

  }
  return v5;
}

- (BOOL)tl_isEqualToIdentifiable:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = objc_msgSend(v4, "isEqual:", self);
  else
    v5 = 0;

  return v5;
}

- (CLKComplicationFamily)family
{
  return self->_family;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_clkUserActivity, 0);
}

@end
