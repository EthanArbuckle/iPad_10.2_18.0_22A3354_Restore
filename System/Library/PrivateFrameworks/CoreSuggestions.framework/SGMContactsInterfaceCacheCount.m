@implementation SGMContactsInterfaceCacheCount

- (SGMContactsInterfaceCacheCount)init
{
  SGMContactsInterfaceCacheCount *v2;
  id v3;
  uint64_t v4;
  PETDistributionEventTracker *tracker;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SGMContactsInterfaceCacheCount;
  v2 = -[SGMContactsInterfaceCacheCount init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D80F18]);
    v4 = objc_msgSend(v3, "initWithFeatureId:event:registerProperties:propertySubsets:", CFSTR("Found"), CFSTR("ContactsInterfaceCacheCount"), MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60]);
    tracker = v2->_tracker;
    v2->_tracker = (PETDistributionEventTracker *)v4;

  }
  return v2;
}

- (void)trackEventWithScalar:(double)a3
{
  -[PETDistributionEventTracker trackEventWithPropertyValues:value:](self->_tracker, "trackEventWithPropertyValues:value:", MEMORY[0x1E0C9AA60], a3);
}

- (PETDistributionEventTracker)tracker
{
  return self->_tracker;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tracker, 0);
}

@end
