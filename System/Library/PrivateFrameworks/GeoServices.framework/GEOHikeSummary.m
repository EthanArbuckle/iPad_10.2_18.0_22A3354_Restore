@implementation GEOHikeSummary

- (GEOHikeSummary)initWithPDHikeSummary:(id)a3
{
  id v5;
  GEOHikeSummary *v6;
  GEOHikeSummary *v7;
  id v8;
  double v9;
  void *v10;
  uint64_t v11;
  NSMeasurement *elevationGainMeters;
  id v13;
  double v14;
  void *v15;
  uint64_t v16;
  NSMeasurement *elevationLossMeters;
  id v18;
  double v19;
  void *v20;
  uint64_t v21;
  NSMeasurement *expectedDurationSeconds;
  id v23;
  double v24;
  void *v25;
  uint64_t v26;
  NSMeasurement *lengthMeters;
  GEOHikeSummary *v28;
  objc_super v30;

  v5 = a3;
  if (v5)
  {
    v30.receiver = self;
    v30.super_class = (Class)GEOHikeSummary;
    v6 = -[GEOHikeSummary init](&v30, sel_init);
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_hikeSummary, a3);
      if (objc_msgSend(v5, "hasSumElevationGainCm"))
      {
        v8 = objc_alloc(MEMORY[0x1E0CB3758]);
        v9 = (double)objc_msgSend(v5, "sumElevationGainCm") / 100.0;
        objc_msgSend(MEMORY[0x1E0CB3AD8], "meters");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v8, "initWithDoubleValue:unit:", v10, v9);
        elevationGainMeters = v7->_elevationGainMeters;
        v7->_elevationGainMeters = (NSMeasurement *)v11;

      }
      if (objc_msgSend(v5, "hasSumElevationLossCm"))
      {
        v13 = objc_alloc(MEMORY[0x1E0CB3758]);
        v14 = (double)objc_msgSend(v5, "sumElevationLossCm") / 100.0;
        objc_msgSend(MEMORY[0x1E0CB3AD8], "meters");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v13, "initWithDoubleValue:unit:", v15, v14);
        elevationLossMeters = v7->_elevationLossMeters;
        v7->_elevationLossMeters = (NSMeasurement *)v16;

      }
      if (objc_msgSend(v5, "hasExpectedDurationSeconds"))
      {
        v18 = objc_alloc(MEMORY[0x1E0CB3758]);
        v19 = (double)objc_msgSend(v5, "expectedDurationSeconds");
        objc_msgSend(MEMORY[0x1E0CB3A88], "seconds");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v18, "initWithDoubleValue:unit:", v20, v19);
        expectedDurationSeconds = v7->_expectedDurationSeconds;
        v7->_expectedDurationSeconds = (NSMeasurement *)v21;

      }
      if (objc_msgSend(v5, "hasLengthMeters"))
      {
        v23 = objc_alloc(MEMORY[0x1E0CB3758]);
        v24 = (double)objc_msgSend(v5, "lengthMeters");
        objc_msgSend(MEMORY[0x1E0CB3AD8], "meters");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v23, "initWithDoubleValue:unit:", v25, v24);
        lengthMeters = v7->_lengthMeters;
        v7->_lengthMeters = (NSMeasurement *)v26;

      }
    }
    self = v7;
    v28 = self;
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (id)elevationLossStringForUnit:(id)a3
{
  return -[GEOHikeSummary _GEOStringForDistanceMeasurement:forUnit:allowUnitConversion:](self, "_GEOStringForDistanceMeasurement:forUnit:allowUnitConversion:", self->_elevationLossMeters, a3, 0);
}

- (id)elevationGainStringForUnit:(id)a3
{
  return -[GEOHikeSummary _GEOStringForDistanceMeasurement:forUnit:allowUnitConversion:](self, "_GEOStringForDistanceMeasurement:forUnit:allowUnitConversion:", self->_elevationGainMeters, a3, 0);
}

- (id)lengthStringForUnit:(id)a3
{
  return -[GEOHikeSummary _GEOStringForDistanceMeasurement:forUnit:allowUnitConversion:](self, "_GEOStringForDistanceMeasurement:forUnit:allowUnitConversion:", self->_lengthMeters, a3, 1);
}

- (id)durationString
{
  double v2;

  -[NSMeasurement doubleValue](self->_expectedDurationSeconds, "doubleValue");
  return GEOStringForDuration(1, v2);
}

- (id)hikeTypeNameString
{
  GEOComposedString *v3;
  void *v4;
  GEOComposedString *v5;
  void *v6;

  v3 = [GEOComposedString alloc];
  -[GEOPDHikeSummary hikeTypeName](self->_hikeSummary, "hikeTypeName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[GEOComposedString initWithGeoFormattedString:](v3, "initWithGeoFormattedString:", v4);

  -[GEOComposedString stringWithDefaultOptions](v5, "stringWithDefaultOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_GEOStringForDistanceMeasurement:(id)a3 forUnit:(id)a4 allowUnitConversion:(BOOL)a5
{
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v5 = a5;
  objc_msgSend(a3, "measurementByConvertingToUnit:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v7 = 1;
  else
    v7 = 97;
  +[GEOComposedString localizationProvider](GEOComposedString, "localizationProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _GEOStringForDistanceMeasurement(v6, v8, v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSMeasurement)elevationGainMeters
{
  return self->_elevationGainMeters;
}

- (void)setElevationGainMeters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSMeasurement)elevationLossMeters
{
  return self->_elevationLossMeters;
}

- (void)setElevationLossMeters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSMeasurement)expectedDurationSeconds
{
  return self->_expectedDurationSeconds;
}

- (void)setExpectedDurationSeconds:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSMeasurement)lengthMeters
{
  return self->_lengthMeters;
}

- (void)setLengthMeters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (GEOPDHikeSummary)hikeSummary
{
  return self->_hikeSummary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hikeSummary, 0);
  objc_storeStrong((id *)&self->_lengthMeters, 0);
  objc_storeStrong((id *)&self->_expectedDurationSeconds, 0);
  objc_storeStrong((id *)&self->_elevationLossMeters, 0);
  objc_storeStrong((id *)&self->_elevationGainMeters, 0);
}

@end
