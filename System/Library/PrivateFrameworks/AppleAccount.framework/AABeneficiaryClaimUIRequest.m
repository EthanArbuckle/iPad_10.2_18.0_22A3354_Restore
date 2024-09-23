@implementation AABeneficiaryClaimUIRequest

- (AABeneficiaryClaimUIRequest)initWithGrandSlamAccount:(id)a3 accountStore:(id)a4 claimCode:(id)a5
{
  id v9;
  AABeneficiaryClaimUIRequest *v10;
  AABeneficiaryClaimUIRequest *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)AABeneficiaryClaimUIRequest;
  v10 = -[AAAppleIDSettingsRequest initWithGrandSlamAccount:accountStore:](&v13, sel_initWithGrandSlamAccount_accountStore_, a3, a4);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_claimCode, a5);

  return v11;
}

- (id)urlString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0D002A0];
  -[AAAppleIDSettingsRequest grandSlamAccount](self, "grandSlamAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "aida_alternateDSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bagForAltDSID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "urlAtKey:", CFSTR("startBeneficiaryClaim"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)urlRequest
{
  void *v3;
  void *v4;
  NSString *claimCode;
  void *v6;
  objc_super v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)AABeneficiaryClaimUIRequest;
  -[AAAppleIDSettingsRequest urlRequest](&v8, sel_urlRequest);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  claimCode = self->_claimCode;
  if (claimCode)
  {
    v9 = CFSTR("claimCode");
    v10[0] = claimCode;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "aa_setBodyWithParameters:", v6);

  }
  objc_msgSend(v4, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v4, "addValue:forHTTPHeaderField:", CFSTR("application/x-plist"), CFSTR("Content-Type"));
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_claimCode, 0);
}

@end
