@implementation FCEntitlementsOverride

- (FCEntitlementsOverride)initWithEntitlements:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  FCEntitlementsOverride *v8;
  uint64_t v9;
  NSArray *entitlements;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FCEntitlementsOverride;
  v8 = -[FCEntitlementsOverride init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    entitlements = v8->_entitlements;
    v8->_entitlements = (NSArray *)v9;

    objc_storeStrong((id *)&v8->_error, a4);
  }

  return v8;
}

- (NSArray)entitlements
{
  return self->_entitlements;
}

- (void)setEntitlements:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_entitlements, 0);
}

@end
