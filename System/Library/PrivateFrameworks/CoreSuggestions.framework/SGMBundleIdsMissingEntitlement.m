@implementation SGMBundleIdsMissingEntitlement

- (SGMBundleIdsMissingEntitlement)init
{
  SGMBundleIdsMissingEntitlement *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  PETScalarEventTracker *tracker;
  objc_super v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)SGMBundleIdsMissingEntitlement;
  v2 = -[SGMBundleIdsMissingEntitlement init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("BundleId"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("Entitlement"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc(MEMORY[0x1E0D80F38]);
    v11[0] = v3;
    v11[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "initWithFeatureId:event:registerProperties:propertySubsets:", CFSTR("Found"), CFSTR("BundleIdsMissingEntitlement"), v6, MEMORY[0x1E0C9AA60]);
    tracker = v2->_tracker;
    v2->_tracker = (PETScalarEventTracker *)v7;

  }
  return v2;
}

- (void)trackEventWithScalar:(unint64_t)a3 bundleId:(id)a4 entitlement:(id)a5
{
  PETScalarEventTracker *tracker;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  tracker = self->_tracker;
  v12[0] = a4;
  v12[1] = a5;
  v8 = (void *)MEMORY[0x1E0C99D20];
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "arrayWithObjects:count:", v12, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PETScalarEventTracker trackEventWithPropertyValues:value:](tracker, "trackEventWithPropertyValues:value:", v11, a3);

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
