@implementation INCreateTaskListIntent

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

  -[INCreateTaskListIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INCreateTaskListIntent _typedBackingStore](self, "_typedBackingStore");
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

- (INCreateTaskListIntent)initWithTitle:(INSpeakableString *)title taskTitles:(NSArray *)taskTitles groupName:(INSpeakableString *)groupName
{
  INSpeakableString *v8;
  NSArray *v9;
  INSpeakableString *v10;
  INCreateTaskListIntent *v11;
  INCreateTaskListIntent *v12;
  objc_super v14;

  v8 = title;
  v9 = taskTitles;
  v10 = groupName;
  v14.receiver = self;
  v14.super_class = (Class)INCreateTaskListIntent;
  v11 = -[INIntent init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    -[INCreateTaskListIntent setTitle:](v11, "setTitle:", v8);
    -[INCreateTaskListIntent setTaskTitles:](v12, "setTaskTitles:", v9);
    -[INCreateTaskListIntent setGroupName:](v12, "setGroupName:", v10);
  }

  return v12;
}

- (INSpeakableString)title
{
  void *v2;
  void *v3;
  void *v4;

  -[INCreateTaskListIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromDataString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INSpeakableString *)v4;
}

- (void)setTitle:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INCreateTaskListIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDataString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setTitle:", v5);
}

- (NSArray)taskTitles
{
  void *v2;
  void *v3;
  void *v4;

  -[INCreateTaskListIntent _typedBackingStore](self, "_typedBackingStore");
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
  -[INCreateTaskListIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDataStrings(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setTaskTitles:", v5);
}

- (INSpeakableString)groupName
{
  void *v2;
  void *v3;
  void *v4;

  -[INCreateTaskListIntent _typedBackingStore](self, "_typedBackingStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "groupName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformFromDataString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (INSpeakableString *)v4;
}

- (void)setGroupName:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[INCreateTaskListIntent _typedBackingStore](self, "_typedBackingStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  INIntentSlotValueTransformToDataString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setGroupName:", v5);
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
  v11[0] = CFSTR("title");
  -[INCreateTaskListIntent title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[0] = v4;
  v11[1] = CFSTR("taskTitles");
  -[INCreateTaskListIntent taskTitles](self, "taskTitles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = v6;
  v11[2] = CFSTR("groupName");
  -[INCreateTaskListIntent groupName](self, "groupName");
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

  -[INCreateTaskListIntent _typedBackingStore](self, "_typedBackingStore", a3, a4);
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
  return CFSTR("CreateTaskList");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
