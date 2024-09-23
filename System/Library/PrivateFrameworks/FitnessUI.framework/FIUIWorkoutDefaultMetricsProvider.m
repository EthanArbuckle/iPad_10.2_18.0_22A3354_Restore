@implementation FIUIWorkoutDefaultMetricsProvider

- (FIUIWorkoutDefaultMetricsProvider)initWithMetricsVersion:(int64_t)a3 activityType:(id)a4 activityMoveMode:(int64_t)a5 deviceSupportsElevationMetrics:(BOOL)a6 deviceSupportsGroundElevationMetrics:(BOOL)a7
{
  id v13;
  FIUIWorkoutDefaultMetricsProvider *v14;
  FIUIWorkoutDefaultMetricsProvider *v15;
  uint64_t v16;
  NSArray *defaultEnabledMetrics;
  uint64_t v18;
  NSArray *defaultSecondPlatterMetrics;
  void *v20;
  void *v21;
  objc_super v23;

  v13 = a4;
  v23.receiver = self;
  v23.super_class = (Class)FIUIWorkoutDefaultMetricsProvider;
  v14 = -[FIUIWorkoutDefaultMetricsProvider init](&v23, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_metricsVersion = a3;
    objc_storeStrong((id *)&v14->_activityType, a4);
    v15->_activityMoveMode = a5;
    v15->_supportsElevationMetrics = a6;
    v15->_supportsGroundElevationMetrics = a7;
    -[FIUIWorkoutDefaultMetricsProvider _defaultEnabledMetricsForActivityType:metricsVersion:](v15, "_defaultEnabledMetricsForActivityType:metricsVersion:", v15->_activityType, v15->_metricsVersion);
    v16 = objc_claimAutoreleasedReturnValue();
    defaultEnabledMetrics = v15->_defaultEnabledMetrics;
    v15->_defaultEnabledMetrics = (NSArray *)v16;

    -[FIUIWorkoutDefaultMetricsProvider _defaultEnabledSecondPlatterMetricsForActivityType:metricsVersion:](v15, "_defaultEnabledSecondPlatterMetricsForActivityType:metricsVersion:", v15->_activityType, v15->_metricsVersion);
    v18 = objc_claimAutoreleasedReturnValue();
    defaultSecondPlatterMetrics = v15->_defaultSecondPlatterMetrics;
    v15->_defaultSecondPlatterMetrics = (NSArray *)v18;

    -[FIUIWorkoutDefaultMetricsProvider _updateSupportedMetrics](v15, "_updateSupportedMetrics");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[FIUIBluetoothSensorLookup didUpdateBTSensorSeenStatus](FIUIBluetoothSensorLookup, "didUpdateBTSensorSeenStatus");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:selector:name:object:", v15, sel__didUpdateBTSensorSeenStatus_, v21, 0);

  }
  return v15;
}

