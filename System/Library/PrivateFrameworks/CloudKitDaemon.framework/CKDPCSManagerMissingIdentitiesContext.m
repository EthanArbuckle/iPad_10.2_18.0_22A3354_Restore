@implementation CKDPCSManagerMissingIdentitiesContext

- (CKDPCSManagerMissingIdentitiesContext)initWithContainer:(id)a3
{
  id v4;
  CKDPCSManagerMissingIdentitiesContext *v5;
  CKDPCSManagerMissingIdentitiesContext *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CKDPCSManagerMissingIdentitiesContext;
  v5 = -[CKDPCSManagerMissingIdentitiesContext init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_container, v4);

  return v6;
}

- (NSMutableSet)servicesWithMissingIdentities
{
  CKDPCSManagerMissingIdentitiesContext *v2;
  NSMutableSet *servicesWithMissingIdentities;
  uint64_t v4;
  NSMutableSet *v5;
  NSMutableSet *v6;

  v2 = self;
  objc_sync_enter(v2);
  servicesWithMissingIdentities = v2->_servicesWithMissingIdentities;
  if (!servicesWithMissingIdentities)
  {
    v4 = objc_opt_new();
    v5 = v2->_servicesWithMissingIdentities;
    v2->_servicesWithMissingIdentities = (NSMutableSet *)v4;

    servicesWithMissingIdentities = v2->_servicesWithMissingIdentities;
  }
  v6 = servicesWithMissingIdentities;
  objc_sync_exit(v2);

  return v6;
}

- (NSMutableSet)missingIdentityPublicKeys
{
  CKDPCSManagerMissingIdentitiesContext *v2;
  NSMutableSet *missingIdentityPublicKeys;
  uint64_t v4;
  NSMutableSet *v5;
  NSMutableSet *v6;

  v2 = self;
  objc_sync_enter(v2);
  missingIdentityPublicKeys = v2->_missingIdentityPublicKeys;
  if (!missingIdentityPublicKeys)
  {
    v4 = objc_opt_new();
    v5 = v2->_missingIdentityPublicKeys;
    v2->_missingIdentityPublicKeys = (NSMutableSet *)v4;

    missingIdentityPublicKeys = v2->_missingIdentityPublicKeys;
  }
  v6 = missingIdentityPublicKeys;
  objc_sync_exit(v2);

  return v6;
}

- (id)copyOfServicesWithMissingIdentities
{
  CKDPCSManagerMissingIdentitiesContext *v2;
  const char *v3;
  uint64_t v4;
  NSMutableSet *servicesWithMissingIdentities;
  uint64_t v6;
  NSMutableSet *v7;
  void *v8;

  v2 = self;
  objc_sync_enter(v2);
  servicesWithMissingIdentities = v2->_servicesWithMissingIdentities;
  if (!servicesWithMissingIdentities)
  {
    v6 = objc_opt_new();
    v7 = v2->_servicesWithMissingIdentities;
    v2->_servicesWithMissingIdentities = (NSMutableSet *)v6;

    servicesWithMissingIdentities = v2->_servicesWithMissingIdentities;
  }
  v8 = (void *)objc_msgSend_copy(servicesWithMissingIdentities, v3, v4);
  objc_sync_exit(v2);

  return v8;
}

- (id)copyOfMissingIdentityPublicKeys
{
  CKDPCSManagerMissingIdentitiesContext *v2;
  const char *v3;
  uint64_t v4;
  NSMutableSet *missingIdentityPublicKeys;
  uint64_t v6;
  NSMutableSet *v7;
  void *v8;

  v2 = self;
  objc_sync_enter(v2);
  missingIdentityPublicKeys = v2->_missingIdentityPublicKeys;
  if (!missingIdentityPublicKeys)
  {
    v6 = objc_opt_new();
    v7 = v2->_missingIdentityPublicKeys;
    v2->_missingIdentityPublicKeys = (NSMutableSet *)v6;

    missingIdentityPublicKeys = v2->_missingIdentityPublicKeys;
  }
  v8 = (void *)objc_msgSend_copy(missingIdentityPublicKeys, v3, v4);
  objc_sync_exit(v2);

  return v8;
}

- (CKDAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (void)setServicesWithMissingIdentities:(id)a3
{
  objc_storeStrong((id *)&self->_servicesWithMissingIdentities, a3);
}

- (void)setMissingIdentityPublicKeys:(id)a3
{
  objc_storeStrong((id *)&self->_missingIdentityPublicKeys, a3);
}

- (CKDContainer)container
{
  return (CKDContainer *)objc_loadWeakRetained((id *)&self->_container);
}

- (void)setContainer:(id)a3
{
  objc_storeWeak((id *)&self->_container, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_container);
  objc_storeStrong((id *)&self->_missingIdentityPublicKeys, 0);
  objc_storeStrong((id *)&self->_servicesWithMissingIdentities, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
