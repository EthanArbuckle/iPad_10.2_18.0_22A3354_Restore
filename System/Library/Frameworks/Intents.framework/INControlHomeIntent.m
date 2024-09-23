@implementation INControlHomeIntent

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

  -[INControlHomeIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INControlHomeIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIntentMetadata:", v4);

}

- (id)_categoryVerb
{
  return CFSTR("Run");
}

- (INControlHomeIntent)initWithUserTask:(id)a3 filters:(id)a4 time:(id)a5
{
  id v8;
  id v9;
  id v10;
  INControlHomeIntent *v11;
  INControlHomeIntent *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)INControlHomeIntent;
  v11 = -[INIntent init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    -[INControlHomeIntent setUserTask:](v11, "setUserTask:", v8);
    -[INControlHomeIntent setFilters:](v12, "setFilters:", v9);
    -[INControlHomeIntent setTime:](v12, "setTime:", v10);
  }

  return v12;
}

- (INControlHomeIntent)initWithUserTask:(id)a3 filters:(id)a4
{
  return -[INControlHomeIntent initWithUserTask:filters:time:](self, "initWithUserTask:filters:time:", a3, a4, 0);
}

- (INHomeUserTask)userTask
{
  void *v2;
  void *v3;
  void *v4;

  -[INControlHomeIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userTask");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromHomeUserTask(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INHomeUserTask *)v4;
}

- (void)setUserTask:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INControlHomeIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToHomeUserTask(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setUserTask:", v5);
}

- (NSArray)filters
{
  void *v2;
  void *v3;
  void *v4;

  -[INControlHomeIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromHomeFilters(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)setFilters:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INControlHomeIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToHomeFilters(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setFilters:", v5);
}

- (INDateComponentsRange)time
{
  void *v2;
  void *v3;
  void *v4;

  -[INControlHomeIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "time");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromDateTimeRange(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INDateComponentsRange *)v4;
}

- (void)setTime:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INControlHomeIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDateTimeRange(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setTime:", v5);
}

- (INControlHomeIntent)initWithContents:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  INHomeUserTask *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  INHomeUserTask *v12;
  void *v13;
  void *v14;
  INControlHomeIntent *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    INIntentSlotValueTransformToHomeAction(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = [INHomeUserTask alloc];
    v9 = objc_msgSend(v6, "type");
    objc_msgSend(v7, "attributeValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    INIntentSlotValueTransformFromHomeAttributeValue(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[INHomeUserTask initWithTaskType:attribute:value:](v8, "initWithTaskType:attribute:value:", 1, v9, v11);

  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(v4, "filter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v4, "filter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v15 = -[INControlHomeIntent initWithUserTask:filters:](self, "initWithUserTask:filters:", v12, v13);

  return v15;
}

- (NSArray)contents
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  INHomeAction *v14;
  void *v15;
  void *v16;
  INHomeContent *v17;
  void *v18;
  void *v19;
  INHomeContent *v20;
  uint64_t v22;
  INHomeAction *v23;
  void *v24;
  void *v25;
  INHomeContent *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  -[INControlHomeIntent userTask](self, "userTask");
  v3 = objc_claimAutoreleasedReturnValue();
  -[INControlHomeIntent filters](self, "filters");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v3 | v4)
  {
    if (v3)
    {
      v23 = [INHomeAction alloc];
      v22 = objc_msgSend((id)v3, "attribute");
      objc_msgSend((id)v3, "value");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v25, "type");
      objc_msgSend((id)v3, "value");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v24, "BOOLValue");
      objc_msgSend((id)v3, "value");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "doubleValue");
      v9 = v8;
      objc_msgSend((id)v3, "value");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "integerValue");
      objc_msgSend((id)v3, "value");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringValue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[INHomeAction initWithType:valueType:BOOLValue:doubleValue:integerValue:stringValue:](v23, "initWithType:valueType:BOOLValue:doubleValue:integerValue:stringValue:", v22, v5, v6, v11, v13, v9);
      v27[0] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = 0;
    }
    v17 = [INHomeContent alloc];
    -[INControlHomeIntent filters](self, "filters");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[INHomeContent initWithFilter:actions:](v17, "initWithFilter:actions:", v19, v15);
    v26 = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }

  return (NSArray *)v16;
}

