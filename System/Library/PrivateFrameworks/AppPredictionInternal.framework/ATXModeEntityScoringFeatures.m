@implementation ATXModeEntityScoringFeatures

- (ATXModeEntityScoringFeatures)init
{
  ATXModeEntityScoringFeatures *v2;
  uint64_t v3;
  NSArray *totalModeLaunchesHistogramForLast28Days;
  uint64_t v5;
  NSArray *totalGlobalLaunchesHistogramForLast28Days;
  uint64_t v7;
  NSArray *macPortableGlobalAppLaunchesHistogramForLast28Days;
  uint64_t v9;
  NSArray *macPortableModeAppLaunchesHistogramForLast28Days;
  uint64_t v11;
  NSArray *macDesktopGlobalAppLaunchesHistogramForLast28Days;
  uint64_t v13;
  NSArray *macDesktopModeAppLaunchesHistogramForLast28Days;
  uint64_t v15;
  NSArray *localDeviceGlobalAppLaunchesHistogramForLast28Days;
  uint64_t v17;
  NSArray *localDeviceModeAppLaunchesHistogramForLast28Days;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)ATXModeEntityScoringFeatures;
  v2 = -[ATXModeEntityScoringFeatures init](&v20, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    totalModeLaunchesHistogramForLast28Days = v2->_totalModeLaunchesHistogramForLast28Days;
    v2->_totalModeLaunchesHistogramForLast28Days = (NSArray *)v3;

    v5 = objc_opt_new();
    totalGlobalLaunchesHistogramForLast28Days = v2->_totalGlobalLaunchesHistogramForLast28Days;
    v2->_totalGlobalLaunchesHistogramForLast28Days = (NSArray *)v5;

    v7 = objc_opt_new();
    macPortableGlobalAppLaunchesHistogramForLast28Days = v2->_macPortableGlobalAppLaunchesHistogramForLast28Days;
    v2->_macPortableGlobalAppLaunchesHistogramForLast28Days = (NSArray *)v7;

    v9 = objc_opt_new();
    macPortableModeAppLaunchesHistogramForLast28Days = v2->_macPortableModeAppLaunchesHistogramForLast28Days;
    v2->_macPortableModeAppLaunchesHistogramForLast28Days = (NSArray *)v9;

    v11 = objc_opt_new();
    macDesktopGlobalAppLaunchesHistogramForLast28Days = v2->_macDesktopGlobalAppLaunchesHistogramForLast28Days;
    v2->_macDesktopGlobalAppLaunchesHistogramForLast28Days = (NSArray *)v11;

    v13 = objc_opt_new();
    macDesktopModeAppLaunchesHistogramForLast28Days = v2->_macDesktopModeAppLaunchesHistogramForLast28Days;
    v2->_macDesktopModeAppLaunchesHistogramForLast28Days = (NSArray *)v13;

    v15 = objc_opt_new();
    localDeviceGlobalAppLaunchesHistogramForLast28Days = v2->_localDeviceGlobalAppLaunchesHistogramForLast28Days;
    v2->_localDeviceGlobalAppLaunchesHistogramForLast28Days = (NSArray *)v15;

    v17 = objc_opt_new();
    localDeviceModeAppLaunchesHistogramForLast28Days = v2->_localDeviceModeAppLaunchesHistogramForLast28Days;
    v2->_localDeviceModeAppLaunchesHistogramForLast28Days = (NSArray *)v17;

  }
  return v2;
}

