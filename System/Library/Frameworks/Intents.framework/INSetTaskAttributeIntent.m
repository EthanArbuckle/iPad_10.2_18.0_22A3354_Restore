@implementation INSetTaskAttributeIntent

- (INSetTaskAttributeIntent)initWithTargetTask:(INTask *)targetTask status:(INTaskStatus)status spatialEventTrigger:(INSpatialEventTrigger *)spatialEventTrigger temporalEventTrigger:(INTemporalEventTrigger *)temporalEventTrigger
{
  return -[INSetTaskAttributeIntent initWithTargetTask:taskTitle:status:priority:spatialEventTrigger:temporalEventTrigger:](self, "initWithTargetTask:taskTitle:status:priority:spatialEventTrigger:temporalEventTrigger:", targetTask, 0, status, 0, spatialEventTrigger, temporalEventTrigger);
}

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

  -[INSetTaskAttributeIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INSetTaskAttributeIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIntentMetadata:", v4);

}

- (int64_t)_intentCategory
{
  return 16;
}

- (id)_categoryVerb
{
  return CFSTR("Set");
}

- (INSetTaskAttributeIntent)initWithTargetTask:(INTask *)targetTask taskTitle:(INSpeakableString *)taskTitle status:(INTaskStatus)status priority:(INTaskPriority)priority spatialEventTrigger:(INSpatialEventTrigger *)spatialEventTrigger temporalEventTrigger:(INTemporalEventTrigger *)temporalEventTrigger
{
  INTask *v14;
  INSpeakableString *v15;
  INSpatialEventTrigger *v16;
  INTemporalEventTrigger *v17;
  INSetTaskAttributeIntent *v18;
  INSetTaskAttributeIntent *v19;
  objc_super v21;

  v14 = targetTask;
  v15 = taskTitle;
  v16 = spatialEventTrigger;
  v17 = temporalEventTrigger;
  v21.receiver = self;
  v21.super_class = (Class)INSetTaskAttributeIntent;
  v18 = -[INIntent init](&v21, sel_init);
  v19 = v18;
  if (v18)
  {
    -[INSetTaskAttributeIntent setTargetTask:](v18, "setTargetTask:", v14);
    -[INSetTaskAttributeIntent setTaskTitle:](v19, "setTaskTitle:", v15);
    -[INSetTaskAttributeIntent setStatus:](v19, "setStatus:", status);
    -[INSetTaskAttributeIntent setPriority:](v19, "setPriority:", priority);
    -[INSetTaskAttributeIntent setSpatialEventTrigger:](v19, "setSpatialEventTrigger:", v16);
    -[INSetTaskAttributeIntent setTemporalEventTrigger:](v19, "setTemporalEventTrigger:", v17);
  }

  return v19;
}

- (INTask)targetTask
{
  void *v2;
  void *v3;
  void *v4;

  -[INSetTaskAttributeIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "targetTask");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromTask(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INTask *)v4;
}

- (void)setTargetTask:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INSetTaskAttributeIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToTask(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setTargetTask:", v5);
}

- (INSpeakableString)taskTitle
{
  void *v2;
  void *v3;
  void *v4;

  -[INSetTaskAttributeIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "taskTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromDataString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INSpeakableString *)v4;
}

- (void)setTaskTitle:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INSetTaskAttributeIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDataString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setTaskTitle:", v5);
}

- (INTaskStatus)status
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  uint64_t v7;
  INTaskStatus v8;

  -[INSetTaskAttributeIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasStatus");
  -[INSetTaskAttributeIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "status");
  v7 = v6 == 10;
  if (v6 == 20)
    v7 = 2;
  if (v4)
    v8 = v7;
  else
    v8 = INTaskStatusUnknown;

  return v8;
}

