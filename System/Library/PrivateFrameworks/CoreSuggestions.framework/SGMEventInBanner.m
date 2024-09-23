@implementation SGMEventInBanner

- (SGMEventInBanner)init
{
  SGMEventInBanner *v2;
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
  v12.super_class = (Class)SGMEventInBanner;
  v2 = -[SGMEventInBanner init](&v12, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("App"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("Category"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("Extracted"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("State"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc(MEMORY[0x1E0D80F38]);
    v13[0] = v3;
    v13[1] = v4;
    v13[2] = v5;
    v13[3] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "initWithFeatureId:event:registerProperties:propertySubsets:", CFSTR("Found"), CFSTR("EventInBanner"), v8, MEMORY[0x1E0C9AA60]);
    tracker = v2->_tracker;
    v2->_tracker = (PETScalarEventTracker *)v9;

  }
  return v2;
}

- (void)trackEventWithScalar:(unint64_t)a3 app:(SGMBannerDisplayApp_)a4 category:(SGMEventCategory_)a5 extracted:(SGMEventExtractionType_)a6 state:(SGMEventState_)a7
{
  const __CFString *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  PETScalarEventTracker *tracker;
  void *v26;
  _QWORD v27[5];

  v27[4] = *MEMORY[0x1E0C80C00];
  if (a4.var0 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGMBannerDisplayApp_toString(SGMBannerDisplayApp)");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("SGMetricsDefines.h"), 61, CFSTR("unrecognized tag %lu on SGMBannerDisplayApp"), a4.var0);

    v13 = CFSTR("ERR_UNMATCHED_TAG");
  }
  else
  {
    v13 = off_1E4761260[a4.var0];
  }
  if (a5.var0 >= 0xB)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGMEventCategory_toString(SGMEventCategory)");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("SGMetricsDefines.h"), 222, CFSTR("unrecognized tag %lu on SGMEventCategory"), a5.var0);

    v16 = CFSTR("ERR_UNMATCHED_TAG");
    if (a6.var0)
    {
LABEL_6:
      if (a6.var0 == 1)
      {
        v17 = CFSTR("Template");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGMEventExtractionType_toString(SGMEventExtractionType)");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("SGMetricsDefines.h"), 269, CFSTR("unrecognized tag %lu on SGMEventExtractionType"), a6.var0);

        v17 = CFSTR("ERR_UNMATCHED_TAG");
      }
      goto LABEL_11;
    }
  }
  else
  {
    v16 = off_1E4761278[a5.var0];
    if (a6.var0)
      goto LABEL_6;
  }
  v17 = CFSTR("iCal");
LABEL_11:
  if (a7.var0 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGMEventState_toString(SGMEventState)");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, CFSTR("SGMetricsDefines.h"), 256, CFSTR("unrecognized tag %lu on SGMEventState"), a7.var0);

    v22 = CFSTR("ERR_UNMATCHED_TAG");
  }
  else
  {
    v22 = off_1E4761248[a7.var0];
  }
  tracker = self->_tracker;
  v27[0] = v13;
  v27[1] = v16;
  v27[2] = v17;
  v27[3] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[PETScalarEventTracker trackEventWithPropertyValues:value:](tracker, "trackEventWithPropertyValues:value:", v26, a3);

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