- (void)setContents:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  INHomeUserTask *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  INHomeUserTask *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    INIntentSlotValueTransformToHomeAction(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = [INHomeUserTask alloc];
    v9 = objc_msgSend(v6, "type");
    objc_msgSend(v7, "attributeValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    INIntentSlotValueTransformFromHomeAttributeValue(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[INHomeUserTask initWithTaskType:attribute:value:](v8, "initWithTaskType:attribute:value:", 1, v9, v11);
    -[INControlHomeIntent setUserTask:](self, "setUserTask:", v12);

  }
  objc_msgSend(v4, "filter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v4, "filter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[INControlHomeIntent setFilters:](self, "setFilters:", v15);

  }
}

- (id)_initWithIdentifier:(id)a3 backingStore:(id)a4 schema:(id)a5 error:(id *)a6
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)INControlHomeIntent;
  v6 = -[INIntent _initWithIdentifier:backingStore:schema:error:](&v12, sel__initWithIdentifier_backingStore_schema_error_, a3, a4, a5, a6);
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "backingStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "contentsCount"))
    {
      objc_msgSend(v8, "contents");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      INIntentSlotValueTransformFromHomeContents(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setContents:", v10);

    }
  }
  return v7;
}

- (id)_dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("userTask");
  -[INControlHomeIntent userTask](self, "userTask");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[0] = v4;
  v11[1] = CFSTR("filters");
  -[INControlHomeIntent filters](self, "filters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = v6;
  v11[2] = CFSTR("time");
  -[INControlHomeIntent time](self, "time");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)

  if (!v5)
  if (!v3)

  return v9;
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
  -[INControlHomeIntent _typedBackingStore](self, "_typedBackingStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v6;
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v7, "time");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueRedactedDateTimeRangeFromDateTimeRange(v9, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setTime:", v10);
  -[INIntent setBackingStore:](self, "setBackingStore:", v8);

}

- (id)domain
{
  return CFSTR("HomeKit");
}

- (id)verb
{
  return CFSTR("ControlHome");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)_hasTitle
{
  void *v3;
  void *v4;
  BOOL v5;

  -[INControlHomeIntent userTask](self, "userTask");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[INControlHomeIntent filters](self, "filters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  if (objc_msgSend(v4, "count") && v3)
    v5 = objc_msgSend(v3, "taskType") == 1;

  return v5;
}

- (id)_titleWithLocalizer:(id)a3 fromBundleURL:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;

  v5 = a3;
  -[INControlHomeIntent filters](self, "filters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[INControlHomeIntent userTask](self, "userTask");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = 0;
  if (v7 && v8)
  {
    if (objc_msgSend(v8, "taskType") == 1)
    {
      if (objc_msgSend(v9, "attribute") == 1)
      {
        objc_msgSend(v7, "entityName");
        v11 = objc_claimAutoreleasedReturnValue();
        if (v11 && (v12 = (void *)v11, v13 = objc_msgSend(v7, "entityType"), v12, v13 == 5))
        {
          v14 = (void *)MEMORY[0x1E0CB3940];
          v15 = CFSTR("Run %@");
        }
        else
        {
          objc_msgSend(v9, "value");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "BOOLValue");

          v14 = (void *)MEMORY[0x1E0CB3940];
          if (v17)
            v15 = CFSTR("Turn on %@");
          else
            v15 = CFSTR("Turn off %@");
        }
      }
      else
      {
        v14 = (void *)MEMORY[0x1E0CB3940];
        v15 = CFSTR("Control %@");
      }
      INLocalizedStringWithLocalizer(v15, v15, v5);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_intents_readableTitleWithLocalizer:", v5);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringWithFormat:", v18, v19);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (id)_subtitleWithLocalizer:(id)a3 fromBundleURL:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  -[INControlHomeIntent filters](self, "filters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v7, "home");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_intents_readableTitleWithLocalizer:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