- (id)initFromJSON:(id)a3
{
  id v4;
  ATXModeEntityScoringFeatures *v5;
  ATXModeEntityScoringFeatures *v6;
  BOOL v7;
  NSString *modeDescription;
  NSString *entityDescription;
  void *v10;
  double v11;
  void *v12;
  double v13;
  ATXModeEntityProtocol *entity;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  uint64_t v24;
  NSArray *totalModeLaunchesHistogramForLast28Days;
  uint64_t v26;
  NSArray *totalGlobalLaunchesHistogramForLast28Days;
  uint64_t v28;
  NSArray *macPortableGlobalAppLaunchesHistogramForLast28Days;
  uint64_t v30;
  NSArray *macPortableModeAppLaunchesHistogramForLast28Days;
  uint64_t v32;
  NSArray *macDesktopGlobalAppLaunchesHistogramForLast28Days;
  uint64_t v34;
  NSArray *macDesktopModeAppLaunchesHistogramForLast28Days;
  uint64_t v36;
  NSArray *localDeviceGlobalAppLaunchesHistogramForLast28Days;
  uint64_t v38;
  NSArray *localDeviceModeAppLaunchesHistogramForLast28Days;
  void *v40;
  NSString *v41;
  objc_class *v42;
  id v43;
  void *v44;
  uint64_t v45;
  NSObject *entitySpecificFeatures;
  objc_super v48;

  v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)ATXModeEntityScoringFeatures;
  v5 = -[ATXModeEntityScoringFeatures init](&v48, sel_init);
  v6 = v5;
  if (v5)
    v7 = v4 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    modeDescription = v5->_modeDescription;
    v5->_modeDescription = (NSString *)&stru_1E82FDC98;

    entityDescription = v6->_entityDescription;
    v6->_entityDescription = (NSString *)&stru_1E82FDC98;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("correlationPosteriorProbability"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    v6->_posteriorProbability = v11;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("correlationClassConditionalProbability"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    v6->_classConditionalProbability = v13;

    entity = v6->_entity;
    v6->_entity = 0;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("correlationUniqueOccurrencesInMode"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_uniqueOccurrencesInMode = objc_msgSend(v15, "unsignedIntegerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("correlationNumLocalOccurrences"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_localOccurrences = objc_msgSend(v16, "unsignedIntegerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("correlationNumGlobalOccurrences"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_globalOccurrences = objc_msgSend(v17, "unsignedIntegerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("correlationModePopularity"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "doubleValue");
    v6->_modePopularity = v19;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("correlationRatioModeAndGlobalPopularity"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "doubleValue");
    v6->_ratioModeAndGlobalPopularity = v21;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("correlationGlobalPopularity"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "doubleValue");
    v6->_globalPopularity = v23;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("totalModeLaunchesHistogram"));
    v24 = objc_claimAutoreleasedReturnValue();
    totalModeLaunchesHistogramForLast28Days = v6->_totalModeLaunchesHistogramForLast28Days;
    v6->_totalModeLaunchesHistogramForLast28Days = (NSArray *)v24;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("totalGlobalLaunchesHistogram"));
    v26 = objc_claimAutoreleasedReturnValue();
    totalGlobalLaunchesHistogramForLast28Days = v6->_totalGlobalLaunchesHistogramForLast28Days;
    v6->_totalGlobalLaunchesHistogramForLast28Days = (NSArray *)v26;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("macPortableGlobalAppLaunchesHistogram"));
    v28 = objc_claimAutoreleasedReturnValue();
    macPortableGlobalAppLaunchesHistogramForLast28Days = v6->_macPortableGlobalAppLaunchesHistogramForLast28Days;
    v6->_macPortableGlobalAppLaunchesHistogramForLast28Days = (NSArray *)v28;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("macPortableModeAppLaunchesHistogram"));
    v30 = objc_claimAutoreleasedReturnValue();
    macPortableModeAppLaunchesHistogramForLast28Days = v6->_macPortableModeAppLaunchesHistogramForLast28Days;
    v6->_macPortableModeAppLaunchesHistogramForLast28Days = (NSArray *)v30;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("macDesktopGlobalAppLaunchesHistogram"));
    v32 = objc_claimAutoreleasedReturnValue();
    macDesktopGlobalAppLaunchesHistogramForLast28Days = v6->_macDesktopGlobalAppLaunchesHistogramForLast28Days;
    v6->_macDesktopGlobalAppLaunchesHistogramForLast28Days = (NSArray *)v32;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("macDesktopModeAppLaunchesHistogram"));
    v34 = objc_claimAutoreleasedReturnValue();
    macDesktopModeAppLaunchesHistogramForLast28Days = v6->_macDesktopModeAppLaunchesHistogramForLast28Days;
    v6->_macDesktopModeAppLaunchesHistogramForLast28Days = (NSArray *)v34;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("localDeviceGlobalAppLaunchesHistogram"));
    v36 = objc_claimAutoreleasedReturnValue();
    localDeviceGlobalAppLaunchesHistogramForLast28Days = v6->_localDeviceGlobalAppLaunchesHistogramForLast28Days;
    v6->_localDeviceGlobalAppLaunchesHistogramForLast28Days = (NSArray *)v36;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("localDeviceModeAppLaunchesHistogram"));
    v38 = objc_claimAutoreleasedReturnValue();
    localDeviceModeAppLaunchesHistogramForLast28Days = v6->_localDeviceModeAppLaunchesHistogramForLast28Days;
    v6->_localDeviceModeAppLaunchesHistogramForLast28Days = (NSArray *)v38;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("correlationEntityFeaturesType"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (v40)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("correlationEntityFeaturesType"));
      v41 = (NSString *)objc_claimAutoreleasedReturnValue();
      v42 = NSClassFromString(v41);

      if (v42)
      {
        v43 = [v42 alloc];
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("correlationEntitySpecificFeatures"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v43, "initFromJSON:", v44);
        entitySpecificFeatures = v6->_entitySpecificFeatures;
        v6->_entitySpecificFeatures = v45;

      }
    }
  }

  return v6;
}

