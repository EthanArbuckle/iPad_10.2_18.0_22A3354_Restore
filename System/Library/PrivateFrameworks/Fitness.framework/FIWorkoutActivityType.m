@implementation FIWorkoutActivityType

+ (id)activityTypeWithHKWorkoutActivityTypeIdentifier:(unint64_t)a3 isIndoor:(BOOL)a4
{
  _BOOL8 v4;
  FIWorkoutActivityType *v6;

  v4 = a4;
  v6 = [FIWorkoutActivityType alloc];
  return -[FIWorkoutActivityType initWithActivityTypeIdentifier:isIndoor:metadata:](v6, "initWithActivityTypeIdentifier:isIndoor:metadata:", a3, v4, MEMORY[0x24BDBD1B8]);
}

+ (id)activityTypeWithHKWorkoutActivityTypeIdentifier:(unint64_t)a3 isIndoor:(BOOL)a4 metadata:(id)a5
{
  _BOOL8 v5;
  id v7;
  FIWorkoutActivityType *v8;

  v5 = a4;
  v7 = a5;
  v8 = -[FIWorkoutActivityType initWithActivityTypeIdentifier:isIndoor:metadata:]([FIWorkoutActivityType alloc], "initWithActivityTypeIdentifier:isIndoor:metadata:", a3, v5, v7);

  return v8;
}

+ (id)activityTypeWithWorkout:(id)a3
{
  id v3;
  FIWorkoutActivityType *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  FIWorkoutActivityType *v10;

  v3 = a3;
  v4 = [FIWorkoutActivityType alloc];
  v5 = objc_msgSend(v3, "workoutActivityType");
  objc_msgSend(v3, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDD31C0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  objc_msgSend(v3, "metadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[FIWorkoutActivityType initWithActivityTypeIdentifier:isIndoor:metadata:](v4, "initWithActivityTypeIdentifier:isIndoor:metadata:", v5, v8, v9);
  return v10;
}

+ (id)effectiveActivityTypeWithWorkout:(id)a3
{
  id v3;
  _BOOL8 v4;
  FIWorkoutActivityType *v5;
  uint64_t v6;
  void *v7;
  FIWorkoutActivityType *v8;

  v3 = a3;
  v4 = +[FIWorkoutActivityType isEffectivelyIndoorForWorkout:](FIWorkoutActivityType, "isEffectivelyIndoorForWorkout:", v3);
  v5 = [FIWorkoutActivityType alloc];
  v6 = objc_msgSend(v3, "workoutActivityType");
  objc_msgSend(v3, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[FIWorkoutActivityType initWithActivityTypeIdentifier:isIndoor:metadata:](v5, "initWithActivityTypeIdentifier:isIndoor:metadata:", v6, v4, v7);
  return v8;
}

+ (BOOL)isEffectivelyIndoorForWorkout:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  __n128 v14;
  uint64_t v15;
  __n128 v16;
  uint64_t v17;
  __n128 v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;

  v3 = a3;
  objc_msgSend(v3, "sourceRevision");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_hasFirstPartyBundleID");

  if ((v6 & 1) == 0)
    goto LABEL_9;
  v7 = objc_msgSend(v3, "workoutActivityType");
  if (v7 != 35 && v7 != 25)
    goto LABEL_9;
  v20 = 0uLL;
  v21 = 0;
  HKNSOperatingSystemVersionFromString();
  v18 = 0uLL;
  v19 = 0;
  objc_msgSend(v3, "sourceRevision");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "operatingSystemVersion");
  }
  else
  {
    v16 = 0uLL;
    v17 = 0;
  }
  FIEffectiveOperatingSystemVersion(&v16, &v18);

  v14 = v18;
  v15 = v19;
  if (HKNSOperatingSystemVersionCompare() == 1)
  {
    v10 = 1;
  }
  else
  {
LABEL_9:
    objc_msgSend(v3, "metadata", *(_OWORD *)&v14, v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD31C0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v12, "BOOLValue");

  }
  return v10;
}

- (FIWorkoutActivityType)initWithActivityTypeIdentifier:(unint64_t)a3 isIndoor:(BOOL)a4
{
  return -[FIWorkoutActivityType initWithActivityTypeIdentifier:isIndoor:metadata:](self, "initWithActivityTypeIdentifier:isIndoor:metadata:", a3, a4, MEMORY[0x24BDBD1B8]);
}

- (FIWorkoutActivityType)initWithActivityTypeIdentifier:(unint64_t)a3 isIndoor:(BOOL)a4 metadata:(id)a5
{
  return -[FIWorkoutActivityType initWithActivityTypeIdentifier:isIndoor:isPartOfMultiSport:metadata:](self, "initWithActivityTypeIdentifier:isIndoor:isPartOfMultiSport:metadata:", a3, a4, 0, a5);
}

- (FIWorkoutActivityType)initWithActivityTypeIdentifier:(unint64_t)a3 isIndoor:(BOOL)a4 metadata:(id)a5 auxiliaryTypeIdentifier:(unint64_t)a6
{
  return -[FIWorkoutActivityType initWithActivityTypeIdentifier:isIndoor:isPartOfMultiSport:metadata:auxiliaryTypeIdentifier:](self, "initWithActivityTypeIdentifier:isIndoor:isPartOfMultiSport:metadata:auxiliaryTypeIdentifier:", a3, a4, 0, a5, a6);
}

