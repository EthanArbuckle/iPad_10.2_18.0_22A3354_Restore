@implementation HKFHIRCredential

- (HKFHIRCredential)initWithAccessToken:(id)a3 refreshToken:(id)a4 expiration:(id)a5 requestedScopeString:(id)a6 scopes:(id)a7
{
  void *v8;
  uint64_t v9;
  void *v10;

  v8 = (void *)MEMORY[0x24BDBCE88];
  v9 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "raise:format:", v9, CFSTR("The -%@ method is not available on %@"), v10, objc_opt_class());

  return 0;
}

- (HKFHIRCredential)initWithAccessToken:(id)a3 refreshToken:(id)a4 patientID:(id)a5 expiration:(id)a6 requestedScopeString:(id)a7 scopeString:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  HKFHIRCredential *v24;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = v20;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKFHIRCredential.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("patientID"));

    if (v21)
      goto LABEL_3;
LABEL_5:
    v22 = 0;
    goto LABEL_6;
  }
  if (!v20)
    goto LABEL_5;
LABEL_3:
  +[HKOAuth2ScopeSet scopesFromScopeString:](HKOAuth2ScopeSet, "scopesFromScopeString:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  v24 = -[HKFHIRCredential initWithAccessToken:refreshToken:patientID:expiration:requestedScopeString:scopes:](self, "initWithAccessToken:refreshToken:patientID:expiration:requestedScopeString:scopes:", v15, v16, v17, v18, v19, v22);

  return v24;
}

- (HKFHIRCredential)initWithAccessToken:(id)a3 refreshToken:(id)a4 patientID:(id)a5 expiration:(id)a6 requestedScopeString:(id)a7 scopes:(id)a8
{
  id v14;
  HKFHIRCredential *v15;
  uint64_t v16;
  NSString *patientID;
  objc_super v19;

  v14 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HKFHIRCredential;
  v15 = -[HKOAuth2Credential initWithAccessToken:refreshToken:expiration:requestedScopeString:scopes:](&v19, sel_initWithAccessToken_refreshToken_expiration_requestedScopeString_scopes_, a3, a4, a6, a7, a8);
  if (v15)
  {
    v16 = objc_msgSend(v14, "copy");
    patientID = v15->_patientID;
    v15->_patientID = (NSString *)v16;

  }
  return v15;
}

- (BOOL)isEqualToCredential:(id)a3 epsilonExpiration:(double)a4
{
  id v6;
  NSString *patientID;
  NSString *v8;
  void *v9;
  NSString *v10;
  void *v11;
  char v12;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKFHIRCredential;
  if (-[HKOAuth2Credential isEqualToCredential:epsilonExpiration:](&v14, sel_isEqualToCredential_epsilonExpiration_, v6, a4))
  {
    patientID = self->_patientID;
    objc_msgSend(v6, "patientID");
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (patientID == v8)
    {
      v12 = 1;
    }
    else
    {
      objc_msgSend(v6, "patientID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = self->_patientID;
        objc_msgSend(v6, "patientID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[NSString isEqualToString:](v10, "isEqualToString:", v11);

      }
      else
      {
        v12 = 0;
      }

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKFHIRCredential;
  v3 = -[HKOAuth2Credential hash](&v5, sel_hash);
  return -[NSString hash](self->_patientID, "hash") ^ v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *patientID;
  id v5;
  objc_super v6;

  patientID = self->_patientID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", patientID, CFSTR("patientID"));
  v6.receiver = self;
  v6.super_class = (Class)HKFHIRCredential;
  -[HKOAuth2Credential encodeWithCoder:](&v6, sel_encodeWithCoder_, v5);

}

- (HKFHIRCredential)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HKFHIRCredential *v6;
  uint64_t v7;
  NSString *patientID;
  HKFHIRCredential *v9;
  objc_super v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("patientID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v11.receiver = self;
    v11.super_class = (Class)HKFHIRCredential;
    v6 = -[HKOAuth2Credential initWithCoder:](&v11, sel_initWithCoder_, v4);

    if (v6)
    {
      v7 = objc_msgSend(v5, "copy");
      patientID = v6->_patientID;
      v6->_patientID = (NSString *)v7;

    }
    self = v6;
    v9 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");

    v9 = 0;
  }

  return v9;
}

- (NSString)patientID
{
  return self->_patientID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_patientID, 0);
}

@end
