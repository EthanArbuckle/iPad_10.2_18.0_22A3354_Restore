@implementation SGMBundleIdsUsingOldEntitlement

- (SGMBundleIdsUsingOldEntitlement)init
{
  SGMBundleIdsUsingOldEntitlement *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  PETScalarEventTracker *tracker;
  objc_super v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)SGMBundleIdsUsingOldEntitlement;
  v2 = -[SGMBundleIdsUsingOldEntitlement init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("BundleId"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_alloc(MEMORY[0x1E0D80F38]);
    v10[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "initWithFeatureId:event:registerProperties:propertySubsets:", CFSTR("Found"), CFSTR("BundleIdsUsingOldEntitlement"), v5, MEMORY[0x1E0C9AA60]);
    tracker = v2->_tracker;
    v2->_tracker = (PETScalarEventTracker *)v6;

  }
  return v2;
}

- (void)trackEventWithScalar:(unint64_t)a3 bundleId:(id)a4
{
  PETScalarEventTracker *tracker;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  tracker = self->_tracker;
  v9 = a4;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  objc_msgSend(v6, "arrayWithObjects:count:", &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PETScalarEventTracker trackEventWithPropertyValues:value:](tracker, "trackEventWithPropertyValues:value:", v8, a3, v9, v10);

}

- (PETScalarEventTracker)tracker
{
  return self->_tracker;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tracker, 0);
}

@end
