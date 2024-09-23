@implementation SGMEventBannerConfirmed

- (SGMEventBannerConfirmed)init
{
  SGMEventBannerConfirmed *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  PETScalarEventTracker *tracker;
  objc_super v15;
  _QWORD v16[8];

  v16[7] = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)SGMEventBannerConfirmed;
  v2 = -[SGMEventBannerConfirmed init](&v15, sel_init);
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
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("TiA"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("DaA"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("DuA"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc(MEMORY[0x1E0D80F38]);
    v16[0] = v3;
    v16[1] = v4;
    v16[2] = v5;
    v16[3] = v6;
    v16[4] = v7;
    v16[5] = v8;
    v16[6] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "initWithFeatureId:event:registerProperties:propertySubsets:", CFSTR("Found"), CFSTR("EventBannerConfirmed"), v11, MEMORY[0x1E0C9AA60]);
    tracker = v2->_tracker;
    v2->_tracker = (PETScalarEventTracker *)v12;

  }
  return v2;
}

- (void)trackEventWithScalar:(unint64_t)a3 app:(SGMBannerDisplayApp_)a4 category:(SGMEventCategory_)a5 extracted:(SGMEventExtractionType_)a6 state:(SGMEventState_)a7 titleAdj:(SGMEventStringAdj_)a8 dateAdj:(SGMEventDateAdj_)a9 duraAdj:(SGMEventDurationAdj_)a10
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
  const __CFString *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  PETScalarEventTracker *tracker;
  void *v37;
  const __CFString *v38;
  const __CFString *v39;
  _QWORD v42[8];

  v42[7] = *MEMORY[0x1E0C80C00];
  if (a4.var0 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGMBannerDisplayApp_toString(SGMBannerDisplayApp)");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("SGMetricsDefines.h"), 61, CFSTR("unrecognized tag %lu on SGMBannerDisplayApp"), a4.var0);

    v15 = CFSTR("ERR_UNMATCHED_TAG");
  }
  else
  {
    v15 = off_1E4761260[a4.var0];
  }
  v39 = v15;
  if (a5.var0 >= 0xB)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGMEventCategory_toString(SGMEventCategory)");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("SGMetricsDefines.h"), 222, CFSTR("unrecognized tag %lu on SGMEventCategory"), a5.var0);

    v18 = CFSTR("ERR_UNMATCHED_TAG");
  }
  else
  {
    v18 = off_1E4761278[a5.var0];
  }
  v38 = v18;
  if (a6.var0)
  {
    if (a6.var0 == 1)
    {
      v21 = CFSTR("Template");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGMEventExtractionType_toString(SGMEventExtractionType)");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, CFSTR("SGMetricsDefines.h"), 269, CFSTR("unrecognized tag %lu on SGMEventExtractionType"), a6.var0);

      v21 = CFSTR("ERR_UNMATCHED_TAG");
    }
  }
  else
  {
    v21 = CFSTR("iCal");
  }
  if (a7.var0 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGMEventState_toString(SGMEventState)");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, CFSTR("SGMetricsDefines.h"), 256, CFSTR("unrecognized tag %lu on SGMEventState"), a7.var0);

    v24 = CFSTR("ERR_UNMATCHED_TAG");
  }
  else
  {
    v24 = off_1E4761248[a7.var0];
  }
  if (a8.var0 >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGMEventStringAdj_toString(SGMEventStringAdj)");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, CFSTR("SGMetricsDefines.h"), 288, CFSTR("unrecognized tag %lu on SGMEventStringAdj"), a8.var0);

    v27 = CFSTR("ERR_UNMATCHED_TAG");
  }
  else
  {
    v27 = off_1E4761398[a8.var0];
  }
  if (a9.var0 >= 0xA)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGMEventDateAdj_toString(SGMEventDateAdj)");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", v32, CFSTR("SGMetricsDefines.h"), 317, CFSTR("unrecognized tag %lu on SGMEventDateAdj"), a9.var0);

    v30 = CFSTR("ERR_UNMATCHED_TAG");
  }
  else
  {
    v30 = off_1E47613C0[a9.var0];
  }
  if (a10.var0 >= 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGMEventDurationAdj_toString(SGMEventDurationAdj)");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, CFSTR("SGMetricsDefines.h"), 338, CFSTR("unrecognized tag %lu on SGMEventDurationAdj"), a10.var0);

    v33 = CFSTR("ERR_UNMATCHED_TAG");
  }
  else
  {
    v33 = off_1E4761410[a10.var0];
  }
  tracker = self->_tracker;
  v42[0] = v39;
  v42[1] = v38;
  v42[2] = v21;
  v42[3] = v24;
  v42[4] = v27;
  v42[5] = v30;
  v42[6] = v33;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 7);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[PETScalarEventTracker trackEventWithPropertyValues:value:](tracker, "trackEventWithPropertyValues:value:", v37, a3);

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
