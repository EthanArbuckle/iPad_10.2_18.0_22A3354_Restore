@implementation HDMedicationsDemoDataGeneratorState

- (HDMedicationsDemoDataGeneratorState)initWithDictionary:(id)a3
{
  id v4;
  HDMedicationsDemoDataGeneratorState *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  NSDate *v21;
  NSDate *latestLogDate;
  void *v23;
  id v24;
  void *v25;
  NSDate *v26;
  NSDate *v27;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)HDMedicationsDemoDataGeneratorState;
  v5 = -[HDMedicationsDemoDataGeneratorState init](&v29, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HDMedicationsDemoDataGeneratorDidSetupOntologyKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v7 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;

    if (v9)
      v5->_didSetupOntologyData = objc_msgSend(v9, "BOOLValue");
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HDMedicationsDemoDataGeneratorDidSaveInitialDataKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v11 = v10;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
    v13 = v12;

    if (v13)
      v5->_didSaveIntialData = objc_msgSend(v13, "BOOLValue");
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HDMedicationsDemoDataGeneratorHasScheduledMedicationsKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v15 = v14;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
    v17 = v16;

    if (v17)
      v5->_hasScheduledMedications = objc_msgSend(v17, "BOOLValue");
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HDMedicationsDemoDataGeneratorLatestLogDateKey"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v19 = v18;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v20 = v19;
    else
      v20 = 0;
    v21 = v20;

    latestLogDate = v5->_latestLogDate;
    v5->_latestLogDate = v21;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HDMedicationsDemoDataGeneratorLatestTakenLogDateKey"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v24 = v23;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v25 = v24;
    else
      v25 = 0;
    v26 = v25;

    v27 = v5->_latestLogDate;
    v5->_latestLogDate = v26;

  }
  return v5;
}

- (id)dictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSDate *latestLogDate;
  NSDate *latestTakenLogDate;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_didSetupOntologyData);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("HDMedicationsDemoDataGeneratorDidSetupOntologyKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_didSaveIntialData);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("HDMedicationsDemoDataGeneratorDidSaveInitialDataKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasScheduledMedications);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("HDMedicationsDemoDataGeneratorHasScheduledMedicationsKey"));

  latestLogDate = self->_latestLogDate;
  if (latestLogDate)
    objc_msgSend(v3, "setObject:forKey:", latestLogDate, CFSTR("HDMedicationsDemoDataGeneratorLatestLogDateKey"));
  latestTakenLogDate = self->_latestTakenLogDate;
  if (latestTakenLogDate)
    objc_msgSend(v3, "setObject:forKey:", latestTakenLogDate, CFSTR("HDMedicationsDemoDataGeneratorLatestTakenLogDateKey"));
  return v3;
}

- (BOOL)didSetupOntologyData
{
  return self->_didSetupOntologyData;
}

- (void)setDidSetupOntologyData:(BOOL)a3
{
  self->_didSetupOntologyData = a3;
}

- (BOOL)didSaveIntialData
{
  return self->_didSaveIntialData;
}

- (void)setDidSaveIntialData:(BOOL)a3
{
  self->_didSaveIntialData = a3;
}

- (BOOL)hasScheduledMedications
{
  return self->_hasScheduledMedications;
}

- (void)setHasScheduledMedications:(BOOL)a3
{
  self->_hasScheduledMedications = a3;
}

- (NSDate)latestLogDate
{
  return self->_latestLogDate;
}

- (void)setLatestLogDate:(id)a3
{
  objc_storeStrong((id *)&self->_latestLogDate, a3);
}

- (NSDate)latestTakenLogDate
{
  return self->_latestTakenLogDate;
}

- (void)setLatestTakenLogDate:(id)a3
{
  objc_storeStrong((id *)&self->_latestTakenLogDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestTakenLogDate, 0);
  objc_storeStrong((id *)&self->_latestLogDate, 0);
}

@end
