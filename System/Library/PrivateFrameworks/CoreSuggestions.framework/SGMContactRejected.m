@implementation SGMContactRejected

- (SGMContactRejected)init
{
  SGMContactRejected *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  PETScalarEventTracker *tracker;
  objc_super v13;
  _QWORD v14[6];

  v14[5] = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)SGMContactRejected;
  v2 = -[SGMContactRejected init](&v13, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("App"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("Extracted"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("SelfId"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "propertyWithName:range:clampValues:", CFSTR("ExtractionModelVersion"), 0, 1000, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("ContactDetail"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc(MEMORY[0x1E0D80F38]);
    v14[0] = v3;
    v14[1] = v4;
    v14[2] = v5;
    v14[3] = v6;
    v14[4] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "initWithFeatureId:event:registerProperties:propertySubsets:", CFSTR("Found"), CFSTR("ContactRejected"), v9, MEMORY[0x1E0C9AA60]);
    tracker = v2->_tracker;
    v2->_tracker = (PETScalarEventTracker *)v10;

  }
  return v2;
}

- (void)trackEventWithScalar:(unint64_t)a3 app:(SGMBannerDisplayApp_)a4 extracted:(SGMBannerExtractionType_)a5 selfId:(SGMTypeSafeBool_)a6 extractionModelVersion:(unint64_t)a7 contactDetail:(SGMContactDetailType_)a8
{
  const __CFString *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  PETScalarEventTracker *tracker;
  void *v27;
  void *v28;
  _QWORD v30[6];

  v30[5] = *MEMORY[0x1E0C80C00];
  if (a4.var0 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGMBannerDisplayApp_toString(SGMBannerDisplayApp)");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("SGMetricsDefines.h"), 61, CFSTR("unrecognized tag %lu on SGMBannerDisplayApp"), a4.var0);

    v14 = CFSTR("ERR_UNMATCHED_TAG");
  }
  else
  {
    v14 = off_1E4761260[a4.var0];
  }
  if (a5.var0 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGMBannerExtractionType_toString(SGMBannerExtractionType)");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("SGMetricsDefines.h"), 111, CFSTR("unrecognized tag %lu on SGMBannerExtractionType"), a5.var0);

    v17 = CFSTR("ERR_UNMATCHED_TAG");
    if (a6.var0)
    {
LABEL_6:
      if (a6.var0 == 1)
      {
        v18 = CFSTR("1");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGMTypeSafeBool_toString(SGMTypeSafeBool)");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("SGMetricsDefines.h"), 12, CFSTR("unrecognized tag %lu on SGMTypeSafeBool"), a6.var0);

        v18 = CFSTR("ERR_UNMATCHED_TAG");
      }
      goto LABEL_11;
    }
  }
  else
  {
    v17 = off_1E4761228[a5.var0];
    if (a6.var0)
      goto LABEL_6;
  }
  v18 = CFSTR("0");
LABEL_11:
  if (a8.var0 >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGMContactDetailType_toString(SGMContactDetailType)");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, CFSTR("SGMetricsDefines.h"), 159, CFSTR("unrecognized tag %lu on SGMContactDetailType"), a8.var0);

    v23 = CFSTR("ERR_UNMATCHED_TAG");
  }
  else
  {
    v23 = off_1E4761670[a8.var0];
  }
  tracker = self->_tracker;
  v30[0] = v14;
  v30[1] = v17;
  v30[2] = v18;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a7);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v27;
  v30[4] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 5);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[PETScalarEventTracker trackEventWithPropertyValues:value:](tracker, "trackEventWithPropertyValues:value:", v28, a3);

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
