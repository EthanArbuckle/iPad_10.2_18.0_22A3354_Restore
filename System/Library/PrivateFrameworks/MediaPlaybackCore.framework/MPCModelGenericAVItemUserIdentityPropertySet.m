@implementation MPCModelGenericAVItemUserIdentityPropertySet

- (ICUserIdentityProperties)identityProperties
{
  return self->_identityProperties;
}

- (ICUserIdentityProperties)delegatedIdentityProperties
{
  return self->_delegatedIdentityProperties;
}

- (MPCModelGenericAVItemUserIdentityPropertySet)initWithRequestContext:(id)a3 error:(id *)a4
{
  id v6;
  MPCModelGenericAVItemUserIdentityPropertySet *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  ICUserIdentityProperties *identityProperties;
  void *v12;
  void *v13;
  uint64_t v14;
  ICUserIdentityProperties *delegatedIdentityProperties;
  MPCModelGenericAVItemUserIdentityPropertySet *v16;
  objc_super v18;

  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MPCModelGenericAVItemUserIdentityPropertySet;
  v7 = -[MPCModelGenericAVItemUserIdentityPropertySet init](&v18, sel_init);
  if (!v7)
    goto LABEL_13;
  objc_msgSend(v6, "identity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 67, CFSTR("No user identity for requestContext: %@"), v6);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_11;
  }
  objc_msgSend(v6, "identityStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "getPropertiesForUserIdentity:error:", v8, a4);
  v10 = objc_claimAutoreleasedReturnValue();
  identityProperties = v7->_identityProperties;
  v7->_identityProperties = (ICUserIdentityProperties *)v10;

  if (!a4 || !*a4)
  {
    objc_msgSend(v6, "delegatedIdentity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v6, "identityStore");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "getPropertiesForUserIdentity:error:", v12, a4);
      v14 = objc_claimAutoreleasedReturnValue();
      delegatedIdentityProperties = v7->_delegatedIdentityProperties;
      v7->_delegatedIdentityProperties = (ICUserIdentityProperties *)v14;

      if (a4)
      {
        if (*a4)
        {

          goto LABEL_11;
        }
      }
    }

LABEL_13:
    v16 = v7;
    goto LABEL_14;
  }
LABEL_11:

  v16 = 0;
LABEL_14:

  return v16;
}

- (void)setIdentityProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setDelegatedIdentityProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegatedIdentityProperties, 0);
  objc_storeStrong((id *)&self->_identityProperties, 0);
}

@end
