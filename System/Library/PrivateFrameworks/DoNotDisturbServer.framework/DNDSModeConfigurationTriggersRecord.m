@implementation DNDSModeConfigurationTriggersRecord

- (DNDSModeConfigurationTriggersRecord)init
{
  return (DNDSModeConfigurationTriggersRecord *)-[DNDSModeConfigurationTriggersRecord _initWithRecord:](self, "_initWithRecord:", 0);
}

- (id)_initWithTriggers:(id)a3
{
  id v4;
  DNDSModeConfigurationTriggersRecord *v5;
  uint64_t v6;
  NSArray *triggers;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DNDSModeConfigurationTriggersRecord;
  v5 = -[DNDSModeConfigurationTriggersRecord init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    triggers = v5->_triggers;
    v5->_triggers = (NSArray *)v6;

  }
  return v5;
}

- (id)_initWithRecord:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "triggers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[DNDSModeConfigurationTriggersRecord _initWithTriggers:](self, "_initWithTriggers:", v4);

  return v5;
}

- (unint64_t)hash
{
  return -[NSArray hash](self->_triggers, "hash");
}

- (BOOL)isEqual:(id)a3
{
  DNDSModeConfigurationTriggersRecord *v4;
  DNDSModeConfigurationTriggersRecord *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (DNDSModeConfigurationTriggersRecord *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[DNDSModeConfigurationTriggersRecord triggers](self, "triggers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSModeConfigurationTriggersRecord triggers](v5, "triggers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {
        v12 = 1;
      }
      else
      {
        -[DNDSModeConfigurationTriggersRecord triggers](self, "triggers");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          -[DNDSModeConfigurationTriggersRecord triggers](v5, "triggers");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            -[DNDSModeConfigurationTriggersRecord triggers](self, "triggers");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDSModeConfigurationTriggersRecord triggers](v5, "triggers");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v10, "isEqual:", v11);

          }
          else
          {
            v12 = 0;
          }

        }
        else
        {
          v12 = 0;
        }

      }
    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[DNDSModeConfigurationTriggersRecord triggers](self, "triggers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; triggers: %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[DNDSModeConfigurationTriggersRecord _initWithRecord:]([DNDSMutableModeConfigurationTriggersRecord alloc], "_initWithRecord:", self);
}

+ (id)migrateDictionaryRepresentation:(id)a3 fromVersionNumber:(unint64_t)a4 toVersionNumber:(unint64_t)a5
{
  return a3;
}

+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSString *v14;
  void *v15;
  void *v16;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(a3, "bs_safeArrayForKey:", CFSTR("triggers"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v13, "bs_safeStringForKey:", CFSTR("class"));
        v14 = (NSString *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(&unk_1E86DEEC8, "containsObject:", v14) & 1) != 0
          || objc_msgSend(&unk_1E86DEEE0, "containsObject:", v14))
        {
          v15 = (void *)-[objc_class newWithDictionaryRepresentation:context:](NSClassFromString(v14), "newWithDictionaryRepresentation:context:", v13, v5);
          objc_msgSend(v7, "addObject:", v15);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  v16 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTriggers:", v7);
  return v16;
}

+ (id)newWithDictionaryRepresentation:(id)a3 partitionedDictionaryRepresentation:(id)a4 context:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSString *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  NSString *v23;
  void *v24;
  void *v25;
  id v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v28 = a4;
  v7 = a5;
  objc_msgSend(a3, "bs_safeArrayForKey:", CFSTR("triggers"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v8;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v35 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v14, "bs_safeStringForKey:", CFSTR("class"));
        v15 = (NSString *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(&unk_1E86DEEF8, "containsObject:", v15) & 1) != 0
          || objc_msgSend(&unk_1E86DEF10, "containsObject:", v15))
        {
          v16 = (void *)-[objc_class newWithDictionaryRepresentation:context:](NSClassFromString(v15), "newWithDictionaryRepresentation:context:", v14, v7);
          objc_msgSend(v9, "addObject:", v16);

        }
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v11);
  }

  objc_msgSend(v28, "bs_safeArrayForKey:", CFSTR("triggers"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v31 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
        objc_msgSend(v22, "bs_safeStringForKey:", CFSTR("class"));
        v23 = (NSString *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(&unk_1E86DEF28, "containsObject:", v23))
        {
          v24 = (void *)-[objc_class newWithDictionaryRepresentation:context:](NSClassFromString(v23), "newWithDictionaryRepresentation:context:", v22, v7);
          objc_msgSend(v9, "addObject:", v24);

        }
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v19);
  }
  v25 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTriggers:", v9);

  return v25;
}

- (id)dictionaryRepresentationWithContext:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  objc_class *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  const __CFString *v22;
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = self->_triggers;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v10);
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v4, "partitionType", (_QWORD)v18) & 1) != 0)
        {
          v14 = objc_msgSend(&unk_1E86DEF40, "containsObject:", v13);
          if ((objc_msgSend(v4, "partitionType") & 2) != 0)
          {
LABEL_12:
            if ((objc_msgSend(&unk_1E86DEF58, "containsObject:", v13) & 1) == 0)
              goto LABEL_14;
LABEL_13:
            objc_msgSend(v11, "dictionaryRepresentationWithContext:", v4);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v15);

            goto LABEL_14;
          }
          if (v14)
            goto LABEL_13;
        }
        else if ((objc_msgSend(v4, "partitionType") & 2) != 0)
        {
          goto LABEL_12;
        }
LABEL_14:

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v8);
  }

  v22 = CFSTR("triggers");
  v23 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (NSArray)triggers
{
  return self->_triggers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggers, 0);
}

@end