- (FIWorkoutActivityType)initWithActivityTypeIdentifier:(unint64_t)a3 isIndoor:(BOOL)a4 isPartOfMultiSport:(BOOL)a5 metadata:(id)a6
{
  uint64_t v6;

  if (a4)
    v6 = 2;
  else
    v6 = 3;
  return -[FIWorkoutActivityType initWithActivityTypeIdentifier:location:isPartOfMultiSport:metadata:](self, "initWithActivityTypeIdentifier:location:isPartOfMultiSport:metadata:", a3, v6, a5, a6);
}

- (FIWorkoutActivityType)initWithActivityTypeIdentifier:(unint64_t)a3 isIndoor:(BOOL)a4 isPartOfMultiSport:(BOOL)a5 metadata:(id)a6 auxiliaryTypeIdentifier:(unint64_t)a7
{
  uint64_t v7;

  if (a4)
    v7 = 2;
  else
    v7 = 3;
  return -[FIWorkoutActivityType initWithActivityTypeIdentifier:location:isPartOfMultiSport:metadata:auxiliaryTypeIdentifier:](self, "initWithActivityTypeIdentifier:location:isPartOfMultiSport:metadata:auxiliaryTypeIdentifier:", a3, v7, a5, a6, a7);
}

- (FIWorkoutActivityType)initWithActivityTypeIdentifier:(unint64_t)a3 location:(int64_t)a4 isPartOfMultiSport:(BOOL)a5 metadata:(id)a6
{
  _BOOL8 v6;
  unint64_t v10;
  id v11;
  FIWorkoutActivityType *v12;

  v6 = a5;
  v10 = *MEMORY[0x24BDD4500];
  v11 = a6;
  if ((_os_feature_enabled_impl() & 1) == 0 && !FIActivityTypeIsCalorimetryOptimized(a3))
  {
    v10 = a3;
    a3 = 3000;
  }
  v12 = -[FIWorkoutActivityType initWithActivityTypeIdentifier:location:isPartOfMultiSport:metadata:auxiliaryTypeIdentifier:](self, "initWithActivityTypeIdentifier:location:isPartOfMultiSport:metadata:auxiliaryTypeIdentifier:", a3, a4, v6, v11, v10);

  return v12;
}

- (FIWorkoutActivityType)initWithActivityTypeIdentifier:(unint64_t)a3 location:(int64_t)a4 isPartOfMultiSport:(BOOL)a5 metadata:(id)a6 auxiliaryTypeIdentifier:(unint64_t)a7
{
  id v12;
  FIWorkoutActivityType *v13;
  FIWorkoutActivityType *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  NSDictionary *v19;
  NSDictionary *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  void *v26;
  NSDictionary *metadata;
  objc_super v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[7];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v12 = a6;
  v29.receiver = self;
  v29.super_class = (Class)FIWorkoutActivityType;
  v13 = -[FIWorkoutActivityType init](&v29, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_identifier = a3;
    v13->_auxiliaryTypeIdentifier = a7;
    v13->_isPartOfMultiSport = a5;
    v13->_location = a4;
    v13->_isIndoor = a4 == 2;
    if (v12 && objc_msgSend(v12, "count"))
    {
      v15 = *MEMORY[0x24BDD3200];
      v34[0] = *MEMORY[0x24BDD31D0];
      v34[1] = v15;
      v16 = *MEMORY[0x24BDD3220];
      v34[2] = *MEMORY[0x24BDD3208];
      v34[3] = v16;
      v34[4] = CFSTR("BackdatedStartDate");
      v34[5] = CFSTR("PredictionSessionUUID");
      v34[6] = CFSTR("_HKPrivateSeymourMediaType");
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 7);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v18 = v12;
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v19 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v20 = (NSDictionary *)v17;
      v21 = -[NSDictionary countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v31 != v23)
              objc_enumerationMutation(v20);
            v25 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
            objc_msgSend(v18, "objectForKeyedSubscript:", v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if (v26)
              -[NSDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v26, v25);

          }
          v22 = -[NSDictionary countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        }
        while (v22);
      }

      metadata = v14->_metadata;
      v14->_metadata = v19;

    }
    else
    {
      v20 = v14->_metadata;
      v14->_metadata = (NSDictionary *)MEMORY[0x24BDBD1B8];
    }

  }
  return v14;
}

