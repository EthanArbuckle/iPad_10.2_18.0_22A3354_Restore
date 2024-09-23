@implementation _EntitlementCheckResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entitlement, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

- (BOOL)isEntitled
{
  return self->_entitled;
}

- (NSError)error
{
  return self->_error;
}

- (_EntitlementCheckResult)initWithEntitlement:(id)a3 group:(id)a4
{
  id v6;
  id v7;
  _EntitlementCheckResult *v8;
  uint64_t v9;
  NSString *entitlement;
  uint64_t v11;
  NSString *group;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_EntitlementCheckResult;
  v8 = -[_EntitlementCheckResult init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    entitlement = v8->_entitlement;
    v8->_entitlement = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    group = v8->_group;
    v8->_group = (NSString *)v11;

  }
  return v8;
}

- (void)setEntitled:(BOOL)a3
{
  self->_entitled = a3;
}

- (NSString)group
{
  return self->_group;
}

- (NSString)entitlement
{
  return self->_entitlement;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void)setGroup:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setEntitlement:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

@end
