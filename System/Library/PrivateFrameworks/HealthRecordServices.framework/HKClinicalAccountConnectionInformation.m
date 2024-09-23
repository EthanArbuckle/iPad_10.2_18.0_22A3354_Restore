@implementation HKClinicalAccountConnectionInformation

- (HKClinicalAccountConnectionInformation)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKClinicalAccountConnectionInformation)initWithAccountIdentifier:(id)a3 gateway:(id)a4 authorization:(id)a5 authentication:(id)a6 authSchemaDefinitions:(id)a7 resourceSchemaDefinitions:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  HKClinicalAccountConnectionInformation *v20;
  uint64_t v21;
  NSUUID *accountIdentifier;
  uint64_t v23;
  HKClinicalGateway *gateway;
  uint64_t v25;
  HKFHIRCredential *authorization;
  uint64_t v27;
  HKFHIRServerAuthenticationInformation *authentication;
  uint64_t v29;
  NSArray *authSchemaDefinitions;
  uint64_t v31;
  NSArray *resourceSchemaDefinitions;
  objc_super v34;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v34.receiver = self;
  v34.super_class = (Class)HKClinicalAccountConnectionInformation;
  v20 = -[HKClinicalAccountConnectionInformation init](&v34, sel_init);
  if (v20)
  {
    v21 = objc_msgSend(v14, "copy");
    accountIdentifier = v20->_accountIdentifier;
    v20->_accountIdentifier = (NSUUID *)v21;

    v23 = objc_msgSend(v15, "copy");
    gateway = v20->_gateway;
    v20->_gateway = (HKClinicalGateway *)v23;

    v25 = objc_msgSend(v16, "copy");
    authorization = v20->_authorization;
    v20->_authorization = (HKFHIRCredential *)v25;

    v27 = objc_msgSend(v17, "copy");
    authentication = v20->_authentication;
    v20->_authentication = (HKFHIRServerAuthenticationInformation *)v27;

    v29 = objc_msgSend(v18, "copy");
    authSchemaDefinitions = v20->_authSchemaDefinitions;
    v20->_authSchemaDefinitions = (NSArray *)v29;

    v31 = objc_msgSend(v19, "copy");
    resourceSchemaDefinitions = v20->_resourceSchemaDefinitions;
    v20->_resourceSchemaDefinitions = (NSArray *)v31;

  }
  return v20;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[NSUUID hash](self->_accountIdentifier, "hash");
  v4 = -[HKClinicalGateway hash](self->_gateway, "hash") ^ v3;
  v5 = -[HKFHIRCredential hash](self->_authorization, "hash");
  v6 = v4 ^ v5 ^ -[HKFHIRServerAuthenticationInformation hash](self->_authentication, "hash");
  v7 = -[NSArray hash](self->_authSchemaDefinitions, "hash");
  return v6 ^ v7 ^ -[NSArray hash](self->_resourceSchemaDefinitions, "hash");
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  HKClinicalAccountConnectionInformation *v6;
  HKClinicalAccountConnectionInformation *v7;
  HKClinicalAccountConnectionInformation *v8;
  NSUUID *accountIdentifier;
  NSUUID *v10;
  uint64_t v11;
  void *v12;
  NSUUID *v13;
  HKClinicalGateway *gateway;
  HKClinicalGateway *v15;
  NSUUID *v16;
  HKClinicalGateway *v17;
  HKClinicalGateway *v18;
  void *v19;
  HKFHIRCredential *authorization;
  uint64_t v21;
  HKFHIRCredential *v22;
  uint64_t v23;
  HKFHIRCredential *v24;
  HKFHIRCredential *v25;
  uint64_t v26;
  HKFHIRCredential *v27;
  void *v28;
  HKFHIRCredential *v29;
  BOOL v30;
  HKFHIRServerAuthenticationInformation *authentication;
  uint64_t v32;
  HKFHIRServerAuthenticationInformation *v33;
  uint64_t v34;
  HKFHIRServerAuthenticationInformation *v35;
  HKFHIRCredential *v36;
  void *authSchemaDefinitions;
  uint64_t v38;
  NSArray *v39;
  void *v40;
  NSArray *resourceSchemaDefinitions;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  HKFHIRCredential *v47;
  HKFHIRServerAuthenticationInformation *v48;
  HKFHIRServerAuthenticationInformation *v49;
  BOOL v50;
  HKFHIRServerAuthenticationInformation *v51;
  void *v53;
  void *v54;
  void *v55;
  HKFHIRCredential *v56;
  void *v57;
  void *v58;
  void *v59;
  HKFHIRCredential *v60;
  HKFHIRServerAuthenticationInformation *v61;
  void *v62;
  NSUUID *v63;
  void *v64;
  HKFHIRServerAuthenticationInformation *v65;
  NSUUID *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;

  v6 = (HKClinicalAccountConnectionInformation *)a3;
  v7 = v6;
  if (v6 != self)
  {
    v8 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      LOBYTE(v3) = 0;
LABEL_77:

      goto LABEL_78;
    }
    accountIdentifier = self->_accountIdentifier;
    -[HKClinicalAccountConnectionInformation accountIdentifier](v8, "accountIdentifier");
    v10 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    if (accountIdentifier != v10)
    {
      -[HKClinicalAccountConnectionInformation accountIdentifier](v8, "accountIdentifier");
      v11 = objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        LOBYTE(v3) = 0;
        goto LABEL_76;
      }
      v12 = (void *)v11;
      v13 = self->_accountIdentifier;
      -[HKClinicalAccountConnectionInformation accountIdentifier](v8, "accountIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[NSUUID isEqual:](v13, "isEqual:", v4))
      {
        LOBYTE(v3) = 0;
LABEL_75:

        goto LABEL_76;
      }
      v70 = v12;
    }
    gateway = self->_gateway;
    -[HKClinicalAccountConnectionInformation gateway](v8, "gateway");
    v15 = (HKClinicalGateway *)objc_claimAutoreleasedReturnValue();
    if (gateway == v15)
    {
      v69 = v4;
    }
    else
    {
      -[HKClinicalAccountConnectionInformation gateway](v8, "gateway");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v3)
      {

        v30 = accountIdentifier == v10;
        goto LABEL_59;
      }
      v66 = v10;
      v16 = accountIdentifier;
      v17 = gateway;
      v18 = self->_gateway;
      -[HKClinicalAccountConnectionInformation gateway](v8, "gateway");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[HKClinicalGateway isEqual:](v18, "isEqual:", v19))
      {

        LOBYTE(v3) = 0;
        v30 = v16 == v66;
        v10 = v66;
        goto LABEL_59;
      }
      v64 = v19;
      v69 = v4;
      gateway = v17;
      accountIdentifier = v16;
      v10 = v66;
    }
    authorization = self->_authorization;
    -[HKClinicalAccountConnectionInformation authorization](v8, "authorization");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (HKFHIRCredential *)v21;
    if (authorization == (HKFHIRCredential *)v21)
    {
      v63 = accountIdentifier;
      v29 = (HKFHIRCredential *)v21;
LABEL_22:
      authentication = self->_authentication;
      -[HKClinicalAccountConnectionInformation authentication](v8, "authentication");
      v61 = authentication;
      v65 = (HKFHIRServerAuthenticationInformation *)objc_claimAutoreleasedReturnValue();
      if (authentication == v65)
      {
        v60 = authorization;
        v36 = v29;
      }
      else
      {
        -[HKClinicalAccountConnectionInformation authentication](v8, "authentication");
        v32 = objc_claimAutoreleasedReturnValue();
        if (!v32)
        {
          v68 = v3;
          LOBYTE(v3) = 0;
          v36 = v29;
          accountIdentifier = v63;
          v40 = v64;
          goto LABEL_67;
        }
        v57 = (void *)v32;
        v60 = authorization;
        v33 = self->_authentication;
        -[HKClinicalAccountConnectionInformation authentication](v8, "authentication");
        v34 = objc_claimAutoreleasedReturnValue();
        v35 = v33;
        authorization = (HKFHIRCredential *)v34;
        v36 = v29;
        if (!-[HKFHIRServerAuthenticationInformation isEqual:](v35, "isEqual:", v34))
        {

          if (v60 == v29)
          {

          }
          else
          {

          }
          v4 = v69;
          if (gateway != v15)
          {

          }
          LOBYTE(v3) = 0;
          v30 = v63 == v10;
LABEL_59:
          v12 = v70;
          if (v30)
            goto LABEL_76;
          goto LABEL_75;
        }
      }
      authSchemaDefinitions = self->_authSchemaDefinitions;
      -[HKClinicalAccountConnectionInformation authSchemaDefinitions](v8, "authSchemaDefinitions");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = authSchemaDefinitions;
      v56 = authorization;
      v68 = v3;
      if (authSchemaDefinitions != v59)
      {
        -[HKClinicalAccountConnectionInformation authSchemaDefinitions](v8, "authSchemaDefinitions");
        v38 = objc_claimAutoreleasedReturnValue();
        if (!v38)
        {
          LOBYTE(v3) = 0;
          goto LABEL_48;
        }
        v54 = (void *)v38;
        v39 = self->_authSchemaDefinitions;
        -[HKClinicalAccountConnectionInformation authSchemaDefinitions](v8, "authSchemaDefinitions");
        authSchemaDefinitions = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[NSArray isEqualToArray:](v39, "isEqualToArray:", authSchemaDefinitions))
        {

          LOBYTE(v3) = 0;
LABEL_65:
          v40 = v64;
          v51 = v65;
          authorization = v60;
          accountIdentifier = v63;
          if (v61 == v65)
          {
LABEL_68:

            if (authorization != v36)
            {

            }
            if (gateway != v15)
            {

            }
            goto LABEL_73;
          }

LABEL_67:
          v51 = v65;
          goto LABEL_68;
        }
      }
      resourceSchemaDefinitions = self->_resourceSchemaDefinitions;
      -[HKClinicalAccountConnectionInformation resourceSchemaDefinitions](v8, "resourceSchemaDefinitions");
      v42 = objc_claimAutoreleasedReturnValue();
      LOBYTE(v3) = resourceSchemaDefinitions == (NSArray *)v42;
      if (resourceSchemaDefinitions != (NSArray *)v42)
      {
        resourceSchemaDefinitions = (NSArray *)v42;
        -[HKClinicalAccountConnectionInformation resourceSchemaDefinitions](v8, "resourceSchemaDefinitions");
        v43 = objc_claimAutoreleasedReturnValue();
        if (v43)
        {
          v53 = authSchemaDefinitions;
          v3 = self->_resourceSchemaDefinitions;
          v44 = (void *)v43;
          -[HKClinicalAccountConnectionInformation resourceSchemaDefinitions](v8, "resourceSchemaDefinitions");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v3) = objc_msgSend(v3, "isEqualToArray:", v45);

          if (v55 == v59)
          {

          }
          else
          {

          }
          goto LABEL_65;
        }
      }

      if (v55 == v59)
      {

        v46 = v64;
        v48 = v65;
        v47 = v60;
        if (v61 == v65)
          goto LABEL_50;
        goto LABEL_49;
      }

