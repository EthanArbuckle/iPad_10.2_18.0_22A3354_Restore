@implementation NLWorkoutSplitStorage

- (NLWorkoutSplitStorage)initWithType:(int64_t)a3 value:(double)a4
{
  NLWorkoutSplitStorage *result;
  BOOL v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NLWorkoutSplitStorage;
  result = -[NLWorkoutSplitStorage init](&v9, sel_init);
  if (result)
  {
    result->_type = a3;
    result->_value = a4;
    v8 = a4 > 0.0 && a3 != 0;
    result->_enabled = v8;
  }
  return result;
}

+ (NSUserDefaults)userDefaults
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)_userDefaults;
  if (!_userDefaults)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)_userDefaults;
    _userDefaults = v3;

    v2 = (void *)_userDefaults;
  }
  return (NSUserDefaults *)v2;
}

+ (void)setUserDefaults:(id)a3
{
  objc_storeStrong((id *)&_userDefaults, a3);
}

+ (BOOL)isTesting
{
  void *v2;
  void *v3;

  v2 = (void *)_userDefaults;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v2, "isEqual:", v3) ^ 1;

  return (char)v2;
}

- (BOOL)isEqual:(id)a3
{
  NLWorkoutSplitStorage *v4;
  NLWorkoutSplitStorage *v5;
  int64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;
  BOOL v13;
  char v15;

  v4 = (NLWorkoutSplitStorage *)a3;
  if (self == v4)
  {
    v15 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[NLWorkoutSplitStorage type](self, "type");
      v7 = -[NLWorkoutSplitStorage type](v5, "type");
      -[NLWorkoutSplitStorage value](self, "value");
      v9 = v8;
      -[NLWorkoutSplitStorage value](v5, "value");
      v11 = v10;
      v12 = -[NLWorkoutSplitStorage enabled](self, "enabled");
      v13 = -[NLWorkoutSplitStorage enabled](v5, "enabled");

      if (v9 == v11 && v6 == v7)
        v15 = v12 ^ v13 ^ 1;
      else
        v15 = 0;
    }
    else
    {
      v15 = 0;
    }
  }

  return v15;
}

- (unint64_t)hash
{
  double v3;
  double v4;

  v3 = (double)(unint64_t)(31 * -[NLWorkoutSplitStorage type](self, "type") + 961);
  -[NLWorkoutSplitStorage value](self, "value");
  return 31 * (unint64_t)(v4 + v3) + -[NLWorkoutSplitStorage enabled](self, "enabled");
}

- (id)description
{
  void *v3;
  int64_t v4;
  __CFString *v5;
  __CFString *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = -[NLWorkoutSplitStorage type](self, "type");
  v5 = CFSTR("NLWorkoutSplitsTypeNone");
  if (v4 == 1)
    v5 = CFSTR("NLWorkoutSplitsTypeDistance");
  if (v4 == 2)
    v5 = CFSTR("NLWorkoutSplitsTypeTime");
  v6 = v5;
  if (-[NLWorkoutSplitStorage enabled](self, "enabled"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  -[NLWorkoutSplitStorage value](self, "value");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("NLWorkoutSplitStorage(type:%@ enabled:%@ value:%f)"), v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_defaultSplit:(id)a3 activityType:(id)a4 userDistanceUnit:(id)a5
{
  id v7;
  id v8;
  id v9;
  double v10;
  double v11;
  NLWorkoutSplitStorage *v12;
  uint64_t v13;
  double v14;
  NLWorkoutSplitStorage *v15;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("DistanceSplitsByActivityType")) & 1) == 0)
    objc_msgSend(v7, "isEqualToString:", CFSTR("TimeSplitsByActivityType"));
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("DistanceSplitsByActivityType")))
  {
    +[NLWorkoutSplitStorage _defaultSplitDistanceForActivityType:userDistanceUnit:](NLWorkoutSplitStorage, "_defaultSplitDistanceForActivityType:userDistanceUnit:", v8, v9);
    v11 = v10;
    v12 = [NLWorkoutSplitStorage alloc];
    v13 = 1;
    v14 = v11;
  }
  else
  {
    v12 = [NLWorkoutSplitStorage alloc];
    v14 = 0.0;
    v13 = 2;
  }
  v15 = -[NLWorkoutSplitStorage initWithType:value:](v12, "initWithType:value:", v13, v14);

  return v15;
}