- (id)_defaultEnabledMetricsForActivityType:(id)a3 metricsVersion:(int64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v6 = a3;
  if (objc_msgSend(v6, "effectiveTypeIdentifier") == 46)
  {
    -[FIUIWorkoutDefaultMetricsProvider _defaultEnabledMetricsForSwimmingWithLocationType:metricsVersion:](self, "_defaultEnabledMetricsForSwimmingWithLocationType:metricsVersion:", objc_msgSend(v6, "swimmingLocationType"), a4);
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v8 = (void *)v7;
    goto LABEL_7;
  }
  if (!objc_msgSend(v6, "isIndoor")
    || (-[FIUIWorkoutDefaultMetricsProvider _indoorDefaultEnabledMetricsForActivityType:metricsVersion:](self, "_indoorDefaultEnabledMetricsForActivityType:metricsVersion:", objc_msgSend(v6, "effectiveTypeIdentifier"), a4), (v8 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[FIUIWorkoutDefaultMetricsProvider _defaultOutdoorEnabledMetricsForActivityType:metricsVersion:supportsElevationMetrics:](self, "_defaultOutdoorEnabledMetricsForActivityType:metricsVersion:supportsElevationMetrics:", objc_msgSend(v6, "effectiveTypeIdentifier"), a4, self->_supportsElevationMetrics);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
LABEL_7:
  -[FIUIWorkoutDefaultMetricsProvider removeUnsupportedFitnessJuniorMetricsFrom:](self, "removeUnsupportedFitnessJuniorMetricsFrom:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_defaultEnabledSecondPlatterMetricsForActivityType:(id)a3 metricsVersion:(int64_t)a4
{
  void *v5;
  void *v6;

  +[FIUIDefaultSecondPlatterMetrics metricsForActivityType:metricsVersion:](FIUIDefaultSecondPlatterMetrics, "metricsForActivityType:metricsVersion:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIWorkoutDefaultMetricsProvider removeUnsupportedFitnessJuniorMetricsFrom:](self, "removeUnsupportedFitnessJuniorMetricsFrom:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)removeUnsupportedFitnessJuniorMetricsFrom:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = v4;
  if (self->_activityMoveMode == 2)
  {
    v6 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v6, "removeObjectsInArray:", &unk_24CF4F1D0);

    v5 = v6;
  }
  return v5;
}

- (id)_defaultEnabledMetricsForSwimmingWithLocationType:(int64_t)a3 metricsVersion:(int64_t)a4
{
  _QWORD *v5;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if ((unint64_t)(a4 - 2) >= 5)
  {
    if (!a4 && (unint64_t)a3 < 3)
    {
      v5 = &unk_24CF31CE8;
      return (id)v5[a3];
    }
  }
  else if ((unint64_t)a3 < 3)
  {
    v5 = &unk_24CF31CD0;
    return (id)v5[a3];
  }
  _HKInitializeLogging();
  v7 = (void *)*MEMORY[0x24BDD3078];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3078], OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)MEMORY[0x24BDD16E0];
    v9 = v7;
    objc_msgSend(v8, "numberWithInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v10;
    _os_log_impl(&dword_21307C000, v9, OS_LOG_TYPE_DEFAULT, "Can't find default Glory metrics for swimming workout with location type %@", (uint8_t *)&v11, 0xCu);

  }
  return 0;
}

- (id)_indoorDefaultEnabledMetricsForActivityType:(unint64_t)a3 metricsVersion:(int64_t)a4
{
  void *v4;

  if ((unint64_t)(a4 - 2) >= 4)
  {
    if (a4)
    {
      if (a4 == 6)
      {
        -[FIUIWorkoutDefaultMetricsProvider _defaultMoonstoneIndoorEnabledMetricsForActivityType:](self, "_defaultMoonstoneIndoorEnabledMetricsForActivityType:", a3);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v4 = 0;
      }
    }
    else
    {
      -[FIUIWorkoutDefaultMetricsProvider _defaultPreGloryIndoorEnabledMetricsForActivityType:](self, "_defaultPreGloryIndoorEnabledMetricsForActivityType:", a3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    -[FIUIWorkoutDefaultMetricsProvider _defaultGloryIndoorEnabledMetricsForActivityType:](self, "_defaultGloryIndoorEnabledMetricsForActivityType:", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)_defaultMoonstoneIndoorEnabledMetricsForActivityType:(unint64_t)a3
{
  void *v5;
  id v6;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    if (a3 <= 0x29 && ((1 << a3) & 0x28800000000) != 0)
    {
      v5 = &unk_24CF4F248;
    }
    else
    {
      -[FIUIWorkoutDefaultMetricsProvider _defaultGloryIndoorEnabledMetricsForActivityType:](self, "_defaultGloryIndoorEnabledMetricsForActivityType:", a3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v5)
      {
        _HKInitializeLogging();
        v8 = (void *)*MEMORY[0x24BDD3078];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3078], OS_LOG_TYPE_DEFAULT))
        {
          v9 = (void *)MEMORY[0x24BDD16E0];
          v10 = v8;
          objc_msgSend(v9, "numberWithUnsignedInteger:", a3);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = 138412290;
          v13 = v11;
          _os_log_impl(&dword_21307C000, v10, OS_LOG_TYPE_DEFAULT, "Can't find default Moonstone metrics for indoor workout of type %@", (uint8_t *)&v12, 0xCu);

        }
        v5 = 0;
      }
    }
  }
  else
  {
    -[FIUIWorkoutDefaultMetricsProvider _defaultGloryIndoorEnabledMetricsForActivityType:](self, "_defaultGloryIndoorEnabledMetricsForActivityType:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)_defaultGloryIndoorEnabledMetricsForActivityType:(unint64_t)a3
{
  id result;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  result = &unk_24CF4F260;
  if (a3 != 52 && a3 != 37)
  {
    if (a3 == 13)
    {
      return &unk_24CF4F278;
    }
    else
    {
      _HKInitializeLogging();
      v5 = (void *)*MEMORY[0x24BDD3078];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3078], OS_LOG_TYPE_DEFAULT))
      {
        v6 = (void *)MEMORY[0x24BDD16E0];
        v7 = v5;
        objc_msgSend(v6, "numberWithUnsignedInteger:", a3);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138412290;
        v10 = v8;
        _os_log_impl(&dword_21307C000, v7, OS_LOG_TYPE_DEFAULT, "Can't find default Glory metrics for indoor workout of type %@", (uint8_t *)&v9, 0xCu);

      }
      return 0;
    }
  }
  return result;
}

- (id)_defaultPreGloryIndoorEnabledMetricsForActivityType:(unint64_t)a3
{
  id result;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  result = &unk_24CF4F290;
  if (a3 != 52 && a3 != 37)
  {
    if (a3 == 13)
    {
      return &unk_24CF4F2A8;
    }
    else
    {
      _HKInitializeLogging();
      v5 = (void *)*MEMORY[0x24BDD3078];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3078], OS_LOG_TYPE_DEFAULT))
      {
        v6 = (void *)MEMORY[0x24BDD16E0];
        v7 = v5;
        objc_msgSend(v6, "numberWithUnsignedInteger:", a3);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138412290;
        v10 = v8;
        _os_log_impl(&dword_21307C000, v7, OS_LOG_TYPE_DEFAULT, "Can't find default Pre-Glory metrics for indoor workout of type %@", (uint8_t *)&v9, 0xCu);

      }
      return 0;
    }
  }
  return result;
}