+ (id)activityTypeFromUniqueIdentifier:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  FIWorkoutActivityType *v28;
  char v29;
  char v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  void *v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = *MEMORY[0x24BDD4500];
  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR(";,"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsSeparatedByCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
  if (v8)
  {
    v9 = v8;
    v39 = v4;
    v40 = (uint64_t)v3;
    v43 = 0;
    v44 = 0;
    v41 = 0;
    v42 = 0;
    v10 = *(_QWORD *)v46;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v46 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "componentsSeparatedByString:", CFSTR("="), v39);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "count") != 2)
        {
          _HKInitializeLogging();
          v21 = *MEMORY[0x24BDD3078];
          v3 = (id)v40;
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3078], OS_LOG_TYPE_ERROR))
            +[FIWorkoutActivityType activityTypeFromUniqueIdentifier:].cold.2(v40, v21, v22, v23, v24, v25, v26, v27);

          v28 = 0;
          v20 = v7;
          goto LABEL_38;
        }
        objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "isEqualToString:", CFSTR("type")))
          v42 = objc_msgSend(v14, "integerValue");
        if (objc_msgSend(v13, "isEqualToString:", CFSTR("isIndoor")))
          LOBYTE(v44) = objc_msgSend(v14, "BOOLValue");
        if (objc_msgSend(v13, "isEqualToString:", CFSTR("isOther")))
          v41 = objc_msgSend(v14, "BOOLValue");
        if (objc_msgSend(v13, "isEqualToString:", CFSTR("swimmingLocationType")))
          v43 = objc_msgSend(v14, "integerValue");
        if (objc_msgSend(v13, "isEqualToString:", CFSTR("isPartOfMultiSport")))
          BYTE4(v44) = objc_msgSend(v14, "BOOLValue");

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
      if (v9)
        continue;
      break;
    }

    v15 = _os_feature_enabled_impl();
    v4 = v39;
    if ((v41 & 1) != 0)
      v16 = v42;
    else
      v16 = v39;
    v17 = 3000;
    if ((v41 & 1) == 0)
      v17 = v42;
    if (v15)
    {
      v18 = v42;
    }
    else
    {
      v4 = v16;
      v18 = v17;
    }
    if (v43)
    {
      v49 = *MEMORY[0x24BDD3200];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v43);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v19;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v20 = 0;
    }
    v3 = (id)v40;
    v29 = v44;
    v30 = BYTE4(v44);
  }
  else
  {

    _os_feature_enabled_impl();
    v18 = 0;
    v29 = 0;
    v30 = 0;
    v20 = 0;
  }
  if ((_HKWorkoutActivityTypeIsValid() & 1) != 0)
  {
    v28 = -[FIWorkoutActivityType initWithActivityTypeIdentifier:isIndoor:isPartOfMultiSport:metadata:auxiliaryTypeIdentifier:]([FIWorkoutActivityType alloc], "initWithActivityTypeIdentifier:isIndoor:isPartOfMultiSport:metadata:auxiliaryTypeIdentifier:", v18, v29 & 1, v30 & 1, v20, v4);
  }
  else
  {
    _HKInitializeLogging();
    v31 = *MEMORY[0x24BDD3078];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3078], OS_LOG_TYPE_ERROR))
      +[FIWorkoutActivityType activityTypeFromUniqueIdentifier:].cold.1((uint64_t)v3, v31, v32, v33, v34, v35, v36, v37);
    v28 = 0;
  }
LABEL_38:

  return v28;
}

- (void)encodeWithCoder:(id)a3
{
  int v4;
  unint64_t v5;
  void *v6;
  void *v7;
  int v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = _os_feature_enabled_impl();
  v5 = -[FIWorkoutActivityType identifier](self, "identifier");
  if (v4)
  {
    objc_msgSend(v12, "encodeInteger:forKey:", v5, CFSTR("FIUIWorkoutActivityTypeTrueIdentifier"));
    +[FIWorkoutActivityType otherWorkoutActivityTypes](FIWorkoutActivityType, "otherWorkoutActivityTypes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[FIWorkoutActivityType identifier](self, "identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "containsObject:", v7);

    if (!v8)
    {
      objc_msgSend(v12, "encodeInteger:forKey:", -[FIWorkoutActivityType identifier](self, "identifier"), CFSTR("FIUIWorkoutActivityTypeIdentifier"));
      v10 = *MEMORY[0x24BDD4500];
      goto LABEL_7;
    }
    objc_msgSend(v12, "encodeInteger:forKey:", 3000, CFSTR("FIUIWorkoutActivityTypeIdentifier"));
    v9 = -[FIWorkoutActivityType identifier](self, "identifier");
  }
  else
  {
    objc_msgSend(v12, "encodeInteger:forKey:", v5, CFSTR("FIUIWorkoutActivityTypeIdentifier"));
    v9 = -[FIWorkoutActivityType auxiliaryTypeIdentifier](self, "auxiliaryTypeIdentifier");
  }
  v10 = v9;
LABEL_7:
  objc_msgSend(v12, "encodeInteger:forKey:", v10, CFSTR("NLSessionAuxiliaryActivityTypeIdentifier"));
  objc_msgSend(v12, "encodeBool:forKey:", -[FIWorkoutActivityType isIndoor](self, "isIndoor"), CFSTR("FIUIWorkoutActivityTypeIsIndoor"));
  -[FIWorkoutActivityType metadata](self, "metadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v11, CFSTR("FIUIWorkoutActivityTypeMetadata"));

  objc_msgSend(v12, "encodeBool:forKey:", -[FIWorkoutActivityType isPartOfMultiSport](self, "isPartOfMultiSport"), CFSTR("FIUIWorkoutActivityTypePartOfMultisport"));
  objc_msgSend(v12, "encodeInteger:forKey:", -[FIWorkoutActivityType location](self, "location"), CFSTR("FIUIWorkoutActivityTypeLocation"));

}

- (FIWorkoutActivityType)initWithCoder:(id)a3
{
  id v4;
  FIWorkoutActivityType *v5;
  unint64_t v6;
  unint64_t auxiliaryTypeIdentifier;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSDictionary *metadata;
  uint64_t v13;
  uint64_t v14;
  objc_super v16;
  _QWORD v17[6];

  v17[5] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FIWorkoutActivityType;
  v5 = -[FIWorkoutActivityType init](&v16, sel_init);
  if (!v5)
    goto LABEL_12;
  v5->_identifier = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("FIUIWorkoutActivityTypeIdentifier"));
  v5->_isIndoor = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("FIUIWorkoutActivityTypeIsIndoor"));
  v5->_auxiliaryTypeIdentifier = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("NLSessionAuxiliaryActivityTypeIdentifier"));
  if (_os_feature_enabled_impl())
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("FIUIWorkoutActivityTypeTrueIdentifier")))
    {
      v5->_identifier = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("FIUIWorkoutActivityTypeTrueIdentifier"));
      v6 = *MEMORY[0x24BDD4500];
    }
    else
    {
      auxiliaryTypeIdentifier = v5->_auxiliaryTypeIdentifier;
      v6 = *MEMORY[0x24BDD4500];
      if (auxiliaryTypeIdentifier == *MEMORY[0x24BDD4500])
        goto LABEL_8;
      v5->_identifier = auxiliaryTypeIdentifier;
    }
    v5->_auxiliaryTypeIdentifier = v6;
  }
