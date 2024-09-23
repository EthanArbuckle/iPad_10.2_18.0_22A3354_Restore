@implementation EKFrozenReminderAlarm

- (EKFrozenReminderAlarm)initWithREMObject:(id)a3 inStore:(id)a4 withChanges:(id)a5
{
  id v8;
  EKFrozenReminderAlarm *v9;
  EKFrozenReminderAlarm *v10;
  id v11;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EKFrozenReminderAlarm;
  v9 = -[EKFrozenReminderObject initWithREMObject:inStore:withChanges:](&v13, sel_initWithREMObject_inStore_withChanges_, v8, a4, a5);
  v10 = v9;
  if (v9)
    v11 = -[EKFrozenReminderAlarm _setTimeOrLocationAlarm:](v9, "_setTimeOrLocationAlarm:", v8);

  return v10;
}

- (EKFrozenReminderAlarm)initWithAlarms:(id)a3 inStore:(id)a4
{
  return -[EKFrozenReminderAlarm initWithAlarms:inStore:withChanges:](self, "initWithAlarms:inStore:withChanges:", a3, a4, 0);
}

- (EKFrozenReminderAlarm)initWithAlarms:(id)a3 inStore:(id)a4 withChanges:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  EKFrozenReminderAlarm *v12;
  objc_super v14;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)EKFrozenReminderAlarm;
  v12 = -[EKFrozenReminderObject initWithREMObject:inStore:withChanges:](&v14, sel_initWithREMObject_inStore_withChanges_, v11, v10, v9);

  if (v12)
    -[EKFrozenReminderAlarm _setTimeAndLocationAlarms:](v12, "_setTimeAndLocationAlarms:", v8);

  return v12;
}