- (id)_defaultOutdoorEnabledMetricsForActivityType:(unint64_t)a3 metricsVersion:(int64_t)a4 supportsElevationMetrics:(BOOL)a5
{
  void *v5;

  if ((unint64_t)(a4 - 2) >= 4)
  {
    if (a4)
    {
      if (a4 == 6)
      {
        -[FIUIWorkoutDefaultMetricsProvider _defaultMoonstoneOutdoorEnabledMetricsForActivityType:supportsElevationMetrics:](self, "_defaultMoonstoneOutdoorEnabledMetricsForActivityType:supportsElevationMetrics:", a3, a5);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v5 = 0;
      }
    }
    else
    {
      -[FIUIWorkoutDefaultMetricsProvider _defaultPreGloryOutdoorEnabledMetricsForActivityType:](self, "_defaultPreGloryOutdoorEnabledMetricsForActivityType:", a3, 0, a5);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    -[FIUIWorkoutDefaultMetricsProvider _defaultGloryOutdoorEnabledMetricsForActivityType:supportsElevationMetrics:](self, "_defaultGloryOutdoorEnabledMetricsForActivityType:supportsElevationMetrics:", a3, a5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)_defaultGloryOutdoorEnabledMetricsForActivityType:(unint64_t)a3 supportsElevationMetrics:(BOOL)a4
{
  void *v5;
  void *v6;

  if ((uint64_t)a3 > 51)
  {
    if (a3 - 70 >= 2)
    {
      if (a3 == 52)
        return &unk_24CF4F338;
      return &unk_24CF4F380;
    }
    v5 = &unk_24CF4F320;
    v6 = &unk_24CF4F308;
  }
  else
  {
    switch(a3)
    {
      case 0xDuLL:
        v5 = &unk_24CF4F2D8;
        v6 = &unk_24CF4F2C0;
        break;
      case 0x18uLL:
        v5 = &unk_24CF4F368;
        v6 = &unk_24CF4F350;
        break;
      case 0x25uLL:
        return &unk_24CF4F2F0;
      default:
        return &unk_24CF4F380;
    }
  }
  if (a4)
    return v6;
  else
    return v5;
}

- (id)_defaultMoonstoneOutdoorEnabledMetricsForActivityType:(unint64_t)a3 supportsElevationMetrics:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  id v8;

  v4 = a4;
  if ((_os_feature_enabled_impl() & 1) == 0)
    goto LABEL_17;
  if ((uint64_t)a3 > 59)
  {
    if ((uint64_t)a3 > 66)
    {
      if (a3 == 75)
        goto LABEL_5;
      if (a3 != 67)
        goto LABEL_17;
    }
    else
    {
      if (a3 == 60)
      {
        v7 = &unk_24CF4F398;
        goto LABEL_18;
      }
      if (a3 != 61)
        goto LABEL_17;
    }
    v7 = &unk_24CF4F3B0;
    goto LABEL_18;
  }
  if ((uint64_t)a3 <= 24)
  {
    if (a3 != 1 && a3 != 3)
    {
      if (a3 == 21)
      {
        v7 = &unk_24CF4F3F8;
        goto LABEL_18;
      }
LABEL_17:
      -[FIUIWorkoutDefaultMetricsProvider _defaultGloryOutdoorEnabledMetricsForActivityType:supportsElevationMetrics:](self, "_defaultGloryOutdoorEnabledMetricsForActivityType:supportsElevationMetrics:", a3, v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
LABEL_5:
    v7 = &unk_24CF4F428;
    goto LABEL_18;
  }
  switch(a3)
  {
    case 0x19uLL:
    case 0x1BuLL:
    case 0x24uLL:
    case 0x29uLL:
      goto LABEL_5;
    case 0x1FuLL:
      v7 = &unk_24CF4F3C8;
      break;
    case 0x23uLL:
      v7 = &unk_24CF4F3E0;
      break;
    case 0x27uLL:
      v7 = &unk_24CF4F410;
      break;
    default:
      goto LABEL_17;
  }
LABEL_18:
  v8 = v7;

  return v8;
}

- (id)_defaultPreGloryOutdoorEnabledMetricsForActivityType:(unint64_t)a3
{
  char v4;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if ((uint64_t)a3 > 36)
  {
    v4 = a3 - 44;
    if (a3 - 44 <= 0x1B)
    {
      if (((1 << v4) & 0x82001) != 0)
        return &unk_24CF4F4A0;
      if (((1 << v4) & 0xC000000) != 0)
        return &unk_24CF4F470;
      if (a3 == 52)
        return &unk_24CF4F488;
    }
    if (a3 != 3000)
    {
      if (a3 == 37)
        return &unk_24CF4F458;
      goto LABEL_18;
    }
    return &unk_24CF4F4A0;
  }
  if (a3 == 13)
    return &unk_24CF4F440;
  if (a3 == 16 || a3 == 35)
    return &unk_24CF4F4A0;
LABEL_18:
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x24BDD3078];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3078], OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)MEMORY[0x24BDD16E0];
    v8 = v6;
    objc_msgSend(v7, "numberWithUnsignedInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v9;
    _os_log_impl(&dword_21307C000, v8, OS_LOG_TYPE_DEFAULT, "Can't find metrics for outdoor/unspecified workout of type %@", (uint8_t *)&v10, 0xCu);

  }
  return 0;
}

- (void)_updateSupportedMetrics
{
  NSObject *v3;
  NSArray *v4;
  NSArray *supportedMetrics;
  uint8_t v6[16];

  _HKInitializeLogging();
  v3 = *MEMORY[0x24BDD3078];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3078], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21307C000, v3, OS_LOG_TYPE_DEFAULT, "Updating supported metrics", v6, 2u);
  }
  -[FIUIWorkoutDefaultMetricsProvider _supportedMetricsForActivityType:metricsVersion:](self, "_supportedMetricsForActivityType:metricsVersion:", self->_activityType, self->_metricsVersion);
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  supportedMetrics = self->_supportedMetrics;
  self->_supportedMetrics = v4;

}

