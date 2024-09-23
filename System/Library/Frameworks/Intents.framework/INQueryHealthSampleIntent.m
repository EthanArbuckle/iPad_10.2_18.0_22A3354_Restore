@implementation INQueryHealthSampleIntent

- (id)_typedBackingStore
{
  void *v2;
  void *v3;
  id v4;

  -[INIntent backingStore](self, "backingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)_metadata
{
  void *v2;
  void *v3;

  -[INQueryHealthSampleIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intentMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_setMetadata:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[INQueryHealthSampleIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIntentMetadata:", v4);

}

- (INQueryHealthSampleIntent)initWithObjectType:(int64_t)a3 recordDates:(id)a4 unit:(id)a5 questionType:(int64_t)a6 thresholdValues:(id)a7 expectedResultType:(int64_t)a8
{
  id v14;
  id v15;
  id v16;
  INQueryHealthSampleIntent *v17;
  INQueryHealthSampleIntent *v18;
  objc_super v20;

  v14 = a4;
  v15 = a5;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)INQueryHealthSampleIntent;
  v17 = -[INIntent init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    -[INQueryHealthSampleIntent setObjectType:](v17, "setObjectType:", a3);
    -[INQueryHealthSampleIntent setRecordDates:](v18, "setRecordDates:", v14);
    -[INQueryHealthSampleIntent setUnit:](v18, "setUnit:", v15);
    -[INQueryHealthSampleIntent setQuestionType:](v18, "setQuestionType:", a6);
    -[INQueryHealthSampleIntent setThresholdValues:](v18, "setThresholdValues:", v16);
    -[INQueryHealthSampleIntent setExpectedResultType:](v18, "setExpectedResultType:", a8);
  }

  return v18;
}

- (int64_t)objectType
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  int64_t v7;
  int64_t v8;

  -[INQueryHealthSampleIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasObjectType");
  -[INQueryHealthSampleIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "objectType") - 1;
  if (v6 <= 0x49)
    v7 = v6 + 1;
  else
    v7 = 0;
  if (v4)
    v8 = v7;
  else
    v8 = 0;

  return v8;
}

- (void)setObjectType:(int64_t)a3
{
  void *v4;
  id v5;

  -[INQueryHealthSampleIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((unint64_t)a3 > 0x4A)
    objc_msgSend(v4, "setHasObjectType:", 0);
  else
    objc_msgSend(v4, "setObjectType:", a3);

}

- (NSArray)recordDates
{
  void *v2;
  void *v3;
  void *v4;

  -[INQueryHealthSampleIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordDates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromDateTimeRanges(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)setRecordDates:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INQueryHealthSampleIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDateTimeRanges(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setRecordDates:", v5);
}

- (HKUnit)unit
{
  void *v2;
  void *v3;
  void *v4;

  -[INQueryHealthSampleIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromWellnessUnitType(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKUnit *)v4;
}

- (void)setUnit:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INQueryHealthSampleIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToWellnessUnitType(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setUnit:", v5);
}

- (int64_t)questionType
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  int64_t v7;
  int64_t v8;

  -[INQueryHealthSampleIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasQuestionType");
  -[INQueryHealthSampleIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "questionType") - 1;
  if (v6 <= 6)
    v7 = v6 + 1;
  else
    v7 = 0;
  if (v4)
    v8 = v7;
  else
    v8 = 0;

  return v8;
}

- (void)setQuestionType:(int64_t)a3
{
  void *v4;
  id v5;

  -[INQueryHealthSampleIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((unint64_t)a3 > 7)
    objc_msgSend(v4, "setHasQuestionType:", 0);
  else
    objc_msgSend(v4, "setQuestionType:", a3);

}

- (NSArray)thresholdValues
{
  void *v2;
  void *v3;
  void *v4;

  -[INQueryHealthSampleIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "thresholdValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromWellnessValues(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)setThresholdValues:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INQueryHealthSampleIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToWellnessValues(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setThresholdValues:", v5);
}

- (int64_t)expectedResultType
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  int64_t v7;
  int64_t v8;

  -[INQueryHealthSampleIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasExpectedResultType");
  -[INQueryHealthSampleIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "expectedResultType") - 1;
  if (v6 <= 8)
    v7 = v6 + 1;
  else
    v7 = 0;
  if (v4)
    v8 = v7;
  else
    v8 = 0;

  return v8;
}

- (void)setExpectedResultType:(int64_t)a3
{
  void *v4;
  id v5;

  -[INQueryHealthSampleIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((unint64_t)a3 > 9)
    objc_msgSend(v4, "setHasExpectedResultType:", 0);
  else
    objc_msgSend(v4, "setExpectedResultType:", a3);

}

- (id)_dictionaryRepresentation
{
  int64_t v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  int64_t v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  _QWORD v20[6];
  _QWORD v21[7];

  v21[6] = *MEMORY[0x1E0C80C00];
  v20[0] = CFSTR("objectType");
  v3 = -[INQueryHealthSampleIntent objectType](self, "objectType");
  if ((unint64_t)(v3 - 1) > 0x49)
    v4 = CFSTR("unknown");
  else
    v4 = off_1E228BC08[v3 - 1];
  v5 = v4;
  v21[0] = v5;
  v20[1] = CFSTR("recordDates");
  -[INQueryHealthSampleIntent recordDates](self, "recordDates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21[1] = v7;
  v20[2] = CFSTR("unit");
  -[INQueryHealthSampleIntent unit](self, "unit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21[2] = v9;
  v20[3] = CFSTR("questionType");
  v10 = -[INQueryHealthSampleIntent questionType](self, "questionType");
  if ((unint64_t)(v10 - 1) > 6)
    v11 = CFSTR("unknown");
  else
    v11 = off_1E228F560[v10 - 1];
  v12 = v11;
  v21[3] = v12;
  v20[4] = CFSTR("thresholdValues");
  -[INQueryHealthSampleIntent thresholdValues](self, "thresholdValues");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21[4] = v14;
  v20[5] = CFSTR("expectedResultType");
  v15 = -[INQueryHealthSampleIntent expectedResultType](self, "expectedResultType");
  if ((unint64_t)(v15 - 1) > 8)
    v16 = CFSTR("unknown");
  else
    v16 = off_1E2291D50[v15 - 1];
  v17 = v16;
  v21[5] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  if (!v8)

  if (!v6)
  return v18;
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  -[INQueryHealthSampleIntent _typedBackingStore](self, "_typedBackingStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v6;
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v7, "recordDates");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedDateTimeRangesFromDateTimeRanges(v9, a3, v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setRecordDates:", v10);
  -[INIntent setBackingStore:](self, "setBackingStore:", v8);

}

- (id)domain
{
  return CFSTR("Wellness");
}

- (id)verb
{
  return CFSTR("QueryHealthSample");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
