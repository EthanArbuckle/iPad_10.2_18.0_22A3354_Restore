@implementation FIUIFormattingManager

- (FIUIFormattingManager)initWithUnitManager:(id)a3
{
  id v5;
  FIUIFormattingManager *v6;
  FIUIFormattingManager *v7;
  FIUIDepthFormatter *v8;
  FIUIDepthFormatter *depthFormatter;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FIUIFormattingManager;
  v6 = -[FIUIFormattingManager init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_unitManager, a3);
    v8 = -[FIUIDepthFormatter initWithUnitManager:]([FIUIDepthFormatter alloc], "initWithUnitManager:", v5);
    depthFormatter = v7->_depthFormatter;
    v7->_depthFormatter = v8;

  }
  return v7;
}

- (id)localizedGoalDescriptionForGoalType:(unint64_t)a3 goalValue:(double)a4 activityType:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  v8 = a5;
  v9 = v8;
  switch(a3)
  {
    case 0uLL:
      FIUIBundle();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("WORKOUT_OPEN_GOAL"), &stru_24CF339D8, CFSTR("Localizable"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    case 1uLL:
      v12 = -[FIUIUnitManager userDistanceUnitForDistanceType:](self->_unitManager, "userDistanceUnitForDistanceType:", FIUIDistanceTypeForActivityType(v8));
      -[FIUIFormattingManager localizedStringWithDistanceInMeters:distanceUnit:unitStyle:decimalPrecision:roundingMode:decimalTrimmingMode:](self, "localizedStringWithDistanceInMeters:distanceUnit:unitStyle:decimalPrecision:roundingMode:decimalTrimmingMode:", v12, 2, objc_msgSend((id)objc_opt_class(), "defaultPrecisionForDistanceUnit:", v12), 6, 2, a4);
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 2uLL:
      -[FIUIFormattingManager stringWithDuration:durationFormat:](self, "stringWithDuration:durationFormat:", 7, a4);
      v13 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v11 = (void *)v13;
      break;
    case 3uLL:
      v14 = (void *)MEMORY[0x24BDD3E50];
      objc_msgSend(MEMORY[0x24BDD4048], "kilocalorieUnit");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "quantityWithUnit:doubleValue:", v15, a4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[FIUIFormattingManager localizedStringWithActiveEnergy:unitStyle:](self, "localizedStringWithActiveEnergy:unitStyle:", v16, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v11 = 0;
      break;
  }

  return v11;
}

- (FIUIUnitManager)unitManager
{
  return self->_unitManager;
}

+ (id)stringWithNumber:(id)a3 decimalPrecision:(unint64_t)a4
{
  return (id)objc_msgSend(a1, "stringWithNumber:decimalPrecision:roundingMode:decimalTrimmingMode:", a3, a4, 2, 1);
}

+ (id)stringWithNumber:(id)a3 decimalPrecision:(unint64_t)a4 roundingMode:(unint64_t)a5
{
  return (id)objc_msgSend(a1, "stringWithNumber:decimalPrecision:roundingMode:decimalTrimmingMode:", a3, a4, a5, 1);
}

- (id)localizedPaceUnitStringWithDistanceType:(unint64_t)a3 distanceUnit:(unint64_t)a4
{
  return -[FIUIFormattingManager localizedPaceUnitStringWithDistanceType:distanceUnit:unitStyle:](self, "localizedPaceUnitStringWithDistanceType:distanceUnit:unitStyle:", a3, a4, 2);
}

- (id)localizedShortUnitStringForDistanceUnit:(unint64_t)a3
{
  return -[FIUIFormattingManager localizedShortUnitStringForDistanceUnit:textCase:](self, "localizedShortUnitStringForDistanceUnit:textCase:", a3, 0);
}

- (id)localizedShortUnitStringForDistanceUnit:(unint64_t)a3 textCase:(unint64_t)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  os_unfair_lock_lock((os_unfair_lock_t)&__formatterLock);
  _LengthFormatter((void *)1, 2, 2, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a3 - 1 > 4)
    v9 = 14;
  else
    v9 = qword_21310E378[a3 - 1];
  objc_msgSend(v7, "unitStringFromValue:unit:", v9, 100.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)&__formatterLock);
  -[FIUIFormattingManager applyTextCase:toString:](self, "applyTextCase:toString:", a4, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)applyTextCase:(unint64_t)a3 toString:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  v6 = v5;
  switch(a3)
  {
    case 0uLL:
      v7 = v5;
      goto LABEL_6;
    case 1uLL:
      objc_msgSend(v5, "localizedUppercaseString");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 2uLL:
      objc_msgSend(v5, "localizedLowercaseString");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 3uLL:
      objc_msgSend(v5, "localizedCapitalizedString");
      v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
      a3 = (unint64_t)v7;
      break;
    default:
      break;
  }

  return (id)a3;
}

- (id)decimalSeparator
{
  void *v2;
  void *v3;

  os_unfair_lock_lock((os_unfair_lock_t)&__formatterLock);
  _DoubleFractionNumberFormatter(2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "decimalSeparator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock((os_unfair_lock_t)&__formatterLock);
  return v3;
}

- (id)stringWithDuration:(double)a3 durationFormat:(unint64_t)a4
{
  double v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  unint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  if ((*(_QWORD *)&a3 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
    v5 = 0.0;
  else
    v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x24BDD14F8]);
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLocale:", v8);

  objc_msgSend(v6, "setCalendar:", v7);
  objc_msgSend(v6, "setUnitsStyle:", 0);
  switch(a4)
  {
    case 1uLL:
      os_unfair_lock_lock((os_unfair_lock_t)&__formatterLock);
      _IntegerNumberFormatter(2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      _ZeroPaddedIntegerNumberFormatter();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", (unint64_t)(v5 / 60.0));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringFromNumber:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", (unint64_t)(v5 - (double)(60 * (unint64_t)(v5 / 60.0))));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringFromNumber:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      os_unfair_lock_unlock((os_unfair_lock_t)&__formatterLock);
      v15 = (void *)MEMORY[0x24BDD17C8];
      FIUIBundle();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("PACE_FORMATTING"), &stru_24CF339D8, CFSTR("Localizable"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringWithFormat:", v17, v12, v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    case 2uLL:
      objc_msgSend(v6, "setZeroFormattingBehavior:", 0);
      v19 = v6;
      v20 = 224;
      goto LABEL_12;
    case 3uLL:
      objc_msgSend(v6, "setZeroFormattingBehavior:", 0x10000);
      v19 = v6;
      v20 = 192;
      goto LABEL_12;
    case 4uLL:
      objc_msgSend(v6, "setZeroFormattingBehavior:", 0);
      v19 = v6;
      v20 = 96;
LABEL_12:
      objc_msgSend(v19, "setAllowedUnits:", v20);
      goto LABEL_16;
    case 5uLL:
      objc_msgSend(v6, "setZeroFormattingBehavior:", 1);
      objc_msgSend(v6, "setAllowedUnits:", 96);
      objc_msgSend(v6, "setUnitsStyle:", 1);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v5);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "unsignedIntegerValue");

      objc_msgSend(v6, "stringFromTimeInterval:", (double)(60 * (v22 / 0x3C)));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 6uLL:
      objc_msgSend(v6, "setZeroFormattingBehavior:", 1);
      objc_msgSend(v6, "setAllowedUnits:", 224);
      v23 = v6;
      v24 = 4;
      goto LABEL_15;
    case 7uLL:
      objc_msgSend(v6, "setZeroFormattingBehavior:", 1);
      objc_msgSend(v6, "setAllowedUnits:", 224);
      v23 = v6;
      v24 = 5;
LABEL_15:
      objc_msgSend(v23, "setUnitsStyle:", v24);
LABEL_16:
      objc_msgSend(v6, "stringFromTimeInterval:", v5);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      os_unfair_lock_lock((os_unfair_lock_t)&__formatterLock);
      if (a4 != 3)
        goto LABEL_36;
      if (_DurationSeparator___durationSeparator)
        goto LABEL_31;
      v25 = objc_alloc_init(MEMORY[0x24BDD14F8]);
      objc_msgSend(v25, "setUnitsStyle:", 0);
      objc_msgSend(v25, "stringFromTimeInterval:", 100.0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v27 = objc_msgSend(&unk_24CF4F1B8, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      if (!v27)
        goto LABEL_28;
      v28 = v27;
      v29 = *(_QWORD *)v38;
      break;
    default:
      v18 = 0;
LABEL_10:
      os_unfair_lock_lock((os_unfair_lock_t)&__formatterLock);
      goto LABEL_36;
  }
  while (2)
  {
    for (i = 0; i != v28; ++i)
    {
      if (*(_QWORD *)v38 != v29)
        objc_enumerationMutation(&unk_24CF4F1B8);
      v31 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
      if (objc_msgSend(v26, "containsString:", v31))
      {
        objc_storeStrong((id *)&_DurationSeparator___durationSeparator, v31);
        goto LABEL_28;
      }
    }
    v28 = objc_msgSend(&unk_24CF4F1B8, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v28)
      continue;
    break;
  }
LABEL_28:
  if (!_DurationSeparator___durationSeparator)
    _DurationSeparator___durationSeparator = (uint64_t)CFSTR(":");

LABEL_31:
  if (objc_msgSend(v18, "rangeOfString:") == 1)
  {
    _ZeroPaddedIntegerNumberFormatter();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "paddingCharacter");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "stringByAppendingString:", v18);
    v34 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v34;
  }
  if (v5 <= -1.0 && v5 > -60.0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("-00:%02d"), (int)-v5);
    v35 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v35;
  }
LABEL_36:
  os_unfair_lock_unlock((os_unfair_lock_t)&__formatterLock);

  return v18;
}

- (id)localizedNaturalScaleStringWithDistanceInMeters:(double)a3 distanceType:(unint64_t)a4 unitStyle:(unint64_t)a5 usedUnit:(unint64_t *)a6
{
  return -[FIUIFormattingManager localizedNaturalScaleStringWithDistanceInMeters:distanceType:unitStyle:usedUnit:decimalTrimmingMode:](self, "localizedNaturalScaleStringWithDistanceInMeters:distanceType:unitStyle:usedUnit:decimalTrimmingMode:", a4, a5, a6, 1, a3);
}

- (id)localizedStringWithDistanceInMeters:(double)a3 distanceUnit:(unint64_t)a4 unitStyle:(unint64_t)a5 decimalPrecision:(unint64_t)a6
{
  return -[FIUIFormattingManager localizedStringWithDistanceInMeters:distanceUnit:unitStyle:decimalPrecision:roundingMode:decimalTrimmingMode:](self, "localizedStringWithDistanceInMeters:distanceUnit:unitStyle:decimalPrecision:roundingMode:decimalTrimmingMode:", a4, a5, a6, 2, 1, a3);
}

