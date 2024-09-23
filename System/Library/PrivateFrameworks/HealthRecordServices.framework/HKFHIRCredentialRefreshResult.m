@implementation HKFHIRCredentialRefreshResult

- (HKFHIRCredentialRefreshResult)initWithCredential:(id)a3 authResponse:(id)a4 endStates:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HKFHIRCredentialRefreshResult *v14;
  uint64_t v15;
  HKFHIRCredential *credential;
  uint64_t v17;
  HDFHIRAuthResponse *authResponse;
  uint64_t v19;
  HKFHIRRequestTaskEndStates *endStates;
  uint64_t v21;
  NSError *error;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)HKFHIRCredentialRefreshResult;
  v14 = -[HKFHIRCredentialRefreshResult init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    credential = v14->_credential;
    v14->_credential = (HKFHIRCredential *)v15;

    v17 = objc_msgSend(v11, "copy");
    authResponse = v14->_authResponse;
    v14->_authResponse = (HDFHIRAuthResponse *)v17;

    v19 = objc_msgSend(v12, "copy");
    endStates = v14->_endStates;
    v14->_endStates = (HKFHIRRequestTaskEndStates *)v19;

    v21 = objc_msgSend(v13, "copy");
    error = v14->_error;
    v14->_error = (NSError *)v21;

  }
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  HKFHIRCredentialRefreshResult *v6;
  HKFHIRCredentialRefreshResult *v7;
  HKFHIRCredentialRefreshResult *v8;
  HKFHIRCredential *credential;
  HKFHIRCredential *v10;
  uint64_t v11;
  HKFHIRCredential *v12;
  void *v13;
  char v14;
  HDFHIRAuthResponse *authResponse;
  HDFHIRAuthResponse *v16;
  uint64_t v17;
  void *v18;
  HDFHIRAuthResponse *v19;
  HKFHIRRequestTaskEndStates *endStates;
  HKFHIRRequestTaskEndStates *v21;
  uint64_t v22;
  HKFHIRRequestTaskEndStates *v23;
  uint64_t v24;
  HKFHIRRequestTaskEndStates *v25;
  void *v26;
  NSError *error;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  NSError *v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  HKFHIRRequestTaskEndStates *v40;
  void *v41;
  HDFHIRAuthResponse *v42;
  void *v43;

  v6 = (HKFHIRCredentialRefreshResult *)a3;
  v7 = v6;
  if (self != v6)
  {
    v8 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v14 = 0;
LABEL_40:

      goto LABEL_41;
    }
    credential = self->_credential;
    -[HKFHIRCredentialRefreshResult credential](v8, "credential");
    v10 = (HKFHIRCredential *)objc_claimAutoreleasedReturnValue();
    if (credential != v10)
    {
      -[HKFHIRCredentialRefreshResult credential](v8, "credential");
      v11 = objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        v14 = 0;
        goto LABEL_39;
      }
      v3 = (void *)v11;
      v12 = self->_credential;
      -[HKFHIRCredentialRefreshResult credential](v8, "credential");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[HKOAuth2Credential isEqual:](v12, "isEqual:", v13))
      {
        v14 = 0;
LABEL_38:

        goto LABEL_39;
      }
      v43 = v13;
    }
    authResponse = self->_authResponse;
    -[HKFHIRCredentialRefreshResult authResponse](v8, "authResponse");
    v16 = (HDFHIRAuthResponse *)objc_claimAutoreleasedReturnValue();
    if (authResponse == v16)
    {
      v42 = authResponse;
    }
    else
    {
      -[HKFHIRCredentialRefreshResult authResponse](v8, "authResponse");
      v17 = objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        v14 = 0;
        goto LABEL_36;
      }
      v18 = (void *)v17;
      v42 = authResponse;
      v19 = self->_authResponse;
      -[HKFHIRCredentialRefreshResult authResponse](v8, "authResponse");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[HDFHIRAuthResponse isEqual:](v19, "isEqual:", v4))
      {

        v14 = 0;
        goto LABEL_37;
      }
      v38 = v18;
    }
    endStates = self->_endStates;
    -[HKFHIRCredentialRefreshResult endStates](v8, "endStates");
    v21 = (HKFHIRRequestTaskEndStates *)objc_claimAutoreleasedReturnValue();
    v41 = v4;
    if (endStates == v21)
    {
      v39 = v3;
      v40 = endStates;
    }
    else
    {
      -[HKFHIRCredentialRefreshResult endStates](v8, "endStates");
      v22 = objc_claimAutoreleasedReturnValue();
      if (!v22)
      {
        v14 = 0;
LABEL_33:

LABEL_34:
        if (v42 != v16)
        {
LABEL_35:

        }
LABEL_36:

LABEL_37:
        v13 = v43;
        if (credential != v10)
          goto LABEL_38;
LABEL_39:

        goto LABEL_40;
      }
      v40 = endStates;
      v37 = (void *)v22;
      v23 = self->_endStates;
      -[HKFHIRCredentialRefreshResult endStates](v8, "endStates");
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = v23;
      v26 = (void *)v24;
      if (!-[HKFHIRRequestTaskEndStates isEqual:](v25, "isEqual:", v24))
      {

        v14 = 0;
        goto LABEL_34;
      }
      v35 = v26;
      v39 = v3;
    }
    error = self->_error;
    -[HKFHIRCredentialRefreshResult error](v8, "error", v35);
    v28 = objc_claimAutoreleasedReturnValue();
    v14 = error == (NSError *)v28;
    if (error == (NSError *)v28)
    {

    }
    else
    {
      v29 = (void *)v28;
      -[HKFHIRCredentialRefreshResult error](v8, "error");
      v30 = objc_claimAutoreleasedReturnValue();
      if (v30)
      {
        v31 = (void *)v30;
        v32 = self->_error;
        -[HKFHIRCredentialRefreshResult error](v8, "error");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[NSError isEqual:](v32, "isEqual:", v33);

        if (v40 == v21)
        {

LABEL_44:
          v3 = v39;
          if (v42 == v16)
            goto LABEL_36;
          goto LABEL_35;
        }

LABEL_42:
        goto LABEL_44;
      }

    }
    if (v40 == v21)
      goto LABEL_42;

    v3 = v39;
    goto LABEL_33;
  }
  v14 = 1;
LABEL_41:

  return v14;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = -[HKFHIRCredential hash](self->_credential, "hash");
  v4 = -[HDFHIRAuthResponse hash](self->_authResponse, "hash") ^ v3;
  v5 = -[HKFHIRRequestTaskEndStates hash](self->_endStates, "hash");
  return v4 ^ v5 ^ -[NSError hash](self->_error, "hash");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  HKFHIRCredential *credential;
  id v5;

  credential = self->_credential;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", credential, CFSTR("credential"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_authResponse, CFSTR("authResponse"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endStates, CFSTR("endStates"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_error, CFSTR("error"));

}

- (HKFHIRCredentialRefreshResult)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HKFHIRCredentialRefreshResult *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("credential"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("authResponse"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endStates"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[HKFHIRCredentialRefreshResult initWithCredential:authResponse:endStates:error:](self, "initWithCredential:authResponse:endStates:error:", v5, v6, v7, v8);

    v9 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v9 = 0;
  }

  return v9;
}

- (HKFHIRCredential)credential
{
  return self->_credential;
}

- (HDFHIRAuthResponse)authResponse
{
  return self->_authResponse;
}

- (HKFHIRRequestTaskEndStates)endStates
{
  return self->_endStates;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_endStates, 0);
  objc_storeStrong((id *)&self->_authResponse, 0);
  objc_storeStrong((id *)&self->_credential, 0);
}

@end
