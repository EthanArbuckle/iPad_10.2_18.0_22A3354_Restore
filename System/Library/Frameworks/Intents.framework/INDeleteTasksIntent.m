@implementation INDeleteTasksIntent

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

  -[INDeleteTasksIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INDeleteTasksIntent _typedBackingStore](self, "_typedBackingStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIntentMetadata:", v4);

}

- (INDeleteTasksIntent)initWithTaskList:(INTaskList *)taskList tasks:(NSArray *)tasks all:(NSNumber *)all
{
  INTaskList *v8;
  NSArray *v9;
  NSNumber *v10;
  INDeleteTasksIntent *v11;
  INDeleteTasksIntent *v12;
  objc_super v14;

  v8 = taskList;
  v9 = tasks;
  v10 = all;
  v14.receiver = self;
  v14.super_class = (Class)INDeleteTasksIntent;
  v11 = -[INIntent init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    -[INDeleteTasksIntent setTaskList:](v11, "setTaskList:", v8);
    -[INDeleteTasksIntent setTasks:](v12, "setTasks:", v9);
    -[INDeleteTasksIntent setAll:](v12, "setAll:", v10);
  }

  return v12;
}

- (INTaskList)taskList
{
  void *v2;
  void *v3;
  void *v4;

  -[INDeleteTasksIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "taskList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromTaskList(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INTaskList *)v4;
}

- (void)setTaskList:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INDeleteTasksIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToTaskList(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setTaskList:", v5);
}

- (NSArray)tasks
{
  void *v2;
  void *v3;
  void *v4;

  -[INDeleteTasksIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tasks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromTasks(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)setTasks:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INDeleteTasksIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToTasks(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setTasks:", v5);
}

- (NSNumber)all
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[INDeleteTasksIntent _typedBackingStore](self, "_typedBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasAll"))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[INDeleteTasksIntent _typedBackingStore](self, "_typedBackingStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "all"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (NSNumber *)v6;
}

- (void)setAll:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[INDeleteTasksIntent _typedBackingStore](self, "_typedBackingStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setAll:", objc_msgSend(v5, "BOOLValue"));
  else
    objc_msgSend(v4, "setHasAll:", 0);

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
  v11[0] = CFSTR("taskList");
  -[INDeleteTasksIntent taskList](self, "taskList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[0] = v4;
  v11[1] = CFSTR("tasks");
  -[INDeleteTasksIntent tasks](self, "tasks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = v6;
  v11[2] = CFSTR("all");
  -[INDeleteTasksIntent all](self, "all");
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
  void *v5;
  id v6;

  -[INDeleteTasksIntent _typedBackingStore](self, "_typedBackingStore", a3, a4);
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
  return CFSTR("DeleteTasks");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
