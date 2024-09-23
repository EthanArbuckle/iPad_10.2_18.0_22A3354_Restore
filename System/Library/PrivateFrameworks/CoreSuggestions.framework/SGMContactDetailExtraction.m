@implementation SGMContactDetailExtraction

- (SGMContactDetailExtraction)init
{
  SGMContactDetailExtraction *v2;
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
  v16.super_class = (Class)SGMContactDetailExtraction;
  v2 = -[SGMContactDetailExtraction init](&v16, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("Source"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("Signature"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("Detail"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("Outcome"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("FoundInSenderCNContact"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "propertyWithName:range:clampValues:", CFSTR("ExtractionModelVersion"), 0, 1000, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("IsUnlikelyPhone"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("SignatureExtractionSource"));
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
    v12 = objc_msgSend(v10, "initWithFeatureId:event:registerProperties:propertySubsets:", CFSTR("Found"), CFSTR("ContactDetailExtraction"), v11, MEMORY[0x1E0C9AA60]);
    tracker = v2->_tracker;
    v2->_tracker = (PETScalarEventTracker *)v12;

  }
  return v2;
}

- (void)trackEventWithScalar:(unint64_t)a3 source:(SGMDocumentType_)a4 signature:(SGMTypeSafeBool_)a5 detail:(SGMContactDetailType_)a6 outcome:(SGMContactDetailExtractionOutcome_)a7 foundInSenderCNContact:(SGMContactDetailOwner_)a8 extractionModelVersion:(unint64_t)a9 isUnlikelyPhone:(SGMTypeSafeBool_)a10 signatureExtractionSource:(SGMContactDetailExtractionSignatureSource_)a11
{
  const __CFString *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  PETScalarEventTracker *tracker;
  void *v38;
  void *v39;
  _QWORD v42[9];

  v42[8] = *MEMORY[0x1E0C80C00];
  if (a4.var0)
  {
    if (a4.var0 == 1)
    {
      v16 = CFSTR("Message");
      if (!a5.var0)
        goto LABEL_9;
LABEL_6:
      if (a5.var0 == 1)
      {
        v17 = CFSTR("1");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGMTypeSafeBool_toString(SGMTypeSafeBool)");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("SGMetricsDefines.h"), 12, CFSTR("unrecognized tag %lu on SGMTypeSafeBool"), a5.var0);

        v17 = CFSTR("ERR_UNMATCHED_TAG");
      }
      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGMDocumentType_toString(SGMDocumentType)");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("SGMetricsDefines.h"), 586, CFSTR("unrecognized tag %lu on SGMDocumentType"), a4.var0);

    v16 = CFSTR("ERR_UNMATCHED_TAG");
    if (a5.var0)
      goto LABEL_6;
  }
  else
  {
    v16 = CFSTR("Email");
    if (a5.var0)
      goto LABEL_6;
  }
LABEL_9:
  v17 = CFSTR("0");
LABEL_11:
  if (a6.var0 >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGMContactDetailType_toString(SGMContactDetailType)");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, CFSTR("SGMetricsDefines.h"), 159, CFSTR("unrecognized tag %lu on SGMContactDetailType"), a6.var0);

    v22 = CFSTR("ERR_UNMATCHED_TAG");
  }
  else
  {
    v22 = off_1E4761670[a6.var0];
  }
  if (a7.var0 >= 7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGMContactDetailExtractionOutcome_toString(SGMContactDetailExtractionOutcome)");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, CFSTR("SGMetricsDefines.h"), 558, CFSTR("unrecognized tag %lu on SGMContactDetailExtractionOutcome"), a7.var0);

    v25 = CFSTR("ERR_UNMATCHED_TAG");
  }
  else
  {
    v25 = off_1E4761540[a7.var0];
  }
  if (a8.var0 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGMContactDetailOwner_toString(SGMContactDetailOwner)");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInFunction:file:lineNumber:description:", v30, CFSTR("SGMetricsDefines.h"), 174, CFSTR("unrecognized tag %lu on SGMContactDetailOwner"), a8.var0);

    v28 = CFSTR("ERR_UNMATCHED_TAG");
  }
  else
  {
    v28 = off_1E4761578[a8.var0];
  }
  if (a10.var0)
  {
    if (a10.var0 == 1)
    {
      v31 = CFSTR("1");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGMTypeSafeBool_toString(SGMTypeSafeBool)");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "handleFailureInFunction:file:lineNumber:description:", v33, CFSTR("SGMetricsDefines.h"), 12, CFSTR("unrecognized tag %lu on SGMTypeSafeBool"), a10.var0);

      v31 = CFSTR("ERR_UNMATCHED_TAG");
    }
  }
  else
  {
    v31 = CFSTR("0");
  }
  if (a11.var0 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGMContactDetailExtractionSignatureSource_toString(SGMContactDetailExtractionSignatureSource)");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInFunction:file:lineNumber:description:", v36, CFSTR("SGMetricsDefines.h"), 573, CFSTR("unrecognized tag %lu on SGMContactDetailExtractionSignatureSource"), a11.var0);

    v34 = CFSTR("ERR_UNMATCHED_TAG");
  }
  else
  {
    v34 = off_1E4761590[a11.var0];
  }
  tracker = self->_tracker;
  v42[0] = v16;
  v42[1] = v17;
  v42[2] = v22;
  v42[3] = v25;
  v42[4] = v28;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a9);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v42[5] = v38;
  v42[6] = v31;
  v42[7] = v34;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 8);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[PETScalarEventTracker trackEventWithPropertyValues:value:](tracker, "trackEventWithPropertyValues:value:", v39, a3);

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