+ (double)_defaultSplitDistanceForActivityType:(id)a3 userDistanceUnit:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "effectiveTypeIdentifier");
  if ((unint64_t)(v7 - 13) <= 0x3A
    && ((1 << (v7 - 13)) & 0x600808001000800) == 0
    && v7 == 13)
  {
    objc_msgSend(v5, "isIndoor", 1.0);
  }
  objc_msgSend(MEMORY[0x24BDD3E50], "quantityWithUnit:doubleValue:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValueForUnit:", v9);
  v11 = v10;

  if (objc_msgSend(v5, "effectiveTypeIdentifier") == 35)
  {
    v12 = (void *)MEMORY[0x24BDD3E50];
    objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "quantityWithUnit:doubleValue:", v13, 500.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValueForUnit:", v15);
    v11 = v16;

  }
  return v11;
}

+ (id)distanceSplitForActivityType:(id)a3 userDistanceUnit:(id)a4
{
  return +[NLWorkoutSplitStorage splitForActivityType:splitsActivityTypeKey:userDistanceUnit:](NLWorkoutSplitStorage, "splitForActivityType:splitsActivityTypeKey:userDistanceUnit:", a3, CFSTR("DistanceSplitsByActivityType"), a4);
}

+ (id)timeSplitForActivityType:(id)a3
{
  return +[NLWorkoutSplitStorage splitForActivityType:splitsActivityTypeKey:userDistanceUnit:](NLWorkoutSplitStorage, "splitForActivityType:splitsActivityTypeKey:userDistanceUnit:", a3, CFSTR("TimeSplitsByActivityType"), 0);
}