- (id)description
{
  return objc_autoreleaseReturnValue((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("entityDescription: %@, posteriorProbability: %.3f, globalPopularity: %.3f, modePopularity: %.3f, ratio between mode popularity and global popularity: %.3f, classConditionalProbability: %.3f, unique occurrences in mode: %lu, local occurrences: %lu, global occurrences: %lu, entity specific features: %@, total mode launches histogram: %@, total global launches histogram: %@, macPortable global app launches histogram: %@, macPortable mode app launches histogram: %@, macDesktop global app launches histogram: %@, macDesktop mode app launches histogram: %@local device global app launches histogram: %@local device mode app launches histogram: %@"), self->_entityDescription, *(_QWORD *)&self->_posteriorProbability, *(_QWORD *)&self->_globalPopularity, *(_QWORD *)&self->_modePopularity, *(_QWORD *)&self->_ratioModeAndGlobalPopularity, *(_QWORD *)&self->_classConditionalProbability, self->_uniqueOccurrencesInMode, self->_localOccurrences, self->_globalOccurrences, self->_entitySpecificFeatures, self->_totalModeLaunchesHistogramForLast28Days, self->_totalGlobalLaunchesHistogramForLast28Days, self->_macPortableGlobalAppLaunchesHistogramForLast28Days, self->_macPortableModeAppLaunchesHistogramForLast28Days, self->_macDesktopGlobalAppLaunchesHistogramForLast28Days, self->_macDesktopModeAppLaunchesHistogramForLast28Days,
                                           self->_localDeviceGlobalAppLaunchesHistogramForLast28Days,
                                           self->_localDeviceModeAppLaunchesHistogramForLast28Days));
}

