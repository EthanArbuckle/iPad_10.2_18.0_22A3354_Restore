@implementation ASCredentialIdentityStoreState

- (ASCredentialIdentityStoreState)initWithEnabledState:(BOOL)a3 supportsIncrementalUpdates:(BOOL)a4
{
  ASCredentialIdentityStoreState *v6;
  ASCredentialIdentityStoreState *v7;
  ASCredentialIdentityStoreState *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ASCredentialIdentityStoreState;
  v6 = -[ASCredentialIdentityStoreState init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_enabled = a3;
    v6->_supportsIncrementalUpdates = a4;
    v8 = v6;
  }

  return v7;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_enabled);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_supportsIncrementalUpdates);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; isEnabled=%@; supportsIncrementalUpdates=%@>"),
    v4,
    self,
    v5,
    v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)supportsIncrementalUpdates
{
  return self->_supportsIncrementalUpdates;
}

@end
