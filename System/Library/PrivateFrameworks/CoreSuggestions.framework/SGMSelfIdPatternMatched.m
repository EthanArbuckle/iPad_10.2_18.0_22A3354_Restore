@implementation SGMSelfIdPatternMatched

- (SGMSelfIdPatternMatched)init
{
  SGMSelfIdPatternMatched *v2;
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
  v13.super_class = (Class)SGMSelfIdPatternMatched;
  v2 = -[SGMSelfIdPatternMatched init](&v13, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("PatternType"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("PatternHash"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "propertyWithName:range:clampValues:", CFSTR("NameTokens"), 1, 2, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("NameClass"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "propertyWithName:range:clampValues:", CFSTR("MessageIndex"), 0, 5, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc(MEMORY[0x1E0D80F38]);
    v14[0] = v3;
    v14[1] = v4;
    v14[2] = v5;
    v14[3] = v6;
    v14[4] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "initWithFeatureId:event:registerProperties:propertySubsets:", CFSTR("Found"), CFSTR("SelfIdPatternMatched"), v9, MEMORY[0x1E0C9AA60]);
    tracker = v2->_tracker;
    v2->_tracker = (PETScalarEventTracker *)v10;

  }
  return v2;
}

- (void)trackEventWithScalar:(unint64_t)a3 patternType:(SGMSIPatternType_)a4 patternHash:(id)a5 nameTokens:(unint64_t)a6 nameClass:(SGMSINameClassification_)a7 messageIndex:(unint64_t)a8
{
  id v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  id v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  PETScalarEventTracker *tracker;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[6];

  v26[5] = *MEMORY[0x1E0C80C00];
  v14 = a5;
  if (a4.var0)
  {
    if (a4.var0 == 1)
    {
      v15 = CFSTR("SelfIdRequest");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGMSIPatternType_toString(SGMSIPatternType)");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("SGMetricsDefines.h"), 522, CFSTR("unrecognized tag %lu on SGMSIPatternType"), a4.var0);

      v15 = CFSTR("ERR_UNMATCHED_TAG");
    }
  }
  else
  {
    v15 = CFSTR("SelfId");
  }
  v18 = v14;
  if (a7.var0 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGMSINameClassification_toString(SGMSINameClassification)");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("SGMetricsDefines.h"), 509, CFSTR("unrecognized tag %lu on SGMSINameClassification"), a7.var0);

    v19 = CFSTR("ERR_UNMATCHED_TAG");
  }
  else
  {
    v19 = off_1E4761528[a7.var0];
  }
  tracker = self->_tracker;
  v26[0] = v15;
  v26[1] = v18;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v23;
  v26[3] = v19;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a8);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v26[4] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 5);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PETScalarEventTracker trackEventWithPropertyValues:value:](tracker, "trackEventWithPropertyValues:value:", v25, a3);

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
