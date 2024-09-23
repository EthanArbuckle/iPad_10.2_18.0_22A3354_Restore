@implementation SGMFoundInMailModelScore

- (SGMFoundInMailModelScore)init
{
  SGMFoundInMailModelScore *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  PETScalarEventTracker *tracker;
  objc_super v14;
  _QWORD v15[7];

  v15[6] = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)SGMFoundInMailModelScore;
  v2 = -[SGMFoundInMailModelScore init](&v14, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("Model"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("ContactDetail"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("Result"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("Correct"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("Mode"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("Supervision"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc(MEMORY[0x1E0D80F38]);
    v15[0] = v3;
    v15[1] = v4;
    v15[2] = v5;
    v15[3] = v6;
    v15[4] = v7;
    v15[5] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "initWithFeatureId:event:registerProperties:propertySubsets:", CFSTR("Found"), CFSTR("FoundInMailModelScore"), v10, MEMORY[0x1E0C9AA60]);
    tracker = v2->_tracker;
    v2->_tracker = (PETScalarEventTracker *)v11;

  }
  return v2;
}

- (void)trackEventWithScalar:(unint64_t)a3 model:(SGMFoundInMailModelType_)a4 contactDetail:(SGMContactDetailType_)a5 result:(SGMTypeSafeBool_)a6 correct:(SGMTypeSafeBool_)a7 mode:(SGFoundInMailModelMode_)a8 supervision:(SGMFoundInMailSupervisionType_)a9
{
  const __CFString *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  PETScalarEventTracker *tracker;
  void *v35;
  const __CFString *v37;
  const __CFString *v38;
  _QWORD v39[7];

  v39[6] = *MEMORY[0x1E0C80C00];
  if (a4.var0 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGMFoundInMailModelType_toString(SGMFoundInMailModelType)");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("SGMetricsDefines.h"), 603, CFSTR("unrecognized tag %lu on SGMFoundInMailModelType"), a4.var0);

    v15 = CFSTR("ERR_UNMATCHED_TAG");
  }
  else
  {
    v15 = off_1E4761650[a4.var0];
  }
  if (a5.var0 >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGMContactDetailType_toString(SGMContactDetailType)");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("SGMetricsDefines.h"), 159, CFSTR("unrecognized tag %lu on SGMContactDetailType"), a5.var0);

    v18 = CFSTR("ERR_UNMATCHED_TAG");
  }
  else
  {
    v18 = off_1E4761670[a5.var0];
  }
  v38 = v18;
  if (a6.var0)
  {
    if (a6.var0 == 1)
    {
      v21 = CFSTR("1");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGMTypeSafeBool_toString(SGMTypeSafeBool)");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, CFSTR("SGMetricsDefines.h"), 12, CFSTR("unrecognized tag %lu on SGMTypeSafeBool"), a6.var0);

      v21 = CFSTR("ERR_UNMATCHED_TAG");
    }
  }
  else
  {
    v21 = CFSTR("0");
  }
  v37 = v21;
  if (a7.var0)
  {
    v24 = a3;
    if (a7.var0 == 1)
    {
      v25 = CFSTR("1");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGMTypeSafeBool_toString(SGMTypeSafeBool)");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, CFSTR("SGMetricsDefines.h"), 12, CFSTR("unrecognized tag %lu on SGMTypeSafeBool"), a7.var0);

      v25 = CFSTR("ERR_UNMATCHED_TAG");
    }
  }
  else
  {
    v24 = a3;
    v25 = CFSTR("0");
  }
  if (a8.var0 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGFoundInMailModelMode_toString(SGFoundInMailModelMode)");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInFunction:file:lineNumber:description:", v30, CFSTR("SGMetricsDefines.h"), 635, CFSTR("unrecognized tag %lu on SGFoundInMailModelMode"), a8.var0);

    v28 = CFSTR("ERR_UNMATCHED_TAG");
  }
  else
  {
    v28 = off_1E4761698[a8.var0];
  }
  if (a9.var0 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGMFoundInMailSupervisionType_toString(SGMFoundInMailSupervisionType)");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInFunction:file:lineNumber:description:", v33, CFSTR("SGMetricsDefines.h"), 620, CFSTR("unrecognized tag %lu on SGMFoundInMailSupervisionType"), a9.var0);

    v31 = CFSTR("ERR_UNMATCHED_TAG");
  }
  else
  {
    v31 = off_1E47616B0[a9.var0];
  }
  tracker = self->_tracker;
  v39[0] = v15;
  v39[1] = v38;
  v39[2] = v37;
  v39[3] = v25;
  v39[4] = v28;
  v39[5] = v31;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 6);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[PETScalarEventTracker trackEventWithPropertyValues:value:](tracker, "trackEventWithPropertyValues:value:", v35, v24);

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
