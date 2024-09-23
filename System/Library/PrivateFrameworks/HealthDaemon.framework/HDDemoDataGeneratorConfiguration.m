@implementation HDDemoDataGeneratorConfiguration

+ (id)configurationFromDefaults:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v4, "objectForKey:", CFSTR("HealthDemoDataProfileTypeKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "setProfileType:", objc_msgSend(v4, "integerForKey:", CFSTR("HealthDemoDataProfileTypeKey")));
    objc_msgSend(v5, "setGenerationPeriodInDays:", objc_msgSend(v4, "integerForKey:", CFSTR("HealthDemoInitialDataGenerationPeriodKey")));
    objc_msgSend(v5, "setHighFidelityGeneration:", objc_msgSend(v4, "BOOLForKey:", CFSTR("HealthDemoDataHighFidelityDataKey")));
    objc_msgSend(v5, "setShouldPresentNotifications:", objc_msgSend(v4, "BOOLForKey:", CFSTR("HealthDemoDataEnableNotificationsKey")));
    objc_msgSend(v5, "setBiologicalSex:", objc_msgSend(v4, "integerForKey:", CFSTR("HealthDemoDataGenderKey")));
    objc_msgSend(v5, "setSampleTrackingType:", objc_msgSend(v4, "integerForKey:", CFSTR("HealthDemoDataDataTrackingTypeKey")));
    objc_msgSend(v5, "setNutritionTrackingType:", objc_msgSend(v4, "integerForKey:", CFSTR("HealthDemoDataNutritionTrackingTypeKey")));
    objc_msgSend(v5, "setResultsTrackingType:", objc_msgSend(v4, "integerForKey:", CFSTR("HealthDemoDataResultsTrackingTypeKey")));
    objc_msgSend(v5, "setShouldGenerateMedicalID:", objc_msgSend(v4, "BOOLForKey:", CFSTR("HealthDemoDataGenerateMedicalIDKey")));
    objc_msgSend(v5, "setShouldGenerateHealthDocuments:", objc_msgSend(v4, "BOOLForKey:", CFSTR("HealthDemoDataGenerateHealthDocumentsKey")));
    objc_msgSend(v5, "setShouldEnsureRecentWorkoutHasRoute:", objc_msgSend(v4, "BOOLForKey:", CFSTR("HealthDemoDataEnsureRecentWorkoutHasRouteKey")));
    objc_msgSend(v5, "setShouldGenerateRecentLiquidsIntake:", objc_msgSend(v4, "BOOLForKey:", CFSTR("HealthDemoDataGenerateRecentLiquidsKey")));
    objc_msgSend(v5, "setShouldGenerateLoudHeadphoneData:", objc_msgSend(v4, "BOOLForKey:", CFSTR("HealthDemoDataLoudHeadphoneListeningKey")));
  }
  else
  {
    objc_msgSend(v5, "configureForProfileType:", 1);
  }

  return v5;
}