LABEL_48:
      v46 = v64;
      v47 = v60;

      v48 = v65;
      if (v61 == v65)
      {
LABEL_50:

        if (v47 != v36)
        {

        }
        if (gateway != v15)
        {

        }
        v50 = v63 == v10;
LABEL_74:
        v4 = v69;
        v12 = v70;
        if (!v50)
          goto LABEL_75;
LABEL_76:

        goto LABEL_77;
      }
LABEL_49:
      v49 = v48;

      v48 = v49;
      goto LABEL_50;
    }
    -[HKClinicalAccountConnectionInformation authorization](v8, "authorization");
    v23 = objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v67 = v3;
      v24 = authorization;
      v62 = (void *)v23;
      v25 = self->_authorization;
      -[HKClinicalAccountConnectionInformation authorization](v8, "authorization");
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = v25;
      v28 = (void *)v26;
      if (-[HKOAuth2Credential isEqual:](v27, "isEqual:", v26))
      {
        v63 = accountIdentifier;
        v58 = v28;
        authorization = v24;
        v29 = v22;
        v3 = v67;
        goto LABEL_22;
      }

      if (gateway != v15)
      {

        goto LABEL_37;
      }
    }
    else
    {

      if (gateway != v15)
      {

LABEL_37:
LABEL_39:
        LOBYTE(v3) = 0;
LABEL_73:
        v50 = accountIdentifier == v10;
        goto LABEL_74;
      }
    }

    goto LABEL_39;
  }
  LOBYTE(v3) = 1;