- (id)jsonRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSArray *totalModeLaunchesHistogramForLast28Days;
  NSArray *totalGlobalLaunchesHistogramForLast28Days;
  NSArray *v19;
  NSArray *macPortableGlobalAppLaunchesHistogramForLast28Days;
  NSArray *macPortableModeAppLaunchesHistogramForLast28Days;
  NSArray *v22;
  NSArray *macDesktopGlobalAppLaunchesHistogramForLast28Days;
  NSArray *macDesktopModeAppLaunchesHistogramForLast28Days;
  NSArray *v25;
  NSArray *localDeviceGlobalAppLaunchesHistogramForLast28Days;
  NSArray *localDeviceModeAppLaunchesHistogramForLast28Days;
  NSArray *v28;
  void *v29;
  void *v31;
  _QWORD v32[18];
  _QWORD v33[20];

  v33[18] = *MEMORY[0x1E0C80C00];
  v32[0] = CFSTR("correlationModePopularity");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_modePopularity);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v31;
  v32[1] = CFSTR("correlationGlobalPopularity");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_globalPopularity);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v3;
  v32[2] = CFSTR("correlationPosteriorProbability");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_posteriorProbability);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v4;
  v32[3] = CFSTR("correlationRatioModeAndGlobalPopularity");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_ratioModeAndGlobalPopularity);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v33[3] = v5;
  v32[4] = CFSTR("correlationClassConditionalProbability");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_classConditionalProbability);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v33[4] = v6;
  v32[5] = CFSTR("correlationUniqueOccurrencesInMode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_uniqueOccurrencesInMode);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v33[5] = v7;
  v32[6] = CFSTR("correlationNumLocalOccurrences");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_localOccurrences);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v33[6] = v8;
  v32[7] = CFSTR("correlationNumGlobalOccurrences");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_globalOccurrences);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v33[7] = v9;
  v32[8] = CFSTR("correlationEntityFeaturesType");
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v13 = &stru_1E82FDC98;
  if (v11)
    v13 = (const __CFString *)v11;
  v33[8] = v13;
  v32[9] = CFSTR("correlationEntitySpecificFeatures");
  -[NSObject jsonRepresentation](self->_entitySpecificFeatures, "jsonRepresentation");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  v16 = MEMORY[0x1E0C9AA70];
  if (v14)
    v16 = v14;
  totalModeLaunchesHistogramForLast28Days = self->_totalModeLaunchesHistogramForLast28Days;
  totalGlobalLaunchesHistogramForLast28Days = self->_totalGlobalLaunchesHistogramForLast28Days;
  if (!totalModeLaunchesHistogramForLast28Days)
    totalModeLaunchesHistogramForLast28Days = (NSArray *)MEMORY[0x1E0C9AA60];
  v33[9] = v16;
  v33[10] = totalModeLaunchesHistogramForLast28Days;
  v32[10] = CFSTR("totalModeLaunchesHistogram");
  v32[11] = CFSTR("totalGlobalLaunchesHistogram");
  if (totalGlobalLaunchesHistogramForLast28Days)
    v19 = totalGlobalLaunchesHistogramForLast28Days;
  else
    v19 = (NSArray *)MEMORY[0x1E0C9AA60];
  macPortableGlobalAppLaunchesHistogramForLast28Days = self->_macPortableGlobalAppLaunchesHistogramForLast28Days;
  macPortableModeAppLaunchesHistogramForLast28Days = self->_macPortableModeAppLaunchesHistogramForLast28Days;
  if (!macPortableGlobalAppLaunchesHistogramForLast28Days)
    macPortableGlobalAppLaunchesHistogramForLast28Days = (NSArray *)MEMORY[0x1E0C9AA60];
  v33[11] = v19;
  v33[12] = macPortableGlobalAppLaunchesHistogramForLast28Days;
  v32[12] = CFSTR("macPortableGlobalAppLaunchesHistogram");
  v32[13] = CFSTR("macPortableModeAppLaunchesHistogram");
  if (macPortableModeAppLaunchesHistogramForLast28Days)
    v22 = macPortableModeAppLaunchesHistogramForLast28Days;
  else
    v22 = (NSArray *)MEMORY[0x1E0C9AA60];
  macDesktopGlobalAppLaunchesHistogramForLast28Days = self->_macDesktopGlobalAppLaunchesHistogramForLast28Days;
  macDesktopModeAppLaunchesHistogramForLast28Days = self->_macDesktopModeAppLaunchesHistogramForLast28Days;
  if (!macDesktopGlobalAppLaunchesHistogramForLast28Days)
    macDesktopGlobalAppLaunchesHistogramForLast28Days = (NSArray *)MEMORY[0x1E0C9AA60];
  v33[13] = v22;
  v33[14] = macDesktopGlobalAppLaunchesHistogramForLast28Days;
  v32[14] = CFSTR("macDesktopGlobalAppLaunchesHistogram");
  v32[15] = CFSTR("macDesktopModeAppLaunchesHistogram");
  if (macDesktopModeAppLaunchesHistogramForLast28Days)
    v25 = macDesktopModeAppLaunchesHistogramForLast28Days;
  else
    v25 = (NSArray *)MEMORY[0x1E0C9AA60];
  localDeviceGlobalAppLaunchesHistogramForLast28Days = self->_localDeviceGlobalAppLaunchesHistogramForLast28Days;
  localDeviceModeAppLaunchesHistogramForLast28Days = self->_localDeviceModeAppLaunchesHistogramForLast28Days;
  if (!localDeviceGlobalAppLaunchesHistogramForLast28Days)
    localDeviceGlobalAppLaunchesHistogramForLast28Days = (NSArray *)MEMORY[0x1E0C9AA60];
  v33[15] = v25;
  v33[16] = localDeviceGlobalAppLaunchesHistogramForLast28Days;
  v32[16] = CFSTR("localDeviceGlobalAppLaunchesHistogram");
  v32[17] = CFSTR("localDeviceModeAppLaunchesHistogram");
  if (localDeviceModeAppLaunchesHistogramForLast28Days)
    v28 = localDeviceModeAppLaunchesHistogramForLast28Days;
  else
    v28 = (NSArray *)MEMORY[0x1E0C9AA60];
  v33[17] = v28;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 18);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (BOOL)entityOccurredOverLastNDays:(unint64_t)a3 withHistogram:(id)a4
{
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v5 = a4;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__ATXModeEntityScoringFeatures_entityOccurredOverLastNDays_withHistogram___block_invoke;
  v7[3] = &unk_1E82EB8A8;
  v7[4] = &v8;
  v7[5] = a3;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);
  LOBYTE(a3) = v9[3] != 0;
  _Block_object_dispose(&v8, 8);

  return a3;
}

