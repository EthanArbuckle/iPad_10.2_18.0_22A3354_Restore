@implementation SGMSelfIdModelScore

- (SGMSelfIdModelScore)init
{
  SGMSelfIdModelScore *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  PETScalarEventTracker *tracker;
  objc_super v12;
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)SGMSelfIdModelScore;
  v2 = -[SGMSelfIdModelScore init](&v12, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("Model"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("Result"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("Supervision"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "propertyWithName:range:clampValues:", CFSTR("ExtractionModelVersion"), 0, 1000, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc(MEMORY[0x1E0D80F38]);
    v13[0] = v3;
    v13[1] = v4;
    v13[2] = v5;
    v13[3] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "initWithFeatureId:event:registerProperties:propertySubsets:", CFSTR("Found"), CFSTR("SelfIdModelScore"), v8, MEMORY[0x1E0C9AA60]);
    tracker = v2->_tracker;
    v2->_tracker = (PETScalarEventTracker *)v9;

  }
  return v2;
}

- (void)trackEventWithScalar:(unint64_t)a3 model:(SGMSelfIdModelType_)a4 result:(SGMTypeSafeBool_)a5 supervision:(SGMSelfIdSupervisionType_)a6 extractionModelVersion:(unint64_t)a7
{
  const __CFString *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  PETScalarEventTracker *tracker;
  void *v23;
  void *v24;
  _QWORD v25[5];

  v25[4] = *MEMORY[0x1E0C80C00];
  if (a4.var0 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGMSelfIdModelType_toString(SGMSelfIdModelType)");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("SGMetricsDefines.h"), 652, CFSTR("unrecognized tag %lu on SGMSelfIdModelType"), a4.var0);

    v13 = CFSTR("ERR_UNMATCHED_TAG");
    if (a5.var0)
    {
LABEL_3:
      if (a5.var0 == 1)
      {
        v14 = CFSTR("1");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGMTypeSafeBool_toString(SGMTypeSafeBool)");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("SGMetricsDefines.h"), 12, CFSTR("unrecognized tag %lu on SGMTypeSafeBool"), a5.var0);

        v14 = CFSTR("ERR_UNMATCHED_TAG");
      }
      goto LABEL_8;
    }
  }
  else
  {
    v13 = off_1E47616D0[a4.var0];
    if (a5.var0)
      goto LABEL_3;
  }
  v14 = CFSTR("0");
LABEL_8:
  if (a6.var0 >= 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGMSelfIdSupervisionType_toString(SGMSelfIdSupervisionType)");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("SGMetricsDefines.h"), 673, CFSTR("unrecognized tag %lu on SGMSelfIdSupervisionType"), a6.var0);

    v19 = CFSTR("ERR_UNMATCHED_TAG");
  }
  else
  {
    v19 = off_1E47616F0[a6.var0];
  }
  tracker = self->_tracker;
  v25[0] = v13;
  v25[1] = v14;
  v25[2] = v19;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a7);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PETScalarEventTracker trackEventWithPropertyValues:value:](tracker, "trackEventWithPropertyValues:value:", v24, a3);

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
