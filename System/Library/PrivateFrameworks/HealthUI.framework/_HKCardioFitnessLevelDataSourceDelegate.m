@implementation _HKCardioFitnessLevelDataSourceDelegate

- (_HKCardioFitnessLevelDataSourceDelegate)initWithCardioFitnessLevel:(int64_t)a3 healthStore:(id)a4 baseDisplayType:(id)a5
{
  id v8;
  id v9;
  _HKCardioFitnessLevelDataSourceDelegate *v10;
  _HKCardioFitnessLevelDataSourceDelegate *v11;
  void *v12;
  uint64_t v13;
  NSDateComponents *v14;
  NSDateComponents *dateOfBirthComponents;
  NSDateComponents *v16;
  uint64_t v17;
  HKUnit *unit;
  objc_super v20;

  v8 = a4;
  v9 = a5;
  v20.receiver = self;
  v20.super_class = (Class)_HKCardioFitnessLevelDataSourceDelegate;
  v10 = -[_HKCardioFitnessLevelDataSourceDelegate init](&v20, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_cardioFitnessLevel = a3;
    objc_storeStrong((id *)&v10->_baseDisplayType, a5);
    objc_msgSend(v8, "biologicalSexWithError:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "biologicalSex");

    objc_msgSend(v8, "dateOfBirthComponentsWithError:", 0);
    v14 = (NSDateComponents *)objc_claimAutoreleasedReturnValue();
    dateOfBirthComponents = v11->_dateOfBirthComponents;
    v11->_biologicalSex = v13;
    v11->_dateOfBirthComponents = v14;
    v16 = v14;

    objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("mL/(kg*min)"));
    v17 = objc_claimAutoreleasedReturnValue();
    unit = v11->_unit;
    v11->_unit = (HKUnit *)v17;

  }
  return v11;
}

- (id)dataForDateRange:(id)a3 timeScope:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v21[4];
  id v22;
  _HKCardioFitnessLevelDataSourceDelegate *v23;
  id v24;

  v6 = a3;
  +[HKGraphZoomLevelConfiguration configurationForZoomLevel:](HKGraphZoomLevelConfiguration, "configurationForZoomLevel:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "seriesPointIntervalComponentsAtResolution:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKGraphZoomLevelConfiguration defaultCalendar](HKGraphZoomLevelConfiguration, "defaultCalendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hk_dateByShiftingFromGregorianCalendarWithUTCTimeZone:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "endDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "hk_dateByShiftingFromGregorianCalendarWithUTCTimeZone:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v11, v13);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __70___HKCardioFitnessLevelDataSourceDelegate_dataForDateRange_timeScope___block_invoke;
  v21[3] = &unk_1E9C417F8;
  v22 = v8;
  v23 = self;
  v16 = v14;
  v24 = v16;
  v17 = v8;
  objc_msgSend(v9, "hk_enumerateDateInterval:byDateComponents:block:", v15, v17, v21);

  v18 = v24;
  v19 = v16;

  return v19;
}

- (int64_t)cardioFitnessLevel
{
  return self->_cardioFitnessLevel;
}

- (void)setCardioFitnessLevel:(int64_t)a3
{
  self->_cardioFitnessLevel = a3;
}

- (int64_t)biologicalSex
{
  return self->_biologicalSex;
}

- (void)setBiologicalSex:(int64_t)a3
{
  self->_biologicalSex = a3;
}

- (NSDateComponents)dateOfBirthComponents
{
  return self->_dateOfBirthComponents;
}

- (void)setDateOfBirthComponents:(id)a3
{
  objc_storeStrong((id *)&self->_dateOfBirthComponents, a3);
}

- (HKUnit)unit
{
  return self->_unit;
}

- (void)setUnit:(id)a3
{
  objc_storeStrong((id *)&self->_unit, a3);
}

- (HKDisplayType)baseDisplayType
{
  return self->_baseDisplayType;
}

- (void)setBaseDisplayType:(id)a3
{
  objc_storeStrong((id *)&self->_baseDisplayType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseDisplayType, 0);
  objc_storeStrong((id *)&self->_unit, 0);
  objc_storeStrong((id *)&self->_dateOfBirthComponents, 0);
}

@end