- (id)_supportedMetricsForActivityType:(id)a3 metricsVersion:(int64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  char v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  int v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = objc_msgSend(v6, "effectiveTypeIdentifier");
  if (v7 > 51)
  {
    switch(v7)
    {
      case '<':
        -[FIUIWorkoutDefaultMetricsProvider _standardSupportedMetricsWithMetricsVersion:](self, "_standardSupportedMetricsWithMetricsVersion:", a4);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (a4 < 6 || !_os_feature_enabled_impl())
          goto LABEL_101;
        v10 = &unk_24CF4F680;
        goto LABEL_23;
      case '=':
      case 'C':
        -[FIUIWorkoutDefaultMetricsProvider _standardSupportedMetricsWithMetricsVersion:](self, "_standardSupportedMetricsWithMetricsVersion:", a4);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (a4 < 6 || !_os_feature_enabled_impl())
          goto LABEL_101;
        v10 = &unk_24CF4F728;
        goto LABEL_23;
      case '>':
      case '?':
      case '@':
      case 'A':
      case 'B':
      case 'D':
      case 'E':
        goto LABEL_65;
      case 'F':
      case 'G':
        if ((objc_msgSend(v6, "isIndoor") & 1) != 0)
        {
          v8 = &unk_24CF4F590;
        }
        else
        {
          objc_msgSend(&unk_24CF4F590, "arrayByAddingObject:", &unk_24CF4FFC8);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
        }
        if ((objc_msgSend(v6, "isIndoor") & 1) == 0 && self->_supportsGroundElevationMetrics)
        {
          objc_msgSend(v8, "arrayByAddingObject:", &unk_24CF50148);
          v14 = objc_claimAutoreleasedReturnValue();

          v8 = (void *)v14;
        }
        if (a4 < 4)
          goto LABEL_101;
        v13 = &unk_24CF4F5A8;
        goto LABEL_45;
      default:
        if (v7 == 52)
        {
LABEL_27:
          if ((objc_msgSend(v6, "isIndoor") & 1) != 0 || !self->_supportsElevationMetrics)
          {
            v8 = &unk_24CF4F560;
          }
          else
          {
            objc_msgSend(&unk_24CF4F560, "arrayByAddingObject:", &unk_24CF4FFC8);
            v8 = (void *)objc_claimAutoreleasedReturnValue();
          }
          if ((objc_msgSend(v6, "isIndoor") & 1) == 0 && self->_supportsGroundElevationMetrics)
          {
            objc_msgSend(v8, "arrayByAddingObject:", &unk_24CF50148);
            v12 = objc_claimAutoreleasedReturnValue();

            v8 = (void *)v12;
          }
          if (a4 >= 4)
          {
            v13 = &unk_24CF4F578;
LABEL_45:
            objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v13);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (a4 == 4)
            {
LABEL_85:
              v8 = v15;
            }
            else
            {
LABEL_79:
              objc_msgSend(v15, "arrayByAddingObject:", &unk_24CF50130);
              v8 = (void *)objc_claimAutoreleasedReturnValue();

            }
          }
          goto LABEL_101;
        }
        if (v7 != 75)
          goto LABEL_65;
        break;
    }
  }
  else
  {
    if (v7 > 20)
    {
      switch(v7)
      {
        case 21:
          -[FIUIWorkoutDefaultMetricsProvider _standardSupportedMetricsWithMetricsVersion:](self, "_standardSupportedMetricsWithMetricsVersion:", a4);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (a4 < 6 || !_os_feature_enabled_impl())
            goto LABEL_101;
          v10 = &unk_24CF4F6C8;
          goto LABEL_23;
        case 24:
          goto LABEL_27;
        case 25:
        case 41:
          -[FIUIWorkoutDefaultMetricsProvider _standardSupportedMetricsWithMetricsVersion:](self, "_standardSupportedMetricsWithMetricsVersion:", a4);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v6, "isIndoor");
          if (a4 < 6 || (v9 & 1) != 0 || !_os_feature_enabled_impl())
            goto LABEL_101;
          v10 = &unk_24CF4F6F8;
          goto LABEL_23;
        case 27:
        case 36:
          goto LABEL_20;
        case 31:
          -[FIUIWorkoutDefaultMetricsProvider _standardSupportedMetricsWithMetricsVersion:](self, "_standardSupportedMetricsWithMetricsVersion:", a4);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (a4 < 6 || !_os_feature_enabled_impl())
            goto LABEL_101;
          v10 = &unk_24CF4F6B0;
          goto LABEL_23;
        case 35:
          -[FIUIWorkoutDefaultMetricsProvider _standardSupportedMetricsWithMetricsVersion:](self, "_standardSupportedMetricsWithMetricsVersion:", a4);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v6, "isIndoor");
          if (a4 < 6 || (v16 & 1) != 0 || !_os_feature_enabled_impl())
            goto LABEL_101;
          v10 = &unk_24CF4F698;
          goto LABEL_23;
        case 37:
          if (a4 < 2)
          {
            v8 = &unk_24CF4F5C0;
          }
          else
          {
            objc_msgSend(&unk_24CF4F5C0, "arrayByAddingObjectsFromArray:", &unk_24CF4F5D8);
            v8 = (void *)objc_claimAutoreleasedReturnValue();
          }
          if ((objc_msgSend(v6, "isIndoor") & 1) == 0 && self->_supportsElevationMetrics)
          {
            objc_msgSend(v8, "arrayByAddingObject:", &unk_24CF4FFC8);
            v18 = objc_claimAutoreleasedReturnValue();

            v8 = (void *)v18;
          }
          if ((objc_msgSend(v6, "isIndoor") & 1) == 0 && self->_supportsGroundElevationMetrics)
          {
            objc_msgSend(v8, "arrayByAddingObject:", &unk_24CF50148);
            v19 = objc_claimAutoreleasedReturnValue();

            v8 = (void *)v19;
          }
          if (a4 < 4)
            goto LABEL_101;
          objc_msgSend(v8, "arrayByAddingObjectsFromArray:", &unk_24CF4F5F0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v6, "isIndoor") & 1) == 0
            && objc_msgSend(MEMORY[0x24BDC1418], "isRunningFormAvailable")
            && self->_activityMoveMode == 1)
          {
            objc_msgSend(v15, "arrayByAddingObjectsFromArray:", &unk_24CF4F608);
            v20 = objc_claimAutoreleasedReturnValue();

            v15 = (void *)v20;
          }
          if ((unint64_t)a4 >= 5)
            goto LABEL_79;
          goto LABEL_85;
        case 39:
          -[FIUIWorkoutDefaultMetricsProvider _standardSupportedMetricsWithMetricsVersion:](self, "_standardSupportedMetricsWithMetricsVersion:", a4);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v6, "isIndoor");
          if (a4 < 6 || (v17 & 1) != 0 || !_os_feature_enabled_impl())
            goto LABEL_101;
          v10 = &unk_24CF4F710;
          goto LABEL_23;
        case 46:
          if (objc_msgSend(v6, "swimmingLocationType") == 1)
          {
            objc_msgSend(&unk_24CF4F620, "arrayByAddingObject:", &unk_24CF4FF68);
            v8 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v8 = &unk_24CF4F620;
          }
          if (a4 < 4)
            goto LABEL_101;
          objc_msgSend(v8, "arrayByAddingObjectsFromArray:", &unk_24CF4F638);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if ((unint64_t)a4 < 6)
            goto LABEL_85;
          objc_msgSend(v15, "arrayByAddingObjectsFromArray:", &unk_24CF4F650);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          if (!_os_feature_enabled_impl())
            goto LABEL_101;
          v10 = &unk_24CF4F668;
          break;
        default:
          goto LABEL_65;
      }
      goto LABEL_23;
    }
    if (v7 != 1 && v7 != 3)
    {
      if (v7 == 13)
      {
        if (objc_msgSend(v6, "isIndoor"))
        {
          if (a4 < 4)
          {
            v8 = &unk_24CF4F4B8;
            goto LABEL_105;
          }
          objc_msgSend(&unk_24CF4F4B8, "arrayByAddingObjectsFromArray:", &unk_24CF4F4D0);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (a4 < 4)
          {
            v8 = &unk_24CF4F4E8;
          }
          else
          {
            objc_msgSend(&unk_24CF4F4E8, "arrayByAddingObjectsFromArray:", &unk_24CF4F500);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v8 = v21;
            if (a4 != 4)
            {
              objc_msgSend(v21, "arrayByAddingObject:", &unk_24CF50130);
              v22 = objc_claimAutoreleasedReturnValue();

              v8 = (void *)v22;
            }
          }
          if (self->_supportsElevationMetrics)
          {
            objc_msgSend(v8, "arrayByAddingObject:", &unk_24CF4FFC8);
            v23 = objc_claimAutoreleasedReturnValue();

            v8 = (void *)v23;
          }
          if (self->_supportsGroundElevationMetrics)
          {
            objc_msgSend(v8, "arrayByAddingObject:", &unk_24CF50148);
            v24 = objc_claimAutoreleasedReturnValue();

            v8 = (void *)v24;
          }
        }
        if (a4 >= 5)
        {
          objc_msgSend(v8, "arrayByAddingObjectsFromArray:", &unk_24CF4F518);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (_os_feature_enabled_impl())
          {
            objc_msgSend(v11, "arrayByAddingObjectsFromArray:", &unk_24CF4F530);
            v25 = objc_claimAutoreleasedReturnValue();

            v11 = (void *)v25;
          }
          if (!objc_msgSend(v6, "isIndoor")
            || !+[FIUIBluetoothSensorLookup hasHadPairedCyclingSpeedSensors](FIUIBluetoothSensorLookup, "hasHadPairedCyclingSpeedSensors"))
          {
            goto LABEL_24;
          }
          objc_msgSend(v11, "arrayByAddingObjectsFromArray:", &unk_24CF4F548);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

        }
      }
      else
      {
LABEL_65:
        -[FIUIWorkoutDefaultMetricsProvider _standardSupportedMetricsWithMetricsVersion:](self, "_standardSupportedMetricsWithMetricsVersion:", a4);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_101;
    }
  }