- (EKFrozenReminderAlarm)initWithAlternateUniverseObject:(id)a3 inEventStore:(id)a4 withUpdatedChildObjects:(id)a5
{
  id v9;
  id v10;
  id v11;
  EKChangeSet *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  EKFrozenReminderAlarm *v23;
  void *v25;
  objc_class *v26;
  void *v27;
  objc_super v28;

  v9 = a3;
  v10 = a5;
  v11 = a4;
  v12 = objc_alloc_init(EKChangeSet);
  -[EKChangeSet setSkipsPersistentObjectCopy:](v12, "setSkipsPersistentObjectCopy:", 1);
  objc_msgSend(v9, "valueForKey:", CFSTR("relativeOffset"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKChangeSet changeSingleValue:forKey:basedOn:](v12, "changeSingleValue:forKey:basedOn:", v13, CFSTR("relativeOffset"), 0);

  objc_msgSend(v9, "valueForKey:", CFSTR("absoluteDate"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKChangeSet changeSingleValue:forKey:basedOn:](v12, "changeSingleValue:forKey:basedOn:", v14, CFSTR("absoluteDate"), 0);

  objc_msgSend(v9, "valueForKey:", CFSTR("structuredLocation"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "uniqueIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v17);
    v18 = (id)objc_claimAutoreleasedReturnValue();

    if (!v18)
      v18 = v16;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EKFrozenReminderAlarm.m"), 85, CFSTR("structured location is an unexpected type: %@"), v27);

    }
    -[EKChangeSet changeSingleValue:forKey:basedOn:](v12, "changeSingleValue:forKey:basedOn:", v18, CFSTR("structuredLocation"), 0);

  }
  objc_msgSend(v9, "valueForKey:", CFSTR("proximity"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKChangeSet changeSingleValue:forKey:basedOn:](v12, "changeSingleValue:forKey:basedOn:", v19, CFSTR("proximity"), 0);

  objc_msgSend(v9, "valueForKey:", CFSTR("UUID"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "UUIDString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[EKChangeSet changeSingleValue:forKey:basedOn:](v12, "changeSingleValue:forKey:basedOn:", v20, CFSTR("UUID"), 0);
  objc_msgSend(v11, "reminderStore");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v28.receiver = self;
  v28.super_class = (Class)EKFrozenReminderAlarm;
  v23 = -[EKFrozenReminderObject initWithREMObject:inStore:withChanges:](&v28, sel_initWithREMObject_inStore_withChanges_, 0, v22, v12);

  return v23;
}

- (id)updatedFrozenObjectWithChanges:(id)a3 updatedChildren:(id)a4
{
  EKFrozenReminderAlarm *v5;
  void *v6;
  EKFrozenReminderAlarm *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)EKFrozenReminderAlarm;
  -[EKFrozenReminderObject updatedFrozenObjectWithChanges:updatedChildren:](&v9, sel_updatedFrozenObjectWithChanges_updatedChildren_, a3, a4);
  v5 = (EKFrozenReminderAlarm *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
  {
    v7 = self;
  }
  else
  {
    -[EKFrozenReminderAlarm alarms](self, "alarms");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
      -[EKFrozenReminderAlarm _setTimeAndLocationAlarms:](v5, "_setTimeAndLocationAlarms:", v6);
    v7 = v5;

  }
  return v7;
}

- (void)_setTimeAndLocationAlarms:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  NSObject *v14;
  uint8_t v15;
  _BYTE v16[15];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[EKFrozenReminderAlarm _setTimeOrLocationAlarm:](self, "_setTimeOrLocationAlarm:", v9);
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = (void *)v10;
        if (v10)
          v12 = v10 == v9;
        else
          v12 = 1;
        if (!v12)
        {
          +[EKReminderStore log](EKReminderStore, "log");
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            -[EKFrozenReminderAlarm _setTimeAndLocationAlarms:].cold.2(&v15, v16, v13);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }
  if (!self->_timeAlarm && !self->_locationAlarm)
  {
    +[EKReminderStore log](EKReminderStore, "log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[EKFrozenReminderAlarm _setTimeAndLocationAlarms:].cold.1(v4, v14);

  }
}

- (id)_setTimeOrLocationAlarm:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id *v9;
  id v10;
  NSObject *v12;

  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    v10 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v5, "trigger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  getREMAlarmTimeIntervalTriggerClass();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (getREMAlarmDateTriggerClass(), objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 152;
  }
  else
  {
    getREMAlarmLocationTriggerClass();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      +[EKReminderStore log](EKReminderStore, "log");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[EKFrozenReminderAlarm _setTimeOrLocationAlarm:].cold.1((uint64_t)v7, v12);

      v10 = 0;
      goto LABEL_6;
    }
    v8 = 160;
  }
  v9 = (id *)((char *)&self->super.super.super.isa + v8);
  v10 = *(id *)((char *)&self->super.super.super.isa + v8);
  objc_storeStrong(v9, a3);
LABEL_6:

LABEL_8:
  return v10;
}

- (id)_timeAlarm
{
  return self->_timeAlarm;
}

- (id)_locationAlarm
{
  return self->_locationAlarm;
}

- (NSArray)alarms
{
  REMAlarm *locationAlarm;
  void *v3;
  REMAlarm **p_timeAlarm;
  uint64_t v5;
  REMAlarm *v7;
  REMAlarm *timeAlarm;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  locationAlarm = self->_locationAlarm;
  if (!self->_timeAlarm)
  {
    if (!locationAlarm)
      return (NSArray *)0;
    v7 = self->_locationAlarm;
    v3 = (void *)MEMORY[0x1E0C99D20];
    p_timeAlarm = &v7;
    goto LABEL_7;
  }
  if (!locationAlarm)
  {
    timeAlarm = self->_timeAlarm;
    v3 = (void *)MEMORY[0x1E0C99D20];
    p_timeAlarm = &timeAlarm;
LABEL_7:
    v5 = 1;
    goto LABEL_8;
  }
  v9[0] = self->_timeAlarm;
  v9[1] = locationAlarm;
  v3 = (void *)MEMORY[0x1E0C99D20];
  p_timeAlarm = (REMAlarm **)v9;
  v5 = 2;
LABEL_8:
  objc_msgSend(v3, "arrayWithObjects:count:", p_timeAlarm, v5);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)remObjectID
{
  REMAlarm *timeAlarm;

  if (self->_timeAlarm)
    timeAlarm = self->_timeAlarm;
  else
    timeAlarm = self->_locationAlarm;
  -[REMAlarm objectID](timeAlarm, "objectID");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (Class)meltedClass
{
  return (Class)objc_opt_class();
}

- (double)relativeOffset
{
  void *v2;
  double v3;
  double v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__EKFrozenReminderAlarm_relativeOffset__block_invoke;
  v6[3] = &unk_1E4784D28;
  v6[4] = self;
  -[EKFrozenReminderObject valueForSingleValueKey:backingValue:](self, "valueForSingleValueKey:backingValue:", CFSTR("relativeOffset"), v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

id __39__EKFrozenReminderAlarm_relativeOffset__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_timeAlarm");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "trigger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  getREMAlarmTimeIntervalTriggerClass();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v2, "timeInterval");
    objc_msgSend(v3, "numberWithDouble:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &unk_1E47B5DF8;
  }

  return v4;
}

- (id)absoluteDate
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __37__EKFrozenReminderAlarm_absoluteDate__block_invoke;
  v3[3] = &unk_1E4784D00;
  v3[4] = self;
  -[EKFrozenReminderObject valueForSingleValueKey:backingValue:](self, "valueForSingleValueKey:backingValue:", CFSTR("absoluteDate"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __37__EKFrozenReminderAlarm_absoluteDate__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_timeAlarm");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "trigger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  getREMAlarmDateTriggerClass();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "dateComponents");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setCalendar:", v4);

    objc_msgSend(v3, "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (EKFrozenReminderStructuredLocation)structuredLocation
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__EKFrozenReminderAlarm_structuredLocation__block_invoke;
  v3[3] = &unk_1E47891D8;
  v3[4] = self;
  -[EKFrozenReminderObject valueForSingleValueKey:backingValue:](self, "valueForSingleValueKey:backingValue:", CFSTR("structuredLocation"), v3);
  return (EKFrozenReminderStructuredLocation *)(id)objc_claimAutoreleasedReturnValue();
}

id __43__EKFrozenReminderAlarm_structuredLocation__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(*(id *)(a1 + 32), "_locationAlarm");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "trigger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "structuredLocation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 128));
    objc_msgSend(WeakRetained, "frozenObjectForReminderObject:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "remObjectID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayByAddingObject:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPath:", v9);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)modifiedStructuredLocation
{
  void *v3;

  if (-[EKChangeSet hasUnsavedChangeForKey:](self->super._changeSet, "hasUnsavedChangeForKey:", CFSTR("structuredLocation")))
  {
    -[EKChangeSet valueForSingleValueKey:basedOn:](self->super._changeSet, "valueForSingleValueKey:basedOn:", CFSTR("structuredLocation"), 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (NSString)externalID
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __35__EKFrozenReminderAlarm_externalID__block_invoke;
  v3[3] = &unk_1E4784B98;
  v3[4] = self;
  -[EKFrozenReminderObject valueForSingleValueKey:backingValue:](self, "valueForSingleValueKey:backingValue:", CFSTR("UUID"), v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

id __35__EKFrozenReminderAlarm_externalID__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 152);
  if (v3)
  {
    objc_msgSend(v3, "alarmUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v4 = 0;
  }
  v5 = *(void **)(v2 + 160);
  if (v5)
  {
    objc_msgSend(v5, "alarmUID");
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  if (!v4)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 152);
    if (v8 || (v8 = *(void **)(v7 + 160)) != 0)
    {
      objc_msgSend(v8, "remObjectID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "uuid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "UUIDString");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
  }
  return v4;
}

+ (int64_t)remAlarmProximityToEKAlarmProximity:(int64_t)a3
{
  return a3;
}

+ (int64_t)ekAlarmProximityToEKAlarmProximity:(int64_t)a3
{
  return a3;
}

- (id)_remStructuredLocation
{
  void *v3;
  void *v4;
  void *v5;
  REMAlarm *v6;
  void *v7;
  NSObject *v8;
  REMAlarm *locationAlarm;
  int v11;
  EKFrozenReminderAlarm *v12;
  __int16 v13;
  REMAlarm *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[EKFrozenReminderAlarm modifiedStructuredLocation](self, "modifiedStructuredLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "updatedStructuredLocation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (-[EKChangeSet hasUnsavedChangeForKey:](self->super._changeSet, "hasUnsavedChangeForKey:", CFSTR("structuredLocation"))|| (v6 = self->_locationAlarm) == 0)
  {
    v5 = 0;
  }
  else
  {
    -[REMAlarm trigger](v6, "trigger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    getREMAlarmLocationTriggerClass();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "structuredLocation");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[EKReminderStore log](EKReminderStore, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        locationAlarm = self->_locationAlarm;
        v11 = 138412802;
        v12 = self;
        v13 = 2112;
        v14 = locationAlarm;
        v15 = 2112;
        v16 = v7;
        _os_log_error_impl(&dword_1A2318000, v8, OS_LOG_TYPE_ERROR, "Frozen reminder alarm being committed has a location alarm without a location alarm trigger. EKFrozenReminderAlarm=%@; _locationAlarm=%@, _locationAlarm.trigger=%@",
          (uint8_t *)&v11,
          0x20u);
      }

      v5 = 0;
    }

  }
  return v5;
}

- (NSArray)triggers
{
  void *v3;
  _BOOL8 v4;
  void *v5;
  double v6;
  void *v7;

  -[EKFrozenReminderAlarm _remStructuredLocation](self, "_remStructuredLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self->_timeAlarm
    || -[EKChangeSet hasUnsavedChangeForKey:](self->super._changeSet, "hasUnsavedChangeForKey:", CFSTR("absoluteDate"))
    || -[EKChangeSet hasUnsavedChangeForKey:](self->super._changeSet, "hasUnsavedChangeForKey:", CFSTR("relativeOffset"));
  -[EKFrozenReminderAlarm absoluteDate](self, "absoluteDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKFrozenReminderAlarm relativeOffset](self, "relativeOffset");
  +[EKFrozenReminderAlarm triggersFromAbsoluteDate:relativeOffset:timeValuesRelevant:structuredLocation:proximity:](EKFrozenReminderAlarm, "triggersFromAbsoluteDate:relativeOffset:timeValuesRelevant:structuredLocation:proximity:", v5, v4, v3, -[EKFrozenReminderAlarm proximity](self, "proximity"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v7;
}

+ (id)triggersFromAbsoluteDate:(id)a3 relativeOffset:(double)a4 timeValuesRelevant:(BOOL)a5 structuredLocation:(id)a6 proximity:(int64_t)a7
{
  _BOOL4 v9;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v9 = a5;
  v11 = a3;
  v12 = a6;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
  if (v9)
  {
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "components:fromDate:", 254, v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(objc_alloc((Class)getREMAlarmDateTriggerClass()), "initWithDateComponents:", v15);
      objc_msgSend(v13, "addObject:", v16);

    }
    else
    {
      v14 = (void *)objc_msgSend(objc_alloc((Class)getREMAlarmTimeIntervalTriggerClass()), "initWithTimeInterval:", a4);
      objc_msgSend(v13, "addObject:", v14);
    }

  }
  if (v12)
  {
    v17 = (void *)objc_msgSend(objc_alloc((Class)getREMAlarmLocationTriggerClass()), "initWithStructuredLocation:proximity:", v12, +[EKFrozenReminderAlarm ekAlarmProximityToEKAlarmProximity:](EKFrozenReminderAlarm, "ekAlarmProximityToEKAlarmProximity:", a7));
    objc_msgSend(v13, "addObject:", v17);

  }
  return v13;
}

- (BOOL)_applyChanges:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[EKFrozenReminderAlarm externalID](self, "externalID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_timeAlarm)
    objc_msgSend(v5, "removeAlarm:");
  if (self->_locationAlarm)
  {
    objc_msgSend(v5, "removeAlarm:");
    -[EKFrozenReminderAlarm modifiedStructuredLocation](self, "modifiedStructuredLocation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[EKFrozenReminderObject path](self, "path");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMAlarm objectID](self->_locationAlarm, "objectID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "arrayByAddingObject:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setPath:", v10);

    }
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[EKFrozenReminderAlarm triggers](self, "triggers", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(v5, "addAlarmWithTrigger:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setAlarmUID:", v6);
        -[EKFrozenReminderAlarm acknowledgedDate](self, "acknowledgedDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setAcknowledgedDate:", v17);

        -[EKFrozenReminderAlarm originalAlarm](self, "originalAlarm");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "externalID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setOriginalAlarmUID:", v19);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v13);
  }

  return 1;
}

- (BOOL)_applyChangesToSaveRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  BOOL v14;
  NSObject *v15;
  NSObject *v16;
  id v18;

  v6 = a3;
  -[EKFrozenReminderObject path](self, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->super._reminderStore);
    objc_msgSend(WeakRetained, "remStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = 0;
    objc_msgSend(v10, "fetchReminderWithObjectID:error:", v8, &v18);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v18;
    if (v11)
    {
      objc_msgSend(v6, "updateReminder:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[EKFrozenReminderAlarm _applyChanges:error:](self, "_applyChanges:error:", v13, a4);

    }
    else
    {
      +[EKReminderStore log](EKReminderStore, "log");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[EKFrozenReminderAlarm _applyChangesToSaveRequest:error:].cold.2();

      if (a4)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithEKErrorCode:", 5);
        v14 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = 0;
      }
    }

  }
  else
  {
    +[EKReminderStore log](EKReminderStore, "log");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[EKFrozenReminderAlarm _applyChangesToSaveRequest:error:].cold.1();

    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithEKErrorCode:", 5);
      v14 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
  }

  return v14;
}

+ (id)uniqueIdentifierForREMObject:(id)a3
{
  return (id)objc_msgSend(a3, "alarmUID");
}

- (id)updatedAlarmWithLocation:(id)a3
{
  id v4;
  EKChangeSet *v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc_init(EKChangeSet);
  -[EKChangeSet setSkipsPersistentObjectCopy:](v5, "setSkipsPersistentObjectCopy:", 1);
  -[EKChangeSet changeSingleValue:forKey:basedOn:](v5, "changeSingleValue:forKey:basedOn:", v4, CFSTR("structuredLocation"), 0);

  -[EKFrozenReminderObject updatedFrozenObjectWithChanges:](self, "updatedFrozenObjectWithChanges:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)semanticIdentifierFromREMAlarm:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;

  v4 = a3;
  objc_msgSend(v4, "acknowledgedDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trigger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  getREMAlarmDateTriggerClass();
  v7 = 0x1E0CB3000uLL;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "dateComponents");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "semanticIdentifierFromDateComponents:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_13;
  }
  getREMAlarmTimeIntervalTriggerClass();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "timeInterval");
    objc_msgSend(v10, "numberWithDouble:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

    goto LABEL_13;
  }
  getREMAlarmLocationTriggerClass();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = v6;
    v28 = objc_msgSend(v12, "proximity");
    objc_msgSend(v12, "structuredLocation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "title");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "address");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "mapKitHandle");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "contactLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v11, "latitude");
    objc_msgSend(v13, "numberWithDouble:");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v11, "longitude");
    objc_msgSend(v14, "numberWithDouble:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v11, "radius");
    objc_msgSend(v16, "numberWithDouble:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[EKStructuredLocationSemanticIdentifierGenerator semanticIdentifierForLocationWithTitle:address:mapKitHandle:contactLabel:latitude:longitude:radius:](EKStructuredLocationSemanticIdentifierGenerator, "semanticIdentifierForLocationWithTitle:address:mapKitHandle:contactLabel:latitude:longitude:radius:", v29, v27, v26, v25, v24, v15, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v28);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("Proximity=%@;Location=%@"), v20, v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = 0x1E0CB3000;
    goto LABEL_7;
  }
  if (v6)
  {
    +[EKReminderStore log](EKReminderStore, "log");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      +[EKFrozenReminderAlarm semanticIdentifierFromREMAlarm:].cold.1((uint64_t)v6, (uint64_t)v4, v21);

  }
  v9 = 0;
LABEL_13:
  objc_msgSend(*(id *)(v7 + 2368), "stringWithFormat:", CFSTR("Ack=%@;Trigger=%@:%@"), v5, objc_opt_class(), v9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

+ (id)semanticIdentifierFromDateComponents:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;

  v3 = a3;
  v4 = objc_msgSend(v3, "era");
  v5 = objc_msgSend(v3, "year");
  v6 = objc_msgSend(v3, "month");
  v7 = objc_msgSend(v3, "day");
  v8 = objc_msgSend(v3, "hour");
  v9 = objc_msgSend(v3, "minute");
  v10 = objc_msgSend(v3, "second");
  objc_msgSend(v3, "timeZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("["));
  v13 = v12;
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v12, "appendFormat:", CFSTR("Era=%li;"), v4);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v13, "appendFormat:", CFSTR("Year=%li;"), v5);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v13, "appendFormat:", CFSTR("Month=%li;"), v6);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v13, "appendFormat:", CFSTR("Day=%li;"), v7);
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v13, "appendFormat:", CFSTR("Hour=%li;"), v8);
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v13, "appendFormat:", CFSTR("Minute=%li;"), v9);
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v13, "appendFormat:", CFSTR("Second=%li;"), v10);
  objc_msgSend(v11, "name");
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v11)
  {

    v15 = CFSTR("FLOAT");
  }
  objc_msgSend(v13, "appendFormat:", CFSTR("TZ=%@]"), v15);

  return v13;
}