LABEL_78:

  return (char)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *accountIdentifier;
  id v5;

  accountIdentifier = self->_accountIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", accountIdentifier, CFSTR("accountIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_gateway, CFSTR("gateway"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_authorization, CFSTR("authorization"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_authentication, CFSTR("authentication"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_authSchemaDefinitions, CFSTR("authSchemaDefinitions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_resourceSchemaDefinitions, CFSTR("resourceSchemaDefinitions"));

}

- (HKClinicalAccountConnectionInformation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HKClinicalAccountConnectionInformation *v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("gateway"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("authorization"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("authentication"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1608], "hk_JSONObjectSecureCodingClasses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("authSchemaDefinitions"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1608], "hk_JSONObjectSecureCodingClasses");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("resourceSchemaDefinitions"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && v6 && v10 && v12)
  {
    self = -[HKClinicalAccountConnectionInformation initWithAccountIdentifier:gateway:authorization:authentication:authSchemaDefinitions:resourceSchemaDefinitions:](self, "initWithAccountIdentifier:gateway:authorization:authentication:authSchemaDefinitions:resourceSchemaDefinitions:", v5, v6, v7, v8, v10, v12);
    v13 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v13 = 0;
  }

  return v13;
}

- (NSUUID)accountIdentifier
{
  return self->_accountIdentifier;
}

- (HKClinicalGateway)gateway
{
  return self->_gateway;
}

- (HKFHIRCredential)authorization
{
  return self->_authorization;
}

- (HKFHIRServerAuthenticationInformation)authentication
{
  return self->_authentication;
}

- (NSArray)authSchemaDefinitions
{
  return self->_authSchemaDefinitions;
}

- (NSArray)resourceSchemaDefinitions
{
  return self->_resourceSchemaDefinitions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceSchemaDefinitions, 0);
  objc_storeStrong((id *)&self->_authSchemaDefinitions, 0);
  objc_storeStrong((id *)&self->_authentication, 0);
  objc_storeStrong((id *)&self->_authorization, 0);
  objc_storeStrong((id *)&self->_gateway, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
