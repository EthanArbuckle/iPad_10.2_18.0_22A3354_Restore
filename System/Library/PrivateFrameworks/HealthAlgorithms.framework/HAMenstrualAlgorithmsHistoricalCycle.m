@implementation HAMenstrualAlgorithmsHistoricalCycle

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HAMenstrualAlgorithmsHistoricalCycle)init
{
  HAMenstrualAlgorithmsHistoricalCycle *v2;
  HAMenstrualAlgorithmsHistoricalCycle *v3;
  NSArray *phases;
  HAMenstrualAlgorithmsHistoricalCycle *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HAMenstrualAlgorithmsHistoricalCycle;
  v2 = -[HAMenstrualAlgorithmsHistoricalCycle init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    phases = v2->_phases;
    v2->_phases = (NSArray *)MEMORY[0x24BDBD1A8];

    v5 = v3;
  }

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *fertilityStartJulianDay;
  void *v5;
  NSNumber *fertilityEndJulianDay;
  void *v7;
  uint64_t julianDayOfMenstruationStart;
  void *v9;
  uint64_t julianDayOfMenstruationEnd;
  void *v11;
  void *v12;
  uint64_t predictionPrimarySource;
  void *v14;
  NSArray *phases;
  void *v16;
  int64_t dailyEligibleWristTemperatureCount;
  void *v18;
  uint64_t ovulationConfirmationFailure;
  void *v20;
  id v21;

  v21 = a3;
  fertilityStartJulianDay = self->_fertilityStartJulianDay;
  NSStringFromSelector(sel_fertilityStartJulianDay);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", fertilityStartJulianDay, v5);

  fertilityEndJulianDay = self->_fertilityEndJulianDay;
  NSStringFromSelector(sel_fertilityEndJulianDay);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", fertilityEndJulianDay, v7);

  julianDayOfMenstruationStart = self->_julianDayOfMenstruationStart;
  NSStringFromSelector(sel_julianDayOfMenstruationStart);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeInt32:forKey:", julianDayOfMenstruationStart, v9);

  julianDayOfMenstruationEnd = self->_julianDayOfMenstruationEnd;
  NSStringFromSelector(sel_julianDayOfMenstruationEnd);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeInt32:forKey:", julianDayOfMenstruationEnd, v11);

  LODWORD(julianDayOfMenstruationEnd) = self->_isDeterminant;
  NSStringFromSelector(sel_isDeterminant);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeBool:forKey:", (_DWORD)julianDayOfMenstruationEnd != 0, v12);

  predictionPrimarySource = self->_predictionPrimarySource;
  NSStringFromSelector(sel_predictionPrimarySource);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeInt32:forKey:", predictionPrimarySource, v14);

  phases = self->_phases;
  NSStringFromSelector(sel_phases);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", phases, v16);

  dailyEligibleWristTemperatureCount = self->_dailyEligibleWristTemperatureCount;
  NSStringFromSelector(sel_dailyEligibleWristTemperatureCount);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeInteger:forKey:", dailyEligibleWristTemperatureCount, v18);

  ovulationConfirmationFailure = self->_ovulationConfirmationFailure;
  NSStringFromSelector(sel_ovulationConfirmationFailure);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeInt32:forKey:", ovulationConfirmationFailure, v20);

}