- (int64_t)proximity
{
  void *v2;
  int64_t v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__EKFrozenReminderAlarm_proximity__block_invoke;
  v5[3] = &unk_1E4784B98;
  v5[4] = self;
  -[EKFrozenReminderObject valueForSingleValueKey:backingValue:](self, "valueForSingleValueKey:backingValue:", CFSTR("proximity"), v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

id __34__EKFrozenReminderAlarm_proximity__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_locationAlarm");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "trigger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "proximity");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_effectiveAlarm
{
  REMAlarm *timeAlarm;

  timeAlarm = self->_timeAlarm;
  if (!timeAlarm)
    timeAlarm = self->_locationAlarm;
  return timeAlarm;
}

- (id)acknowledgedDate
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__EKFrozenReminderAlarm_acknowledgedDate__block_invoke;
  v3[3] = &unk_1E4784D00;
  v3[4] = self;
  -[EKFrozenReminderObject valueForSingleValueKey:backingValue:](self, "valueForSingleValueKey:backingValue:", CFSTR("acknowledgedDate"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __41__EKFrozenReminderAlarm_acknowledgedDate__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_effectiveAlarm");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "acknowledgedDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (int64_t)type
{
  return 0;
}

- (id)emailAddress
{
  return 0;
}

- (id)urlWrapper
{
  return 0;
}

- (id)snoozedAlarmsSet
{
  return 0;
}

- (id)calendarOwner
{
  return 0;
}

- (id)calendarItemOwner
{
  return 0;
}

- (id)originalAlarm
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__EKFrozenReminderAlarm_originalAlarm__block_invoke;
  v3[3] = &unk_1E4789200;
  v3[4] = self;
  -[EKFrozenReminderObject valueForSingleValueKey:backingValue:](self, "valueForSingleValueKey:backingValue:", CFSTR("originalAlarm"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

EKFrozenReminderAlarm *__38__EKFrozenReminderAlarm_originalAlarm__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  char v17;
  EKFrozenReminderAlarm *v18;
  EKFrozenReminderAlarm *v19;
  id v20;
  EKFrozenReminderAlarm *v21;
  id v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_effectiveAlarm");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "originalAlarmUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 128));
    objc_msgSend(WeakRetained, "remStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    objc_msgSend(v5, "fetchReminderWithObjectID:error:", v7, &v29);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v29;

    if (v8)
    {
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      objc_msgSend(v8, "alarms");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      if (v11)
      {
        v12 = v11;
        v23 = v9;
        v24 = v5;
        v13 = *(_QWORD *)v26;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v26 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
            objc_msgSend(v15, "alarmUID");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "isEqualToString:", v3);

            if ((v17 & 1) != 0)
            {
              v19 = [EKFrozenReminderAlarm alloc];
              v20 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 128));
              v21 = -[EKFrozenReminderObject initWithREMObject:inStore:](v19, "initWithREMObject:inStore:", v15, v20);

              v18 = v21;
              v10 = v18;
              goto LABEL_14;
            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
          if (v12)
            continue;
          break;
        }
        v18 = 0;
LABEL_14:
        v9 = v23;
        v5 = v24;
      }
      else
      {
        v18 = 0;
      }

    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BOOL)isDefaultAlarm
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationAlarm, 0);
  objc_storeStrong((id *)&self->_timeAlarm, 0);
}