LABEL_20:
  -[FIUIWorkoutDefaultMetricsProvider _standardSupportedMetricsWithMetricsVersion:](self, "_standardSupportedMetricsWithMetricsVersion:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 >= 6 && _os_feature_enabled_impl())
  {
    v10 = &unk_24CF4F6E0;
LABEL_23:
    objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_24:
    v8 = v11;
  }
LABEL_101:
  if (!v8)
  {
    _HKInitializeLogging();
    v26 = (void *)*MEMORY[0x24BDD3078];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3078], OS_LOG_TYPE_DEFAULT))
    {
      v27 = (void *)MEMORY[0x24BDD16E0];
      v28 = v26;
      objc_msgSend(v27, "numberWithUnsignedInteger:", objc_msgSend(v6, "effectiveTypeIdentifier"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 138412290;
      v33 = v29;
      _os_log_impl(&dword_21307C000, v28, OS_LOG_TYPE_DEFAULT, "Can't find supported metrics for workout of type %@", (uint8_t *)&v32, 0xCu);

    }
    v8 = 0;
  }
LABEL_105:
  if (self->_activityMoveMode == 2)
  {
    v30 = (void *)objc_msgSend(v8, "mutableCopy");
    objc_msgSend(v30, "removeObjectsInArray:", &unk_24CF4F740);

    v8 = v30;
  }

  return v8;
}

