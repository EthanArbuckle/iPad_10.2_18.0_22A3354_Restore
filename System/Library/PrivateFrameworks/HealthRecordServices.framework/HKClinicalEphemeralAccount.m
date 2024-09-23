@implementation HKClinicalEphemeralAccount

- (HKClinicalEphemeralAccount)initWithProvenance:(id)a3 authResponse:(id)a4 requestedScopeString:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  HKClinicalEphemeralAccount *v13;
  uint64_t v14;
  HDFHIRAuthResponse *authResponse;
  uint64_t v16;
  NSString *requestedScopeString;
  char v19;
  objc_super v20;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  objc_msgSend((id)objc_opt_class(), "ephemeralAccountIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKClinicalSharingStatus unknownStatus](HKClinicalSharingStatus, "unknownStatus");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20.receiver = self;
  v20.super_class = (Class)HKClinicalEphemeralAccount;
  v19 = 0;
  v13 = -[HKClinicalAccount initWithIdentifier:state:userEnabled:lastFetchDate:lastFullFetchDate:lastFailedFetchDate:failedFetchAttemptsCount:clinicalSharingStatus:hasClinicalSharingScopes:provenance:](&v20, sel_initWithIdentifier_state_userEnabled_lastFetchDate_lastFullFetchDate_lastFailedFetchDate_failedFetchAttemptsCount_clinicalSharingStatus_hasClinicalSharingScopes_provenance_, v11, 0, 1, 0, 0, 0, 0, v12, v19, v10);

  if (v13)
  {
    v14 = objc_msgSend(v8, "copy");
    authResponse = v13->_authResponse;
    v13->_authResponse = (HDFHIRAuthResponse *)v14;

    v16 = objc_msgSend(v9, "copy");
    requestedScopeString = v13->_requestedScopeString;
    v13->_requestedScopeString = (NSString *)v16;

  }
  return v13;
}

- (HKClinicalEphemeralAccount)initWithGateway:(id)a3 authResponse:(id)a4 requestedScopeString:(id)a5
{
  id v8;
  id v9;
  id v10;
  HKClinicalAccountProvenance *v11;
  HKClinicalEphemeralAccount *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[HKClinicalAccountProvenance initWithGateway:]([HKClinicalAccountProvenance alloc], "initWithGateway:", v10);

  v12 = -[HKClinicalEphemeralAccount initWithProvenance:authResponse:requestedScopeString:](self, "initWithProvenance:authResponse:requestedScopeString:", v11, v9, v8);
  return v12;
}

+ (id)ephemeralAccountIdentifier
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("00000000-0000-0000-0000-000000000000"));
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  HKClinicalEphemeralAccount *v5;
  HKClinicalEphemeralAccount *v6;
  HKClinicalEphemeralAccount *v7;
  uint64_t v8;
  HDFHIRAuthResponse *authResponse;
  HDFHIRAuthResponse *v10;
  uint64_t v11;
  HDFHIRAuthResponse *v12;
  char v13;
  NSString *requestedScopeString;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSString *v19;
  void *v20;
  objc_super v22;

  v5 = (HKClinicalEphemeralAccount *)a3;
  v6 = v5;
  if (self != v5)
  {
    v7 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (v22.receiver = self,
          v22.super_class = (Class)HKClinicalEphemeralAccount,
          !-[HKClinicalAccount isEqual:](&v22, sel_isEqual_, v7)))
    {
      v13 = 0;
LABEL_19:

      goto LABEL_20;
    }
    v8 = 80;
    authResponse = self->_authResponse;
    -[HKClinicalEphemeralAccount authResponse](v7, "authResponse");
    v10 = (HDFHIRAuthResponse *)objc_claimAutoreleasedReturnValue();
    if (authResponse == v10)
      goto LABEL_10;
    -[HKClinicalEphemeralAccount authResponse](v7, "authResponse");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v13 = 0;
LABEL_18:

      goto LABEL_19;
    }
    v3 = (void *)v11;
    v12 = self->_authResponse;
    -[HKClinicalEphemeralAccount authResponse](v7, "authResponse");
    v8 = objc_claimAutoreleasedReturnValue();
    if (-[HDFHIRAuthResponse isEqual:](v12, "isEqual:", v8))
    {
LABEL_10:
      requestedScopeString = self->_requestedScopeString;
      -[HKClinicalEphemeralAccount requestedScopeString](v7, "requestedScopeString");
      v15 = objc_claimAutoreleasedReturnValue();
      if (requestedScopeString == (NSString *)v15)
      {

        v13 = 1;
      }
      else
      {
        v16 = (void *)v15;
        -[HKClinicalEphemeralAccount requestedScopeString](v7, "requestedScopeString");
        v17 = objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v18 = (void *)v17;
          v19 = self->_requestedScopeString;
          -[HKClinicalEphemeralAccount requestedScopeString](v7, "requestedScopeString");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = -[NSString isEqualToString:](v19, "isEqualToString:", v20);

        }
        else
        {

          v13 = 0;
        }
      }
      if (authResponse == v10)
        goto LABEL_18;
    }
    else
    {
      v13 = 0;
    }

    goto LABEL_18;
  }
  v13 = 1;
LABEL_20:

  return v13;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKClinicalEphemeralAccount;
  v3 = -[HKClinicalAccount hash](&v6, sel_hash);
  v4 = -[HDFHIRAuthResponse hash](self->_authResponse, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_requestedScopeString, "hash");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKClinicalEphemeralAccount;
  v4 = a3;
  -[HKClinicalAccount encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_authResponse, CFSTR("authResponse"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_requestedScopeString, CFSTR("requestedScopeString"));

}

- (HKClinicalEphemeralAccount)initWithCoder:(id)a3
{
  id v4;
  HKClinicalEphemeralAccount *v5;
  void *v6;
  void *v7;
  HKClinicalEphemeralAccount *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKClinicalEphemeralAccount;
  v5 = -[HKClinicalAccount initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("authResponse"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestedScopeString"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_storeStrong((id *)&v5->_authResponse, v6);
        objc_storeStrong((id *)&v5->_requestedScopeString, v7);
        v8 = v5;
      }
      else
      {
        objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
        v8 = 0;
      }

    }
    else
    {
      objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (HDFHIRAuthResponse)authResponse
{
  return self->_authResponse;
}

- (NSString)requestedScopeString
{
  return self->_requestedScopeString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedScopeString, 0);
  objc_storeStrong((id *)&self->_authResponse, 0);
}

@end
