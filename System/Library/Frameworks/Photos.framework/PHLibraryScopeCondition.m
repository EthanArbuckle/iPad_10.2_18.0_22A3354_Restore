@implementation PHLibraryScopeCondition

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_proxyObject;
}

- (PHLibraryScopeCondition)initWithProxyObject:(id)a3
{
  id v5;
  PHLibraryScopeCondition *v6;
  PHLibraryScopeCondition *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PHLibraryScopeCondition;
  v6 = -[PHLibraryScopeCondition init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_proxyObject, a3);

  return v7;
}

- (PHLibraryScopeCondition)init
{
  id v3;
  PHLibraryScopeCondition *v4;

  v3 = objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(), "_mappedPLConditionClass"));
  v4 = -[PHLibraryScopeCondition initWithProxyObject:](self, "initWithProxyObject:", v3);

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  void *v7;

  v5 = objc_alloc((Class)objc_opt_class());
  v6 = (void *)-[PLLibraryScopeCondition copyWithZone:](self->_proxyObject, "copyWithZone:", a3);
  v7 = (void *)objc_msgSend(v5, "initWithProxyObject:", v6);

  return v7;
}

- (id)description
{
  return (id)-[PLLibraryScopeCondition description](self->_proxyObject, "description");
}

- (PLLibraryScopeCondition)proxyObject
{
  return self->_proxyObject;
}

- (void)setProxyObject:(id)a3
{
  objc_storeStrong((id *)&self->_proxyObject, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyObject, 0);
}

+ (Class)_mappedPLConditionClass
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = objc_opt_class();
  if (v2 == objc_opt_class()
    || (v3 = objc_opt_class(), v3 == objc_opt_class())
    || (v4 = objc_opt_class(), v4 == objc_opt_class()))
  {
    v5 = (void *)objc_opt_class();
  }
  else
  {
    v5 = 0;
  }
  return (Class)v5;
}

@end
