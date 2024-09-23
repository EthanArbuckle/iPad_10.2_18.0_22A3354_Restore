@implementation AKAppleIDPasskeySetupContext

- (AKAppleIDPasskeySetupContext)initWithAltDSID:(id)a3
{
  id v5;
  AKAppleIDPasskeySetupContext *v6;
  AKAppleIDPasskeySetupContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKAppleIDPasskeySetupContext;
  v6 = -[AKAppleIDPasskeySetupContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_altDSID, a3);

  return v7;
}

- (AKAppleIDPasskeySetupContext)initWithCoder:(id)a3
{
  id v4;
  AKAppleIDPasskeySetupContext *v5;
  uint64_t v6;
  NSString *altDSID;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSDictionary *appProvidedData;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AKAppleIDPasskeySetupContext;
  v5 = -[AKAppleIDPasskeySetupContext init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_altDSID"));
    v6 = objc_claimAutoreleasedReturnValue();
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, v10, v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("_appProvidedData"));
    v13 = objc_claimAutoreleasedReturnValue();
    appProvidedData = v5->_appProvidedData;
    v5->_appProvidedData = (NSDictionary *)v13;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *altDSID;
  id v5;

  altDSID = self->_altDSID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", altDSID, CFSTR("_altDSID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appProvidedData, CFSTR("_appProvidedData"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NSString copy](self->_altDSID, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  v7 = -[NSDictionary copy](self->_appProvidedData, "copy");
  v8 = (void *)v4[2];
  v4[2] = v7;

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p {\n\taltDSID: %@, \n\tappProvidedData: %@, \n}>"), v5, self, self->_altDSID, self->_appProvidedData);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (NSDictionary)appProvidedData
{
  return self->_appProvidedData;
}

- (void)setAppProvidedData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appProvidedData, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
}

@end
