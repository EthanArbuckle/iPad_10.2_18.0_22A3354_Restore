@implementation MTRBasicInformationClusterCapabilityMinimaStruct

- (MTRBasicInformationClusterCapabilityMinimaStruct)init
{
  MTRBasicInformationClusterCapabilityMinimaStruct *v2;
  MTRBasicInformationClusterCapabilityMinimaStruct *v3;
  NSNumber *caseSessionsPerFabric;
  NSNumber *subscriptionsPerFabric;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTRBasicInformationClusterCapabilityMinimaStruct;
  v2 = -[MTRBasicInformationClusterCapabilityMinimaStruct init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    caseSessionsPerFabric = v2->_caseSessionsPerFabric;
    v2->_caseSessionsPerFabric = (NSNumber *)&unk_250591B18;

    subscriptionsPerFabric = v3->_subscriptionsPerFabric;
    v3->_subscriptionsPerFabric = (NSNumber *)&unk_250591B18;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRBasicInformationClusterCapabilityMinimaStruct *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;

  v4 = objc_alloc_init(MTRBasicInformationClusterCapabilityMinimaStruct);
  objc_msgSend_caseSessionsPerFabric(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCaseSessionsPerFabric_(v4, v8, (uint64_t)v7);

  objc_msgSend_subscriptionsPerFabric(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSubscriptionsPerFabric_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: caseSessionsPerFabric:%@; subscriptionsPerFabric:%@; >"),
    v5,
    self->_caseSessionsPerFabric,
    self->_subscriptionsPerFabric);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)caseSessionsPerFabric
{
  return self->_caseSessionsPerFabric;
}

- (void)setCaseSessionsPerFabric:(NSNumber *)caseSessionsPerFabric
{
  objc_setProperty_nonatomic_copy(self, a2, caseSessionsPerFabric, 8);
}

- (NSNumber)subscriptionsPerFabric
{
  return self->_subscriptionsPerFabric;
}

- (void)setSubscriptionsPerFabric:(NSNumber *)subscriptionsPerFabric
{
  objc_setProperty_nonatomic_copy(self, a2, subscriptionsPerFabric, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionsPerFabric, 0);
  objc_storeStrong((id *)&self->_caseSessionsPerFabric, 0);
}

@end