LABEL_8:
  v8 = (void *)MEMORY[0x24BDBCF20];
  v17[0] = objc_opt_class();
  v17[1] = objc_opt_class();
  v17[2] = objc_opt_class();
  v17[3] = objc_opt_class();
  v17[4] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("FIUIWorkoutActivityTypeMetadata"));
  v11 = objc_claimAutoreleasedReturnValue();
  metadata = v5->_metadata;
  v5->_metadata = (NSDictionary *)v11;

  v5->_isPartOfMultiSport = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("FIUIWorkoutActivityTypePartOfMultisport"));
  v13 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("FIUIWorkoutActivityTypeLocation"));
  v5->_location = v13;
  if (!v13)
  {
    v14 = 2;
    if (!v5->_isIndoor)
      v14 = 3;
    v5->_location = v14;
  }
LABEL_12:

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)swimmingLocationType
{
  void *v2;
  void *v3;
  int64_t v4;

  -[FIWorkoutActivityType metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BDD3200]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (HKQuantity)lapLength
{
  void *v2;
  void *v3;

  -[FIWorkoutActivityType metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BDD31D0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKQuantity *)v3;
}

- (BOOL)isIndoor
{
  return self->_isIndoor;
}

- (BOOL)isCategorizedOtherWorkout
{
  unint64_t v3;

  v3 = -[FIWorkoutActivityType identifier](self, "identifier");
  return v3 != -[FIWorkoutActivityType effectiveTypeIdentifier](self, "effectiveTypeIdentifier");
}

- (unint64_t)effectiveTypeIdentifier
{
  unint64_t identifier;
  unint64_t result;

  identifier = self->_identifier;
  if (identifier != 3000)
    return identifier;
  result = self->_auxiliaryTypeIdentifier;
  if (result == *MEMORY[0x24BDD4500])
    return identifier;
  return result;
}

- (id)localizationKey
{
  return FILocalizationKeyForHKWorkoutActivityTypeIsLocationAgnosticAndIsIndoor(-[FIWorkoutActivityType effectiveTypeIdentifier](self, "effectiveTypeIdentifier"), 0, self->_isIndoor);
}

- (id)localizedName
{
  _BOOL4 v3;
  uint64_t v4;

  v3 = -[FIWorkoutActivityType requiresDisambiguation](self, "requiresDisambiguation");
  v4 = -[FIWorkoutActivityType effectiveTypeIdentifier](self, "effectiveTypeIdentifier");
  if (v3)
    FILocalizedNameForIndoorAgnosticActivityType();
  else
    FILocalizedNameForActivityType(v4, -[FIWorkoutActivityType swimmingLocationType](self, "swimmingLocationType"), self->_isIndoor);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)localizedNamePlural
{
  return FILocalizedNameForActivityTypePlural(-[FIWorkoutActivityType effectiveTypeIdentifier](self, "effectiveTypeIdentifier"), -[FIWorkoutActivityType swimmingLocationType](self, "swimmingLocationType"), self->_isIndoor);
}

- (id)localizedNameComponents
{
  void *v3;
  unint64_t v4;

  -[NSDictionary objectForKeyedSubscript:](self->_metadata, "objectForKeyedSubscript:", *MEMORY[0x24BDD3200]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return FILocalizedActivityNameComponentsWithFormatting(-[FIWorkoutActivityType effectiveTypeIdentifier](self, "effectiveTypeIdentifier"), v4, self->_isIndoor, -[FIWorkoutActivityType isCategorizedOtherWorkout](self, "isCategorizedOtherWorkout"));
}

- (id)activityTypeByAddingLapLength:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  FIWorkoutActivityType *v8;
  void *v9;
  void *v10;
  void *v11;

  if (a3 > 2.22044605e-16 && -[FIWorkoutActivityType identifier](self, "identifier") == 46)
  {
    -[FIWorkoutActivityType metadata](self, "metadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[FIWorkoutActivityType metadata](self, "metadata");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v6, "mutableCopy");

    }
    else
    {
      v7 = (void *)objc_opt_new();
    }

    v9 = (void *)MEMORY[0x24BDD3E50];
    objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "quantityWithUnit:doubleValue:", v10, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v11, *MEMORY[0x24BDD31D0]);

    v8 = -[FIWorkoutActivityType initWithActivityTypeIdentifier:isIndoor:isPartOfMultiSport:metadata:]([FIWorkoutActivityType alloc], "initWithActivityTypeIdentifier:isIndoor:isPartOfMultiSport:metadata:", -[FIWorkoutActivityType identifier](self, "identifier"), -[FIWorkoutActivityType isIndoor](self, "isIndoor"), -[FIWorkoutActivityType isPartOfMultiSport](self, "isPartOfMultiSport"), v7);
  }
  else
  {
    v8 = self;
  }
  return v8;
}