void __74__ATXModeEntityScoringFeatures_entityOccurredOverLastNDays_withHistogram___block_invoke(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v7 = a2;
  if (*(_QWORD *)(a1 + 40) < a3
    || (v11 = v7,
        v8 = objc_msgSend(v7, "unsignedIntegerValue"),
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8),
        v10 = *(_QWORD *)(v9 + 24) + v8,
        v7 = v11,
        *(_QWORD *)(v9 + 24) = v10,
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)))
  {
    *a4 = 1;
  }

}

- (BOOL)entityOccurredGloballyOverLastNDays:(unint64_t)a3
{
  return -[ATXModeEntityScoringFeatures entityOccurredOverLastNDays:withHistogram:](self, "entityOccurredOverLastNDays:withHistogram:", a3, self->_totalGlobalLaunchesHistogramForLast28Days);
}

- (BOOL)entityOccurredInModeOverLastNDays:(unint64_t)a3
{
  return -[ATXModeEntityScoringFeatures entityOccurredOverLastNDays:withHistogram:](self, "entityOccurredOverLastNDays:withHistogram:", a3, self->_totalModeLaunchesHistogramForLast28Days);
}

- (NSString)modeDescription
{
  return self->_modeDescription;
}

- (void)setModeDescription:(id)a3
{
  objc_storeStrong((id *)&self->_modeDescription, a3);
}

- (double)posteriorProbability
{
  return self->_posteriorProbability;
}

- (void)setPosteriorProbability:(double)a3
{
  self->_posteriorProbability = a3;
}

- (double)classConditionalProbability
{
  return self->_classConditionalProbability;
}

- (void)setClassConditionalProbability:(double)a3
{
  self->_classConditionalProbability = a3;
}

- (unint64_t)uniqueOccurrencesInMode
{
  return self->_uniqueOccurrencesInMode;
}

- (void)setUniqueOccurrencesInMode:(unint64_t)a3
{
  self->_uniqueOccurrencesInMode = a3;
}

- (unint64_t)modeOccurrences
{
  return self->_modeOccurrences;
}

- (void)setModeOccurrences:(unint64_t)a3
{
  self->_modeOccurrences = a3;
}

- (unint64_t)localOccurrences
{
  return self->_localOccurrences;
}

- (void)setLocalOccurrences:(unint64_t)a3
{
  self->_localOccurrences = a3;
}

- (unint64_t)globalOccurrences
{
  return self->_globalOccurrences;
}

- (void)setGlobalOccurrences:(unint64_t)a3
{
  self->_globalOccurrences = a3;
}

- (double)modePopularity
{
  return self->_modePopularity;
}

- (void)setModePopularity:(double)a3
{
  self->_modePopularity = a3;
}

- (double)globalPopularity
{
  return self->_globalPopularity;
}

- (void)setGlobalPopularity:(double)a3
{
  self->_globalPopularity = a3;
}

- (double)ratioModeAndGlobalPopularity
{
  return self->_ratioModeAndGlobalPopularity;
}

- (void)setRatioModeAndGlobalPopularity:(double)a3
{
  self->_ratioModeAndGlobalPopularity = a3;
}

- (unint64_t)localOccurrencesAcrossAllEntities
{
  return self->_localOccurrencesAcrossAllEntities;
}

- (void)setLocalOccurrencesAcrossAllEntities:(unint64_t)a3
{
  self->_localOccurrencesAcrossAllEntities = a3;
}

- (NSArray)totalModeLaunchesHistogramForLast28Days
{
  return self->_totalModeLaunchesHistogramForLast28Days;
}

- (void)setTotalModeLaunchesHistogramForLast28Days:(id)a3
{
  objc_storeStrong((id *)&self->_totalModeLaunchesHistogramForLast28Days, a3);
}