- (HDDemoDataGeneratorConfiguration)init
{
  HDDemoDataGeneratorConfiguration *v2;
  HDDemoDataGeneratorConfiguration *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HDDemoDataGeneratorConfiguration;
  v2 = -[HDDemoDataGeneratorConfiguration init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[HDDemoDataGeneratorConfiguration configureForProfileType:](v2, "configureForProfileType:", 1);
  return v3;
}

- (void)configureForProfileType:(int64_t)a3
{
  void *v4;
  int v5;
  int64_t v6;
  int64x2_t v7;
  id v8;

  self->_profileType = a3;
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAppleWatch");

  if (v5)
  {
    v6 = 1;
  }
  else if (objc_msgSend(MEMORY[0x1E0CB6F18], "isRunningStoreDemoMode"))
  {
    v6 = 180;
  }
  else
  {
    v6 = 90;
  }
  self->_generationPeriodInDays = v6;
  self->_highFidelityGeneration = objc_msgSend(MEMORY[0x1E0CB6F18], "runningInStoreDemoModeF201");
  v7 = vdupq_n_s64(1uLL);
  *(int64x2_t *)&self->_biologicalSex = v7;
  *(int64x2_t *)&self->_nutritionTrackingType = v7;
  self->_shouldGenerateMedicalID = 1;
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  self->_shouldGenerateHealthDocuments = objc_msgSend(v8, "isAppleWatch") ^ 1;

}

- (void)persistToDefaults:(id)a3
{
  void *v4;
  int64_t profileType;
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
  id v19;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  profileType = self->_profileType;
  v6 = a3;
  objc_msgSend(v4, "numberWithInteger:", profileType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("HealthDemoDataProfileTypeKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_generationPeriodInDays);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v8, CFSTR("HealthDemoInitialDataGenerationPeriodKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_highFidelityGeneration);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v9, CFSTR("HealthDemoDataHighFidelityDataKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldPresentNotifications);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v10, CFSTR("HealthDemoDataEnableNotificationsKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_biologicalSex);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v11, CFSTR("HealthDemoDataGenderKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_sampleTrackingType);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v12, CFSTR("HealthDemoDataDataTrackingTypeKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_nutritionTrackingType);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v13, CFSTR("HealthDemoDataNutritionTrackingTypeKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_resultsTrackingType);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v14, CFSTR("HealthDemoDataResultsTrackingTypeKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldGenerateMedicalID);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v15, CFSTR("HealthDemoDataGenerateMedicalIDKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldGenerateHealthDocuments);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v16, CFSTR("HealthDemoDataGenerateHealthDocumentsKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldEnsureRecentWorkoutHasRoute);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v17, CFSTR("HealthDemoDataEnsureRecentWorkoutHasRouteKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldGenerateRecentLiquidsIntake);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v18, CFSTR("HealthDemoDataGenerateRecentLiquidsKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldGenerateLoudHeadphoneData);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v19, CFSTR("HealthDemoDataLoudHeadphoneListeningKey"));

}

- (int64_t)profileType
{
  return self->_profileType;
}

- (void)setProfileType:(int64_t)a3
{
  self->_profileType = a3;
}

- (int64_t)generationPeriodInDays
{
  return self->_generationPeriodInDays;
}

- (void)setGenerationPeriodInDays:(int64_t)a3
{
  self->_generationPeriodInDays = a3;
}

- (BOOL)highFidelityGeneration
{
  return self->_highFidelityGeneration;
}

- (void)setHighFidelityGeneration:(BOOL)a3
{
  self->_highFidelityGeneration = a3;
}

- (BOOL)shouldPresentNotifications
{
  return self->_shouldPresentNotifications;
}

- (void)setShouldPresentNotifications:(BOOL)a3
{
  self->_shouldPresentNotifications = a3;
}

- (int64_t)biologicalSex
{
  return self->_biologicalSex;
}

- (void)setBiologicalSex:(int64_t)a3
{
  self->_biologicalSex = a3;
}

- (int64_t)sampleTrackingType
{
  return self->_sampleTrackingType;
}

- (void)setSampleTrackingType:(int64_t)a3
{
  self->_sampleTrackingType = a3;
}

- (int64_t)nutritionTrackingType
{
  return self->_nutritionTrackingType;
}

- (void)setNutritionTrackingType:(int64_t)a3
{
  self->_nutritionTrackingType = a3;
}

- (int64_t)resultsTrackingType
{
  return self->_resultsTrackingType;
}

- (void)setResultsTrackingType:(int64_t)a3
{
  self->_resultsTrackingType = a3;
}

- (BOOL)shouldGenerateHealthDocuments
{
  return self->_shouldGenerateHealthDocuments;
}

- (void)setShouldGenerateHealthDocuments:(BOOL)a3
{
  self->_shouldGenerateHealthDocuments = a3;
}

- (BOOL)shouldGenerateMedicalID
{
  return self->_shouldGenerateMedicalID;
}

- (void)setShouldGenerateMedicalID:(BOOL)a3
{
  self->_shouldGenerateMedicalID = a3;
}

- (BOOL)shouldEnsureRecentWorkoutHasRoute
{
  return self->_shouldEnsureRecentWorkoutHasRoute;
}

- (void)setShouldEnsureRecentWorkoutHasRoute:(BOOL)a3
{
  self->_shouldEnsureRecentWorkoutHasRoute = a3;
}

- (BOOL)shouldGenerateRecentLiquidsIntake
{
  return self->_shouldGenerateRecentLiquidsIntake;
}

- (void)setShouldGenerateRecentLiquidsIntake:(BOOL)a3
{
  self->_shouldGenerateRecentLiquidsIntake = a3;
}

- (BOOL)shouldGenerateLoudHeadphoneData
{
  return self->_shouldGenerateLoudHeadphoneData;
}

- (void)setShouldGenerateLoudHeadphoneData:(BOOL)a3
{
  self->_shouldGenerateLoudHeadphoneData = a3;
}

@end
