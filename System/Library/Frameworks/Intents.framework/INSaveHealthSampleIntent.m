@implementation INSaveHealthSampleIntent

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

  -[INSaveHealthSampleIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INSaveHealthSampleIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIntentMetadata:", v4);

}

- (INSaveHealthSampleIntent)initWithRecordDate:(id)a3 objectType:(int64_t)a4 values:(id)a5 unit:(id)a6 sampleMetadatas:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  INSaveHealthSampleIntent *v16;
  INSaveHealthSampleIntent *v17;
  objc_super v19;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)INSaveHealthSampleIntent;
  v16 = -[INIntent init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    -[INSaveHealthSampleIntent setRecordDate:](v16, "setRecordDate:", v12);
    -[INSaveHealthSampleIntent setObjectType:](v17, "setObjectType:", a4);
    -[INSaveHealthSampleIntent setValues:](v17, "setValues:", v13);
    -[INSaveHealthSampleIntent setUnit:](v17, "setUnit:", v14);
    -[INSaveHealthSampleIntent setSampleMetadatas:](v17, "setSampleMetadatas:", v15);
  }

  return v17;
}

- (INDateComponentsRange)recordDate
{
  void *v2;
  void *v3;
  void *v4;

  -[INSaveHealthSampleIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromDateTimeRange(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INDateComponentsRange *)v4;
}

- (void)setRecordDate:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INSaveHealthSampleIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDateTimeRange(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setRecordDate:", v5);
}

- (int64_t)objectType
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  int64_t v7;
  int64_t v8;

  -[INSaveHealthSampleIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasObjectType");
  -[INSaveHealthSampleIntent _typedBackingStore](self, "_typedBackingStore");
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

  -[INSaveHealthSampleIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((unint64_t)a3 > 0x4A)
    objc_msgSend(v4, "setHasObjectType:", 0);
  else
    objc_msgSend(v4, "setObjectType:", a3);

}

- (NSArray)values
{
  void *v2;
  void *v3;
  void *v4;

  -[INSaveHealthSampleIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "values");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromWellnessValues(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)setValues:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INSaveHealthSampleIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToWellnessValues(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setValues:", v5);
}

- (HKUnit)unit
{
  void *v2;
  void *v3;
  void *v4;

  -[INSaveHealthSampleIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INSaveHealthSampleIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToWellnessUnitType(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setUnit:", v5);
}

- (NSArray)sampleMetadatas
{
  void *v2;
  void *v3;
  void *v4;

  -[INSaveHealthSampleIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sampleMetadatas");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromWellnessMetadataPairs(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)setSampleMetadatas:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INSaveHealthSampleIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToWellnessMetadataPairs(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setSampleMetadatas:", v5);
}

- (id)_dictionaryRepresentation
{
  void *v3;
  void *v4;
  int64_t v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  _QWORD v17[6];

  v17[5] = *MEMORY[0x1E0C80C00];
  v16[0] = CFSTR("recordDate");
  -[INSaveHealthSampleIntent recordDate](self, "recordDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[0] = v4;
  v16[1] = CFSTR("objectType");
  v5 = -[INSaveHealthSampleIntent objectType](self, "objectType");
  if ((unint64_t)(v5 - 1) > 0x49)
    v6 = CFSTR("unknown");
  else
    v6 = off_1E228BC08[v5 - 1];
  v7 = v6;
  v17[1] = v7;
  v16[2] = CFSTR("values");
  -[INSaveHealthSampleIntent values](self, "values");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[2] = v9;
  v16[3] = CFSTR("unit");
  -[INSaveHealthSampleIntent unit](self, "unit");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[3] = v11;
  v16[4] = CFSTR("sampleMetadatas");
  -[INSaveHealthSampleIntent sampleMetadatas](self, "sampleMetadatas");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[4] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)

  if (!v10)
  if (!v8)

  if (!v3)
  return v14;
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
  -[INSaveHealthSampleIntent _typedBackingStore](self, "_typedBackingStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v6;
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v7, "recordDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedDateTimeRangeFromDateTimeRange(v9, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setRecordDate:", v10);
  -[INIntent setBackingStore:](self, "setBackingStore:", v8);

}

- (id)domain
{
  return CFSTR("Wellness");
}

- (id)verb
{
  return CFSTR("SaveHealthSample");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
