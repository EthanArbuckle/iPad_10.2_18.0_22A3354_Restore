@implementation _INPBWellnessUnitType

- (void)setBloodGlucoseUnit:(int)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_WORD *)&self->_has = has & 0xFFFE;
  }
  else
  {
    *(_WORD *)&self->_has = has | 1;
    self->_bloodGlucoseUnit = a3;
  }
}

- (BOOL)hasBloodGlucoseUnit
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasBloodGlucoseUnit:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (id)bloodGlucoseUnitAsString:(int)a3
{
  if (a3 < 3)
    return *(&off_1E228D868 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsBloodGlucoseUnit:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_BLOOD_GLUCOSE_UNIT")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MGDL")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("MMOLL")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setBloodPressureUnit:(int)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_WORD *)&self->_has = has & 0xFFFD;
  }
  else
  {
    *(_WORD *)&self->_has = has | 2;
    self->_bloodPressureUnit = a3;
  }
}

- (BOOL)hasBloodPressureUnit
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasBloodPressureUnit:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (id)bloodPressureUnitAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("UNKNOWN_BLOOD_PRESSURE_UNIT");
  if (a3 == 1)
  {
    v3 = CFSTR("MMHG");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsBloodPressureUnit:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_BLOOD_PRESSURE_UNIT")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("MMHG"));

  return v4;
}

- (void)setEnergyUnit:(int)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_WORD *)&self->_has = has & 0xFFFB;
  }
  else
  {
    *(_WORD *)&self->_has = has | 4;
    self->_energyUnit = a3;
  }
}

- (BOOL)hasEnergyUnit
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasEnergyUnit:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (id)energyUnitAsString:(int)a3
{
  if (a3 < 6)
    return *(&off_1E228D880 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsEnergyUnit:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_ENERGY_UNIT")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KILOJOULE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("JOULE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KILOCALORIE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CALORIE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("KILOWATT_HOUR")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setHeartRateUnit:(int)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_WORD *)&self->_has = has & 0xFFF7;
  }
  else
  {
    *(_WORD *)&self->_has = has | 8;
    self->_heartRateUnit = a3;
  }
}

- (BOOL)hasHeartRateUnit
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasHeartRateUnit:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (id)heartRateUnitAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("UNKNOWN_HEART_RATE_UNIT");
  if (a3 == 1)
  {
    v3 = CFSTR("BPM");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsHeartRateUnit:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_HEART_RATE_UNIT")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("BPM"));

  return v4;
}

- (void)setLengthUnit:(int)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_WORD *)&self->_has = has & 0xFFEF;
  }
  else
  {
    *(_WORD *)&self->_has = has | 0x10;
    self->_lengthUnit = a3;
  }
}

- (BOOL)hasLengthUnit
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasLengthUnit:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (id)lengthUnitAsString:(int)a3
{
  if ((a3 - 1) < 0x16)
    return *(&off_1E228D8B0 + (a3 - 1));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsLengthUnit:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("METERS")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MILES")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CENTIMETER")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FOOT")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INCH")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("YARD")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KILOMETER")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MEGAMETER")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HECTOMETER")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DECAMETER")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DECIMETER")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MILLIMETER")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MICROMETER")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NANOMETER")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PICOMETER")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SCANDINAVIAN_MILE")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LIGHTYEAR")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NAUTICAL_MILE")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FATHOM")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FURLONG")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ASTRONOMICAL_UNIT")) & 1) != 0)
  {
    v4 = 21;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PARSEC")))
  {
    v4 = 22;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setMassUnit:(int)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_WORD *)&self->_has = has & 0xFFDF;
  }
  else
  {
    *(_WORD *)&self->_has = has | 0x20;
    self->_massUnit = a3;
  }
}

- (BOOL)hasMassUnit
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasMassUnit:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (id)massUnitAsString:(int)a3
{
  if (a3 < 0x11)
    return *(&off_1E228D960 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsMassUnit:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_MASS_UNIT")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KILOGRAM")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GRAM")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DECIGRAM")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CENTIGRAM")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MILLIGRAM")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MICROGRAM")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NANOGRAM")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PICOGRAM")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OUNCE")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POUND")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STONE")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("METRIC_TONNE")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHORT_TONNE")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARATS")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OUNCE_TROY")) & 1) != 0)
  {
    v4 = 15;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SLUG")))
  {
    v4 = 16;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setRespiratoryRateUnit:(int)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_WORD *)&self->_has = has & 0xFFBF;
  }
  else
  {
    *(_WORD *)&self->_has = has | 0x40;
    self->_respiratoryRateUnit = a3;
  }
}