- (BOOL)isWaterLockActivity
{
  return -[FIWorkoutActivityType effectiveTypeIdentifier](self, "effectiveTypeIdentifier") == 46
      || -[FIWorkoutActivityType effectiveTypeIdentifier](self, "effectiveTypeIdentifier") == 45
      || -[FIWorkoutActivityType effectiveTypeIdentifier](self, "effectiveTypeIdentifier") == 84
      || -[FIWorkoutActivityType effectiveTypeIdentifier](self, "effectiveTypeIdentifier") == 53
      || -[FIWorkoutActivityType effectiveTypeIdentifier](self, "effectiveTypeIdentifier") == 54
      || -[FIWorkoutActivityType effectiveTypeIdentifier](self, "effectiveTypeIdentifier") == 55;
}

+ (id)defaultActivityTypesWithIsWheelchairUser:(BOOL)a3 isSwimmingSupported:(BOOL)a4 activityMoveMode:(int64_t)a5
{
  void *v5;

  if (a5 == 2)
  {
    FIFitnessJuniorDefaultActivityTypes();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a5 == 1)
  {
    FIStandardFitnessDefaultActivityTypes(a3, a4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)gymKitCapableActivityTypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[7];

  v11[6] = *MEMORY[0x24BDAC8D0];
  +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:", 52, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:", 37, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v3;
  +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:", 13, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v4;
  +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:", 44, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v5;
  +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:", 35, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v6;
  +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:", 16, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[5] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 6);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)gymKitCapableActivityTypes_activityTypes;
  gymKitCapableActivityTypes_activityTypes = v8;

  return (id)gymKitCapableActivityTypes_activityTypes;
}

+ (id)optimizedActivityTypesWithIsWheelchairUser:(BOOL)a3 isSwimmingSupported:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t *v5;
  _QWORD block[4];
  BOOL v8;

  v4 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __88__FIWorkoutActivityType_optimizedActivityTypesWithIsWheelchairUser_isSwimmingSupported___block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  v8 = a4;
  if (optimizedActivityTypesWithIsWheelchairUser_isSwimmingSupported__onceToken != -1)
    dispatch_once(&optimizedActivityTypesWithIsWheelchairUser_isSwimmingSupported__onceToken, block);
  v5 = &optimizedActivityTypesWithIsWheelchairUser_isSwimmingSupported__activityTypes;
  if (v4)
    v5 = &optimizedActivityTypesWithIsWheelchairUser_isSwimmingSupported__wheelchairActivityTypes;
  return (id)*v5;
}

void __88__FIWorkoutActivityType_optimizedActivityTypesWithIsWheelchairUser_isSwimmingSupported___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v40[23];

  v40[21] = *MEMORY[0x24BDAC8D0];
  +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:", 52, 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v38;
  +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:", 37, 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v37;
  +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:", 13, 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v40[2] = v36;
  +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:", 52, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v40[3] = v35;
  +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:", 37, 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v40[4] = v34;
  +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:", 13, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v40[5] = v33;
  +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:", 16, 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v40[6] = v32;
  +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:", 35, 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v40[7] = v31;
  +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:", 44, 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v40[8] = v30;
  +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:", 63, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v40[9] = v29;
  +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:", 24, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v40[10] = v28;
  +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:", 57, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v40[11] = v27;
  +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:", 20, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v40[12] = v26;
  +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:", 77, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v40[13] = v1;
  +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:", 80, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v40[14] = v2;
  +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:", 59, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v40[15] = v3;
  +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:", 66, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v40[16] = v4;
  +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:", 72, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v40[17] = v5;
  +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:", 65, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v40[18] = v6;
  +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:", 82, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v40[19] = v7;
  +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:", 3000, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v40[20] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 21);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)optimizedActivityTypesWithIsWheelchairUser_isSwimmingSupported__activityTypes;
  optimizedActivityTypesWithIsWheelchairUser_isSwimmingSupported__activityTypes = v9;

  if (_os_feature_enabled_impl())
  {
    v11 = (void *)optimizedActivityTypesWithIsWheelchairUser_isSwimmingSupported__activityTypes;
    +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:", 35, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "arrayByAddingObject:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)optimizedActivityTypesWithIsWheelchairUser_isSwimmingSupported__activityTypes;
    optimizedActivityTypesWithIsWheelchairUser_isSwimmingSupported__activityTypes = v13;

  }
  +[FIWorkoutActivityType wheelchairActivityTypes](FIWorkoutActivityType, "wheelchairActivityTypes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "arrayByAddingObjectsFromArray:", optimizedActivityTypesWithIsWheelchairUser_isSwimmingSupported__activityTypes);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)optimizedActivityTypesWithIsWheelchairUser_isSwimmingSupported__wheelchairActivityTypes;
  optimizedActivityTypesWithIsWheelchairUser_isSwimmingSupported__wheelchairActivityTypes = v16;

  if (*(_BYTE *)(a1 + 32))
  {
    v18 = (void *)optimizedActivityTypesWithIsWheelchairUser_isSwimmingSupported__activityTypes;
    +[FIWorkoutActivityType swimmingOptimizedActivityTypes](FIWorkoutActivityType, "swimmingOptimizedActivityTypes");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "arrayByAddingObjectsFromArray:", v19);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)optimizedActivityTypesWithIsWheelchairUser_isSwimmingSupported__activityTypes;
    optimizedActivityTypesWithIsWheelchairUser_isSwimmingSupported__activityTypes = v20;

    v22 = (void *)optimizedActivityTypesWithIsWheelchairUser_isSwimmingSupported__wheelchairActivityTypes;
    +[FIWorkoutActivityType swimmingOptimizedActivityTypes](FIWorkoutActivityType, "swimmingOptimizedActivityTypes");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "arrayByAddingObjectsFromArray:", v23);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)optimizedActivityTypesWithIsWheelchairUser_isSwimmingSupported__wheelchairActivityTypes;
    optimizedActivityTypesWithIsWheelchairUser_isSwimmingSupported__wheelchairActivityTypes = v24;

  }
}