- (id)_standardSupportedMetricsWithMetricsVersion:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 < 4)
    return &unk_24CF4F758;
  objc_msgSend(&unk_24CF4F758, "arrayByAddingObjectsFromArray:", &unk_24CF4F770, v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_machineProvidedMetricsForActivityType:(id)a3
{
  uint64_t v3;
  void *v5;

  v3 = objc_msgSend(a3, "effectiveTypeIdentifier");
  if (v3 <= 36)
  {
    v5 = &unk_24CF4F7D0;
    if (v3 != 16)
      v5 = 0;
    if (v3 == 13)
      return &unk_24CF4F7B8;
    else
      return v5;
  }
  else
  {
    switch(v3)
    {
      case '4':
        return &unk_24CF4F788;
      case ',':
        return &unk_24CF4F7A0;
      case '%':
        return &unk_24CF4F788;
      default:
        return 0;
    }
  }
}

- (id)appendMachineMetricsToMetrics:(id)a3 maxNumMetrics:(int64_t)a4 activityType:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v8 = a3;
  v9 = a5;
  -[FIUIWorkoutDefaultMetricsProvider _machineProvidedMetricsForActivityType:](self, "_machineProvidedMetricsForActivityType:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count") < (unint64_t)a4)
  {
    while (1)
    {
      v11 = objc_msgSend(v10, "count");
      if (!v8 || !v11)
        break;
      objc_msgSend(v10, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "containsObject:", v12) & 1) == 0)
      {
        objc_msgSend(v8, "arrayByAddingObject:", v12);
        v13 = objc_claimAutoreleasedReturnValue();

        v8 = (id)v13;
      }
      objc_msgSend(v10, "subarrayWithRange:", 1, objc_msgSend(v10, "count") - 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = v14;
      if (objc_msgSend(v8, "count") >= (unint64_t)a4)
        goto LABEL_9;
    }
  }
  v14 = v10;