- (HAMenstrualAlgorithmsHistoricalCycle)initWithCoder:(id)a3
{
  id v4;
  HAMenstrualAlgorithmsHistoricalCycle *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSNumber *fertilityStartJulianDay;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSNumber *fertilityEndJulianDay;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSArray *phases;
  void *v22;
  void *v23;
  HAMenstrualAlgorithmsHistoricalCycle *v24;

  v4 = a3;
  v5 = -[HAMenstrualAlgorithmsHistoricalCycle init](self, "init");
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_fertilityStartJulianDay);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    fertilityStartJulianDay = v5->_fertilityStartJulianDay;
    v5->_fertilityStartJulianDay = (NSNumber *)v8;

    v10 = objc_opt_class();
    NSStringFromSelector(sel_fertilityEndJulianDay);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    fertilityEndJulianDay = v5->_fertilityEndJulianDay;
    v5->_fertilityEndJulianDay = (NSNumber *)v12;

    NSStringFromSelector(sel_julianDayOfMenstruationStart);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_julianDayOfMenstruationStart = objc_msgSend(v4, "decodeInt32ForKey:", v14);

    NSStringFromSelector(sel_julianDayOfMenstruationEnd);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_julianDayOfMenstruationEnd = objc_msgSend(v4, "decodeInt32ForKey:", v15);

    NSStringFromSelector(sel_isDeterminant);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isDeterminant = objc_msgSend(v4, "decodeBoolForKey:", v16);

    NSStringFromSelector(sel_predictionPrimarySource);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_predictionPrimarySource = objc_msgSend(v4, "decodeInt32ForKey:", v17);

    v18 = objc_opt_class();
    NSStringFromSelector(sel_phases);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", v18, v19);
    v20 = objc_claimAutoreleasedReturnValue();
    phases = v5->_phases;
    v5->_phases = (NSArray *)v20;

    NSStringFromSelector(sel_dailyEligibleWristTemperatureCount);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_dailyEligibleWristTemperatureCount = objc_msgSend(v4, "decodeIntegerForKey:", v22);

    NSStringFromSelector(sel_ovulationConfirmationFailure);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_ovulationConfirmationFailure = objc_msgSend(v4, "decodeInt32ForKey:", v23);

    v24 = v5;
  }

  return v5;
}

- (NSNumber)fertilityStartJulianDay
{
  return self->_fertilityStartJulianDay;
}

- (void)setFertilityStartJulianDay:(id)a3
{
  objc_storeStrong((id *)&self->_fertilityStartJulianDay, a3);
}

- (NSNumber)fertilityEndJulianDay
{
  return self->_fertilityEndJulianDay;
}

- (void)setFertilityEndJulianDay:(id)a3
{
  objc_storeStrong((id *)&self->_fertilityEndJulianDay, a3);
}

- (unsigned)julianDayOfMenstruationStart
{
  return self->_julianDayOfMenstruationStart;
}

- (void)setJulianDayOfMenstruationStart:(unsigned int)a3
{
  self->_julianDayOfMenstruationStart = a3;
}

- (unsigned)julianDayOfMenstruationEnd
{
  return self->_julianDayOfMenstruationEnd;
}

- (void)setJulianDayOfMenstruationEnd:(unsigned int)a3
{
  self->_julianDayOfMenstruationEnd = a3;
}

- (BOOL)isDeterminant
{
  return self->_isDeterminant;
}

- (void)setIsDeterminant:(BOOL)a3
{
  self->_isDeterminant = a3;
}

- (unsigned)predictionPrimarySource
{
  return self->_predictionPrimarySource;
}

- (void)setPredictionPrimarySource:(unsigned __int8)a3
{
  self->_predictionPrimarySource = a3;
}

- (NSArray)phases
{
  return self->_phases;
}

- (void)setPhases:(id)a3
{
  objc_storeStrong((id *)&self->_phases, a3);
}

- (int64_t)dailyEligibleWristTemperatureCount
{
  return self->_dailyEligibleWristTemperatureCount;
}

- (void)setDailyEligibleWristTemperatureCount:(int64_t)a3
{
  self->_dailyEligibleWristTemperatureCount = a3;
}

- (unsigned)ovulationConfirmationFailure
{
  return self->_ovulationConfirmationFailure;
}

- (void)setOvulationConfirmationFailure:(unsigned __int8)a3
{
  self->_ovulationConfirmationFailure = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phases, 0);
  objc_storeStrong((id *)&self->_fertilityEndJulianDay, 0);
  objc_storeStrong((id *)&self->_fertilityStartJulianDay, 0);
}

@end