+ (id)otherWorkoutActivityTypes
{
  void *v2;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:", &unk_24CC5A360);
  objc_msgSend(v2, "addObjectsFromArray:", &unk_24CC5A378);
  objc_msgSend(v2, "addObjectsFromArray:", &unk_24CC5A390);
  if (MGGetBoolAnswer())
    objc_msgSend(v2, "addObjectsFromArray:", &unk_24CC5A3A8);
  return v2;
}

+ (id)nonOptimizedActivityTypes
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(a1, "otherWorkoutActivityTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v8), "integerValue");
        +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:", v9, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v10);

        if (+[FIWorkoutActivityType shouldDisambiguateOnLocationType:](FIWorkoutActivityType, "shouldDisambiguateOnLocationType:", v9))
        {
          +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:", v9, 1);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v11);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

+ (id)unsupportedActivityTypesWithIsWheelchairUser:(BOOL)a3 isSwimmingSupported:(BOOL)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  +[FIWorkoutActivityType deprecatedActivityTypes](FIWorkoutActivityType, "deprecatedActivityTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a4)
  {
    +[FIWorkoutActivityType swimmingOptimizedActivityTypes](FIWorkoutActivityType, "swimmingOptimizedActivityTypes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[FIWorkoutActivityType swimmingOtherActivityTypes](FIWorkoutActivityType, "swimmingOtherActivityTypes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v10;
  }
  if (!a3)
  {
    +[FIWorkoutActivityType wheelchairActivityTypes](FIWorkoutActivityType, "wheelchairActivityTypes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v12;
  }
  +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:metadata:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:metadata:", 84, 0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayByAddingObject:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)wheelchairActivityTypes
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:", 70, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:", 71, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)swimmingOptimizedActivityTypes
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v11 = *MEMORY[0x24BDD3200];
  v2 = v11;
  v12 = &unk_24CC592F0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:metadata:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:metadata:", 46, 0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  v9 = v2;
  v10 = &unk_24CC59308;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:metadata:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:metadata:", 46, 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)swimmingOtherActivityTypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x24BDAC8D0];
  +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:metadata:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:metadata:", 53, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:metadata:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:metadata:", 84, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:metadata:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:metadata:", 54, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v4;
  +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:metadata:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:metadata:", 55, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[3] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)deprecatedActivityTypes
{
  FIWorkoutActivityType *v2;
  FIWorkoutActivityType *v3;
  void *v4;
  void *v5;
  void *v6;
  FIWorkoutActivityType *v7;
  FIWorkoutActivityType *v8;
  uint64_t v9;
  uint64_t v11;
  void *v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v2 = [FIWorkoutActivityType alloc];
  v3 = -[FIWorkoutActivityType initWithActivityTypeIdentifier:isIndoor:metadata:auxiliaryTypeIdentifier:](v2, "initWithActivityTypeIdentifier:isIndoor:metadata:auxiliaryTypeIdentifier:", 14, 0, MEMORY[0x24BDBD1B8], *MEMORY[0x24BDD4500]);
  v13[0] = v3;
  v11 = *MEMORY[0x24BDD3200];
  v12 = &unk_24CC59320;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:metadata:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:metadata:", 46, 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    v7 = [FIWorkoutActivityType alloc];
    v8 = -[FIWorkoutActivityType initWithActivityTypeIdentifier:isIndoor:metadata:auxiliaryTypeIdentifier:](v7, "initWithActivityTypeIdentifier:isIndoor:metadata:auxiliaryTypeIdentifier:", 3000, 0, MEMORY[0x24BDBD1B8], 14);
    objc_msgSend(v6, "arrayByAddingObject:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v9;
  }
  return v6;
}

- (NSString)legacyUniqueIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD16A8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[FIWorkoutActivityType effectiveTypeIdentifier](self, "effectiveTypeIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[FIWorkoutActivityType isCategorizedOtherWorkout](self, "isCategorizedOtherWorkout"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[FIWorkoutActivityType isIndoor](self, "isIndoor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[FIWorkoutActivityType swimmingLocationType](self, "swimmingLocationType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@=%@;%@=%@;%@=%@,%@=%@"),
    CFSTR("type"),
    v4,
    CFSTR("isOther"),
    v5,
    CFSTR("isIndoor"),
    v6,
    CFSTR("swimmingLocationType"),
    v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[FIWorkoutActivityType isPartOfMultiSport](self, "isPartOfMultiSport"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(";%@=YES"), CFSTR("isPartOfMultiSport"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendString:", v9);

  }
  return (NSString *)v8;
}

- (NSString)uniqueIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    v3 = (void *)MEMORY[0x24BDD16A8];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[FIWorkoutActivityType effectiveTypeIdentifier](self, "effectiveTypeIdentifier"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[FIWorkoutActivityType isIndoor](self, "isIndoor"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[FIWorkoutActivityType swimmingLocationType](self, "swimmingLocationType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@=%@;%@=%@;%@=%@"),
      CFSTR("type"),
      v4,
      CFSTR("isIndoor"),
      v5,
      CFSTR("swimmingLocationType"),
      v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[FIWorkoutActivityType isPartOfMultiSport](self, "isPartOfMultiSport"))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(";%@=YES"), CFSTR("isPartOfMultiSport"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "appendString:", v8);

    }
  }
  else
  {
    -[FIWorkoutActivityType legacyUniqueIdentifier](self, "legacyUniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  int64_t v4;
  unint64_t v5;

  v3 = self->_identifier + 31;
  if ((_os_feature_enabled_impl() & 1) == 0)
    v3 = self->_auxiliaryTypeIdentifier - v3 + 32 * v3;
  v4 = 31 * (-[FIWorkoutActivityType swimmingLocationType](self, "swimmingLocationType") - v3 + 32 * v3);
  v5 = v4 + -[FIWorkoutActivityType isPartOfMultiSport](self, "isPartOfMultiSport");
  if (+[FIWorkoutActivityType shouldDisambiguateOnLocationType:](FIWorkoutActivityType, "shouldDisambiguateOnLocationType:", -[FIWorkoutActivityType effectiveTypeIdentifier](self, "effectiveTypeIdentifier")))
  {
    return 31 * v5 + -[FIWorkoutActivityType isIndoor](self, "isIndoor");
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  int v10;
  int v11;
  int v13;

  v4 = a3;
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    v5 = 0;
    if (!v4)
      goto LABEL_12;
  }
  else
  {
    v6 = objc_msgSend(v4, "auxiliaryTypeIdentifier");
    v5 = v6 != -[FIWorkoutActivityType auxiliaryTypeIdentifier](self, "auxiliaryTypeIdentifier");
    if (!v4)
    {
LABEL_12:
      LOBYTE(v11) = 0;
      goto LABEL_13;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_12;
  v7 = objc_msgSend(v4, "identifier");
  if (v7 != -[FIWorkoutActivityType identifier](self, "identifier") || v5)
    goto LABEL_12;
  v9 = objc_msgSend(v4, "swimmingLocationType");
  if (v9 != -[FIWorkoutActivityType swimmingLocationType](self, "swimmingLocationType"))
    goto LABEL_12;
  v10 = objc_msgSend(v4, "isPartOfMultiSport");
  if (v10 != -[FIWorkoutActivityType isPartOfMultiSport](self, "isPartOfMultiSport"))
    goto LABEL_12;
  if (+[FIWorkoutActivityType shouldDisambiguateOnLocationType:](FIWorkoutActivityType, "shouldDisambiguateOnLocationType:", objc_msgSend(v4, "effectiveTypeIdentifier"))|| +[FIWorkoutActivityType shouldDisambiguateOnLocationType:](FIWorkoutActivityType, "shouldDisambiguateOnLocationType:", -[FIWorkoutActivityType effectiveTypeIdentifier](self, "effectiveTypeIdentifier")))
  {
    v13 = objc_msgSend(v4, "isIndoor");
    v11 = v13 ^ -[FIWorkoutActivityType isIndoor](self, "isIndoor") ^ 1;
  }
  else
  {
    LOBYTE(v11) = 1;
  }
LABEL_13:

  return v11;
}

+ (BOOL)shouldDisambiguateOnLocationType:(unint64_t)a3
{
  void *v4;
  void *v5;

  if (shouldDisambiguateOnLocationType__onceToken != -1)
    dispatch_once(&shouldDisambiguateOnLocationType__onceToken, &__block_literal_global_6);
  v4 = (void *)shouldDisambiguateOnLocationType__indoorOutdoorActivityTypes;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "containsObject:", v5);

  return (char)v4;
}

void __58__FIWorkoutActivityType_shouldDisambiguateOnLocationType___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)shouldDisambiguateOnLocationType__indoorOutdoorActivityTypes;
  shouldDisambiguateOnLocationType__indoorOutdoorActivityTypes = (uint64_t)&unk_24CC5A3C0;

  if (_os_feature_enabled_impl())
  {
    objc_msgSend((id)shouldDisambiguateOnLocationType__indoorOutdoorActivityTypes, "arrayByAddingObjectsFromArray:", &unk_24CC5A3D8);
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)shouldDisambiguateOnLocationType__indoorOutdoorActivityTypes;
    shouldDisambiguateOnLocationType__indoorOutdoorActivityTypes = v1;

  }
}

- (BOOL)requiresDisambiguation
{
  return -[FIWorkoutActivityType requiresLocationDisambiguation](self, "requiresLocationDisambiguation")
      || -[FIWorkoutActivityType requiresSwimmingLocationDisambiguation](self, "requiresSwimmingLocationDisambiguation");
}

- (BOOL)requiresLocationDisambiguation
{
  _BOOL4 v3;

  v3 = +[FIWorkoutActivityType shouldDisambiguateOnLocationType:](FIWorkoutActivityType, "shouldDisambiguateOnLocationType:", -[FIWorkoutActivityType effectiveTypeIdentifier](self, "effectiveTypeIdentifier"));
  if (v3)
    LOBYTE(v3) = -[FIWorkoutActivityType location](self, "location") == 1;
  return v3;
}

- (BOOL)requiresSwimmingLocationDisambiguation
{
  return -[FIWorkoutActivityType identifier](self, "identifier") == 46
      && -[FIWorkoutActivityType swimmingLocationType](self, "swimmingLocationType") == 0;
}

- (id)description
{
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  uint64_t v11;
  const __CFString *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;

  v3 = _os_feature_enabled_impl();
  v4 = (void *)MEMORY[0x24BDD17C8];
  -[FIWorkoutActivityType localizedName](self, "localizedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    _HKWorkoutSessionLocationTypeName();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v8 = CFSTR("YES");
    if (!self->_isPartOfMultiSport)
      v8 = CFSTR("NO");
    objc_msgSend(v4, "stringWithFormat:", CFSTR("FIWorkoutActivityType(type=%@, location=%@, partOfMultisport=%@, metadata=%@)"), v5, v6, v8, self->_metadata, v15, v16);
  }
  else
  {
    v9 = &stru_24CC50B10;
    if (self->_identifier == 3000 && self->_auxiliaryTypeIdentifier != *MEMORY[0x24BDD4500])
      v9 = CFSTR(" (Other)");
    if (self->_isIndoor)
      v10 = CFSTR("YES");
    else
      v10 = CFSTR("NO");
    _HKWorkoutSessionLocationTypeName();
    v11 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v11;
    if (self->_isPartOfMultiSport)
      v12 = CFSTR("YES");
    else
      v12 = CFSTR("NO");
    objc_msgSend(v4, "stringWithFormat:", CFSTR("FIWorkoutActivityType(type=%@%@, isIndoor=%@, location=%@, partOfMultisport=%@, metadata=%@)"), v5, v9, v10, v11, v12, self->_metadata);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)possibleActivityTypesForIdentifier:(unint64_t)a3 locationType:(int64_t)a4 swimmingLocationType:(int64_t)a5 wheelchairUser:(BOOL)a6
{
  _BOOL8 v6;
  int IsValid;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v19;
  uint64_t i;
  void *v21;
  _BOOL4 v22;
  int v23;
  _BOOL4 v24;
  unint64_t v26;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v6 = a6;
  v34 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  v26 = a3;
  IsValid = _HKWorkoutActivityTypeIsValid();
  objc_msgSend(a1, "optimizedActivityTypesWithIsWheelchairUser:isSwimmingSupported:", v6, FIDeviceSupportsSwimming());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  objc_msgSend(a1, "nonOptimizedActivityTypes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObjectsFromArray:", v13);

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v14 = v12;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v30;
    v19 = a3 != 46 || a5 == 0;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v30 != v17)
          objc_enumerationMutation(v14);
        v21 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        if (IsValid)
          v22 = objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "effectiveTypeIdentifier") == v26;
        else
          v22 = 1;
        if (a4 == 1 || (((a4 != 2) ^ objc_msgSend(v21, "isIndoor")) & 1) != 0)
        {
          v23 = 1;
          if (v19)
            goto LABEL_17;
        }
        else
        {
          v23 = !+[FIWorkoutActivityType shouldDisambiguateOnLocationType:](FIWorkoutActivityType, "shouldDisambiguateOnLocationType:", objc_msgSend(v21, "effectiveTypeIdentifier"));
          if (v19)
          {
LABEL_17:
            v24 = 1;
            goto LABEL_20;
          }
        }
        v24 = objc_msgSend(v21, "swimmingLocationType") == a5;
LABEL_20:
        if ((v22 & v23 & v24) == 1)
          objc_msgSend(v28, "addObject:", v21);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v16);
  }

  return v28;
}