LABEL_9:
  v15 = v8;

  return v15;
}

- (BOOL)isMetricTypeSupported:(unint64_t)a3 isMachineWorkout:(BOOL)a4 activityType:(id)a5
{
  void *v6;
  void *v7;
  char v8;

  -[FIUIWorkoutDefaultMetricsProvider supportedMetricsWithIsMachineWorkout:activityType:](self, "supportedMetricsWithIsMachineWorkout:activityType:", a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containsObject:", v7);

  return v8;
}

- (id)supportedMetricsWithIsMachineWorkout:(BOOL)a3 activityType:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  v6 = a4;
  -[FIUIWorkoutDefaultMetricsProvider supportedMetrics](self, "supportedMetrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[FIUIWorkoutDefaultMetricsProvider appendMachineMetricsToMetrics:maxNumMetrics:activityType:](self, "appendMachineMetricsToMetrics:maxNumMetrics:activityType:", v7, 0x7FFFFFFFLL, v6);
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }

  return v7;
}

+ (void)initialize
{
  __int128 v2;
  uint64_t v3;

  if ((id)objc_opt_class() == a1)
  {
    HKNSOperatingSystemVersionFromString();
    moonstoneVersion = v2;
    qword_254B75FC8 = v3;
    HKNSOperatingSystemVersionFromString();
    velocityVersion = v2;
    qword_254B75FE0 = v3;
    HKNSOperatingSystemVersionFromString();
    boltVersion = v2;
    qword_254B75FF8 = v3;
    HKNSOperatingSystemVersionFromString();
    gloryCVersion = v2;
    qword_254B76010 = v3;
    HKNSOperatingSystemVersionFromString();
    gloryVersion = v2;
    qword_254B76028 = v3;
  }
}