- (NSArray)totalGlobalLaunchesHistogramForLast28Days
{
  return self->_totalGlobalLaunchesHistogramForLast28Days;
}

- (void)setTotalGlobalLaunchesHistogramForLast28Days:(id)a3
{
  objc_storeStrong((id *)&self->_totalGlobalLaunchesHistogramForLast28Days, a3);
}

- (ATXModeEntityProtocol)entity
{
  return self->_entity;
}

- (void)setEntity:(id)a3
{
  objc_storeStrong((id *)&self->_entity, a3);
}

- (NSString)entityDescription
{
  return self->_entityDescription;
}

- (void)setEntityDescription:(id)a3
{
  objc_storeStrong((id *)&self->_entityDescription, a3);
}

- (NSObject)entitySpecificFeatures
{
  return self->_entitySpecificFeatures;
}

- (void)setEntitySpecificFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_entitySpecificFeatures, a3);
}

- (NSArray)macPortableGlobalAppLaunchesHistogramForLast28Days
{
  return self->_macPortableGlobalAppLaunchesHistogramForLast28Days;
}

- (void)setMacPortableGlobalAppLaunchesHistogramForLast28Days:(id)a3
{
  objc_storeStrong((id *)&self->_macPortableGlobalAppLaunchesHistogramForLast28Days, a3);
}

- (NSArray)macPortableModeAppLaunchesHistogramForLast28Days
{
  return self->_macPortableModeAppLaunchesHistogramForLast28Days;
}

- (void)setMacPortableModeAppLaunchesHistogramForLast28Days:(id)a3
{
  objc_storeStrong((id *)&self->_macPortableModeAppLaunchesHistogramForLast28Days, a3);
}

- (NSArray)macDesktopGlobalAppLaunchesHistogramForLast28Days
{
  return self->_macDesktopGlobalAppLaunchesHistogramForLast28Days;
}

- (void)setMacDesktopGlobalAppLaunchesHistogramForLast28Days:(id)a3
{
  objc_storeStrong((id *)&self->_macDesktopGlobalAppLaunchesHistogramForLast28Days, a3);
}

- (NSArray)macDesktopModeAppLaunchesHistogramForLast28Days
{
  return self->_macDesktopModeAppLaunchesHistogramForLast28Days;
}

- (void)setMacDesktopModeAppLaunchesHistogramForLast28Days:(id)a3
{
  objc_storeStrong((id *)&self->_macDesktopModeAppLaunchesHistogramForLast28Days, a3);
}

- (NSArray)localDeviceGlobalAppLaunchesHistogramForLast28Days
{
  return self->_localDeviceGlobalAppLaunchesHistogramForLast28Days;
}

- (void)setLocalDeviceGlobalAppLaunchesHistogramForLast28Days:(id)a3
{
  objc_storeStrong((id *)&self->_localDeviceGlobalAppLaunchesHistogramForLast28Days, a3);
}

- (NSArray)localDeviceModeAppLaunchesHistogramForLast28Days
{
  return self->_localDeviceModeAppLaunchesHistogramForLast28Days;
}

- (void)setLocalDeviceModeAppLaunchesHistogramForLast28Days:(id)a3
{
  objc_storeStrong((id *)&self->_localDeviceModeAppLaunchesHistogramForLast28Days, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localDeviceModeAppLaunchesHistogramForLast28Days, 0);
  objc_storeStrong((id *)&self->_localDeviceGlobalAppLaunchesHistogramForLast28Days, 0);
  objc_storeStrong((id *)&self->_macDesktopModeAppLaunchesHistogramForLast28Days, 0);
  objc_storeStrong((id *)&self->_macDesktopGlobalAppLaunchesHistogramForLast28Days, 0);
  objc_storeStrong((id *)&self->_macPortableModeAppLaunchesHistogramForLast28Days, 0);
  objc_storeStrong((id *)&self->_macPortableGlobalAppLaunchesHistogramForLast28Days, 0);
  objc_storeStrong((id *)&self->_entitySpecificFeatures, 0);
  objc_storeStrong((id *)&self->_entityDescription, 0);
  objc_storeStrong((id *)&self->_entity, 0);
  objc_storeStrong((id *)&self->_totalGlobalLaunchesHistogramForLast28Days, 0);
  objc_storeStrong((id *)&self->_totalModeLaunchesHistogramForLast28Days, 0);
  objc_storeStrong((id *)&self->_modeDescription, 0);
}

@end
