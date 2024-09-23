@implementation SGMCNtoSGContactsCacheHit

- (SGMCNtoSGContactsCacheHit)init
{
  SGMCNtoSGContactsCacheHit *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  PETScalarEventTracker *tracker;
  objc_super v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)SGMCNtoSGContactsCacheHit;
  v2 = -[SGMCNtoSGContactsCacheHit init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("CacheHit"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_alloc(MEMORY[0x1E0D80F38]);
    v10[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "initWithFeatureId:event:registerProperties:propertySubsets:", CFSTR("Found"), CFSTR("CNtoSGContactsCacheHit"), v5, MEMORY[0x1E0C9AA60]);
    tracker = v2->_tracker;
    v2->_tracker = (PETScalarEventTracker *)v6;

  }
  return v2;
}

- (void)trackEventWithScalar:(unint64_t)a3 cacheHit:(SGMTypeSafeBool_)a4
{
  const __CFString *v7;
  void *v8;
  void *v9;
  PETScalarEventTracker *tracker;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (a4.var0)
  {
    if (a4.var0 == 1)
    {
      v7 = CFSTR("1");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGMTypeSafeBool_toString(SGMTypeSafeBool)");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("SGMetricsDefines.h"), 12, CFSTR("unrecognized tag %lu on SGMTypeSafeBool"), a4.var0);

      v7 = CFSTR("ERR_UNMATCHED_TAG");
    }
  }
  else
  {
    v7 = CFSTR("0");
  }
  tracker = self->_tracker;
  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
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