+ (unint64_t)mapWheelchairUserActivityType:(unint64_t)a3 isWheelchairUser:(BOOL)a4
{
  unint64_t result;

  result = a3;
  if (a4)
  {
    if (a3 == 37)
    {
      return 71;
    }
    else if (a3 == 52)
    {
      return 70;
    }
  }
  return result;
}

- (BOOL)hasLocationTypePool
{
  return -[FIWorkoutActivityType swimmingLocationType](self, "swimmingLocationType") == 1;
}

- (BOOL)isPoolSwimming
{
  return self->_identifier == 46 && -[FIWorkoutActivityType hasLocationTypePool](self, "hasLocationTypePool");
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (unint64_t)auxiliaryTypeIdentifier
{
  return self->_auxiliaryTypeIdentifier;
}

- (int64_t)location
{
  return self->_location;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (BOOL)isPartOfMultiSport
{
  return self->_isPartOfMultiSport;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
}

- (id)activityTypePlistKey
{
  return FIGeneralizedActivityTypeKey(-[FIWorkoutActivityType identifier](self, "identifier"), -[FIWorkoutActivityType isIndoor](self, "isIndoor"), -[FIWorkoutActivityType swimmingLocationType](self, "swimmingLocationType"));
}

- (BOOL)supportsSafetyCheckInPrompt
{
  unint64_t v3;
  BOOL v4;

  v3 = -[FIWorkoutActivityType effectiveTypeIdentifier](self, "effectiveTypeIdentifier");
  v4 = v3 - 9 > 0x3E || ((1 << (v3 - 9)) & 0x6418083874429511) == 0;
  if (!v4 || v3 == 82 || v3 == 74)
    return !-[FIWorkoutActivityType isIndoor](self, "isIndoor");
  else
    return 0;
}

+ (void)activityTypeFromUniqueIdentifier:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21168F000, a2, a3, "Unable to parse property and value from uniqueIdentifier=%@. Invalid activity identifier.", a5, a6, a7, a8, 2u);
}

+ (void)activityTypeFromUniqueIdentifier:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21168F000, a2, a3, "Unable to parse property and value from uniqueIdentifier=%@", a5, a6, a7, a8, 2u);
}

@end