- (void)_setTimeAndLocationAlarms:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_1A2318000, a2, v3, "Alarm has no usable triggers (%lu passed in)", v4);
  OUTLINED_FUNCTION_4_0();
}

- (void)_setTimeAndLocationAlarms:(os_log_t)log .cold.2(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1A2318000, log, OS_LOG_TYPE_ERROR, "Alarm has multiple triggers with the same type; an arbitrary one will be used.",
    buf,
    2u);
}

- (void)_setTimeOrLocationAlarm:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_1A2318000, a2, v5, "Alarm has an unknown trigger type: %{public}@", v6);

  OUTLINED_FUNCTION_4_0();
}

- (void)_applyChangesToSaveRequest:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_1A2318000, v0, v1, "Alarm to be saved doesn't have a parent reminder: %@", v2);
}

- (void)_applyChangesToSaveRequest:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_1A2318000, v0, v1, "Couldn't fetch reminder to be saved: %@", v2);
}

+ (void)semanticIdentifierFromREMAlarm:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint8_t v5[12];
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  OUTLINED_FUNCTION_3();
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_1A2318000, a3, OS_LOG_TYPE_ERROR, "Unknown alarm trigger type %@ on alarm %@ during cloning. Alarms might not be correctly matched.", v5, 0x16u);
  OUTLINED_FUNCTION_4_0();
}

@end
