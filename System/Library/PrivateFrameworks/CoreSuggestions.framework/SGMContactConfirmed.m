@implementation SGMContactConfirmed

- (SGMContactConfirmed)init
{
  SGMContactConfirmed *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  PETScalarEventTracker *tracker;
  void *v16;
  void *v17;
  objc_super v18;
  _QWORD v19[10];

  v19[9] = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)SGMContactConfirmed;
  v2 = -[SGMContactConfirmed init](&v18, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("App"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("FirstNameAdj"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("LastNameAdj"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("MiddleNameAdj"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("IsUpdate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("Extracted"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "propertyWithName:range:clampValues:", CFSTR("ExtractionModelVersion"), 0, 1000, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("SelfId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("ContactDetail"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc(MEMORY[0x1E0D80F38]);
    v19[0] = v17;
    v19[1] = v16;
    v19[2] = v3;
    v19[3] = v4;
    v19[4] = v5;
    v19[5] = v6;
    v11 = (void *)v6;
    v19[6] = v7;
    v19[7] = v8;
    v19[8] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v10, "initWithFeatureId:event:registerProperties:propertySubsets:", CFSTR("Found"), CFSTR("ContactConfirmed"), v12, MEMORY[0x1E0C9AA60]);
    tracker = v2->_tracker;
    v2->_tracker = (PETScalarEventTracker *)v13;

  }
  return v2;
}

- (void)trackEventWithScalar:(unint64_t)a3 app:(SGMBannerDisplayApp_)a4 firstNameAdj:(SGMTypeSafeBool_)a5 lastNameAdj:(SGMTypeSafeBool_)a6 middleNameAdj:(SGMTypeSafeBool_)a7 isUpdate:(SGMTypeSafeBool_)a8 extracted:(SGMBannerExtractionType_)a9 extractionModelVersion:(unint64_t)a10 selfId:(SGMTypeSafeBool_)a11 contactDetail:(SGMContactDetailType_)a12
{
  unint64_t v19;
  const __CFString *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  SGMContactConfirmed *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  const __CFString *v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  PETScalarEventTracker *tracker;
  void *v48;
  void *v49;
  const __CFString *v50;
  const __CFString *v51;
  const __CFString *v52;
  unint64_t v53;
  _QWORD v54[10];

  v54[9] = *MEMORY[0x1E0C80C00];
  v19 = 0x1E0CB3000uLL;
  if (a4.var0 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGMBannerDisplayApp_toString(SGMBannerDisplayApp)");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, CFSTR("SGMetricsDefines.h"), 61, CFSTR("unrecognized tag %lu on SGMBannerDisplayApp"), a4.var0);

    v19 = 0x1E0CB3000;
    v20 = CFSTR("ERR_UNMATCHED_TAG");
    if (a5.var0)
    {
LABEL_3:
      if (a5.var0 == 1)
      {
        v21 = CFSTR("1");
      }
      else
      {
        objc_msgSend(*(id *)(v19 + 1160), "currentHandler");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGMTypeSafeBool_toString(SGMTypeSafeBool)");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, CFSTR("SGMetricsDefines.h"), 12, CFSTR("unrecognized tag %lu on SGMTypeSafeBool"), a5.var0);

        v21 = CFSTR("ERR_UNMATCHED_TAG");
      }
      goto LABEL_8;
    }
  }
  else
  {
    v20 = off_1E4761260[a4.var0];
    if (a5.var0)
      goto LABEL_3;
  }
  v21 = CFSTR("0");
LABEL_8:
  v52 = v21;
  if (a6.var0)
  {
    if (a6.var0 == 1)
    {
      v26 = CFSTR("1");
    }
    else
    {
      objc_msgSend(*(id *)(v19 + 1160), "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGMTypeSafeBool_toString(SGMTypeSafeBool)");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, CFSTR("SGMetricsDefines.h"), 12, CFSTR("unrecognized tag %lu on SGMTypeSafeBool"), a6.var0);

      v26 = CFSTR("ERR_UNMATCHED_TAG");
    }
  }
  else
  {
    v26 = CFSTR("0");
  }
  v51 = v26;
  v53 = a3;
  v29 = self;
  if (a7.var0)
  {
    if (a7.var0 == 1)
    {
      v30 = CFSTR("1");
    }
    else
    {
      objc_msgSend(*(id *)(v19 + 1160), "currentHandler");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGMTypeSafeBool_toString(SGMTypeSafeBool)");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", v32, CFSTR("SGMetricsDefines.h"), 12, CFSTR("unrecognized tag %lu on SGMTypeSafeBool"), a7.var0);

      v30 = CFSTR("ERR_UNMATCHED_TAG");
    }
  }
  else
  {
    v30 = CFSTR("0");
  }
  v50 = v30;
  if (a8.var0)
  {
    if (a8.var0 == 1)
    {
      v33 = CFSTR("1");
    }
    else
    {
      objc_msgSend(*(id *)(v19 + 1160), "currentHandler");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGMTypeSafeBool_toString(SGMTypeSafeBool)");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, CFSTR("SGMetricsDefines.h"), 12, CFSTR("unrecognized tag %lu on SGMTypeSafeBool"), a8.var0);

      v33 = CFSTR("ERR_UNMATCHED_TAG");
    }
  }
  else
  {
    v33 = CFSTR("0");
  }
  if (a9.var0 >= 4)
  {
    objc_msgSend(*(id *)(v19 + 1160), "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGMBannerExtractionType_toString(SGMBannerExtractionType)");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInFunction:file:lineNumber:description:", v38, CFSTR("SGMetricsDefines.h"), 111, CFSTR("unrecognized tag %lu on SGMBannerExtractionType"), a9.var0);

    v36 = CFSTR("ERR_UNMATCHED_TAG");
  }
  else
  {
    v36 = off_1E4761228[a9.var0];
  }
  if (a11.var0)
  {
    if (a11.var0 == 1)
    {
      v39 = CFSTR("1");
    }
    else
    {
      objc_msgSend(*(id *)(v19 + 1160), "currentHandler");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGMTypeSafeBool_toString(SGMTypeSafeBool)");
      v41 = v33;
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "handleFailureInFunction:file:lineNumber:description:", v42, CFSTR("SGMetricsDefines.h"), 12, CFSTR("unrecognized tag %lu on SGMTypeSafeBool"), a11.var0);

      v33 = v41;
      v39 = CFSTR("ERR_UNMATCHED_TAG");
    }
  }
  else
  {
    v39 = CFSTR("0");
  }
  if (a12.var0 >= 5)
  {
    objc_msgSend(*(id *)(v19 + 1160), "currentHandler");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGMContactDetailType_toString(SGMContactDetailType)");
    v45 = v33;
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "handleFailureInFunction:file:lineNumber:description:", v46, CFSTR("SGMetricsDefines.h"), 159, CFSTR("unrecognized tag %lu on SGMContactDetailType"), a12.var0);

    v33 = v45;
    v43 = CFSTR("ERR_UNMATCHED_TAG");
  }
  else
  {
    v43 = off_1E4761670[a12.var0];
  }
  tracker = v29->_tracker;
  v54[0] = v20;
  v54[1] = v52;
  v54[2] = v51;
  v54[3] = v50;
  v54[4] = v33;
  v54[5] = v36;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a10);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v54[6] = v48;
  v54[7] = v39;
  v54[8] = v43;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 9);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[PETScalarEventTracker trackEventWithPropertyValues:value:](tracker, "trackEventWithPropertyValues:value:", v49, v53);

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
