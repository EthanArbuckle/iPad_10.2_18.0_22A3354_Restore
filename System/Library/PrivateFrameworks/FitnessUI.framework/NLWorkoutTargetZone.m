@implementation NLWorkoutTargetZone

- (NLWorkoutTargetZone)initWithType:(int64_t)a3 min:(double)a4 max:(double)a5 currentValue:(double)a6
{
  NLWorkoutTargetZone *result;
  BOOL v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NLWorkoutTargetZone;
  result = -[NLWorkoutTargetZone init](&v12, sel_init);
  if (result)
  {
    result->_type = a3;
    result->_min = a4;
    result->_max = a5;
    result->_currentValue = a6;
    v11 = a4 > 0.0 || a5 > 0.0;
    if (!a3)
      v11 = 0;
    result->_enabled = v11;
  }
  return result;
}

- (BOOL)isSingleThreshold
{
  return self->_min == self->_max;
}

- (id)description
{
  void *v3;
  unint64_t v4;
  __CFString *v5;
  const __CFString *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = -[NLWorkoutTargetZone type](self, "type");
  if (v4 > 7)
    v5 = 0;
  else
    v5 = off_24CF31B00[v4];
  if (-[NLWorkoutTargetZone enabled](self, "enabled"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  -[NLWorkoutTargetZone min](self, "min");
  v8 = v7;
  -[NLWorkoutTargetZone max](self, "max");
  v10 = v9;
  -[NLWorkoutTargetZone currentValue](self, "currentValue");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("NLWorkoutTargetZone(type:%@ enabled:%@ min:%.06f max:%.06f current:%.06f)"), v5, v6, v8, v10, v11);
}

- (unint64_t)stateForDistanceUnit:(id)a3
{
  id v4;
  int64_t v5;
  unint64_t v6;
  unint64_t v7;

  v4 = a3;
  v5 = -[NLWorkoutTargetZone type](self, "type");
  if ((unint64_t)(v5 - 4) >= 4)
  {
    if ((unint64_t)(v5 - 1) > 2)
    {
      v7 = 0;
      goto LABEL_6;
    }
    v6 = -[NLWorkoutTargetZone stateForPaceZoneWithDistanceUnit:](self, "stateForPaceZoneWithDistanceUnit:", v4);
  }
  else
  {
    v6 = -[NLWorkoutTargetZone stateForStandardZone](self, "stateForStandardZone");
  }
  v7 = v6;
LABEL_6:

  return v7;
}

- (unint64_t)stateForPaceZoneWithDistanceUnit:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  unint64_t v21;

  v4 = (void *)MEMORY[0x24BDD3E50];
  v5 = (void *)MEMORY[0x24BDD4048];
  v6 = a3;
  objc_msgSend(v5, "meterUnit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLWorkoutTargetZone currentValue](self, "currentValue");
  objc_msgSend(v4, "quantityWithUnit:doubleValue:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BDD3E50];
  objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLWorkoutTargetZone min](self, "min");
  objc_msgSend(v9, "quantityWithUnit:doubleValue:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x24BDD3E50];
  objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLWorkoutTargetZone max](self, "max");
  objc_msgSend(v12, "quantityWithUnit:doubleValue:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = FIUIPace(v8, v6, 1, 1.0);
  v16 = FIUIPace(v11, v6, 1, 1.0);
  v17 = FIUIPace(v14, v6, 1, 1.0);

  -[NLWorkoutTargetZone max](self, "max");
  v19 = v18;
  -[NLWorkoutTargetZone min](self, "min");
  if (v15 <= 2.22044605e-16)
  {
    v21 = 0;
  }
  else if (v15 <= v16 || v20 <= 2.22044605e-16)
  {
    if (v19 > 2.22044605e-16 && v15 < v17)
      v21 = 3;
    else
      v21 = 2;
  }
  else
  {
    v21 = 1;
  }

  return v21;
}

- (unint64_t)stateForStandardZone
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[NLWorkoutTargetZone currentValue](self, "currentValue");
  v4 = v3;
  -[NLWorkoutTargetZone max](self, "max");
  v6 = v5;
  -[NLWorkoutTargetZone min](self, "min");
  if (v4 <= 2.22044605e-16)
    return 0;
  if (v4 > v6 && v6 > 2.22044605e-16)
    return 3;
  if (v7 > 2.22044605e-16 && v4 < v7)
    return 1;
  else
    return 2;
}

+ (id)defaultTargetZoneForTypeKey:(id)a3
{
  id v3;
  uint64_t v4;
  NLWorkoutTargetZone *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PaceTargetZonesByActivityType")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CadenceTargetZonesByActivityType")) & 1) != 0)
  {
    v4 = 5;
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("PowerTargetZonesByActivityType")))
    {
      v5 = 0;
      goto LABEL_8;
    }
    v4 = 7;
  }
  v5 = -[NLWorkoutTargetZone initWithType:min:max:currentValue:]([NLWorkoutTargetZone alloc], "initWithType:min:max:currentValue:", v4, 0.0, 0.0, 0.0);
