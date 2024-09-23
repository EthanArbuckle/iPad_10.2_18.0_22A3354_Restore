@implementation VSPrivacyConsentVoucher

- (VSPrivacyConsentVoucher)initWithAppAdamID:(id)a3 providerID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  VSPrivacyConsentVoucher *v9;
  uint64_t v10;
  NSString *appAdamID;
  uint64_t v12;
  NSString *providerID;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The appAdamID parameter must not be nil."));
    if (v8)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The providerID parameter must not be nil."));
LABEL_3:
  v15.receiver = self;
  v15.super_class = (Class)VSPrivacyConsentVoucher;
  v9 = -[VSPrivacyConsentVoucher init](&v15, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v6, "copy");
    appAdamID = v9->_appAdamID;
    v9->_appAdamID = (NSString *)v10;

    v12 = objc_msgSend(v8, "copy");
    providerID = v9->_providerID;
    v9->_providerID = (NSString *)v12;

  }
  return v9;
}

- (VSPrivacyConsentVoucher)initWithCoder:(id)a3
{
  id v4;
  VSPrivacyConsentVoucher *v5;
  void *v6;
  uint64_t v7;
  NSString *appAdamID;
  void *v9;
  uint64_t v10;
  NSString *providerID;
  objc_super v13;

  v4 = a3;
  VSRequireKeyedCoder(v4);
  v13.receiver = self;
  v13.super_class = (Class)VSPrivacyConsentVoucher;
  v5 = -[VSPrivacyConsentVoucher init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appAdamID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    appAdamID = v5->_appAdamID;
    v5->_appAdamID = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("providerID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    providerID = v5->_providerID;
    v5->_providerID = (NSString *)v10;

  }
  return v5;
}

- (VSPrivacyConsentVoucher)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ initializer is not available."), v5);

  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  VSRequireKeyedCoder(v4);
  -[VSPrivacyConsentVoucher appAdamID](self, "appAdamID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("appAdamID"));

  -[VSPrivacyConsentVoucher providerID](self, "providerID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("providerID"));

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[VSPrivacyConsentVoucher appAdamID](self, "appAdamID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[VSPrivacyConsentVoucher providerID](self, "providerID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  if (!v4)
    goto LABEL_5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_5;
  objc_msgSend(v4, "appAdamID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSPrivacyConsentVoucher appAdamID](self, "appAdamID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (v7)
  {
    objc_msgSend(v4, "providerID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSPrivacyConsentVoucher providerID](self, "providerID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

  }
  else
  {
LABEL_5:
    v10 = 0;
  }

  return v10;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[VSPrivacyConsentVoucher appAdamID](self, "appAdamID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("appAdamID"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  v7 = (void *)MEMORY[0x1E0CB3940];
  -[VSPrivacyConsentVoucher providerID](self, "providerID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("providerID"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v9);

  v10 = (void *)MEMORY[0x1E0CB3940];
  v14.receiver = self;
  v14.super_class = (Class)VSPrivacyConsentVoucher;
  -[VSPrivacyConsentVoucher description](&v14, sel_description);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("<%@ %@>"), v11, v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSString)appAdamID
{
  return self->_appAdamID;
}

- (NSString)providerID
{
  return self->_providerID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerID, 0);
  objc_storeStrong((id *)&self->_appAdamID, 0);
}

@end
