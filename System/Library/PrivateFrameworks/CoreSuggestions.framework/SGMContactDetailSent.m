@implementation SGMContactDetailSent

- (SGMContactDetailSent)init
{
  SGMContactDetailSent *v2;
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
  v13.super_class = (Class)SGMContactDetailSent;
  v2 = -[SGMContactDetailSent init](&v13, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("Source"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("Detail"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("FoundIn"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("HasName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("Tokens"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc(MEMORY[0x1E0D80F38]);
    v14[0] = v3;
    v14[1] = v4;
    v14[2] = v5;
    v14[3] = v6;
    v14[4] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "initWithFeatureId:event:registerProperties:propertySubsets:", CFSTR("Found"), CFSTR("ContactDetailSent"), v9, MEMORY[0x1E0C9AA60]);
    tracker = v2->_tracker;
    v2->_tracker = (PETScalarEventTracker *)v10;

  }
  return v2;
}

- (void)trackEventWithScalar:(unint64_t)a3 source:(SGMDocumentType_)a4 detail:(SGMContactDetailType_)a5 foundIn:(SGMContactDetailFoundIn_)a6 hasName:(SGMTypeSafeBool_)a7 tokens:(SGMLowCount_)a8
{
  const __CFString *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  PETScalarEventTracker *tracker;
  void *v31;
  _QWORD v32[6];

  v32[5] = *MEMORY[0x1E0C80C00];
  if (a4.var0)
  {
    if (a4.var0 == 1)
    {
      v15 = CFSTR("Message");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGMDocumentType_toString(SGMDocumentType)");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("SGMetricsDefines.h"), 586, CFSTR("unrecognized tag %lu on SGMDocumentType"), a4.var0);

      v15 = CFSTR("ERR_UNMATCHED_TAG");
    }
  }
  else
  {
    v15 = CFSTR("Email");
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
  if (a6.var0 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGMContactDetailFoundIn_toString(SGMContactDetailFoundIn)");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, CFSTR("SGMetricsDefines.h"), 191, CFSTR("unrecognized tag %lu on SGMContactDetailFoundIn"), a6.var0);

    v21 = CFSTR("ERR_UNMATCHED_TAG");
    if (a7.var0)
    {
LABEL_11:
      if (a7.var0 == 1)
      {
        v22 = CFSTR("1");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGMTypeSafeBool_toString(SGMTypeSafeBool)");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, CFSTR("SGMetricsDefines.h"), 12, CFSTR("unrecognized tag %lu on SGMTypeSafeBool"), a7.var0);

        v22 = CFSTR("ERR_UNMATCHED_TAG");
      }
      goto LABEL_16;
    }
  }
  else
  {
    v21 = off_1E47615A8[a6.var0];
    if (a7.var0)
      goto LABEL_11;
  }
  v22 = CFSTR("0");
LABEL_16:
  if (a8.var0 >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGMLowCount_toString(SGMLowCount)");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, CFSTR("SGMetricsDefines.h"), 46, CFSTR("unrecognized tag %lu on SGMLowCount"), a8.var0);

    v27 = CFSTR("ERR_UNMATCHED_TAG");
  }
  else
  {
    v27 = off_1E47615C8[a8.var0];
  }
  tracker = self->_tracker;
  v32[0] = v15;
  v32[1] = v18;
  v32[2] = v21;
  v32[3] = v22;
  v32[4] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 5);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[PETScalarEventTracker trackEventWithPropertyValues:value:](tracker, "trackEventWithPropertyValues:value:", v31, a3);

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