LABEL_8:

  return v5;
}

+ (id)paceTargetZoneForActivityType:(id)a3
{
  return +[NLWorkoutTargetZone targetZoneForActivityType:targetZoneActivityTypeKey:](NLWorkoutTargetZone, "targetZoneForActivityType:targetZoneActivityTypeKey:", a3, CFSTR("PaceTargetZonesByActivityType"));
}

+ (id)cadenceTargetZoneForActivityType:(id)a3
{
  return +[NLWorkoutTargetZone targetZoneForActivityType:targetZoneActivityTypeKey:](NLWorkoutTargetZone, "targetZoneForActivityType:targetZoneActivityTypeKey:", a3, CFSTR("CadenceTargetZonesByActivityType"));
}

+ (id)powerTargetZoneForActivityType:(id)a3
{
  return +[NLWorkoutTargetZone targetZoneForActivityType:targetZoneActivityTypeKey:](NLWorkoutTargetZone, "targetZoneForActivityType:targetZoneActivityTypeKey:", a3, CFSTR("PowerTargetZonesByActivityType"));
}

+ (id)targetZoneForActivityType:(id)a3 targetZoneActivityTypeKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9
    && (objc_msgSend(a1, "restoreFromDictionary:activityType:", v9, v6),
        (v10 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v11 = v10;
    if (objc_msgSend(v10, "enabled"))
    {
      _HKInitializeLogging();
      v12 = *MEMORY[0x24BDD3078];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3078], OS_LOG_TYPE_DEFAULT))
      {
        v14 = 138412290;
        v15 = v11;
        _os_log_impl(&dword_21307C000, v12, OS_LOG_TYPE_DEFAULT, "[targetzones] Pace target zone supported. Target zone: %@", (uint8_t *)&v14, 0xCu);
      }
    }
  }
  else
  {
    +[NLWorkoutTargetZone defaultTargetZoneForTypeKey:](NLWorkoutTargetZone, "defaultTargetZoneForTypeKey:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

+ (id)restoreFromDictionary:(id)a3 activityType:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(a4, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[NLWorkoutTargetZone restoreFromDictionary:](NLWorkoutTargetZone, "restoreFromDictionary:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)restoreFromDictionary:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  NLWorkoutTargetZone *v17;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "objectForKey:", CFSTR("type"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(a1, "mapTargetZoneTypeStringToEnum:", v5);
    objc_msgSend(v4, "objectForKey:", CFSTR("minimum"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    v9 = v8;

    objc_msgSend(v4, "objectForKey:", CFSTR("maximum"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    v12 = v11;

    objc_msgSend(v4, "objectForKey:", CFSTR("enabled"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("true"));
    if (v9 != v12 && v9 == 0.0)
      v9 = v12;
    if (v9 != v12 && v12 == 0.0)
      v12 = v9;
    v17 = -[NLWorkoutTargetZone initWithType:min:max:currentValue:]([NLWorkoutTargetZone alloc], "initWithType:min:max:currentValue:", v6, v9, v12, 0.0);
    -[NLWorkoutTargetZone setEnabled:](v17, "setEnabled:", v14);

  }
  else
  {
    v17 = 0;
  }
  return v17;
}

+ (id)serializeTargetZone:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;

  if (a3)
  {
    v3 = (void *)MEMORY[0x24BDBCED8];
    v4 = a3;
    objc_msgSend(v3, "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[NLWorkoutTargetZone mapTargetZoneTypeEnumToString:](NLWorkoutTargetZone, "mapTargetZoneTypeEnumToString:", objc_msgSend(v4, "type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "enabled");
    v8 = CFSTR("false");
    if (v7)
      v8 = CFSTR("true");
    v9 = v8;
    objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("type"));
    v10 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v4, "min");
    objc_msgSend(v10, "numberWithDouble:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v11, CFSTR("minimum"));

    v12 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v4, "max");
    v14 = v13;

    objc_msgSend(v12, "numberWithDouble:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v15, CFSTR("maximum"));

    objc_msgSend(v5, "setObject:forKey:", v9, CFSTR("enabled"));
  }
  else
  {
    v5 = 0;
  }
  v16 = (void *)objc_msgSend(v5, "copy");

  return v16;
}

+ (void)saveTargetZone:(id)a3 forActivityType:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  _HKInitializeLogging();
  v7 = *MEMORY[0x24BDD3078];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3078], OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412290;
    v17 = v5;
    _os_log_impl(&dword_21307C000, v7, OS_LOG_TYPE_DEFAULT, "[targetzones] Saving target zone values to defaults. zone:%@", (uint8_t *)&v16, 0xCu);
  }
  v8 = objc_msgSend(v5, "type");
  if ((unint64_t)(v8 - 1) <= 6)
  {
    v9 = *off_24CF31B40[v8 - 1];
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    if (!v12)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    +[NLWorkoutTargetZone serializeTargetZone:](NLWorkoutTargetZone, "serializeTargetZone:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uniqueIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v13, v14);

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v12, v9);

    objc_msgSend(MEMORY[0x24BDBCF50], "fu_backupStandardUserDefaultsKey:", v9);
  }

}

+ (int64_t)mapTargetZoneTypeStringToEnum:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("rolling_pace")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("average_pace")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("instantaneous_pace")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("instantaneous_cadence")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("average_cadence")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("instantaneous_power")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("average_power")) & 1) != 0)
  {
    v4 = 7;
  }
  else
  {
    objc_msgSend(v3, "isEqualToString:", CFSTR("none"));
    v4 = 0;
  }

  return v4;
}

