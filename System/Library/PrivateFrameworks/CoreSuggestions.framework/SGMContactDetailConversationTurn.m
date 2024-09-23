@implementation SGMContactDetailConversationTurn

- (SGMContactDetailConversationTurn)init
{
  SGMContactDetailConversationTurn *v2;
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
  void *v15;
  objc_super v16;
  _QWORD v17[9];

  v17[8] = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)SGMContactDetailConversationTurn;
  v2 = -[SGMContactDetailConversationTurn init](&v16, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("DetailExtraction"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("SelfIdName"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "propertyWithName:range:clampValues:", CFSTR("ExtractionModelVersion"), 0, 1000, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("ReceivedConverstationTurn"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("KnownSuggestedContactDetail"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("CuratedContactDetail"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("ThroughApp"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("ContactDetailUsed"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc(MEMORY[0x1E0D80F38]);
    v17[0] = v15;
    v17[1] = v3;
    v17[2] = v4;
    v17[3] = v5;
    v17[4] = v6;
    v17[5] = v7;
    v17[6] = v8;
    v17[7] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "initWithFeatureId:event:registerProperties:propertySubsets:", CFSTR("Found"), CFSTR("ContactDetailConversationTurn"), v11, MEMORY[0x1E0C9AA60]);
    tracker = v2->_tracker;
    v2->_tracker = (PETScalarEventTracker *)v12;

  }
  return v2;
}

- (void)trackEventWithScalar:(unint64_t)a3 detailExtraction:(SGMDetailExtractionType_)a4 selfIdName:(SGMTypeSafeBool_)a5 extractionModelVersion:(unint64_t)a6 receivedConverstationTurn:(SGMTypeSafeBool_)a7 knownSuggestedContactDetail:(SGMTypeSafeBool_)a8 curatedContactDetail:(SGMTypeSafeBool_)a9 throughApp:(SGMContactDetailUsedApp_)a10 contactDetailUsed:(SGMContactDetailType_)a11
{
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
  const __CFString *v36;
  void *v37;
  void *v38;
  PETScalarEventTracker *tracker;
  void *v40;
  void *v41;
  const __CFString *v42;
  const __CFString *v43;
  unint64_t v44;
  _QWORD v45[9];

  v45[8] = *MEMORY[0x1E0C80C00];
  if (a4.var0 >= 0xA)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGMDetailExtractionType_toString(SGMDetailExtractionType)");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("SGMetricsDefines.h"), 140, CFSTR("unrecognized tag %lu on SGMDetailExtractionType"), a4.var0);

    v18 = CFSTR("ERR_UNMATCHED_TAG");
  }
  else
  {
    v18 = off_1E47611D8[a4.var0];
  }
  v44 = a3;
  if (a5.var0)
  {
    if (a5.var0 == 1)
    {
      v21 = CFSTR("1");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGMTypeSafeBool_toString(SGMTypeSafeBool)");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, CFSTR("SGMetricsDefines.h"), 12, CFSTR("unrecognized tag %lu on SGMTypeSafeBool"), a5.var0);

      v21 = CFSTR("ERR_UNMATCHED_TAG");
    }
  }
  else
  {
    v21 = CFSTR("0");
  }
  v43 = v21;
  if (a7.var0)
  {
    if (a7.var0 == 1)
    {
      v24 = CFSTR("1");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGMTypeSafeBool_toString(SGMTypeSafeBool)");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, CFSTR("SGMetricsDefines.h"), 12, CFSTR("unrecognized tag %lu on SGMTypeSafeBool"), a7.var0);

      v24 = CFSTR("ERR_UNMATCHED_TAG");
    }
  }
  else
  {
    v24 = CFSTR("0");
  }
  v42 = v24;
  if (a8.var0)
  {
    if (a8.var0 == 1)
    {
      v27 = CFSTR("1");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGMTypeSafeBool_toString(SGMTypeSafeBool)");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, CFSTR("SGMetricsDefines.h"), 12, CFSTR("unrecognized tag %lu on SGMTypeSafeBool"), a8.var0);

      v27 = CFSTR("ERR_UNMATCHED_TAG");
    }
  }
  else
  {
    v27 = CFSTR("0");
  }
  if (a9.var0)
  {
    if (a9.var0 == 1)
    {
      v30 = CFSTR("1");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGMTypeSafeBool_toString(SGMTypeSafeBool)");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", v32, CFSTR("SGMetricsDefines.h"), 12, CFSTR("unrecognized tag %lu on SGMTypeSafeBool"), a9.var0);

      v30 = CFSTR("ERR_UNMATCHED_TAG");
    }
  }
  else
  {
    v30 = CFSTR("0");
  }
  if (a10.var0 >= 0xC)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGMContactDetailUsedApp_toString(SGMContactDetailUsedApp)");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, CFSTR("SGMetricsDefines.h"), 94, CFSTR("unrecognized tag %lu on SGMContactDetailUsedApp"), a10.var0);

    v33 = CFSTR("ERR_UNMATCHED_TAG");
  }
  else
  {
    v33 = off_1E47615F0[a10.var0];
  }
  if (a11.var0 >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGMContactDetailType_toString(SGMContactDetailType)");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInFunction:file:lineNumber:description:", v38, CFSTR("SGMetricsDefines.h"), 159, CFSTR("unrecognized tag %lu on SGMContactDetailType"), a11.var0);

    v36 = CFSTR("ERR_UNMATCHED_TAG");
  }
  else
  {
    v36 = off_1E4761670[a11.var0];
  }
  tracker = self->_tracker;
  v45[0] = v18;
  v45[1] = v43;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v45[2] = v40;
  v45[3] = v42;
  v45[4] = v27;
  v45[5] = v30;
  v45[6] = v33;
  v45[7] = v36;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 8);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[PETScalarEventTracker trackEventWithPropertyValues:value:](tracker, "trackEventWithPropertyValues:value:", v41, v44);

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