- (BOOL)hasRespiratoryRateUnit
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasRespiratoryRateUnit:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (id)respiratoryRateUnitAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("UNKNOWN_RESPIRATORY_RATE_UNIT");
  if (a3 == 1)
  {
    v3 = CFSTR("BREATHMIN");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsRespiratoryRateUnit:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_RESPIRATORY_RATE_UNIT")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("BREATHMIN"));

  return v4;
}

- (void)setTemperatureUnit:(int)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_WORD *)&self->_has = has & 0xFF7F;
  }
  else
  {
    *(_WORD *)&self->_has = has | 0x80;
    self->_temperatureUnit = a3;
  }
}

- (BOOL)hasTemperatureUnit
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasTemperatureUnit:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (id)temperatureUnitAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return *(&off_1E228D9E8 + (a3 - 1));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTemperatureUnit:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CELSIUS")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FAHRENHEIT")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("KELVIN")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setTimeUnit:(int)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_WORD *)&self->_has = has & 0xFEFF;
  }
  else
  {
    *(_WORD *)&self->_has = has | 0x100;
    self->_timeUnit = a3;
  }
}

- (BOOL)hasTimeUnit
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasTimeUnit:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (id)timeUnitAsString:(int)a3
{
  if (a3 < 8)
    return *(&off_1E228DA00 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTimeUnit:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_TIME_UNIT")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SECOND")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MINUTE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HOUR")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DAY")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WEEK")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MONTH")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("YEAR")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setVolumeUnit:(int)a3
{
  __int16 has;

  has = (__int16)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_WORD *)&self->_has = has & 0xFDFF;
  }
  else
  {
    *(_WORD *)&self->_has = has | 0x200;
    self->_volumeUnit = a3;
  }
}