+ (id)mapTargetZoneTypeEnumToString:(int64_t)a3
{
  if ((unint64_t)a3 > 7)
    return &stru_24CF339D8;
  else
    return off_24CF31B78[a3];
}

+ (int64_t)targetZoneMasterTypeForTargetZoneType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 6)
    return 0;
  else
    return qword_21310E290[a3 - 1];
}

+ (id)targetZonesFromMetadata:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  int64_t v19;
  NLWorkoutTargetZone *v20;
  NLWorkoutTargetZone *v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v4 = objc_msgSend(&unk_24CF4F188, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v25;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v25 != v6)
          objc_enumerationMutation(&unk_24CF4F188);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v7), "intValue");
        if (v8 > 3)
          v9 = 0;
        else
          v9 = off_24CF31BB8[v8];
        objc_msgSend(v3, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
        {
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("_HKPrivateWorkoutTargetZoneMin"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "doubleValue");
          v14 = v13;

          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("_HKPrivateWorkoutTargetZoneMax"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "doubleValue");
          v17 = v16;

          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("_HKPrivateWorkoutTargetZoneType"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = +[NLWorkoutTargetZone mapTargetZoneTypeStringToEnum:](NLWorkoutTargetZone, "mapTargetZoneTypeStringToEnum:", v18);

          if ((unint64_t)(v19 - 1) <= 6)
          {
            v20 = -[NLWorkoutTargetZone initWithType:min:max:currentValue:]([NLWorkoutTargetZone alloc], "initWithType:min:max:currentValue:", v19, v14, v17, 0.0);
            if (v20)
            {
              v21 = v20;
              objc_msgSend(v23, "addObject:", v20);

            }
          }
        }

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(&unk_24CF4F188, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v5);
  }

  return v23;
}

+ (id)metadataForTargetZone:(id)a3
{
  id v3;
  unint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];
  _QWORD v16[3];
  __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = +[NLWorkoutTargetZone targetZoneMasterTypeForTargetZoneType:](NLWorkoutTargetZone, "targetZoneMasterTypeForTargetZoneType:", objc_msgSend(v3, "type"));
  if (v4 > 3)
    v5 = 0;
  else
    v5 = off_24CF31BB8[v4];
  v17 = v5;
  v15[0] = CFSTR("_HKPrivateWorkoutTargetZoneMin");
  v6 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v3, "min");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  v15[1] = CFSTR("_HKPrivateWorkoutTargetZoneMax");
  v8 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v3, "max");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v9;
  v15[2] = CFSTR("_HKPrivateWorkoutTargetZoneType");
  v10 = objc_msgSend(v3, "type");

  +[NLWorkoutTargetZone mapTargetZoneTypeEnumToString:](NLWorkoutTargetZone, "mapTargetZoneTypeEnumToString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (unint64_t)hash
{
  return self->_type ^ (unint64_t)self->_min ^ (unint64_t)self->_max ^ (unint64_t)self->_currentValue;
}

- (BOOL)isEqual:(id)a3
{
  NLWorkoutTargetZone *v4;
  NLWorkoutTargetZone *v5;
  int64_t type;
  double min;
  double v8;
  double max;
  double v10;
  double currentValue;
  double v12;
  BOOL v13;

  v4 = (NLWorkoutTargetZone *)a3;
  if (v4 == self)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      type = self->_type;
      if (type == -[NLWorkoutTargetZone type](v5, "type")
        && (min = self->_min, -[NLWorkoutTargetZone min](v5, "min"), min == v8)
        && (max = self->_max, -[NLWorkoutTargetZone max](v5, "max"), max == v10))
      {
        currentValue = self->_currentValue;
        -[NLWorkoutTargetZone currentValue](v5, "currentValue");
        v13 = currentValue == v12;
      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (int64_t)type
{
  return self->_type;
}

- (double)min
{
  return self->_min;
}

- (double)max
{
  return self->_max;
}

- (double)currentValue
{
  return self->_currentValue;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

@end
