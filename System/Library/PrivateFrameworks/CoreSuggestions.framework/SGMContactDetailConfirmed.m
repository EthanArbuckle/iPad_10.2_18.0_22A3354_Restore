@implementation SGMContactDetailConfirmed

- (SGMContactDetailConfirmed)init
{
  SGMContactDetailConfirmed *v2;
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
  v11.super_class = (Class)SGMContactDetailConfirmed;
  v2 = -[SGMContactDetailConfirmed init](&v11, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("Type"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("Extracted"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "propertyWithName:range:clampValues:", CFSTR("ExtractionModelVersion"), 0, 1000, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc(MEMORY[0x1E0D80F38]);
    v12[0] = v3;
    v12[1] = v4;
    v12[2] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "initWithFeatureId:event:registerProperties:propertySubsets:", CFSTR("Found"), CFSTR("ContactDetailConfirmed"), v7, MEMORY[0x1E0C9AA60]);
    tracker = v2->_tracker;
    v2->_tracker = (PETScalarEventTracker *)v8;

  }
  return v2;
}

- (void)trackEventWithScalar:(unint64_t)a3 type:(SGMContactDetailType_)a4 extracted:(SGMDetailExtractionType_)a5 extractionModelVersion:(unint64_t)a6
{
  const __CFString *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  PETScalarEventTracker *tracker;
  void *v18;
  void *v19;
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  if (a4.var0 >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGMContactDetailType_toString(SGMContactDetailType)");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("SGMetricsDefines.h"), 159, CFSTR("unrecognized tag %lu on SGMContactDetailType"), a4.var0);

    v11 = CFSTR("ERR_UNMATCHED_TAG");
  }
  else
  {
    v11 = off_1E4761670[a4.var0];
  }
  if (a5.var0 >= 0xA)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGMDetailExtractionType_toString(SGMDetailExtractionType)");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("SGMetricsDefines.h"), 140, CFSTR("unrecognized tag %lu on SGMDetailExtractionType"), a5.var0);

    v14 = CFSTR("ERR_UNMATCHED_TAG");
  }
  else
  {
    v14 = off_1E47611D8[a5.var0];
  }
  tracker = self->_tracker;
  v20[0] = v11;
  v20[1] = v14;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PETScalarEventTracker trackEventWithPropertyValues:value:](tracker, "trackEventWithPropertyValues:value:", v19, a3);

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