- (BOOL)hasVolumeUnit
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHasVolumeUnit:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (id)volumeUnitAsString:(int)a3
{
  if (a3 < 0x1D)
    return *(&off_1E228DA40 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsVolumeUnit:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_VOLUME_UNIT")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MEGALITER")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KILOLITER")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LITER")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DECILITER")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CENTILITER")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MILLILITER")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CUBIC_KILOMETER")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CUBIC_DECIMETER")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CUBIC_MILLIMETER")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CUBIC_INCH")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CUBIC_FEET")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CUBIC_YARD")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CUBIC_MILE")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ACRE_FOEET")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BUSHEL")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TEASPOON")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TABLESPOON")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FLUID_OUNCE")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CUP")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PINT")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("QUART")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GALLON")) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IMPERIAL_TEASPOON")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IMPERIAL_QUART")) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IMPERIAL_GALLON")) & 1) != 0)
  {
    v4 = 25;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("METRIC_CUP")) & 1) != 0)
  {
    v4 = 26;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CUBIC_CENTIMETER")) & 1) != 0)
  {
    v4 = 27;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CUBIC_METER")))
  {
    v4 = 28;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBWellnessUnitTypeReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (-[_INPBWellnessUnitType hasBloodGlucoseUnit](self, "hasBloodGlucoseUnit"))
    PBDataWriterWriteInt32Field();
  if (-[_INPBWellnessUnitType hasBloodPressureUnit](self, "hasBloodPressureUnit"))
    PBDataWriterWriteInt32Field();
  if (-[_INPBWellnessUnitType hasEnergyUnit](self, "hasEnergyUnit"))
    PBDataWriterWriteInt32Field();
  if (-[_INPBWellnessUnitType hasHeartRateUnit](self, "hasHeartRateUnit"))
    PBDataWriterWriteInt32Field();
  if (-[_INPBWellnessUnitType hasLengthUnit](self, "hasLengthUnit"))
    PBDataWriterWriteInt32Field();
  if (-[_INPBWellnessUnitType hasMassUnit](self, "hasMassUnit"))
    PBDataWriterWriteInt32Field();
  if (-[_INPBWellnessUnitType hasRespiratoryRateUnit](self, "hasRespiratoryRateUnit"))
    PBDataWriterWriteInt32Field();
  if (-[_INPBWellnessUnitType hasTemperatureUnit](self, "hasTemperatureUnit"))
    PBDataWriterWriteInt32Field();
  if (-[_INPBWellnessUnitType hasTimeUnit](self, "hasTimeUnit"))
    PBDataWriterWriteInt32Field();
  if (-[_INPBWellnessUnitType hasVolumeUnit](self, "hasVolumeUnit"))
    PBDataWriterWriteInt32Field();

}

- (_INPBWellnessUnitType)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBWellnessUnitType *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBWellnessUnitType *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBWellnessUnitType *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBWellnessUnitType initWithData:](self, "initWithData:", v6);

    v6 = self;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_INPBWellnessUnitType data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBWellnessUnitType *v4;

  v4 = -[_INPBWellnessUnitType init](+[_INPBWellnessUnitType allocWithZone:](_INPBWellnessUnitType, "allocWithZone:", a3), "init");
  if (-[_INPBWellnessUnitType hasBloodGlucoseUnit](self, "hasBloodGlucoseUnit"))
    -[_INPBWellnessUnitType setBloodGlucoseUnit:](v4, "setBloodGlucoseUnit:", -[_INPBWellnessUnitType bloodGlucoseUnit](self, "bloodGlucoseUnit"));
  if (-[_INPBWellnessUnitType hasBloodPressureUnit](self, "hasBloodPressureUnit"))
    -[_INPBWellnessUnitType setBloodPressureUnit:](v4, "setBloodPressureUnit:", -[_INPBWellnessUnitType bloodPressureUnit](self, "bloodPressureUnit"));
  if (-[_INPBWellnessUnitType hasEnergyUnit](self, "hasEnergyUnit"))
    -[_INPBWellnessUnitType setEnergyUnit:](v4, "setEnergyUnit:", -[_INPBWellnessUnitType energyUnit](self, "energyUnit"));
  if (-[_INPBWellnessUnitType hasHeartRateUnit](self, "hasHeartRateUnit"))
    -[_INPBWellnessUnitType setHeartRateUnit:](v4, "setHeartRateUnit:", -[_INPBWellnessUnitType heartRateUnit](self, "heartRateUnit"));
  if (-[_INPBWellnessUnitType hasLengthUnit](self, "hasLengthUnit"))
    -[_INPBWellnessUnitType setLengthUnit:](v4, "setLengthUnit:", -[_INPBWellnessUnitType lengthUnit](self, "lengthUnit"));
  if (-[_INPBWellnessUnitType hasMassUnit](self, "hasMassUnit"))
    -[_INPBWellnessUnitType setMassUnit:](v4, "setMassUnit:", -[_INPBWellnessUnitType massUnit](self, "massUnit"));
  if (-[_INPBWellnessUnitType hasRespiratoryRateUnit](self, "hasRespiratoryRateUnit"))
    -[_INPBWellnessUnitType setRespiratoryRateUnit:](v4, "setRespiratoryRateUnit:", -[_INPBWellnessUnitType respiratoryRateUnit](self, "respiratoryRateUnit"));
  if (-[_INPBWellnessUnitType hasTemperatureUnit](self, "hasTemperatureUnit"))
    -[_INPBWellnessUnitType setTemperatureUnit:](v4, "setTemperatureUnit:", -[_INPBWellnessUnitType temperatureUnit](self, "temperatureUnit"));
  if (-[_INPBWellnessUnitType hasTimeUnit](self, "hasTimeUnit"))
    -[_INPBWellnessUnitType setTimeUnit:](v4, "setTimeUnit:", -[_INPBWellnessUnitType timeUnit](self, "timeUnit"));
  if (-[_INPBWellnessUnitType hasVolumeUnit](self, "hasVolumeUnit"))
    -[_INPBWellnessUnitType setVolumeUnit:](v4, "setVolumeUnit:", -[_INPBWellnessUnitType volumeUnit](self, "volumeUnit"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int bloodGlucoseUnit;
  int v7;
  int bloodPressureUnit;
  int v9;
  int energyUnit;
  int v11;
  int heartRateUnit;
  int v13;
  int lengthUnit;
  int v15;
  int massUnit;
  int v17;
  int respiratoryRateUnit;
  int v19;
  int temperatureUnit;
  int v21;
  int timeUnit;
  int v23;
  BOOL v24;
  int volumeUnit;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_39;
  v5 = -[_INPBWellnessUnitType hasBloodGlucoseUnit](self, "hasBloodGlucoseUnit");
  if (v5 != objc_msgSend(v4, "hasBloodGlucoseUnit"))
    goto LABEL_39;
  if (-[_INPBWellnessUnitType hasBloodGlucoseUnit](self, "hasBloodGlucoseUnit"))
  {
    if (objc_msgSend(v4, "hasBloodGlucoseUnit"))
    {
      bloodGlucoseUnit = self->_bloodGlucoseUnit;
      if (bloodGlucoseUnit != objc_msgSend(v4, "bloodGlucoseUnit"))
        goto LABEL_39;
    }
  }
  v7 = -[_INPBWellnessUnitType hasBloodPressureUnit](self, "hasBloodPressureUnit");
  if (v7 != objc_msgSend(v4, "hasBloodPressureUnit"))
    goto LABEL_39;
  if (-[_INPBWellnessUnitType hasBloodPressureUnit](self, "hasBloodPressureUnit"))
  {
    if (objc_msgSend(v4, "hasBloodPressureUnit"))
    {
      bloodPressureUnit = self->_bloodPressureUnit;
      if (bloodPressureUnit != objc_msgSend(v4, "bloodPressureUnit"))
        goto LABEL_39;
    }
  }
  v9 = -[_INPBWellnessUnitType hasEnergyUnit](self, "hasEnergyUnit");
  if (v9 != objc_msgSend(v4, "hasEnergyUnit"))
    goto LABEL_39;
  if (-[_INPBWellnessUnitType hasEnergyUnit](self, "hasEnergyUnit"))
  {
    if (objc_msgSend(v4, "hasEnergyUnit"))
    {
      energyUnit = self->_energyUnit;
      if (energyUnit != objc_msgSend(v4, "energyUnit"))
        goto LABEL_39;
    }
  }
  v11 = -[_INPBWellnessUnitType hasHeartRateUnit](self, "hasHeartRateUnit");
  if (v11 != objc_msgSend(v4, "hasHeartRateUnit"))
    goto LABEL_39;
  if (-[_INPBWellnessUnitType hasHeartRateUnit](self, "hasHeartRateUnit"))
  {
    if (objc_msgSend(v4, "hasHeartRateUnit"))
    {
      heartRateUnit = self->_heartRateUnit;
      if (heartRateUnit != objc_msgSend(v4, "heartRateUnit"))
        goto LABEL_39;
    }
  }
  v13 = -[_INPBWellnessUnitType hasLengthUnit](self, "hasLengthUnit");
  if (v13 != objc_msgSend(v4, "hasLengthUnit"))
    goto LABEL_39;
  if (-[_INPBWellnessUnitType hasLengthUnit](self, "hasLengthUnit"))
  {
    if (objc_msgSend(v4, "hasLengthUnit"))
    {
      lengthUnit = self->_lengthUnit;
      if (lengthUnit != objc_msgSend(v4, "lengthUnit"))
        goto LABEL_39;
    }
  }
  v15 = -[_INPBWellnessUnitType hasMassUnit](self, "hasMassUnit");
  if (v15 != objc_msgSend(v4, "hasMassUnit"))
    goto LABEL_39;
  if (-[_INPBWellnessUnitType hasMassUnit](self, "hasMassUnit"))
  {
    if (objc_msgSend(v4, "hasMassUnit"))
    {
      massUnit = self->_massUnit;
      if (massUnit != objc_msgSend(v4, "massUnit"))
        goto LABEL_39;
    }
  }
  v17 = -[_INPBWellnessUnitType hasRespiratoryRateUnit](self, "hasRespiratoryRateUnit");
  if (v17 != objc_msgSend(v4, "hasRespiratoryRateUnit"))
    goto LABEL_39;
  if (-[_INPBWellnessUnitType hasRespiratoryRateUnit](self, "hasRespiratoryRateUnit"))
  {
    if (objc_msgSend(v4, "hasRespiratoryRateUnit"))
    {
      respiratoryRateUnit = self->_respiratoryRateUnit;
      if (respiratoryRateUnit != objc_msgSend(v4, "respiratoryRateUnit"))
        goto LABEL_39;
    }
  }
  if ((v19 = -[_INPBWellnessUnitType hasTemperatureUnit](self, "hasTemperatureUnit"),
        v19 == objc_msgSend(v4, "hasTemperatureUnit"))
    && (!-[_INPBWellnessUnitType hasTemperatureUnit](self, "hasTemperatureUnit")
     || !objc_msgSend(v4, "hasTemperatureUnit")
     || (temperatureUnit = self->_temperatureUnit, temperatureUnit == objc_msgSend(v4, "temperatureUnit")))
    && (v21 = -[_INPBWellnessUnitType hasTimeUnit](self, "hasTimeUnit"),
        v21 == objc_msgSend(v4, "hasTimeUnit"))
    && (!-[_INPBWellnessUnitType hasTimeUnit](self, "hasTimeUnit")
     || !objc_msgSend(v4, "hasTimeUnit")
     || (timeUnit = self->_timeUnit, timeUnit == objc_msgSend(v4, "timeUnit")))
    && (v23 = -[_INPBWellnessUnitType hasVolumeUnit](self, "hasVolumeUnit"),
        v23 == objc_msgSend(v4, "hasVolumeUnit"))
    && (!-[_INPBWellnessUnitType hasVolumeUnit](self, "hasVolumeUnit")
     || !objc_msgSend(v4, "hasVolumeUnit")
     || (volumeUnit = self->_volumeUnit, volumeUnit == objc_msgSend(v4, "volumeUnit"))))
  {
    v24 = 1;
  }
  else
  {
LABEL_39:
    v24 = 0;
  }

  return v24;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  if (-[_INPBWellnessUnitType hasBloodGlucoseUnit](self, "hasBloodGlucoseUnit"))
    v13 = 2654435761 * self->_bloodGlucoseUnit;
  else
    v13 = 0;
  if (-[_INPBWellnessUnitType hasBloodPressureUnit](self, "hasBloodPressureUnit"))
    v3 = 2654435761 * self->_bloodPressureUnit;
  else
    v3 = 0;
  if (-[_INPBWellnessUnitType hasEnergyUnit](self, "hasEnergyUnit"))
    v4 = 2654435761 * self->_energyUnit;
  else
    v4 = 0;
  if (-[_INPBWellnessUnitType hasHeartRateUnit](self, "hasHeartRateUnit"))
    v5 = 2654435761 * self->_heartRateUnit;
  else
    v5 = 0;
  if (-[_INPBWellnessUnitType hasLengthUnit](self, "hasLengthUnit"))
    v6 = 2654435761 * self->_lengthUnit;
  else
    v6 = 0;
  if (-[_INPBWellnessUnitType hasMassUnit](self, "hasMassUnit"))
    v7 = 2654435761 * self->_massUnit;
  else
    v7 = 0;
  if (-[_INPBWellnessUnitType hasRespiratoryRateUnit](self, "hasRespiratoryRateUnit"))
    v8 = 2654435761 * self->_respiratoryRateUnit;
  else
    v8 = 0;
  if (-[_INPBWellnessUnitType hasTemperatureUnit](self, "hasTemperatureUnit"))
    v9 = 2654435761 * self->_temperatureUnit;
  else
    v9 = 0;
  if (-[_INPBWellnessUnitType hasTimeUnit](self, "hasTimeUnit"))
    v10 = 2654435761 * self->_timeUnit;
  else
    v10 = 0;
  if (-[_INPBWellnessUnitType hasVolumeUnit](self, "hasVolumeUnit"))
    v11 = 2654435761 * self->_volumeUnit;
  else
    v11 = 0;
  return v3 ^ v13 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  __CFString *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBWellnessUnitType hasBloodGlucoseUnit](self, "hasBloodGlucoseUnit"))
  {
    v4 = -[_INPBWellnessUnitType bloodGlucoseUnit](self, "bloodGlucoseUnit");
    if (v4 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = *(&off_1E228D868 + v4);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("bloodGlucoseUnit"));

  }
  if (-[_INPBWellnessUnitType hasBloodPressureUnit](self, "hasBloodPressureUnit"))
  {
    v6 = -[_INPBWellnessUnitType bloodPressureUnit](self, "bloodPressureUnit");
    if ((_DWORD)v6)
    {
      if ((_DWORD)v6 == 1)
      {
        v7 = CFSTR("MMHG");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v7 = CFSTR("UNKNOWN_BLOOD_PRESSURE_UNIT");
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("bloodPressureUnit"));

  }
  if (-[_INPBWellnessUnitType hasEnergyUnit](self, "hasEnergyUnit"))
  {
    v8 = -[_INPBWellnessUnitType energyUnit](self, "energyUnit");
    if (v8 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = *(&off_1E228D880 + v8);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("energyUnit"));

  }
  if (-[_INPBWellnessUnitType hasHeartRateUnit](self, "hasHeartRateUnit"))
  {
    v10 = -[_INPBWellnessUnitType heartRateUnit](self, "heartRateUnit");
    if ((_DWORD)v10)
    {
      if ((_DWORD)v10 == 1)
      {
        v11 = CFSTR("BPM");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v10);
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v11 = CFSTR("UNKNOWN_HEART_RATE_UNIT");
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("heartRateUnit"));

  }
  if (-[_INPBWellnessUnitType hasLengthUnit](self, "hasLengthUnit"))
  {
    v12 = -[_INPBWellnessUnitType lengthUnit](self, "lengthUnit");
    if ((v12 - 1) >= 0x16)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = *(&off_1E228D8B0 + (v12 - 1));
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("lengthUnit"));

  }
  if (-[_INPBWellnessUnitType hasMassUnit](self, "hasMassUnit"))
  {
    v14 = -[_INPBWellnessUnitType massUnit](self, "massUnit");
    if (v14 >= 0x11)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = *(&off_1E228D960 + v14);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("massUnit"));

  }
  if (-[_INPBWellnessUnitType hasRespiratoryRateUnit](self, "hasRespiratoryRateUnit"))
  {
    v16 = -[_INPBWellnessUnitType respiratoryRateUnit](self, "respiratoryRateUnit");
    if ((_DWORD)v16)
    {
      if ((_DWORD)v16 == 1)
      {
        v17 = CFSTR("BREATHMIN");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v16);
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v17 = CFSTR("UNKNOWN_RESPIRATORY_RATE_UNIT");
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("respiratoryRateUnit"));

  }
  if (-[_INPBWellnessUnitType hasTemperatureUnit](self, "hasTemperatureUnit"))
  {
    v18 = -[_INPBWellnessUnitType temperatureUnit](self, "temperatureUnit");
    if ((v18 - 1) >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = *(&off_1E228D9E8 + (v18 - 1));
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("temperatureUnit"));

  }
  if (-[_INPBWellnessUnitType hasTimeUnit](self, "hasTimeUnit"))
  {
    v20 = -[_INPBWellnessUnitType timeUnit](self, "timeUnit");
    if (v20 >= 8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = *(&off_1E228DA00 + v20);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("timeUnit"));

  }
  if (-[_INPBWellnessUnitType hasVolumeUnit](self, "hasVolumeUnit"))
  {
    v22 = -[_INPBWellnessUnitType volumeUnit](self, "volumeUnit");
    if (v22 >= 0x1D)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = *(&off_1E228DA40 + v22);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("volumeUnit"));

  }
  return v3;
}

- (int)bloodGlucoseUnit
{
  return self->_bloodGlucoseUnit;
}

- (int)bloodPressureUnit
{
  return self->_bloodPressureUnit;
}

- (int)energyUnit
{
  return self->_energyUnit;
}

- (int)heartRateUnit
{
  return self->_heartRateUnit;
}

- (int)lengthUnit
{
  return self->_lengthUnit;
}

- (int)massUnit
{
  return self->_massUnit;
}

- (int)respiratoryRateUnit
{
  return self->_respiratoryRateUnit;
}

- (int)temperatureUnit
{
  return self->_temperatureUnit;
}

- (int)timeUnit
{
  return self->_timeUnit;
}

- (int)volumeUnit
{
  return self->_volumeUnit;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