- (void)setStatus:(int64_t)a3
{
  void *v4;
  id v5;

  -[INSetTaskAttributeIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((unint64_t)a3 <= 2)
    objc_msgSend(v4, "setStatus:", (10 * a3));
  else
    objc_msgSend(v4, "setHasStatus:", 0);

}

- (INTaskPriority)priority
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  uint64_t v7;
  INTaskPriority v8;

  -[INSetTaskAttributeIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPriority");
  -[INSetTaskAttributeIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "priority");
  v7 = v6 == 1;
  if (v6 == 2)
    v7 = 2;
  if (v4)
    v8 = v7;
  else
    v8 = INTaskPriorityUnknown;

  return v8;
}

- (void)setPriority:(int64_t)a3
{
  void *v4;
  id v5;

  -[INSetTaskAttributeIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((unint64_t)a3 > 2)
    objc_msgSend(v4, "setHasPriority:", 0);
  else
    objc_msgSend(v4, "setPriority:", a3);

}

- (INSpatialEventTrigger)spatialEventTrigger
{
  void *v2;
  void *v3;
  void *v4;

  -[INSetTaskAttributeIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "spatialEventTrigger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromSpatialEventTrigger(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INSpatialEventTrigger *)v4;
}

- (void)setSpatialEventTrigger:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INSetTaskAttributeIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToSpatialEventTrigger(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setSpatialEventTrigger:", v5);
}

- (INTemporalEventTrigger)temporalEventTrigger
{
  void *v2;
  void *v3;
  void *v4;

  -[INSetTaskAttributeIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "temporalEventTrigger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromTemporalEventTrigger(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INTemporalEventTrigger *)v4;
}

- (void)setTemporalEventTrigger:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INSetTaskAttributeIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToTemporalEventTrigger(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setTemporalEventTrigger:", v5);
}

- (INContactEventTrigger)contactEventTrigger
{
  void *v2;
  void *v3;
  void *v4;

  -[INSetTaskAttributeIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contactEventTrigger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromContactEventTrigger(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INContactEventTrigger *)v4;
}

- (void)setContactEventTrigger:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INSetTaskAttributeIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToContactEventTrigger(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setContactEventTrigger:", v5);
}

- (id)_dictionaryRepresentation
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  INTaskStatus v7;
  __CFString *v8;
  __CFString *v9;
  INTaskPriority v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  _QWORD v20[6];
  _QWORD v21[7];

  v21[6] = *MEMORY[0x1E0C80C00];
  v20[0] = CFSTR("targetTask");
  -[INSetTaskAttributeIntent targetTask](self, "targetTask");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v21[0] = v3;
  v20[1] = CFSTR("taskTitle");
  -[INSetTaskAttributeIntent taskTitle](self, "taskTitle", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21[1] = v6;
  v20[2] = CFSTR("status");
  v7 = -[INSetTaskAttributeIntent status](self, "status");
  v8 = CFSTR("unknown");
  if (v7 == INTaskStatusCompleted)
    v8 = CFSTR("completed");
  if (v7 == INTaskStatusNotCompleted)
    v8 = CFSTR("notCompleted");
  v9 = v8;
  v21[2] = v9;
  v20[3] = CFSTR("priority");
  v10 = -[INSetTaskAttributeIntent priority](self, "priority");
  v11 = CFSTR("unknown");
  if (v10 == INTaskPriorityFlagged)
    v11 = CFSTR("flagged");
  if (v10 == INTaskPriorityNotFlagged)
    v11 = CFSTR("notFlagged");
  v12 = v11;
  v21[3] = v12;
  v20[4] = CFSTR("spatialEventTrigger");
  -[INSetTaskAttributeIntent spatialEventTrigger](self, "spatialEventTrigger");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21[4] = v14;
  v20[5] = CFSTR("temporalEventTrigger");
  -[INSetTaskAttributeIntent temporalEventTrigger](self, "temporalEventTrigger");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21[5] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)

  if (!v13)
  if (!v5)

  if (!v4)
  return v17;
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  void *v5;
  id v6;

  -[INSetTaskAttributeIntent _typedBackingStore](self, "_typedBackingStore", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v6, "copy");
  -[INIntent setBackingStore:](self, "setBackingStore:", v5);

}

- (id)domain
{
  return CFSTR("Notebook");
}

- (id)verb
{
  return CFSTR("SetTaskAttribute");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
