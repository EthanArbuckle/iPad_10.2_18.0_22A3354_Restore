@implementation SGMEventICSOpportunity

- (SGMEventICSOpportunity)init
{
  SGMEventICSOpportunity *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  PETScalarEventTracker *tracker;
  objc_super v11;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)SGMEventICSOpportunity;
  v2 = -[SGMEventICSOpportunity init](&v11, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("Source"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("Recipient"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("AccountSetup"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc(MEMORY[0x1E0D80F38]);
    v12[0] = v3;
    v12[1] = v4;
    v12[2] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "initWithFeatureId:event:registerProperties:propertySubsets:", CFSTR("Found"), CFSTR("ICSOpportunity"), v7, MEMORY[0x1E0C9AA60]);
    tracker = v2->_tracker;
    v2->_tracker = (PETScalarEventTracker *)v8;

  }
  return v2;
}

- (void)trackEventWithScalar:(unint64_t)a3 source:(SGMEventICSSourceType_)a4 recipient:(SGMEventICSSourceType_)a5 accountSetup:(SGMTypeSafeBool_)a6
{
  const __CFString *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  PETScalarEventTracker *tracker;
  void *v21;
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  if (a4.var0 >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGMEventICSSourceType_toString(SGMEventICSSourceType)");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("SGMetricsDefines.h"), 241, CFSTR("unrecognized tag %lu on SGMEventICSSourceType"), a4.var0);

    v11 = CFSTR("ERR_UNMATCHED_TAG");
  }
  else
  {
    v11 = off_1E4761720[a4.var0];
  }
  if (a5.var0 < 5)
  {
    v14 = off_1E4761720[a5.var0];
    if (a6.var0)
      goto LABEL_6;
LABEL_9:
    v15 = CFSTR("0");
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGMEventICSSourceType_toString(SGMEventICSSourceType)");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("SGMetricsDefines.h"), 241, CFSTR("unrecognized tag %lu on SGMEventICSSourceType"), a5.var0);

  v14 = CFSTR("ERR_UNMATCHED_TAG");
  if (!a6.var0)
    goto LABEL_9;
LABEL_6:
  if (a6.var0 == 1)
  {
    v15 = CFSTR("1");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGMTypeSafeBool_toString(SGMTypeSafeBool)");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("SGMetricsDefines.h"), 12, CFSTR("unrecognized tag %lu on SGMTypeSafeBool"), a6.var0);

    v15 = CFSTR("ERR_UNMATCHED_TAG");
  }
LABEL_11:
  tracker = self->_tracker;
  v22[0] = v11;
  v22[1] = v14;
  v22[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PETScalarEventTracker trackEventWithPropertyValues:value:](tracker, "trackEventWithPropertyValues:value:", v21, a3);

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