- (id)localizationKeyForEnergyBaseKey:(id)a3
{
  FIUIUnitManager *unitManager;
  id v4;
  void *v5;
  void *v6;

  unitManager = self->_unitManager;
  v4 = a3;
  -[FIUIUnitManager userActiveEnergyBurnedUnit](unitManager, "userActiveEnergyBurnedUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _FIUILocalizationKeyForUnit(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)localizedStringWithActiveEnergy:(id)a3 unitStyle:(unint64_t)a4
{
  return -[FIUIFormattingManager localizedStringWithEnergy:energyType:unitStyle:](self, "localizedStringWithEnergy:energyType:unitStyle:", a3, 1, a4);
}

- (id)localizedStringWithEnergy:(id)a3 energyType:(unint64_t)a4 unitStyle:(unint64_t)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;

  v8 = a3;
  switch(a4)
  {
    case 3uLL:
      goto LABEL_4;
    case 2uLL:
      -[FIUIUnitManager userBasalEnergyBurnedUnit](self->_unitManager, "userBasalEnergyBurnedUnit");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 1uLL:
LABEL_4:
      -[FIUIUnitManager userActiveEnergyBurnedUnit](self->_unitManager, "userActiveEnergyBurnedUnit");
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v10 = (void *)v9;
      goto LABEL_8;
  }
  v10 = 0;
LABEL_8:
  v11 = _HKWorkoutFlooredValueForQuantity();
  v12 = objc_msgSend(MEMORY[0x24BDD4048], "energyFormatterUnitFromUnit:", v10);
  switch(a5)
  {
    case 0uLL:
      v13 = (void *)objc_opt_class();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithNumber:decimalPrecision:", v14, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    case 1uLL:
      os_unfair_lock_lock((os_unfair_lock_t)&__formatterLock);
      _EnergyFormatter(v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setUnitStyle:", 1);
      objc_msgSend(v14, "stringFromValue:unit:", v12, (double)v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedLowercaseString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_15;
    case 2uLL:
      os_unfair_lock_lock((os_unfair_lock_t)&__formatterLock);
      _EnergyFormatter(v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v17;
      v18 = 2;
      goto LABEL_14;
    case 3uLL:
      os_unfair_lock_lock((os_unfair_lock_t)&__formatterLock);
      _EnergyFormatter(v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v17;
      v18 = 3;
LABEL_14:
      objc_msgSend(v17, "setUnitStyle:", v18);
      objc_msgSend(v14, "stringFromValue:unit:", v12, (double)v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:
      os_unfair_lock_unlock((os_unfair_lock_t)&__formatterLock);
LABEL_16:

      break;
    default:
      v15 = 0;
      break;
  }

  return v15;
}

- (id)localizedShortActiveEnergyUnitString
{
  void *v3;
  void *v4;

  -[FIUIUnitManager userActiveEnergyBurnedUnit](self->_unitManager, "userActiveEnergyBurnedUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIFormattingManager _energyBurnedUnitStringForUnit:useShortString:](self, "_energyBurnedUnitStringForUnit:useShortString:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_energyBurnedUnitStringForUnit:(id)a3 useShortString:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v4 = a4;
  v5 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&__formatterLock);
  _EnergyFormatter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
    v8 = 2;
  else
    v8 = 3;
  objc_msgSend(v6, "setUnitStyle:", v8);
  v9 = objc_msgSend(MEMORY[0x24BDD4048], "energyFormatterUnitFromUnit:", v5);

  objc_msgSend(v7, "unitStringFromValue:unit:", v9, 100.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)&__formatterLock);

  return v10;
}

+ (id)percentStringWithNumber:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&__formatterLock);
  if (_PercentNumberFormatter_onceToken != -1)
    dispatch_once(&_PercentNumberFormatter_onceToken, &__block_literal_global_22);
  objc_msgSend((id)_PercentNumberFormatter___formatter, "stringFromNumber:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock((os_unfair_lock_t)&__formatterLock);
  return v4;
}

+ (id)stringWithNumber:(id)a3 decimalPrecision:(unint64_t)a4 roundingMode:(unint64_t)a5 decimalTrimmingMode:(unint64_t)a6
{
  id v9;
  void *v10;
  void *v11;

  v9 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&__formatterLock);
  _NumberFormatterForDecimalPrecision((id)a4, a5, a6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringFromNumber:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock((os_unfair_lock_t)&__formatterLock);
  return v11;
}

- (id)localizationKeyForMoveBaseKey:(id)a3 activityMoveMode:(int64_t)a4
{
  if (a4 == 2)
    -[FIUIFormattingManager localizationKeyForMoveMinutesBaseKey:](self, "localizationKeyForMoveMinutesBaseKey:", a3);
  else
    -[FIUIFormattingManager localizationKeyForEnergyBaseKey:](self, "localizationKeyForEnergyBaseKey:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)localizationKeyForMoveMinutesBaseKey:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD4048];
  v4 = a3;
  objc_msgSend(v3, "minuteUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _FIUILocalizationKeyForUnit(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)localizationKeyForDistanceBaseKey:(id)a3 distanceType:(unint64_t)a4
{
  FIUIUnitManager *unitManager;
  id v6;
  void *v7;
  void *v8;

  unitManager = self->_unitManager;
  v6 = a3;
  -[FIUIUnitManager userDistanceHKUnitForDistanceType:](unitManager, "userDistanceHKUnitForDistanceType:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _FIUILocalizationKeyForUnit(v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (unint64_t)defaultPrecisionForDistanceUnit:(unint64_t)a3
{
  if (a3 - 1 > 4)
    return 3;
  else
    return qword_21310E350[a3 - 1];
}

- (id)localizedStringWithDistanceInMeters:(double)a3 distanceUnit:(unint64_t)a4 unitStyle:(unint64_t)a5 decimalPrecision:(unint64_t)a6 roundingMode:(unint64_t)a7 decimalTrimmingMode:(unint64_t)a8
{
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  FIUIFormattingManager *v19;
  unint64_t v20;
  uint64_t v21;

  -[FIUIUnitManager distanceInDistanceUnit:forDistanceInMeters:](self->_unitManager, "distanceInDistanceUnit:forDistanceInMeters:", a3);
  v15 = v14;
  switch(a5)
  {
    case 0uLL:
      v16 = (void *)objc_opt_class();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithNumber:decimalPrecision:roundingMode:decimalTrimmingMode:", v17, a6, a7, a8);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      return v18;
    case 1uLL:
      v19 = self;
      v20 = a4;
      v21 = 1;
      goto LABEL_7;
    case 2uLL:
      v19 = self;
      v20 = a4;
      v21 = 2;
      goto LABEL_7;
    case 3uLL:
      v19 = self;
      v20 = a4;
      v21 = 3;
LABEL_7:
      -[FIUIFormattingManager _localizedStringWithDistanceUnit:distanceInUnit:unitStyle:decimalPrecision:roundingMode:decimalTrimmingMode:](v19, "_localizedStringWithDistanceUnit:distanceInUnit:unitStyle:decimalPrecision:roundingMode:decimalTrimmingMode:", v20, v21, a6, a7, a8);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v18 = 0;
      break;
  }
  return v18;
}

- (id)_stringByReplacingThirtyThreeAndAThirdIfNeeded:(id)a3 distanceInMeters:(double)a4 distanceUnit:(unint64_t)a5
{
  id v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a3;
  v9 = v8;
  v10 = a4 / 0.9144;
  if (a5 != 4)
    v10 = a4;
  v11 = v8;
  if (fabs(v10 + -33.3333333) < 0.01)
  {
    FIUIBundle(v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("33⅓"), &stru_24CF339D8, CFSTR("Localizable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[FIUIFormattingManager localizedStringWithDistanceInMeters:distanceUnit:unitStyle:decimalPrecision:](self, "localizedStringWithDistanceInMeters:distanceUnit:unitStyle:decimalPrecision:", a5, 0, objc_msgSend((id)objc_opt_class(), "defaultPrecisionForDistanceUnit:", a5), a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", v14, v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (id)localizedStringWithDistanceInMeters:(double)a3 distanceType:(unint64_t)a4 unitStyle:(unint64_t)a5
{
  return -[FIUIFormattingManager localizedStringWithDistanceInMeters:distanceType:unitStyle:roundingMode:](self, "localizedStringWithDistanceInMeters:distanceType:unitStyle:roundingMode:", a4, a5, 2, a3);
}

- (id)localizedStringWithDistanceInMeters:(double)a3 distanceType:(unint64_t)a4 unitStyle:(unint64_t)a5 roundingMode:(unint64_t)a6
{
  unint64_t v11;
  void *v12;
  uint64_t v13;

  v11 = -[FIUIUnitManager userDistanceUnitForDistanceType:](self->_unitManager, "userDistanceUnitForDistanceType:");
  -[FIUIFormattingManager localizedStringWithDistanceInMeters:distanceUnit:unitStyle:decimalPrecision:roundingMode:decimalTrimmingMode:](self, "localizedStringWithDistanceInMeters:distanceUnit:unitStyle:decimalPrecision:roundingMode:decimalTrimmingMode:", v11, a5, objc_msgSend((id)objc_opt_class(), "defaultPrecisionForDistanceUnit:", v11), a6, 1, a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 == 3)
  {
    -[FIUIFormattingManager _stringByReplacingThirtyThreeAndAThirdIfNeeded:distanceInMeters:distanceUnit:](self, "_stringByReplacingThirtyThreeAndAThirdIfNeeded:distanceInMeters:distanceUnit:", v12, v11, a3);
    v13 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v13;
  }
  return v12;
}

- (id)localizedCompactNaturalScaleStringWithDistanceInMeters:(double)a3 distanceType:(unint64_t)a4 unitStyle:(unint64_t)a5 usedUnit:(unint64_t *)a6
{
  void *v6;
  void *v7;

  -[FIUIFormattingManager localizedNaturalScaleStringWithDistanceInMeters:distanceType:unitStyle:usedUnit:](self, "localizedNaturalScaleStringWithDistanceInMeters:distanceType:unitStyle:usedUnit:", a4, a5, a6, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_24CF339D8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)localizedNaturalScaleStringWithDistanceInMeters:(double)a3 distanceType:(unint64_t)a4 unitStyle:(unint64_t)a5 usedUnit:(unint64_t *)a6 decimalTrimmingMode:(unint64_t)a7
{
  unint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;

  v13 = -[FIUIFormattingManager naturalScaleUnitForDistanceInMeters:distanceType:](self, "naturalScaleUnitForDistanceInMeters:distanceType:");
  v14 = objc_msgSend((id)objc_opt_class(), "defaultPrecisionForDistanceUnit:", v13);
  if (a6)
    *a6 = v13;
  -[FIUIFormattingManager localizedStringWithDistanceInMeters:distanceUnit:unitStyle:decimalPrecision:roundingMode:decimalTrimmingMode:](self, "localizedStringWithDistanceInMeters:distanceUnit:unitStyle:decimalPrecision:roundingMode:decimalTrimmingMode:", v13, a5, v14, 2, a7, a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 == 3)
  {
    -[FIUIFormattingManager _stringByReplacingThirtyThreeAndAThirdIfNeeded:distanceInMeters:distanceUnit:](self, "_stringByReplacingThirtyThreeAndAThirdIfNeeded:distanceInMeters:distanceUnit:", v15, v13, a3);
    v16 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v16;
  }
  return v15;
}

- (unint64_t)naturalScaleUnitForDistanceInMeters:(double)a3 distanceType:(unint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  int IsMetric;
  double v10;
  unint64_t result;

  v7 = naturalScaleUnitForDistanceInMeters_distanceType____userDistanceUnit;
  if (naturalScaleUnitForDistanceInMeters_distanceType____userDistanceUnit
    && v7 == -[FIUIUnitManager userDistanceUnitForDistanceType:](self->_unitManager, "userDistanceUnitForDistanceType:", a4))
  {
    v8 = naturalScaleUnitForDistanceInMeters_distanceType____cutoffDistanceInMeters;
  }
  else
  {
    naturalScaleUnitForDistanceInMeters_distanceType____userDistanceUnit = -[FIUIUnitManager userDistanceUnitForDistanceType:](self->_unitManager, "userDistanceUnitForDistanceType:", a4);
    IsMetric = FIUIDistanceUnitIsMetric();
    v10 = 0.1;
    if (IsMetric)
      v10 = 1.0;
    -[FIUIUnitManager distanceInMetersForDistanceInUserUnit:distanceType:](self->_unitManager, "distanceInMetersForDistanceInUserUnit:distanceType:", a4, v10);
    naturalScaleUnitForDistanceInMeters_distanceType____cutoffDistanceInMeters = v8;
  }
  result = naturalScaleUnitForDistanceInMeters_distanceType____userDistanceUnit;
  if (*(double *)&v8 > a3)
  {
    switch(naturalScaleUnitForDistanceInMeters_distanceType____userDistanceUnit)
    {
      case 5:
        goto LABEL_11;
      case 4:
        return result;
      case 3:
LABEL_11:
        if (a4 == 4)
          return 4;
        else
          return 5;
      default:
        return 1;
    }
  }
  return result;
}

- (id)_localizedStringWithDistanceUnit:(unint64_t)a3 distanceInUnit:(double)a4 unitStyle:(int64_t)a5 decimalPrecision:(unint64_t)a6 roundingMode:(unint64_t)a7 decimalTrimmingMode:(unint64_t)a8
{
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;

  os_unfair_lock_lock((os_unfair_lock_t)&__formatterLock);
  _LengthFormatter((void *)a6, a5, a7, a8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (a3 - 1 > 4)
    v16 = 14;
  else
    v16 = qword_21310E378[a3 - 1];
  objc_msgSend(v14, "stringFromValue:unit:", v16, a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)&__formatterLock);

  return v17;
}

- (id)localizedShortUnitStringForDistanceType:(unint64_t)a3
{
  return -[FIUIFormattingManager localizedShortUnitStringForDistanceUnit:](self, "localizedShortUnitStringForDistanceUnit:", -[FIUIUnitManager userDistanceUnitForDistanceType:](self->_unitManager, "userDistanceUnitForDistanceType:", a3));
}

- (id)localizedLongUnitStringForDistanceUnit:(unint64_t)a3 distanceInUnit:(double)a4
{
  return -[FIUIFormattingManager localizedLongUnitStringForDistanceUnit:distanceInUnit:textCase:](self, "localizedLongUnitStringForDistanceUnit:distanceInUnit:textCase:", a3, 0, a4);
}

- (id)localizedLongUnitStringForDistanceUnit:(unint64_t)a3 distanceInUnit:(double)a4 textCase:(unint64_t)a5
{
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  os_unfair_lock_lock((os_unfair_lock_t)&__formatterLock);
  _LengthFormatter((void *)1, 3, 2, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (a3 - 1 > 4)
    v11 = 14;
  else
    v11 = qword_21310E378[a3 - 1];
  objc_msgSend(v9, "unitStringFromValue:unit:", v11, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)&__formatterLock);
  -[FIUIFormattingManager applyTextCase:toString:](self, "applyTextCase:toString:", a5, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)localizedUnitStringForDistanceUnit:(unint64_t)a3 distanceInUnit:(double)a4 unitStyle:(unint64_t)a5
{
  __CFString *v5;

  if (a5 - 1 >= 2)
  {
    if (a5 == 3)
    {
      -[FIUIFormattingManager localizedLongUnitStringForDistanceUnit:distanceInUnit:](self, "localizedLongUnitStringForDistanceUnit:distanceInUnit:", a3, a4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = &stru_24CF339D8;
    }
  }
  else
  {
    -[FIUIFormattingManager localizedShortUnitStringForDistanceUnit:](self, "localizedShortUnitStringForDistanceUnit:", a3, a4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)localizedPaceStringWithDistance:(id)a3 overDuration:(double)a4 paceFormat:(int64_t)a5 distanceType:(unint64_t)a6
{
  return -[FIUIFormattingManager localizedPaceStringWithDistance:overDuration:paceFormat:unitStyle:decimalTrimmingMode:distanceType:](self, "localizedPaceStringWithDistance:overDuration:paceFormat:unitStyle:decimalTrimmingMode:distanceType:", a3, a5, 2, 1, a6, a4);
}

- (id)localizedPaceStringWithDistance:(id)a3 overDuration:(double)a4 paceFormat:(int64_t)a5 unitStyle:(unint64_t)a6 decimalTrimmingMode:(unint64_t)a7 distanceType:(unint64_t)a8
{
  id v14;
  unint64_t v15;
  unint64_t v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;

  v14 = a3;
  v15 = -[FIUIFormattingManager decimalPrecisionForPaceFormat:](self, "decimalPrecisionForPaceFormat:", a5);
  if (a5 == 4)
  {
    v16 = v15;
    -[FIUIFormattingManager speedPerHourWithDistance:overDuration:paceFormat:distanceType:](self, "speedPerHourWithDistance:overDuration:paceFormat:distanceType:", v14, 4, a8, a4);
    v18 = v17;

    v19 = (void *)objc_opt_class();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithNumber:decimalPrecision:roundingMode:decimalTrimmingMode:", v20, v16, 2, a7);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[FIUIUnitManager paceWithDistance:overDuration:paceFormat:distanceType:](self->_unitManager, "paceWithDistance:overDuration:paceFormat:distanceType:", v14, a5, a8, a4);
    v23 = v22;

    if (v23 == 0.0)
    {
      FIUIBundle(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("PACE_NOVALUE"), &stru_24CF339D8, CFSTR("Localizable"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (a6 == 3)
        v26 = 6;
      else
        v26 = 1;
      -[FIUIFormattingManager stringWithDuration:durationFormat:](self, "stringWithDuration:durationFormat:", v26, v23);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v21;
}

- (id)localizedPaceAndUnitWithDistance:(id)a3 overDuration:(double)a4 paceFormat:(int64_t)a5 distanceType:(unint64_t)a6 unitStyle:(unint64_t)a7 decimalTrimmingMode:(unint64_t)a8
{
  id v8;
  id v15;
  void *v16;
  unint64_t v17;
  FIUIFormattingManager *v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int IsMetric;
  __CFString *v31;
  void *v32;
  __CFString *v33;
  void *v34;
  void *v35;

  v15 = a3;
  -[FIUIFormattingManager localizedPaceStringWithDistance:overDuration:paceFormat:unitStyle:decimalTrimmingMode:distanceType:](self, "localizedPaceStringWithDistance:overDuration:paceFormat:unitStyle:decimalTrimmingMode:distanceType:", v15, a5, a7, a8, a6, a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[FIUIUnitManager paceDistanceUnitForDistanceType:](self->_unitManager, "paceDistanceUnitForDistanceType:", a6);
  if ((unint64_t)(a5 - 1) < 3)
  {
    switch(a7)
    {
      case 0uLL:
        goto LABEL_10;
      case 1uLL:
        v18 = self;
        v19 = a6;
        v20 = v17;
        v21 = 1;
        goto LABEL_12;
      case 2uLL:
        v18 = self;
        v19 = a6;
        v20 = v17;
        v21 = 2;
LABEL_12:
        -[FIUIFormattingManager localizedPaceUnitStringWithDistanceType:distanceUnit:unitStyle:](v18, "localizedPaceUnitStringWithDistanceType:distanceUnit:unitStyle:", v19, v20, v21);
        v24 = objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      case 3uLL:
        -[FIUIFormattingManager localizedPaceUnitStringWithDistanceType:distanceUnit:unitStyle:](self, "localizedPaceUnitStringWithDistanceType:distanceUnit:unitStyle:", a6, v17, 3);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (void *)MEMORY[0x24BDD17C8];
        FIUIBundle(v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("PACE_PER_UNIT"), &stru_24CF339D8, CFSTR("Localizable"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "stringWithFormat:", v28, v16, v25);
        v8 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_16;
      default:
        goto LABEL_17;
    }
  }
  if (a5 == 4)
  {
    -[FIUIFormattingManager speedPerHourWithDistance:overDuration:paceFormat:distanceType:](self, "speedPerHourWithDistance:overDuration:paceFormat:distanceType:", v15, 4, a6, a4);
    v23 = v22;
    if (a8 == 2)
      v23 = trunc(v22 * 10.0) / 10.0;
    if (a7 - 1 < 2)
    {
      -[FIUIFormattingManager localizedSpeedUnitStringForDistanceUnit:unitStyle:](self, "localizedSpeedUnitStringForDistanceUnit:unitStyle:", v17, a7);
      v24 = objc_claimAutoreleasedReturnValue();
LABEL_15:
      v25 = (void *)v24;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), v16, v24);
      v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:

    }
    else if (a7 == 3)
    {
      IsMetric = FIUIDistanceUnitIsMetric(v17);
      v31 = CFSTR("SPOKEN_SPEED_IMPERIAL");
      if (IsMetric)
        v31 = CFSTR("SPOKEN_SPEED_METRIC");
      v32 = (void *)MEMORY[0x24BDD17C8];
      v33 = v31;
      FIUIBundle(v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "localizedStringForKey:value:table:", v33, &stru_24CF339D8, CFSTR("Localizable"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v32, "stringWithFormat:", v35, *(_QWORD *)&v23);
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
    else if (!a7)
    {
LABEL_10:
      v8 = v16;
    }
  }
LABEL_17:

  return v8;
}

- (unint64_t)decimalPrecisionForPaceFormat:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) < 3)
    return 1;
  else
    return 2;
}

- (id)localizedPaceAndUnitStringForSpeed:(double)a3 activityType:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;

  v6 = FIUIDistanceTypeForActivityType(a4);
  v7 = FIUIPaceFormatForDistanceType(v6);
  v8 = (void *)MEMORY[0x24BDD3E50];
  objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "quantityWithUnit:doubleValue:", v9, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIFormattingManager localizedPaceStringWithDistance:overDuration:paceFormat:distanceType:](self, "localizedPaceStringWithDistance:overDuration:paceFormat:distanceType:", v10, v7, v6, 1.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[FIUIFormattingManager unitManager](self, "unitManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "paceDistanceUnitForDistanceType:", v6);

  -[FIUIFormattingManager localizedPaceUnitStringWithDistanceType:distanceUnit:](self, "localizedPaceUnitStringWithDistanceType:distanceUnit:", v6, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedUppercaseString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x24BDD17C8];
  FIUIBundle(v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("PACE_FORMAT"), &stru_24CF339D8, CFSTR("Localizable"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", v19, v11, v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (double)speedPerHourWithDistance:(id)a3 overDuration:(double)a4 paceFormat:(int64_t)a5 distanceType:(unint64_t)a6
{
  FIUIUnitManager *unitManager;
  id v9;
  void *v10;
  double v11;
  double v12;

  unitManager = self->_unitManager;
  v9 = a3;
  FIUIHKUnitForDistanceUnit(-[FIUIUnitManager paceDistanceUnitForDistanceType:](unitManager, "paceDistanceUnitForDistanceType:", a6));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValueForUnit:", v10);
  v12 = v11;

  return v12 / (a4 / 3600.0);
}

- (id)localizedSwimmingPaceStringWithDistance:(id)a3 overDuration:(double)a4 paceFormat:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v8 = a3;
  -[FIUIFormattingManager unitManager](self, "unitManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "userDistanceHKUnitForDistanceType:", 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "doubleValueForUnit:", v10);
  v12 = v11;

  if (v12 > 2.22044605e-16 && a4 / v12 * (double)a5 <= 3600.0)
  {
    -[FIUIFormattingManager stringWithDuration:durationFormat:](self, "stringWithDuration:durationFormat:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    FIUIBundle(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("PACE_NOVALUE"), &stru_24CF339D8, CFSTR("Localizable"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

- (id)localizedStrokeCountStringWithCount:(int64_t)a3 overDistance:(id)a4 paceFormat:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;

  v8 = a4;
  -[FIUIFormattingManager unitManager](self, "unitManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "userDistanceHKUnitForDistanceType:", 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "doubleValueForUnit:", v10);
  v12 = v11;

  if (v12 > 2.22044605e-16)
    a3 = llround((double)a3 / v12 * (double)a5);
  v13 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithNumber:decimalPrecision:", v14, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)localizedShortCadenceUnitStringForActivityType:(unint64_t)a3
{
  uint64_t v3;
  int v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v3 = FIUIIsWorkoutTypePedestrianActivity(a3);
  v4 = v3;
  FIUIBundle(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    v7 = CFSTR("SPM_SHORT_UNIT");
  else
    v7 = CFSTR("RPM_SHORT_UNIT");
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_24CF339D8, CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)localizedShortPowerUnitString
{
  void *v2;
  void *v3;

  FIUIBundle(a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("WATTS_SHORT_UNIT"), &stru_24CF339D8, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)localizedPowerUnitStringForPower:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BDD17C8];
  FIUIBundle(self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("POWER_SHORT_DESCRIPTION"), &stru_24CF339D8, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringWithFormat:", v6, *(_QWORD *)&a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)localizedShortTypeDistinguishingUnitStringForPowerType:(unint64_t)a3 unitString:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  v6 = v5;
  v7 = v5;
  if (a3 == 12)
  {
    v8 = (void *)MEMORY[0x24BDD17C8];
    FIUIBundle(v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("AVERAGE_POWER_DISTINGUISHING_SHORT"), &stru_24CF339D8, CFSTR("Localizable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", v10, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)localizedSpeedUnitString
{
  FIUIWorkoutActivityType *v3;
  void *v4;

  v3 = -[FIUIWorkoutActivityType initWithActivityTypeIdentifier:isIndoor:]([FIUIWorkoutActivityType alloc], "initWithActivityTypeIdentifier:isIndoor:", 13, 0);
  -[FIUIFormattingManager localizedSpeedUnitStringForActivityType:](self, "localizedSpeedUnitStringForActivityType:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)localizedSpeedUnitStringForDistanceType:(unint64_t)a3 unitStyle:(unint64_t)a4
{
  void *v7;
  uint64_t v8;

  -[FIUIFormattingManager unitManager](self, "unitManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "paceDistanceUnitForDistanceType:", a3);

  return -[FIUIFormattingManager localizedSpeedUnitStringForDistanceUnit:unitStyle:](self, "localizedSpeedUnitStringForDistanceUnit:unitStyle:", v8, a4);
}

- (id)localizedSpeedUnitStringForActivityType:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v4 = FIUIDistanceTypeForActivityType(a3);
  -[FIUIFormattingManager unitManager](self, "unitManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userDistanceUnitForDistanceType:", v4);

  return -[FIUIFormattingManager localizedSpeedUnitStringForDistanceUnit:unitStyle:](self, "localizedSpeedUnitStringForDistanceUnit:unitStyle:", v6, 1);
}

- (id)localizedSpeedUnitStringForDistanceUnit:(unint64_t)a3 unitStyle:(unint64_t)a4
{
  uint64_t IsMetric;
  int v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  IsMetric = FIUIDistanceUnitIsMetric(a3);
  v5 = IsMetric;
  FIUIBundle(IsMetric);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
    v8 = CFSTR("KPH_SHORT");
  else
    v8 = CFSTR("MPH_SHORT");
  objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_24CF339D8, CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)localizedPaceUnitStringWithDistanceType:(unint64_t)a3 distanceUnit:(unint64_t)a4 unitStyle:(int64_t)a5
{
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  __CFString *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;

  v8 = FIUIPaceFormatForDistanceType(a3);
  v9 = ((uint64_t (*)(void))FIUINumberOfUnitsInPaceForPaceFormat)();
  v10 = v9;
  if ((unint64_t)(a5 - 1) >= 2)
  {
    if (a5 == 3)
    {
      -[FIUIFormattingManager localizedLongUnitStringForDistanceUnit:distanceInUnit:](self, "localizedLongUnitStringForDistanceUnit:distanceInUnit:", a4, (double)v9);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("PACE_MANY_UNIT_FORMAT_LONG");
    }
    else
    {
      v12 = 0;
      v11 = &stru_24CF339D8;
    }
  }
  else
  {
    -[FIUIFormattingManager localizedShortUnitStringForDistanceUnit:](self, "localizedShortUnitStringForDistanceUnit:", a4);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v12 = CFSTR("PACE_MANY_UNIT_FORMAT");
  }
  if (v10 >= 2)
  {
    v13 = (void *)objc_opt_class();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", FIUINumberOfUnitsInPaceForPaceFormat(v8));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithNumber:decimalPrecision:", v14, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x24BDD17C8];
    FIUIBundle(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", v12, &stru_24CF339D8, CFSTR("Localizable"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringWithFormat:", v19, v15, v11);
    v20 = objc_claimAutoreleasedReturnValue();

    v11 = (__CFString *)v20;
  }
  return v11;
}

- (id)finalLocalizedKeyForKey:(id)a3 multiline:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a4;
  v5 = a3;
  v6 = v5;
  if (v4)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v5, CFSTR("_ONE_LINE"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (id)localizedDistinguishingPaceUnitStringWithMetricType:(unint64_t)a3 distanceType:(unint64_t)a4 distanceUnit:(unint64_t)a5 paceFormat:(int64_t)a6 abbreviated:(BOOL)a7 multiline:(BOOL)a8
{
  _BOOL8 v8;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  int v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  const __CFString *v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  void *v46;
  const __CFString *v47;
  void *v48;
  const __CFString *v49;
  uint64_t v50;
  int v51;
  uint64_t v52;
  int v53;
  uint64_t v54;
  int v55;
  void *v56;
  const __CFString *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  uint64_t v63;
  int v64;
  void *v65;
  void *v66;
  const __CFString *v67;
  const __CFString *v68;
  const __CFString *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  int v73;
  uint64_t v74;
  int v75;
  void *v76;
  const __CFString *v77;
  uint64_t v78;
  int v79;
  void *v80;
  const __CFString *v81;
  uint64_t v82;
  int v83;
  uint64_t IsMetric;
  int v85;
  uint64_t v86;
  int v87;
  uint64_t v88;
  int v89;
  void *v90;
  uint64_t v91;

  v8 = a8;
  if (a3 == 41)
  {
    FIUIBundle(self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (a6 == 4)
    {
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("SPEED_LABEL"), &stru_24CF339D8, CFSTR("Localizable"));
      v13 = objc_claimAutoreleasedReturnValue();

      -[FIUIFormattingManager finalLocalizedKeyForKey:multiline:](self, "finalLocalizedKeyForKey:multiline:", CFSTR("INTERVAL_SPEED_DISTINGUISHING"), v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x24BDD17C8];
      FIUIBundle(v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringForKey:value:table:", v14, &stru_24CF339D8, CFSTR("Localizable"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", v17, v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedUppercaseString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = (void *)v13;
    }
    else
    {
      -[FIUIFormattingManager finalLocalizedKeyForKey:multiline:](self, "finalLocalizedKeyForKey:multiline:", CFSTR("INTERVAL_PACE_DISTINGUISHING"), v8);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", v37, &stru_24CF339D8, CFSTR("Localizable"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_118;
  }
  v20 = a7;
  if (a6 == 4)
  {
    FIUIBundle(self);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("SPEED_LABEL"), &stru_24CF339D8, CFSTR("Localizable"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if ((uint64_t)a3 > 22)
    {
      switch(a3)
      {
        case 0x17uLL:
          if (v20)
          {
            v48 = (void *)MEMORY[0x24BDD17C8];
            FIUIBundle(v24);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = CFSTR("SEGMENT_SPEED_DISTINGUISHING_SHORT");
            goto LABEL_59;
          }
          IsMetric = FIUIDistanceUnitIsMetric(a5);
          v85 = IsMetric;
          v80 = (void *)MEMORY[0x24BDD17C8];
          FIUIBundle(IsMetric);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if (v85)
            v81 = CFSTR("SEGMENT_SPEED_DISTINGUISHING_LONG_METRIC");
          else
            v81 = CFSTR("SEGMENT_SPEED_DISTINGUISHING_LONG_IMPERIAL");
          break;
        case 0x24uLL:
          if (v20)
          {
            v48 = (void *)MEMORY[0x24BDD17C8];
            FIUIBundle(v24);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = CFSTR("SPLIT_SPEED_DISTINGUISHING_SHORT");
            goto LABEL_59;
          }
          v86 = FIUIDistanceUnitIsMetric(a5);
          v87 = v86;
          v80 = (void *)MEMORY[0x24BDD17C8];
          FIUIBundle(v86);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if (v87)
            v81 = CFSTR("SPLIT_SPEED_DISTINGUISHING_LONG_METRIC");
          else
            v81 = CFSTR("SPLIT_SPEED_DISTINGUISHING_LONG_IMPERIAL");
          break;
        case 0x30uLL:
          if (v20)
          {
            v48 = (void *)MEMORY[0x24BDD17C8];
            FIUIBundle(v24);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = CFSTR("MAX_SPEED_DISTINGUISHING_SHORT");
LABEL_59:
            -[FIUIFormattingManager finalLocalizedKeyForKey:multiline:](self, "finalLocalizedKeyForKey:multiline:", v49, v8);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "localizedStringForKey:value:table:", v30, &stru_24CF339D8, CFSTR("Localizable"));
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "stringWithFormat:", v58, v12);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "localizedUppercaseString");
            v60 = objc_claimAutoreleasedReturnValue();

            v12 = (void *)v60;
LABEL_103:

            goto LABEL_104;
          }
          v78 = FIUIDistanceUnitIsMetric(a5);
          v79 = v78;
          v80 = (void *)MEMORY[0x24BDD17C8];
          FIUIBundle(v78);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if (v79)
            v81 = CFSTR("MAX_SPEED_DISTINGUISHING_LONG_METRIC");
          else
            v81 = CFSTR("MAX_SPEED_DISTINGUISHING_LONG_IMPERIAL");
          break;
        default:
          goto LABEL_104;
      }
    }
    else
    {
      if (a3 == 4)
      {
        v54 = FIUIDistanceUnitIsMetric(a5);
        v55 = v54;
        FIUIBundle(v54);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v56;
        if (v55)
          v57 = CFSTR("KPH_SHORT");
        else
          v57 = CFSTR("MPH_SHORT");
        objc_msgSend(v56, "localizedStringForKey:value:table:", v57, &stru_24CF339D8, CFSTR("Localizable"));
        v30 = v12;
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_103;
      }
      if (a3 != 8)
      {
        if (a3 == 18)
        {
          FIUIBundle(v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("SPEED_LABEL"), &stru_24CF339D8, CFSTR("Localizable"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          v27 = FIUIDistanceUnitIsMetric(a5);
          v28 = v27;
          v29 = (void *)MEMORY[0x24BDD17C8];
          FIUIBundle(v27);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = CFSTR("REQUIRED_PACE_DISTINGUISHING_SHORT_IMPERIAL");
          if (v28)
            v31 = CFSTR("REQUIRED_PACE_DISTINGUISHING_SHORT_METRIC");
          v32 = CFSTR("REQUIRED_PACE_DISTINGUISHING_LONG_METRIC");
          if (!v28)
            v32 = CFSTR("REQUIRED_PACE_DISTINGUISHING_LONG_IMPERIAL");
          if (v20)
            v33 = v31;
          else
            v33 = v32;
          -[FIUIFormattingManager finalLocalizedKeyForKey:multiline:](self, "finalLocalizedKeyForKey:multiline:", v33, v8);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "localizedStringForKey:value:table:", v34, &stru_24CF339D8, CFSTR("Localizable"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "stringWithFormat:", v35, v26);
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_103;
        }
LABEL_104:
        objc_msgSend(v12, "localizedUppercaseString");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_118:

        return v19;
      }
      if (v20)
      {
        v48 = (void *)MEMORY[0x24BDD17C8];
        FIUIBundle(v24);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = CFSTR("AVERAGE_SPEED_DISTINGUISHING_SHORT");
        goto LABEL_59;
      }
      v82 = FIUIDistanceUnitIsMetric(a5);
      v83 = v82;
      v80 = (void *)MEMORY[0x24BDD17C8];
      FIUIBundle(v82);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (v83)
        v81 = CFSTR("AVERAGE_SPEED_DISTINGUISHING_LONG_METRIC");
      else
        v81 = CFSTR("AVERAGE_SPEED_DISTINGUISHING_LONG_IMPERIAL");
    }
    -[FIUIFormattingManager finalLocalizedKeyForKey:multiline:](self, "finalLocalizedKeyForKey:multiline:", v81, v8);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "localizedStringForKey:value:table:", v30, &stru_24CF339D8, CFSTR("Localizable"));
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "stringWithFormat:", v90, v12);
    v91 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v91;
    goto LABEL_103;
  }
  v39 = 2;
  if (FIUIDistanceUnitIsMetric(a5))
    v40 = 2;
  else
    v40 = 3;
  if ((unint64_t)FIUINumberOfUnitsInPaceForPaceFormat(a6) < 2)
    v39 = v40;
  if (a3 <= 0x24 && ((1 << a3) & 0x1000800110) != 0 && FIUINumberOfUnitsInPaceForPaceFormat(a6) == 1)
  {
    FIUIBundle(1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "localizedStringForKey:value:table:", CFSTR("PACE_LABEL"), &stru_24CF339D8, CFSTR("Localizable"));
    v42 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[FIUIFormattingManager localizedPaceUnitStringWithDistanceType:distanceUnit:unitStyle:](self, "localizedPaceUnitStringWithDistanceType:distanceUnit:unitStyle:", a4, a5, v39);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "localizedUppercaseString");
    v42 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v42;

  if ((uint64_t)a3 <= 17)
  {
    switch(a3)
    {
      case 4uLL:
        v72 = FIUIDistanceUnitIsMetric(a5);
        v73 = v72;
        v46 = (void *)MEMORY[0x24BDD17C8];
        FIUIBundle(v72);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          if (v73)
            v47 = CFSTR("CURRENT_PACE_DISTINGUISHING_SHORT_METRIC");
          else
            v47 = CFSTR("CURRENT_PACE_DISTINGUISHING_SHORT_IMPERIAL");
        }
        else if (v73)
        {
          v47 = CFSTR("CURRENT_PACE_DISTINGUISHING_LONG_METRIC");
        }
        else
        {
          v47 = CFSTR("CURRENT_PACE_DISTINGUISHING_LONG_IMPERIAL");
        }
        goto LABEL_115;
      case 8uLL:
        if (v20)
        {
          v76 = (void *)MEMORY[0x24BDD17C8];
          FIUIBundle(v43);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v77 = CFSTR("AVERAGE_PACE_DISTINGUISHING_SHORT");
        }
        else
        {
          v88 = FIUIDistanceUnitIsMetric(a5);
          v89 = v88;
          v76 = (void *)MEMORY[0x24BDD17C8];
          FIUIBundle(v88);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v89)
            v77 = CFSTR("AVERAGE_PACE_DISTINGUISHING_LONG_METRIC");
          else
            v77 = CFSTR("AVERAGE_PACE_DISTINGUISHING_LONG_IMPERIAL");
        }
        -[FIUIFormattingManager finalLocalizedKeyForKey:multiline:](self, "finalLocalizedKeyForKey:multiline:", v77, v8);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "localizedStringForKey:value:table:", v66, &stru_24CF339D8, CFSTR("Localizable"));
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "stringWithFormat:", v70, v19);
        goto LABEL_116;
      case 0xEuLL:
        v50 = FIUIDistanceUnitIsMetric(a5);
        v51 = v50;
        v46 = (void *)MEMORY[0x24BDD17C8];
        FIUIBundle(v50);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          if (v51)
            v47 = CFSTR("ROLLING_PACE_DISTINGUISHING_SHORT_METRIC");
          else
            v47 = CFSTR("ROLLING_PACE_DISTINGUISHING_SHORT_IMPERIAL");
        }
        else if (v51)
        {
          v47 = CFSTR("ROLLING_PACE_DISTINGUISHING_LONG_METRIC");
        }
        else
        {
          v47 = CFSTR("ROLLING_PACE_DISTINGUISHING_LONG_IMPERIAL");
        }
        goto LABEL_115;
    }
  }
  else if ((uint64_t)a3 > 35)
  {
    if (a3 == 36)
    {
      v74 = FIUIDistanceUnitIsMetric(a5);
      v75 = v74;
      v46 = (void *)MEMORY[0x24BDD17C8];
      FIUIBundle(v74);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        if (v75)
          v47 = CFSTR("SPLIT_PACE_DISTINGUISHING_SHORT_METRIC");
        else
          v47 = CFSTR("SPLIT_PACE_DISTINGUISHING_SHORT_IMPERIAL");
      }
      else if (v75)
      {
        v47 = CFSTR("SPLIT_PACE_DISTINGUISHING_LONG_METRIC");
      }
      else
      {
        v47 = CFSTR("SPLIT_PACE_DISTINGUISHING_LONG_IMPERIAL");
      }
      goto LABEL_115;
    }
    if (a3 == 48)
    {
      v52 = FIUIDistanceUnitIsMetric(a5);
      v53 = v52;
      v46 = (void *)MEMORY[0x24BDD17C8];
      FIUIBundle(v52);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        if (v53)
          v47 = CFSTR("FASTEST_PACE_DISTINGUISHING_SHORT_METRIC");
        else
          v47 = CFSTR("FASTEST_PACE_DISTINGUISHING_SHORT_IMPERIAL");
      }
      else if (v53)
      {
        v47 = CFSTR("FASTEST_PACE_DISTINGUISHING_LONG_METRIC");
      }
      else
      {
        v47 = CFSTR("FASTEST_PACE_DISTINGUISHING_LONG_IMPERIAL");
      }
      goto LABEL_115;
    }
  }
  else
  {
    if (a3 == 18)
    {
      FIUIBundle(v43);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "localizedStringForKey:value:table:", CFSTR("PACE_LABEL"), &stru_24CF339D8, CFSTR("Localizable"));
      v62 = (void *)objc_claimAutoreleasedReturnValue();

      v63 = FIUIDistanceUnitIsMetric(a5);
      v64 = v63;
      v65 = (void *)MEMORY[0x24BDD17C8];
      FIUIBundle(v63);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = CFSTR("REQUIRED_PACE_DISTINGUISHING_SHORT_IMPERIAL");
      if (v64)
        v67 = CFSTR("REQUIRED_PACE_DISTINGUISHING_SHORT_METRIC");
      v68 = CFSTR("REQUIRED_PACE_DISTINGUISHING_LONG_METRIC");
      if (!v64)
        v68 = CFSTR("REQUIRED_PACE_DISTINGUISHING_LONG_IMPERIAL");
      if (v20)
        v69 = v67;
      else
        v69 = v68;
      -[FIUIFormattingManager finalLocalizedKeyForKey:multiline:](self, "finalLocalizedKeyForKey:multiline:", v69, v8);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "localizedStringForKey:value:table:", v70, &stru_24CF339D8, CFSTR("Localizable"));
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "stringWithFormat:", v71, v62);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_117;
    }
    if (a3 == 23)
    {
      v44 = FIUIDistanceUnitIsMetric(a5);
      v45 = v44;
      v46 = (void *)MEMORY[0x24BDD17C8];
      FIUIBundle(v44);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        if (v45)
          v47 = CFSTR("SEGMENT_PACE_DISTINGUISHING_SHORT_METRIC");
        else
          v47 = CFSTR("SEGMENT_PACE_DISTINGUISHING_SHORT_IMPERIAL");
      }
      else if (v45)
      {
        v47 = CFSTR("SEGMENT_PACE_DISTINGUISHING_LONG_METRIC");
      }
      else
      {
        v47 = CFSTR("SEGMENT_PACE_DISTINGUISHING_LONG_IMPERIAL");
      }
LABEL_115:
      -[FIUIFormattingManager finalLocalizedKeyForKey:multiline:](self, "finalLocalizedKeyForKey:multiline:", v47, v8);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", v66, &stru_24CF339D8, CFSTR("Localizable"));
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "stringWithFormat:", v70, v19);
LABEL_116:
      v71 = v19;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_117:

      goto LABEL_118;
    }
  }
  return v19;
}

- (id)localizedDistinguishingCadenceUnitStringWithMetricType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend((id)objc_opt_class(), "localizedShortCadenceUnitStringForActivityType:", 37);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD17C8];
  FIUIBundle(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a3 == 16)
    v8 = CFSTR("AVERAGE_CADENCE_DISTINGUISHING_LONG");
  else
    v8 = CFSTR("CURRENT_CADENCE_DISTINGUISHING_LONG");
  objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_24CF339D8, CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "localizedUppercaseString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)localizedDistinguishingPowerUnitStringWithMetricType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend((id)objc_opt_class(), "localizedShortPowerUnitString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD17C8];
  FIUIBundle(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a3 == 12)
    v8 = CFSTR("AVERAGE_POWER_DISTINGUISHING_LONG");
  else
    v8 = CFSTR("CURRENT_POWER_DISTINGUISHING_LONG");
  objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_24CF339D8, CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "localizedUppercaseString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)localizedDistinguishingPowerStringWithMetricType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)MEMORY[0x24BDD17C8];
  FIUIBundle(self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3 == 12)
    v7 = CFSTR("AVERAGE_POWER_DISTINGUISHING_LONG");
  else
    v7 = CFSTR("CURRENT_POWER_DISTINGUISHING_LONG");
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_24CF339D8, CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v8, CFSTR("Power"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "localizedUppercaseString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (unint64_t)userDistanceUnitForSwimmingLapLength
{
  if (FIUICurrentLocaleUsesMetricSystem(self, a2))
    return 1;
  else
    return 4;
}

- (id)localizedStringWithPersonHeight:(id)a3 unitStyle:(int64_t)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  void *v15;

  v5 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&__formatterLock);
  v6 = (void *)_LengthFormatterForPersonHeight___formatter;
  if (!_LengthFormatterForPersonHeight___formatter)
  {
    v7 = objc_alloc_init(MEMORY[0x24BDD1630]);
    v8 = (void *)_LengthFormatterForPersonHeight___formatter;
    _LengthFormatterForPersonHeight___formatter = (uint64_t)v7;

    objc_msgSend((id)_LengthFormatterForPersonHeight___formatter, "setForPersonHeightUse:", 1);
    v6 = (void *)_LengthFormatterForPersonHeight___formatter;
  }
  _IntegerNumberFormatter(5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNumberFormatter:", v9);

  objc_msgSend((id)_LengthFormatterForPersonHeight___formatter, "setUnitStyle:", a4);
  v10 = (void *)MEMORY[0x24BDD4048];
  v11 = (id)_LengthFormatterForPersonHeight___formatter;
  objc_msgSend(v10, "meterUnit");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValueForUnit:", v12);
  v14 = v13;

  objc_msgSend(v11, "stringFromMeters:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock((os_unfair_lock_t)&__formatterLock);
  return v15;
}

- (double)roundedDailyMoveGoal:(double)a3 activityMoveMode:(int64_t)a4
{
  double result;

  if (a4 == 2)
    -[FIUIFormattingManager roundedDailyMoveGoalForMoveMinutes:](self, "roundedDailyMoveGoalForMoveMinutes:", a3);
  else
    -[FIUIFormattingManager roundedDailyMoveGoalForCalories:](self, "roundedDailyMoveGoalForCalories:", a3);
  return result;
}

- (double)roundedDailyMoveGoalForMoveMinutes:(double)a3
{
  return round(a3 / 10.0) * 10.0;
}

- (double)roundedDailyMoveGoalForCalories:(double)a3
{
  void *v4;
  char IsCalorieUnit;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;

  -[FIUIUnitManager userActiveEnergyBurnedUnit](self->_unitManager, "userActiveEnergyBurnedUnit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  IsCalorieUnit = FIUIHKUnitIsCalorieUnit();

  if ((IsCalorieUnit & 1) != 0)
    return round(a3 / 10.0) * 10.0;
  objc_msgSend(MEMORY[0x24BDD4048], "jouleUnitWithMetricPrefix:", 9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4048], "kilocalorieUnit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_valueByConvertingValue:toUnit:", v7, a3);
  v10 = v9;

  objc_msgSend(MEMORY[0x24BDD4048], "kilocalorieUnit");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_valueByConvertingValue:toUnit:", v11, round(v10 / 20.0) * 20.0);
  v13 = v12;

  return v13;
}

- (double)energyBurnedInUserUnitForCalories:(double)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;

  -[FIUIUnitManager userActiveEnergyBurnedUnit](self->_unitManager, "userActiveEnergyBurnedUnit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4048], "kilocalorieUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_valueByConvertingValue:toUnit:", v4, a3);
  v7 = v6;

  return v7;
}

- (double)caloriesForEnergyBurnedInUserUnit:(double)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;

  -[FIUIUnitManager userActiveEnergyBurnedUnit](self->_unitManager, "userActiveEnergyBurnedUnit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4048], "kilocalorieUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_valueByConvertingValue:toUnit:", v5, a3);
  v7 = v6;

  return v7;
}

- (id)localizedStringWithMoveQuantity:(id)a3 activityMoveMode:(int64_t)a4
{
  if (a4 == 2)
    -[FIUIFormattingManager localizedStringWithMoveMinutes:](self, "localizedStringWithMoveMinutes:", a3);
  else
    -[FIUIFormattingManager localizedStringWithActiveEnergy:](self, "localizedStringWithActiveEnergy:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)localizedStringWithMoveMinutes:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD4048];
  v4 = a3;
  objc_msgSend(v3, "minuteUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = _HKWorkoutFlooredValueForQuantity();

  v7 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithNumber:decimalPrecision:", v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)localizedStringWithMoveMinutes:(id)a3 unitStyle:(unint64_t)a4
{
  void *v5;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  __CFString *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = (void *)MEMORY[0x24BDD4048];
  v6 = a3;
  objc_msgSend(v5, "minuteUnit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = _HKWorkoutFlooredValueForQuantity();

  if (a4 > 3)
    v10 = 0;
  else
    v10 = off_24CF31CB0[a4];
  v11 = v8;
  v12 = (void *)MEMORY[0x24BDD17C8];
  FIUIBundle(v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", v10, &stru_24CF339D8, CFSTR("Localizable-tinker"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringWithFormat:", v14, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld %@"), v11, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)localizedStringWithBriskMinutes:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD4048];
  v4 = a3;
  objc_msgSend(v3, "minuteUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = _HKWorkoutFlooredValueForQuantity();

  v7 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithNumber:decimalPrecision:", v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)localizedStringWithActiveHours:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD4048];
  v4 = a3;
  objc_msgSend(v3, "countUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = _HKWorkoutFlooredValueForQuantity();

  v7 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithNumber:decimalPrecision:", v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)localizedStringWithMoveQuantity:(id)a3 unitStyle:(unint64_t)a4 activityMoveMode:(int64_t)a5
{
  if (a5 == 2)
    -[FIUIFormattingManager localizedStringWithMoveMinutes:unitStyle:](self, "localizedStringWithMoveMinutes:unitStyle:", a3, a4);
  else
    -[FIUIFormattingManager localizedStringWithActiveEnergy:unitStyle:](self, "localizedStringWithActiveEnergy:unitStyle:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)localizedStringWithActiveEnergy:(id)a3
{
  return -[FIUIFormattingManager localizedStringWithEnergy:energyType:unitStyle:](self, "localizedStringWithEnergy:energyType:unitStyle:", a3, 1, 0);
}

- (id)localizedStringWithEnergyInCalories:(double)a3 energyType:(unint64_t)a4 unitStyle:(unint64_t)a5
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v9 = (void *)MEMORY[0x24BDD3E50];
  objc_msgSend(MEMORY[0x24BDD4048], "kilocalorieUnit");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "quantityWithUnit:doubleValue:", v10, a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[FIUIFormattingManager localizedStringWithEnergy:energyType:unitStyle:](self, "localizedStringWithEnergy:energyType:unitStyle:", v11, a4, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)localizedShortTypeDistinguishingUnitStringForEnergyType:(unint64_t)a3 workoutSectionType:(unint64_t)a4 multiline:(BOOL)a5
{
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = CFSTR("SEGMENT_");
  if (a4 != 3)
    v6 = &stru_24CF339D8;
  v7 = CFSTR("ACTIVE");
  if (a3 == 3)
    v7 = CFSTR("TOTAL");
  if (a5)
    v8 = CFSTR("%@%@_DISTINGUISHING_SHORT");
  else
    v8 = CFSTR("%@%@_DISTINGUISHING_SHORT_ONE_LINE");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v8, v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  FIUIBundle(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIFormattingManager localizationKeyForEnergyBaseKey:](self, "localizationKeyForEnergyBaseKey:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", v11, &stru_24CF339D8, CFSTR("Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (unint64_t)sectionTypeForMetricType:(unint64_t)a3
{
  if (a3 - 21 >= 5)
    return 1;
  else
    return 3;
}

- (id)localizedLongMoveUnitStringWithActivityMoveMode:(int64_t)a3
{
  if (a3 == 2)
    -[FIUIFormattingManager localizedLongMoveMinutesUnitString](self, "localizedLongMoveMinutesUnitString");
  else
    -[FIUIFormattingManager localizedLongActiveEnergyUnitString](self, "localizedLongActiveEnergyUnitString");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)localizedLongMoveUnitStringWithActivityMoveMode:(int64_t)a3 value:(unint64_t)a4
{
  if (a3 == 2)
    -[FIUIFormattingManager localizedLongMoveMinutesUnitStringForValue:](self, "localizedLongMoveMinutesUnitStringForValue:", a4);
  else
    -[FIUIFormattingManager localizedLongActiveEnergyUnitString](self, "localizedLongActiveEnergyUnitString", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)localizedLongMoveMinutesUnitString
{
  return -[FIUIFormattingManager localizedLongMoveMinutesUnitStringWithTextCase:](self, "localizedLongMoveMinutesUnitStringWithTextCase:", 3);
}

- (id)localizedLongMoveMinutesUnitStringForValue:(unint64_t)a3
{
  return -[FIUIFormattingManager localizedLongMoveMinutesUnitStringWithTextCase:value:](self, "localizedLongMoveMinutesUnitStringWithTextCase:value:", 3, a3);
}

- (id)localizedMediumMoveMinutesUnitString
{
  return -[FIUIFormattingManager localizedMediumMoveMinutesUnitStringWithTextCase:](self, "localizedMediumMoveMinutesUnitStringWithTextCase:", 3);
}

- (id)localizedMediumMoveMinutesUnitStringForValue:(unint64_t)a3
{
  return -[FIUIFormattingManager localizedMediumMoveMinutesUnitStringWithTextCase:value:](self, "localizedMediumMoveMinutesUnitStringWithTextCase:value:", 3, a3);
}

- (id)localizedLongBriskMinutesUnitString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  FIUIBundle(self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("BRISK_MINUTES_UNIT_LONG"), &stru_24CF339D8, CFSTR("Localizable-tinker"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringWithFormat:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedUppercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)localizedLongBriskMinutesUnitStringForValue:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x24BDD17C8];
  FIUIBundle(self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("BRISK_MINUTES_UNIT_LONG"), &stru_24CF339D8, CFSTR("Localizable-tinker"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringWithFormat:", v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedUppercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)localizedLongActiveHoursUnitString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  FIUIBundle(self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ACTIVE_HOURS_UNIT_LONG"), &stru_24CF339D8, CFSTR("Localizable-tinker"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringWithFormat:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedUppercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)localizedLongActiveHoursUnitStringForValue:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x24BDD17C8];
  FIUIBundle(self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("ACTIVE_HOURS_UNIT_LONG"), &stru_24CF339D8, CFSTR("Localizable-tinker"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringWithFormat:", v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedUppercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)localizedShortBriskMinutesUnitString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  FIUIBundle(self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("BRISK_MINUTES_UNIT_SHORT"), &stru_24CF339D8, CFSTR("Localizable-tinker"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringWithFormat:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedUppercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)localizedShortActiveHoursUnitString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  FIUIBundle(self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ACTIVE_HOURS_UNIT_SHORT"), &stru_24CF339D8, CFSTR("Localizable-tinker"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringWithFormat:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedUppercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)localizedLongActiveEnergyUnitString
{
  return -[FIUIFormattingManager localizedLongActiveEnergyUnitStringWithTextCase:](self, "localizedLongActiveEnergyUnitStringWithTextCase:", 3);
}

- (id)localizedLongActiveEnergyUnitStringWithTextCase:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;

  -[FIUIUnitManager userActiveEnergyBurnedUnit](self->_unitManager, "userActiveEnergyBurnedUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIFormattingManager _energyBurnedUnitStringForUnit:useShortString:](self, "_energyBurnedUnitStringForUnit:useShortString:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24CF4F1A0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x24BDBCB20]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "containsObject:", v9);

  if ((v10 & 1) == 0)
  {
    -[FIUIFormattingManager applyTextCase:toString:](self, "applyTextCase:toString:", a3, v6);
    v11 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v11;
  }

  return v6;
}

- (id)localizedLongMoveMinutesUnitStringWithTextCase:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x24BDD17C8];
  FIUIBundle(self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("APPLE_MOVE_TIME_UNIT_LONG"), &stru_24CF339D8, CFSTR("Localizable-tinker"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringWithFormat:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[FIUIFormattingManager applyTextCase:toString:](self, "applyTextCase:toString:", a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)localizedLongMoveMinutesUnitStringWithTextCase:(unint64_t)a3 value:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = (void *)MEMORY[0x24BDD17C8];
  FIUIBundle(self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("APPLE_MOVE_TIME_UNIT_LONG"), &stru_24CF339D8, CFSTR("Localizable-tinker"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringWithFormat:", v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[FIUIFormattingManager applyTextCase:toString:](self, "applyTextCase:toString:", a3, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)localizedMediumMoveMinutesUnitStringWithTextCase:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x24BDD17C8];
  FIUIBundle(self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("APPLE_MOVE_TIME_UNIT_MEDIUM"), &stru_24CF339D8, CFSTR("Localizable-tinker"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringWithFormat:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[FIUIFormattingManager applyTextCase:toString:](self, "applyTextCase:toString:", a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)localizedMediumMoveMinutesUnitStringWithTextCase:(unint64_t)a3 value:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = (void *)MEMORY[0x24BDD17C8];
  FIUIBundle(self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("APPLE_MOVE_TIME_UNIT_MEDIUM"), &stru_24CF339D8, CFSTR("Localizable-tinker"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringWithFormat:", v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[FIUIFormattingManager applyTextCase:toString:](self, "applyTextCase:toString:", a3, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)localizedGoalDescriptionForWorkout:(id)a3 withValue:(id *)a4 appendActivityType:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  __CFString *v21;
  uint64_t v22;
  __CFString *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v35;

  v5 = a5;
  v8 = a3;
  objc_msgSend(v8, "metadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BDD31C0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  FIUILocalizedNameForActivityType(objc_msgSend(v8, "workoutActivityType"), objc_msgSend(v8, "fiui_swimmingLocationType"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fiui_activityType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "workoutActivityType") == 84)
  {
    objc_msgSend(MEMORY[0x24BDD3DC0], "quantityTypeForIdentifier:", *MEMORY[0x24BDD3698]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "statisticsForType:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "maximumQuantity");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValueForUnit:", v17);
    v19 = fabs(v18);

    -[FIUIFormattingManager localizedDepthValue:depthUnit:](self, "localizedDepthValue:depthUnit:", 1, v19);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    -[FIUIFormattingManager localizedStringWithDepthInMeters:depthUnit:](self, "localizedStringWithDepthInMeters:depthUnit:", 1, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = &stru_24CF339D8;
  }
  else
  {
    switch(-[FIUIFormattingManager _effectiveGoalTypeForWorkout:](self, "_effectiveGoalTypeForWorkout:", v8))
    {
      case 0uLL:
      case 3uLL:
        -[FIUIFormattingManager _localizedEnergyDescriptionForWorkout:withValue:appendActivityType:activityTypeString:](self, "_localizedEnergyDescriptionForWorkout:withValue:appendActivityType:activityTypeString:", v8, a4, v5, v12);
        v22 = objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      case 1uLL:
        objc_msgSend(v8, "totalDistance");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = FIUIDistanceTypeForActivityType(v13);
        objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "doubleValueForUnit:", v26);
        -[FIUIFormattingManager localizedStringWithDistanceInMeters:distanceType:unitStyle:](self, "localizedStringWithDistanceInMeters:distanceType:unitStyle:", v25, 0);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        -[FIUIFormattingManager localizedShortUnitStringForDistanceType:](self, "localizedShortUnitStringForDistanceType:", v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "localizedUppercaseString");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        v29 = (void *)MEMORY[0x24BDD17C8];
        FIUIBundle(v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v31;
        if (v5)
        {
          objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("DISTANCE_GOAL_FORMAT"), &stru_24CF339D8, CFSTR("Localizable"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "stringWithFormat:", v33, *a4, v28, v12);
        }
        else
        {
          objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("WORKOUT_STATISTICS_UNIT_FORMAT_NO_SPACE"), &stru_24CF339D8, CFSTR("Localizable"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "stringWithFormat:", v33, *a4, v28, v35);
        }
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue();

        break;
      case 2uLL:
        -[FIUIFormattingManager _localizedTimeDescriptionForWorkout:withValue:appendActivityType:activityTypeString:](self, "_localizedTimeDescriptionForWorkout:withValue:appendActivityType:activityTypeString:", v8, a4, v5, v12);
        v22 = objc_claimAutoreleasedReturnValue();
LABEL_9:
        v23 = (__CFString *)v22;
        break;
      default:
        v23 = &stru_24CF339D8;
        break;
    }
    v21 = v23;
    v20 = v21;
  }

  return v20;
}

- (id)localizedGoalValueForWorkout:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  FIUIFormattingManager *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v17;
  void *v18;

  v4 = a3;
  objc_msgSend(v4, "fiui_activityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "workoutActivityType") == 84)
  {
    objc_msgSend(MEMORY[0x24BDD3DC0], "quantityTypeForIdentifier:", *MEMORY[0x24BDD3698]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "statisticsForType:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v7, "maximumQuantity");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "doubleValueForUnit:", v9);
      v11 = fabs(v10);

    }
    else
    {
      v11 = 0.0;
    }
    -[FIUIUnitManager userDepthHKUnit](self->_unitManager, "userDepthHKUnit");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 == v14)
      v15 = 1;
    else
      v15 = 2;

    -[FIUIFormattingManager localizedDepthValue:depthUnit:](self, "localizedDepthValue:depthUnit:", v15, v11);
    v12 = (FIUIFormattingManager *)objc_claimAutoreleasedReturnValue();
LABEL_11:
    self = v12;
LABEL_12:

  }
  else
  {
    switch(-[FIUIFormattingManager _effectiveGoalTypeForWorkout:](self, "_effectiveGoalTypeForWorkout:", v4))
    {
      case 0uLL:
      case 3uLL:
        objc_msgSend(v4, "totalEnergyBurned");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[FIUIFormattingManager localizedStringWithActiveEnergy:unitStyle:](self, "localizedStringWithActiveEnergy:unitStyle:", v7, 0);
        v12 = (FIUIFormattingManager *)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      case 1uLL:
        objc_msgSend(v4, "totalDistance");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = FIUIDistanceTypeForActivityType(v5);
        objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "doubleValueForUnit:", v18);
        -[FIUIFormattingManager localizedStringWithDistanceInMeters:distanceType:unitStyle:](self, "localizedStringWithDistanceInMeters:distanceType:unitStyle:", v17, 0);
        self = (FIUIFormattingManager *)objc_claimAutoreleasedReturnValue();

        goto LABEL_12;
      case 2uLL:
        -[FIUIFormattingManager _localizedTimeValueForWorkout:](self, "_localizedTimeValueForWorkout:", v4);
        self = (FIUIFormattingManager *)objc_claimAutoreleasedReturnValue();
        break;
      default:
        break;
    }
  }

  return self;
}

- (id)localizedGoalUnitForWorkout:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  __CFString *v12;

  v4 = a3;
  objc_msgSend(v4, "fiui_activityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "workoutActivityType") == 84)
  {
    -[FIUIUnitManager userDepthHKUnit](self->_unitManager, "userDepthHKUnit");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
      v8 = 1;
    else
      v8 = 2;

    -[FIUIFormattingManager localizedDepthUnit:](self, "localizedDepthUnit:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v10 = -[FIUIFormattingManager _effectiveGoalTypeForWorkout:](self, "_effectiveGoalTypeForWorkout:", v4);
  if (!v10 || v10 == 3)
  {
    -[FIUIFormattingManager localizedShortActiveEnergyUnitString](self, "localizedShortActiveEnergyUnitString");
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v12 = (__CFString *)v9;
    goto LABEL_12;
  }
  if (v10 == 1)
  {
    -[FIUIFormattingManager localizedShortUnitStringForDistanceType:](self, "localizedShortUnitStringForDistanceType:", FIUIDistanceTypeForActivityType(v5));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedUppercaseString");
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = &stru_24CF339D8;
  }
LABEL_12:

  return v12;
}

- (id)_localizedTimeDescriptionForWorkout:(id)a3 withValue:(id *)a4 appendActivityType:(BOOL)a5 activityTypeString:(id)a6
{
  _BOOL4 v6;
  id v10;
  long double v11;
  double v12;
  double v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v6 = a5;
  v10 = a6;
  objc_msgSend(a3, "duration");
  v12 = v11;
  v13 = fmod(v11, 60.0);
  if (v13 < 30.0)
    v13 = -v13;
  -[FIUIFormattingManager stringWithDuration:durationFormat:](self, "stringWithDuration:durationFormat:", 4, v12 + v13);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  *a4 = v14;
  if (v6)
  {
    v15 = (void *)MEMORY[0x24BDD17C8];
    FIUIBundle(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("TIME_GOAL_FORMAT"), &stru_24CF339D8, CFSTR("Localizable"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", v17, *a4, v10);
    v18 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = v14;
  }

  return v18;
}

- (id)_localizedTimeValueForWorkout:(id)a3
{
  long double v4;
  double v5;
  double v6;

  objc_msgSend(a3, "duration");
  v5 = v4;
  v6 = fmod(v4, 60.0);
  if (v6 < 30.0)
    v6 = -v6;
  return -[FIUIFormattingManager stringWithDuration:durationFormat:](self, "stringWithDuration:durationFormat:", 4, v5 + v6);
}

- (id)_localizedEnergyDescriptionForWorkout:(id)a3 withValue:(id *)a4 appendActivityType:(BOOL)a5 activityTypeString:(id)a6
{
  _BOOL4 v6;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;

  v6 = a5;
  v10 = a6;
  objc_msgSend(a3, "totalEnergyBurned");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIFormattingManager localizedStringWithActiveEnergy:unitStyle:](self, "localizedStringWithActiveEnergy:unitStyle:", v11, 0);
  *a4 = (id)objc_claimAutoreleasedReturnValue();
  -[FIUIFormattingManager localizedShortActiveEnergyUnitString](self, "localizedShortActiveEnergyUnitString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x24BDD17C8];
  FIUIBundle(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v6)
  {
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("ENERGY_GOAL_FORMAT"), &stru_24CF339D8, CFSTR("Localizable"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", v16, *a4, v12, v10);
  }
  else
  {
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("WORKOUT_STATISTICS_UNIT_FORMAT_NO_SPACE"), &stru_24CF339D8, CFSTR("Localizable"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", v16, *a4, v12, v19);
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (unint64_t)_effectiveGoalTypeForWorkout:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  _BOOL4 v18;
  double v19;

  v4 = a3;
  objc_msgSend(v4, "sourceRevision");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "source");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "_isAppleWatch") & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v4, "sourceRevision");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "source");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v9, "_hasFirstPartyBundleID");

  }
  v10 = objc_msgSend(v4, "_goalType");
  objc_msgSend(v4, "workoutActivityType");
  _HKWorkoutDistanceTypeForActivityType();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "statisticsForType:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "sumQuantity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValueForUnit:", v14);
  v16 = v15;

  if (v7)
  {
    if (!v10)
    {
      if (!-[FIUIFormattingManager _workoutSupportsDistanceMetricForGoalDisplay:](self, "_workoutSupportsDistanceMetricForGoalDisplay:", v4)|| v16 <= 2.22044605e-16)
      {
        objc_msgSend(v4, "totalEnergyBurned");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17 == 0;

        v10 = 2 * v18;
        goto LABEL_14;
      }
LABEL_10:
      v10 = 1;
    }
  }
  else
  {
    if (v16 > 2.22044605e-16)
      goto LABEL_10;
    objc_msgSend(v4, "duration");
    if (v19 <= 2.22044605e-16)
      v10 = 3;
    else
      v10 = 2;
  }
LABEL_14:

  return v10;
}

- (BOOL)_workoutSupportsDistanceMetricForGoalDisplay:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if (objc_msgSend(v3, "workoutActivityType") == 82 || objc_msgSend(v3, "workoutActivityType") == 21)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "supportsMetric:", 1);

  return v4;
}

- (id)localizedCompactGoalDescriptionForGoalType:(unint64_t)a3 goalValue:(double)a4 activityType:(id)a5
{
  void *v5;
  void *v6;

  -[FIUIFormattingManager localizedGoalDescriptionForGoalType:goalValue:activityType:](self, "localizedGoalDescriptionForGoalType:goalValue:activityType:", a3, a5, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_24CF339D8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)localizedKeyMetricStringForWorkout:(id)a3 unitStyle:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;

  v6 = a3;
  switch(objc_msgSend(v6, "_goalType"))
  {
    case 0:
      -[FIUIFormattingManager _localizedOpenGoalKeyMetricStringForWorkout:withUnitStyle:](self, "_localizedOpenGoalKeyMetricStringForWorkout:withUnitStyle:", v6, a4);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1:
      -[FIUIFormattingManager _localizedKeyMetricDistanceStringForWorkout:withUnitStyle:](self, "_localizedKeyMetricDistanceStringForWorkout:withUnitStyle:", v6, a4);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2:
      -[FIUIFormattingManager _localizedKeyMetricDurationStringWithWorkout:](self, "_localizedKeyMetricDurationStringWithWorkout:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3:
      -[FIUIFormattingManager _localizedKeyMetricEnergyBurnedStringForWorkout:withUnitStyle:](self, "_localizedKeyMetricEnergyBurnedStringForWorkout:withUnitStyle:", v6, a4);
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v8 = (void *)v7;
      break;
    default:
      v8 = 0;
      break;
  }

  return v8;
}

- (id)_localizedKeyMetricEnergyBurnedStringForWorkout:(id)a3 withUnitStyle:(unint64_t)a4
{
  void *v6;
  void *v7;

  objc_msgSend(a3, "totalEnergyBurned");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIFormattingManager localizedStringWithActiveEnergy:unitStyle:](self, "localizedStringWithActiveEnergy:unitStyle:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_localizedKeyMetricDistanceStringForWorkout:(id)a3 withUnitStyle:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;

  v6 = a3;
  objc_msgSend(v6, "totalDistance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValueForUnit:", v8);
  v10 = v9;
  objc_msgSend(v6, "fiui_activityType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[FIUIFormattingManager localizedNaturalScaleStringWithDistanceInMeters:distanceType:unitStyle:usedUnit:](self, "localizedNaturalScaleStringWithDistanceInMeters:distanceType:unitStyle:usedUnit:", FIUIDistanceTypeForActivityType(v11), a4, 0, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_localizedKeyMetricDurationStringWithWorkout:(id)a3
{
  objc_msgSend(a3, "duration");
  return -[FIUIFormattingManager stringWithDuration:durationFormat:](self, "stringWithDuration:durationFormat:", 4);
}

- (id)_localizedKeyMetricCyclingStringWithWorkout:(id)a3 withUnitStyle:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  void *v15;

  v6 = a3;
  objc_msgSend(v6, "totalDistance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValueForUnit:", v8);
  v10 = v9;

  objc_msgSend(v6, "metadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD31C0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  if ((v13 & 1) != 0 || v10 <= 2.22044605e-16)
  {
    -[FIUIFormattingManager _localizedKeyMetricEnergyBurnedStringForWorkout:withUnitStyle:](self, "_localizedKeyMetricEnergyBurnedStringForWorkout:withUnitStyle:", v6, a4);
    v14 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[FIUIFormattingManager _localizedKeyMetricDistanceStringForWorkout:withUnitStyle:](self, "_localizedKeyMetricDistanceStringForWorkout:withUnitStyle:", v6, a4);
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)v14;

  return v15;
}

- (id)_localizedOpenGoalKeyMetricStringForWorkout:(id)a3 withUnitStyle:(unint64_t)a4
{
  id v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;

  v6 = a3;
  v7 = objc_msgSend(v6, "workoutActivityType");
  if (v7 <= 0x34)
  {
    if (((1 << v7) & 0x10402001000000) != 0)
    {
      -[FIUIFormattingManager _localizedKeyMetricDistanceStringForWorkout:withUnitStyle:](self, "_localizedKeyMetricDistanceStringForWorkout:withUnitStyle:", v6, a4);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    if (v7 == 13)
    {
      -[FIUIFormattingManager _localizedKeyMetricCyclingStringWithWorkout:withUnitStyle:](self, "_localizedKeyMetricCyclingStringWithWorkout:withUnitStyle:", v6, a4);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
  }
  if (v7 == 3000)
    -[FIUIFormattingManager _localizedKeyMetricDurationStringWithWorkout:](self, "_localizedKeyMetricDurationStringWithWorkout:", v6);
  else
    -[FIUIFormattingManager _localizedKeyMetricEnergyBurnedStringForWorkout:withUnitStyle:](self, "_localizedKeyMetricEnergyBurnedStringForWorkout:withUnitStyle:", v6, a4);
  v8 = objc_claimAutoreleasedReturnValue();
LABEL_10:
  v9 = (void *)v8;

  return v9;
}

- (id)localizedShareTextWithWorkout:(id)a3 shareValue:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  uint64_t v23;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDD31C0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  v10 = objc_msgSend(v5, "workoutActivityType");
  if (v10 > 43)
  {
    switch(v10)
    {
      case '9':
        v11 = CFSTR("WORKOUT_SHARING_YOGA_%@");
        goto LABEL_34;
      case ':':
      case '<':
      case '=':
      case '>':
      case '@':
      case 'C':
      case 'D':
      case 'E':
      case 'I':
      case 'J':
      case 'K':
      case 'L':
      case 'N':
      case 'O':
        goto LABEL_23;
      case ';':
        v11 = CFSTR("WORKOUT_SHARING_CORE_TRAINING_%@");
        goto LABEL_34;
      case '?':
        v11 = CFSTR("WORKOUT_SHARING_HIGH_INTENSITY_INTERVAL_TRAINING_%@");
        goto LABEL_34;
      case 'A':
        v11 = CFSTR("WORKOUT_SHARING_KICKBOXING_%@");
        goto LABEL_34;
      case 'B':
        v11 = CFSTR("WORKOUT_SHARING_PILATES_%@");
        goto LABEL_34;
      case 'F':
        v11 = CFSTR("WORKOUT_SHARING_WHEELCHAIR_WALK_PACE_%@");
        goto LABEL_34;
      case 'G':
        v11 = CFSTR("WORKOUT_SHARING_WHEELCHAIR_RUN_PACE_%@");
        goto LABEL_34;
      case 'H':
        v11 = CFSTR("WORKOUT_SHARING_TAI_CHI_%@");
        goto LABEL_34;
      case 'M':
        v11 = CFSTR("WORKOUT_SHARING_CARDIO_DANCE_%@");
        goto LABEL_34;
      case 'P':
        v11 = CFSTR("WORKOUT_SHARING_COOLDOWN_%@");
        goto LABEL_34;
      default:
        if (v10 == 44)
        {
          v11 = CFSTR("WORKOUT_SHARING_STEPPER_%@");
          goto LABEL_34;
        }
        if (v10 != 52)
          goto LABEL_23;
        v12 = CFSTR("WORKOUT_SHARING_OUTDOOR_WALKING_%@");
        v13 = CFSTR("WORKOUT_SHARING_INDOOR_WALKING_%@");
        break;
    }
    goto LABEL_17;
  }
  if (v10 > 23)
  {
    if (v10 == 24)
    {
      v11 = CFSTR("WORKOUT_SHARING_HIKING_%@");
      goto LABEL_34;
    }
    if (v10 == 35)
    {
      v11 = CFSTR("WORKOUT_SHARING_ROWING_%@");
      goto LABEL_34;
    }
    if (v10 != 37)
      goto LABEL_23;
    v12 = CFSTR("WORKOUT_SHARING_OUTDOOR_RUNNING_%@");
    v13 = CFSTR("WORKOUT_SHARING_INDOOR_RUNNING_%@");
  }
  else
  {
    if (v10 != 13)
    {
      if (v10 == 16)
      {
        v11 = CFSTR("WORKOUT_SHARING_ELLIPTICAL_%@");
        goto LABEL_34;
      }
      if (v10 == 20)
      {
        v11 = CFSTR("WORKOUT_SHARING_FUNCTIONAL_STRENGTH_TRAINING_%@");
        goto LABEL_34;
      }
LABEL_23:
      v11 = CFSTR("WORKOUT_SHARING_OTHER_%@");
      goto LABEL_34;
    }
    v12 = CFSTR("WORKOUT_SHARING_OUTDOOR_CYCLING_%@");
    v13 = CFSTR("WORKOUT_SHARING_INDOOR_CYCLING_%@");
  }
LABEL_17:
  if (v9)
    v11 = v13;
  else
    v11 = v12;
LABEL_34:
  v14 = (void *)MEMORY[0x24BDD17C8];
  FIUIBundle(v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", v11, &stru_24CF339D8, CFSTR("Localizable"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", v16, v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "workoutActivityType") == 46)
  {
    v18 = objc_msgSend(v5, "fiui_swimmingLocationType");
    if (v18 == 2)
    {
      FIUIBundle(2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      v21 = CFSTR("WORKOUT_SHARING_OPEN_WATER_SWIMMING_%@");
    }
    else if (v18 == 1)
    {
      FIUIBundle(1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      v21 = CFSTR("WORKOUT_SHARING_POOL_SWIMMING_%@");
    }
    else
    {
      if (v18)
      {
        v22 = 0;
        goto LABEL_43;
      }
      FIUIBundle(0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      v21 = CFSTR("WORKOUT_SHARING_SWIMMING_UNKNOWN_LOCATION_%@");
    }
    objc_msgSend(v19, "localizedStringForKey:value:table:", v21, &stru_24CF339D8, CFSTR("Localizable-Ariel"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_43:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v22, CFSTR("%@"), 0, v6);
    v23 = objc_claimAutoreleasedReturnValue();

    v17 = (void *)v23;
  }

  return v17;
}

- (id)localizedPaceValueForSplit:(id)a3 activityType:(id)a4
{
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  void *v16;

  v6 = (void *)MEMORY[0x24BDD3E50];
  v7 = (void *)MEMORY[0x24BDD4048];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "meterUnit");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "distanceInMeters");
  objc_msgSend(v6, "quantityWithUnit:doubleValue:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = FIUIPaceFormatForWorkoutActivityType(v8);
  v13 = FIUIDistanceTypeForActivityType(v8);

  objc_msgSend(v9, "duration");
  v15 = v14;

  -[FIUIFormattingManager localizedPaceStringWithDistance:overDuration:paceFormat:distanceType:](self, "localizedPaceStringWithDistance:overDuration:paceFormat:distanceType:", v11, v12, v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)localizedTitleForSplit:(id)a3 unit:(id)a4 lapIndex:(int64_t)a5 useShortFormat:(BOOL)a6
{
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;

  if (a6)
    v7 = 1;
  else
    v7 = 3;
  v8 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&__formatterLock);
  _LengthFormatter((void *)1, v7, 2, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(MEMORY[0x24BDD4048], "lengthFormatterUnitFromUnit:", v8);

  objc_msgSend(v9, "unitStringFromValue:unit:", v10, 1.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedCapitalizedString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock((os_unfair_lock_t)&__formatterLock);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a5 + 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[FIUIFormattingManager stringWithNumber:decimalPrecision:](FIUIFormattingManager, "stringWithNumber:decimalPrecision:", v13, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x24BDD17C8];
  FIUIBundle(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("PACE_SECTION_ORDER"), &stru_24CF339D8, CFSTR("Localizable"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", v18, v12, v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)localizedStringWithHeartRate:(id)a3
{
  return -[FIUIFormattingManager localizedStringWithHeartRate:unitStyle:requirePositiveValue:](self, "localizedStringWithHeartRate:unitStyle:requirePositiveValue:", a3, 0, 1);
}

- (id)localizedStringWithHeartRate:(id)a3 unitStyle:(unint64_t)a4
{
  return -[FIUIFormattingManager localizedStringWithHeartRate:unitStyle:requirePositiveValue:](self, "localizedStringWithHeartRate:unitStyle:requirePositiveValue:", a3, a4, 1);
}

- (id)localizedStringWithHeartRate:(id)a3 unitStyle:(unint64_t)a4 requirePositiveValue:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v5 = a5;
  v8 = (void *)MEMORY[0x24BDD4048];
  v9 = a3;
  objc_msgSend(v8, "_countPerMinuteUnit");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValueForUnit:", v10);
  v12 = v11;

  -[FIUIFormattingManager localizedStringWithBeatsPerMinute:requirePositiveValue:](self, "localizedStringWithBeatsPerMinute:requirePositiveValue:", v5, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (a4)
  {
    v15 = (void *)MEMORY[0x24BDD17C8];
    FIUIBundle(v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("HEART_RATE_FORMAT"), &stru_24CF339D8, CFSTR("Localizable"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[FIUIFormattingManager localizedHeartRateUnitString](self, "localizedHeartRateUnitString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", v17, v14, v18);
    v19 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = v13;
  }

  return v19;
}

- (id)localizedStringWithBeatsPerMinute:(double)a3
{
  return -[FIUIFormattingManager localizedStringWithBeatsPerMinute:requirePositiveValue:](self, "localizedStringWithBeatsPerMinute:requirePositiveValue:", 1, a3);
}

- (id)localizedStringWithBeatsPerMinute:(double)a3 requirePositiveValue:(BOOL)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  if (a3 <= 2.22044605e-16 && a4)
  {
    FIUIBundle(self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("HEART_RATE_NOVALUE"), &stru_24CF339D8, CFSTR("Localizable"));
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)objc_opt_class();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithNumber:decimalPrecision:roundingMode:", v5, 1, 6);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v6;

  return v8;
}

- (id)localizedHeartRateUnitString
{
  void *v2;
  void *v3;

  FIUIBundle(self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("BPM"), &stru_24CF339D8, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)localizedDistanceByStrokeStyle:(id)a3 isPoolSwim:(BOOL)a4
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  _BOOL4 v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[4];
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v25 = a4;
  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __67__FIUIFormattingManager_localizedDistanceByStrokeStyle_isPoolSwim___block_invoke;
  v33[3] = &unk_24CF31C70;
  v26 = v4;
  v34 = v26;
  objc_msgSend(v5, "sortedArrayUsingComparator:", v33);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v8 = v6;
  v27 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v27)
  {
    v23 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v30 != v23)
          objc_enumerationMutation(v8);
        v10 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v26, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        FIUILocalizedStrokeStyleName(objc_msgSend(v10, "integerValue"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "doubleValueForUnit:", v13);
          -[FIUIFormattingManager localizedStringWithDistanceInMeters:distanceType:unitStyle:](self, "localizedStringWithDistanceInMeters:distanceType:unitStyle:", 3, 1);
        }
        else
        {
          v28 = 0;
          objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "doubleValueForUnit:", v13);
          -[FIUIFormattingManager localizedNaturalScaleStringWithDistanceInMeters:distanceType:unitStyle:usedUnit:](self, "localizedNaturalScaleStringWithDistanceInMeters:distanceType:unitStyle:usedUnit:", 4, 1, &v28);
        }
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = (void *)MEMORY[0x24BDD17C8];
        FIUIBundle(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("SUMMARY_SWIM_DISTANCE_FORMAT_%@_%@"), &stru_24CF339D8, CFSTR("Localizable"));
        v18 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "localizedStringWithFormat:", v18, v12, v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "firstObject");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v18) = objc_msgSend(v10, "isEqualToNumber:", v20);

        if ((v18 & 1) == 0)
          objc_msgSend(v7, "appendString:", CFSTR("\n"));
        objc_msgSend(v7, "appendString:", v19);

      }
      v27 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v27);
  }

  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithString:", v7);
  return v21;
}

uint64_t __67__FIUIFormattingManager_localizedDistanceByStrokeStyle_isPoolSwim___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "compare:", v8);
  return v9;
}

- (id)localizedInSessionDescriptionForElevation:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[FIUIFormattingManager localizedShortUnitStringForDistanceUnit:textCase:](self, "localizedShortUnitStringForDistanceUnit:textCase:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  FIUIBundle(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("IN_SESSION_ELEVATION_DESCRIPTION"), &stru_24CF339D8, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v6, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)localizedInSessionDescriptionForGroundElevation:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[FIUIFormattingManager localizedShortUnitStringForDistanceUnit:textCase:](self, "localizedShortUnitStringForDistanceUnit:textCase:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  FIUIBundle(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("IN_SESSION_GROUND_ELEVATION_DESCRIPTION"), &stru_24CF339D8, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v6, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)localizedStringForMetricType:(unint64_t)a3 paceFormat:(int64_t)a4
{
  __CFString *v4;
  unint64_t v5;
  __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;

  v4 = &stru_24CF339D8;
  v5 = a3 - 1;
  v6 = CFSTR("METRIC_ROLLING_PACE");
  v7 = CFSTR("METRIC_ACTIVE_ENERGY");
  switch(v5)
  {
    case 0uLL:
      v6 = CFSTR("METRIC_DISTANCE");
      goto LABEL_20;
    case 1uLL:
      goto LABEL_9;
    case 2uLL:
      v6 = CFSTR("METRIC_DURATION");
      goto LABEL_20;
    case 3uLL:
      v8 = CFSTR("METRIC_CURRENT_PACE");
      v9 = CFSTR("METRIC_CURRENT_SPEED");
      goto LABEL_12;
    case 4uLL:
      v6 = CFSTR("METRIC_HEART_RATE");
      goto LABEL_20;
    case 5uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
      return v4;
    case 6uLL:
      v7 = CFSTR("METRIC_TOTAL_ENERGY");
LABEL_9:
      -[FIUIFormattingManager localizationKeyForEnergyBaseKey:](self, "localizationKeyForEnergyBaseKey:", v7, a4);
      self = (FIUIFormattingManager *)objc_claimAutoreleasedReturnValue();
      v6 = (__CFString *)self;
      if (!self)
        return v4;
      goto LABEL_20;
    case 7uLL:
      v8 = CFSTR("METRIC_AVERAGE_PACE");
      v9 = CFSTR("METRIC_AVERAGE_SPEED");
      goto LABEL_12;
    case 8uLL:
      v6 = CFSTR("METRIC_LAPS");
      goto LABEL_20;
    case 9uLL:
      v6 = CFSTR("METRIC_ELEVATION");
      goto LABEL_20;
    case 0xDuLL:
      goto LABEL_20;
    case 0xEuLL:
      v6 = CFSTR("METRIC_CURRENT_CADENCE");
      goto LABEL_20;
    case 0xFuLL:
      v6 = CFSTR("METRIC_AVERAGE_CADENCE");
      goto LABEL_20;
    case 0x10uLL:
      v6 = CFSTR("METRIC_GROUND_ELEVATION");
      goto LABEL_20;
    default:
      if (CFSTR("METRIC_ACTIVE_ENERGY") != (__CFString *)48)
        return v4;
      v8 = CFSTR("METRIC_FASTEST_PACE");
      v9 = CFSTR("METRIC_MAX_SPEED");
LABEL_12:
      if (a4 == 4)
        v6 = (__CFString *)v9;
      else
        v6 = (__CFString *)v8;
LABEL_20:
      FIUIBundle(self);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringForKey:value:table:", v6, &stru_24CF339D8, CFSTR("Localizable"));
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

      return v4;
  }
}

- (id)localizedGoalDescriptionForDive:(id)a3 healthStore:(id)a4 outValue:(id *)a5
{
  void *v6;
  void *v7;

  -[FIUIDepthFormatter formatGoalValueForDive:healthStore:](self->_depthFormatter, "formatGoalValueForDive:healthStore:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "goalValue");
  *a5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "goalString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)beyondLimitStringForDepthUnit:(unint64_t)a3 includeUnits:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;

  v4 = a4;
  FIUIBundle(self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = CFSTR("WORKOUT_DEPTH_BEYOND_40M_NO_UNIT");
  if (a3 == 2)
    v8 = CFSTR("WORKOUT_DEPTH_BEYOND_130FT_NO_UNIT");
  v9 = CFSTR("WORKOUT_DEPTH_BEYOND_130FT");
  if (a3 != 2)
    v9 = CFSTR("WORKOUT_DEPTH_BEYOND_40M");
  if (v4)
    v10 = v9;
  else
    v10 = v8;
  objc_msgSend(v6, "localizedStringForKey:value:table:", v10, &stru_24CF339D8, CFSTR("Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)localizedStringWithDepthInMeters:(double)a3 depthUnit:(unint64_t)a4
{
  return -[FIUIDepthFormatter formatMaxDepth:unit:](self->_depthFormatter, "formatMaxDepth:unit:", a4, a3);
}

- (id)localizedDepthValue:(double)a3 depthUnit:(unint64_t)a4
{
  return -[FIUIDepthFormatter formatDepthValue:unit:](self->_depthFormatter, "formatDepthValue:unit:", a4, a3);
}

- (id)localizedDepthUnit:(unint64_t)a3
{
  uint64_t v3;
  void *v4;
  void *v5;

  if (a3 == 1)
    v3 = 1;
  else
    v3 = 5;
  -[FIUIFormattingManager localizedShortUnitStringForDistanceUnit:](self, "localizedShortUnitStringForDistanceUnit:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedUppercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)localizedWaterTemperatureRangeWithColdest:(double)a3 hottest:(double)a4
{
  return -[FIUIDepthFormatter formatWaterTemperatureRangeWithLower:upper:](self->_depthFormatter, "formatWaterTemperatureRangeWithLower:upper:", a3, a4);
}

- (id)localizedWaterTemperatureValue:(double)a3
{
  return -[FIUIDepthFormatter formatWaterTemperatureValue:](self->_depthFormatter, "formatWaterTemperatureValue:", a3);
}

- (id)localizedUnderwaterTime:(double)a3
{
  return -[FIUIDepthFormatter formatUnderwaterTime:](self->_depthFormatter, "formatUnderwaterTime:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_depthFormatter, 0);
  objc_storeStrong((id *)&self->_unitManager, 0);
}

@end
