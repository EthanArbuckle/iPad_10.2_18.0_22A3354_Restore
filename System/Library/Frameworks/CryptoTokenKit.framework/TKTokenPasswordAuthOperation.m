@implementation TKTokenPasswordAuthOperation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TKTokenPasswordAuthOperation)initWithCoder:(id)a3
{
  id v4;
  TKTokenPasswordAuthOperation *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSString *password;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSString *localizedPasswordLabel;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TKTokenPasswordAuthOperation;
  v5 = -[TKTokenAuthOperation initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_password);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    password = v5->_password;
    v5->_password = (NSString *)v8;

    v10 = objc_opt_class();
    NSStringFromSelector(sel_localizedPasswordLabel);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    localizedPasswordLabel = v5->_localizedPasswordLabel;
    v5->_localizedPasswordLabel = (NSString *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *password;
  void *v6;
  NSString *localizedPasswordLabel;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TKTokenPasswordAuthOperation;
  v4 = a3;
  -[TKTokenAuthOperation encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  password = self->_password;
  NSStringFromSelector(sel_password);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", password, v6, v9.receiver, v9.super_class);

  localizedPasswordLabel = self->_localizedPasswordLabel;
  NSStringFromSelector(sel_localizedPasswordLabel);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", localizedPasswordLabel, v8);

}

- (Class)baseClassForUI
{
  return (Class)objc_opt_class();
}

- (void)importOperation:(id)a3
{
  id v4;
  NSString *v5;
  NSString *localizedPasswordLabel;
  NSString *v7;
  NSString *password;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TKTokenPasswordAuthOperation;
  v4 = a3;
  -[TKTokenAuthOperation importOperation:](&v9, sel_importOperation_, v4);
  objc_msgSend(v4, "localizedPasswordLabel", v9.receiver, v9.super_class);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  localizedPasswordLabel = self->_localizedPasswordLabel;
  self->_localizedPasswordLabel = v5;

  objc_msgSend(v4, "password");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();

  password = self->_password;
  self->_password = v7;

}

- (NSString)password
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPassword:(NSString *)password
{
  objc_setProperty_atomic_copy(self, a2, password, 16);
}

- (NSString)localizedPasswordLabel
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLocalizedPasswordLabel:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedPasswordLabel, 0);
  objc_storeStrong((id *)&self->_password, 0);
}

@end