+ (int64_t)metricsVersionForWorkout:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int64_t v11;
  int64_t v12;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;

  v21 = 0uLL;
  v22 = 0;
  objc_msgSend(a3, "sourceRevision");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "operatingSystemVersion");
  }
  else
  {
    v18 = 0;
    v19 = 0;
    v20 = 0;
  }
  FIEffectiveOperatingSystemVersion();

  v16 = v21;
  v17 = v22;
  v14 = moonstoneVersion;
  v15 = qword_254B75FC8;
  v6 = objc_msgSend(a1, "operatingSystemVersion:atLeastVersion:", &v16, &v14);
  v16 = v21;
  v17 = v22;
  v14 = velocityVersion;
  v15 = qword_254B75FE0;
  v7 = objc_msgSend(a1, "operatingSystemVersion:atLeastVersion:", &v16, &v14);
  v16 = v21;
  v17 = v22;
  v14 = boltVersion;
  v15 = qword_254B75FF8;
  v8 = objc_msgSend(a1, "operatingSystemVersion:atLeastVersion:", &v16, &v14);
  v16 = v21;
  v17 = v22;
  v14 = gloryCVersion;
  v15 = qword_254B76010;
  v9 = objc_msgSend(a1, "operatingSystemVersion:atLeastVersion:", &v16, &v14);
  v16 = v21;
  v17 = v22;
  v14 = gloryVersion;
  v15 = qword_254B76028;
  v10 = objc_msgSend(a1, "operatingSystemVersion:atLeastVersion:", &v16, &v14);
  v11 = 4;
  if (v7)
    v11 = 5;
  if (v6)
    v11 = 6;
  v12 = 2;
  if (!v10)
    v12 = 0;
  if (v9)
    v12 = 3;
  if (v6 | v7 | v8)
    return v11;
  else
    return v12;
}

+ (BOOL)operatingSystemVersion:(id *)a3 atLeastVersion:(id *)a4
{
  return (unint64_t)(HKNSOperatingSystemVersionCompare() + 1) < 2;
}

- (int64_t)metricsVersion
{
  return self->_metricsVersion;
}

- (NSArray)defaultEnabledMetrics
{
  return self->_defaultEnabledMetrics;
}

- (NSArray)defaultSecondPlatterMetrics
{
  return self->_defaultSecondPlatterMetrics;
}

- (NSArray)supportedMetrics
{
  return self->_supportedMetrics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedMetrics, 0);
  objc_storeStrong((id *)&self->_defaultSecondPlatterMetrics, 0);
  objc_storeStrong((id *)&self->_defaultEnabledMetrics, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
}

@end
