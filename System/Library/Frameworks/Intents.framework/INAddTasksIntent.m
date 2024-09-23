@implementation INAddTasksIntent

- (NSArray)contactEventTriggers
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[INAddTasksIntent contactEventTrigger](self, "contactEventTrigger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return (NSArray *)0;
  -[INAddTasksIntent contactEventTrigger](self, "contactEventTrigger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (void)setContactEventTriggers:(id)a3
{
  id v4;

  objc_msgSend(a3, "firstObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[INAddTasksIntent setContactEventTrigger:](self, "setContactEventTrigger:", v4);

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

  -[INAddTasksIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INAddTasksIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIntentMetadata:", v4);

}

- (int64_t)_intentCategory
{
  return 8;
}

- (id)_categoryVerb
{
  return CFSTR("Create");
}

- (INAddTasksIntent)initWithTargetTaskList:(INTaskList *)targetTaskList taskTitles:(NSArray *)taskTitles spatialEventTrigger:(INSpatialEventTrigger *)spatialEventTrigger temporalEventTrigger:(INTemporalEventTrigger *)temporalEventTrigger priority:(INTaskPriority)priority
{
  INTaskList *v12;
  NSArray *v13;
  INSpatialEventTrigger *v14;
  INTemporalEventTrigger *v15;
  INAddTasksIntent *v16;
  INAddTasksIntent *v17;
  objc_super v19;

  v12 = targetTaskList;
  v13 = taskTitles;
  v14 = spatialEventTrigger;
  v15 = temporalEventTrigger;
  v19.receiver = self;
  v19.super_class = (Class)INAddTasksIntent;
  v16 = -[INIntent init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    -[INAddTasksIntent setTargetTaskList:](v16, "setTargetTaskList:", v12);
    -[INAddTasksIntent setTaskTitles:](v17, "setTaskTitles:", v13);
    -[INAddTasksIntent setSpatialEventTrigger:](v17, "setSpatialEventTrigger:", v14);
    -[INAddTasksIntent setTemporalEventTrigger:](v17, "setTemporalEventTrigger:", v15);
    -[INAddTasksIntent setPriority:](v17, "setPriority:", priority);
  }

  return v17;
}

- (int64_t)taskReference
{
  void *v3;
  int64_t v4;
  void *v5;

  -[INAddTasksIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v3, "hasTaskReference");
  -[INAddTasksIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "taskReference"))
    v4 = 0;
  else
    v4 = v4;

  return v4;
}

- (void)setTaskReference:(int64_t)a3
{
  void *v4;
  id v5;

  -[INAddTasksIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3 == 1)
    objc_msgSend(v4, "setTaskReference:", 0);
  else
    objc_msgSend(v4, "setHasTaskReference:", 0);

}

- (NSArray)targetTaskListMembers
{
  void *v2;
  void *v3;
  void *v4;

  -[INAddTasksIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "targetTaskListMembers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromContacts(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)setTargetTaskListMembers:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INAddTasksIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToContacts(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setTargetTaskListMembers:", v5);
}

- (INTaskList)targetTaskList
{
  void *v2;
  void *v3;
  void *v4;

  -[INAddTasksIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "targetTaskList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromTaskList(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INTaskList *)v4;
}

- (void)setTargetTaskList:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INAddTasksIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToTaskList(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setTargetTaskList:", v5);
}

- (NSArray)taskTitles
{
  void *v2;
  void *v3;
  void *v4;

  -[INAddTasksIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "taskTitles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromDataStrings(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)setTaskTitles:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INAddTasksIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDataStrings(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setTaskTitles:", v5);
}

- (INSpatialEventTrigger)spatialEventTrigger
{
  void *v2;
  void *v3;
  void *v4;

  -[INAddTasksIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INAddTasksIntent _typedBackingStore](self, "_typedBackingStore");
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

  -[INAddTasksIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INAddTasksIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToTemporalEventTrigger(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setTemporalEventTrigger:", v5);
}

- (INTaskPriority)priority
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  uint64_t v7;
  INTaskPriority v8;

  -[INAddTasksIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPriority");
  -[INAddTasksIntent _typedBackingStore](self, "_typedBackingStore");
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

  -[INAddTasksIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((unint64_t)a3 > 2)
    objc_msgSend(v4, "setHasPriority:", 0);
  else
    objc_msgSend(v4, "setPriority:", a3);

}

- (INContactEventTrigger)contactEventTrigger
{
  void *v2;
  void *v3;
  void *v4;

  -[INAddTasksIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INAddTasksIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToContactEventTrigger(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setContactEventTrigger:", v5);
}

- (INIntent)intent
{
  void *v2;
  void *v3;
  void *v4;

  -[INAddTasksIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromIntent(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INIntent *)v4;
}

- (void)setIntent:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INAddTasksIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToIntent(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setIntent:", v5);
}

- (id)_redactedDictionaryRepresentation
{
  void *v2;
  void *v3;

  -[INAddTasksIntent _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "setObject:forKey:", CFSTR("<redacted>"), CFSTR("taskTitles"));
  return v3;
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
  void *v10;
  INTaskPriority v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  _QWORD v16[5];
  _QWORD v17[6];

  v17[5] = *MEMORY[0x1E0C80C00];
  v16[0] = CFSTR("targetTaskList");
  -[INAddTasksIntent targetTaskList](self, "targetTaskList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[0] = v4;
  v16[1] = CFSTR("taskTitles");
  -[INAddTasksIntent taskTitles](self, "taskTitles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[1] = v6;
  v16[2] = CFSTR("spatialEventTrigger");
  -[INAddTasksIntent spatialEventTrigger](self, "spatialEventTrigger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[2] = v8;
  v16[3] = CFSTR("temporalEventTrigger");
  -[INAddTasksIntent temporalEventTrigger](self, "temporalEventTrigger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[3] = v10;
  v16[4] = CFSTR("priority");
  v11 = -[INAddTasksIntent priority](self, "priority");
  v12 = CFSTR("unknown");
  if (v11 == INTaskPriorityFlagged)
    v12 = CFSTR("flagged");
  if (v11 == INTaskPriorityNotFlagged)
    v12 = CFSTR("notFlagged");
  v13 = v12;
  v17[4] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  if (!v7)

  if (!v5)
  if (!v3)

  return v14;
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  void *v5;
  id v6;

  -[INAddTasksIntent _typedBackingStore](self, "_typedBackingStore", a3, a4);
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
  return CFSTR("AddTasks");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (INAddTasksIntent)initWithTargetTaskList:(INTaskList *)targetTaskList taskTitles:(NSArray *)taskTitles spatialEventTrigger:(INSpatialEventTrigger *)spatialEventTrigger temporalEventTrigger:(INTemporalEventTrigger *)temporalEventTrigger
{
  return -[INAddTasksIntent initWithTargetTaskList:taskTitles:spatialEventTrigger:temporalEventTrigger:priority:](self, "initWithTargetTaskList:taskTitles:spatialEventTrigger:temporalEventTrigger:priority:", targetTaskList, taskTitles, spatialEventTrigger, temporalEventTrigger, 0);
}

@end