+ (id)splitForActivityType:(id)a3 splitsActivityTypeKey:(id)a4 userDistanceUnit:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[NLWorkoutSplitStorage userDefaults](NLWorkoutSplitStorage, "userDefaults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(a1, "restoreFromDictionary:activityType:", v12, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      if (objc_msgSend(v13, "enabled"))
      {
        _HKInitializeLogging();
        v15 = *MEMORY[0x24BDD3078];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3078], OS_LOG_TYPE_DEFAULT))
        {
          v19 = 138412290;
          v20 = v14;
          _os_log_impl(&dword_21307C000, v15, OS_LOG_TYPE_DEFAULT, "[SplitStorage] Splits supported. Split span: %@", (uint8_t *)&v19, 0xCu);
        }
      }
      v16 = v14;
    }
    else
    {
      +[NLWorkoutSplitStorage _defaultSplit:activityType:userDistanceUnit:](NLWorkoutSplitStorage, "_defaultSplit:activityType:userDistanceUnit:", v9, v8, v10);
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    v17 = v16;

  }
  else
  {
    +[NLWorkoutSplitStorage _defaultSplit:activityType:userDistanceUnit:](NLWorkoutSplitStorage, "_defaultSplit:activityType:userDistanceUnit:", v9, v8, v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
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

  +[NLWorkoutSplitStorage restoreFromDictionary:](NLWorkoutSplitStorage, "restoreFromDictionary:", v7);
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
  uint64_t v11;
  NLWorkoutSplitStorage *v12;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "objectForKey:", CFSTR("type"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(a1, "mapSplitTypeStringToEnum:", v5);
    objc_msgSend(v4, "objectForKey:", CFSTR("value"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    v9 = v8;

    objc_msgSend(v4, "objectForKey:", CFSTR("enabled"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("true"));
    v12 = -[NLWorkoutSplitStorage initWithType:value:]([NLWorkoutSplitStorage alloc], "initWithType:value:", v6, v9);
    -[NLWorkoutSplitStorage setEnabled:](v12, "setEnabled:", v11);

  }
  else
  {
    v12 = 0;
  }
  return v12;
}

+ (id)serializeSplitStorage:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;

  if (a3)
  {
    v3 = (void *)MEMORY[0x24BDBCED8];
    v4 = a3;
    objc_msgSend(v3, "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[NLWorkoutSplitStorage mapSplitTypeEnumToString:](NLWorkoutSplitStorage, "mapSplitTypeEnumToString:", objc_msgSend(v4, "type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "enabled");
    v8 = CFSTR("false");
    if (v7)
      v8 = CFSTR("true");
    v9 = v8;
    objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("type"));
    v10 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v4, "value");
    v12 = v11;

    objc_msgSend(v10, "numberWithDouble:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v13, CFSTR("value"));

    objc_msgSend(v5, "setObject:forKey:", v9, CFSTR("enabled"));
  }
  else
  {
    v5 = 0;
  }
  v14 = (void *)objc_msgSend(v5, "copy");

  return v14;
}

+ (void)saveSplitStorage:(id)a3 forActivityType:(id)a4
{
  +[NLWorkoutSplitStorage saveSplitStorage:forActivityType:useLegacyUniqueIdentifier:](NLWorkoutSplitStorage, "saveSplitStorage:forActivityType:useLegacyUniqueIdentifier:", a3, a4, 0);
}

+ (void)saveSplitStorage:(id)a3 forActivityType:(id)a4 useLegacyUniqueIdentifier:(BOOL)a5
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  __CFString **v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  _HKInitializeLogging();
  v9 = *MEMORY[0x24BDD3078];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3078], OS_LOG_TYPE_DEFAULT))
  {
    v23 = 138412290;
    v24 = v7;
    _os_log_impl(&dword_21307C000, v9, OS_LOG_TYPE_DEFAULT, "[SplitStorage] Saving split values to defaults. split:%@", (uint8_t *)&v23, 0xCu);
  }
  v10 = objc_msgSend(v7, "type");
  if (v10 == 1)
  {
    v11 = kNLSessionTrackerAppKeyDistanceSplitsByActivityType;
  }
  else
  {
    if (v10 != 2)
      goto LABEL_16;
    v11 = &kNLSessionTrackerAppKeyTimeSplitsByActivityType;
  }
  v12 = *v11;
  if (v12)
  {
    v13 = v12;
    +[NLWorkoutSplitStorage userDefaults](NLWorkoutSplitStorage, "userDefaults");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "mutableCopy");

    if (!v16)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    +[NLWorkoutSplitStorage serializeSplitStorage:](NLWorkoutSplitStorage, "serializeSplitStorage:", v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (a5)
    {
      objc_msgSend(v8, "workoutActivityType");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "legacyUniqueIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v8, "uniqueIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v16, "setObject:forKey:", v17, v19);
    +[NLWorkoutSplitStorage userDefaults](NLWorkoutSplitStorage, "userDefaults");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKey:", v16, v13);

    if (!+[NLWorkoutSplitStorage isTesting](NLWorkoutSplitStorage, "isTesting"))
      objc_msgSend(MEMORY[0x24BDBCF50], "fu_backupStandardUserDefaultsKey:", v13);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uniqueIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "postNotificationName:object:", CFSTR("NLWorkoutSplitStorageSaved"), v22);

  }
LABEL_16:

}

+ (int64_t)mapSplitTypeStringToEnum:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("distance")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("time")) & 1) != 0)
  {
    v4 = 2;
  }
  else
  {
    objc_msgSend(v3, "isEqualToString:", CFSTR("none"));
    v4 = 0;
  }

  return v4;
}

+ (id)mapSplitTypeEnumToString:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return &stru_24CF339D8;
  else
    return off_24CF31848[a3];
}

- (int64_t)type
{
  return self->_type;
}

- (double)value
{
  return self->_value;
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
