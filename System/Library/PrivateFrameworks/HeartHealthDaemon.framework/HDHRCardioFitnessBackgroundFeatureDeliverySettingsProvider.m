@implementation HDHRCardioFitnessBackgroundFeatureDeliverySettingsProvider

- (HDHRCardioFitnessBackgroundFeatureDeliverySettingsProvider)initWithHeartRateSettingsDefaults:(id)a3
{
  id v5;
  HDHRCardioFitnessBackgroundFeatureDeliverySettingsProvider *v6;
  HDHRCardioFitnessBackgroundFeatureDeliverySettingsProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDHRCardioFitnessBackgroundFeatureDeliverySettingsProvider;
  v6 = -[HDHRCardioFitnessBackgroundFeatureDeliverySettingsProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_heartRateSettingsDefaults, a3);

  return v7;
}

- (id)featureSettingsUponBackgroundDelivery
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99E08]);
  v8 = *MEMORY[0x1E0D2F9E8];
  v9[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithDictionary:", v4);

  if (-[NSUserDefaults BOOLForKey:](self->_heartRateSettingsDefaults, "BOOLForKey:", *MEMORY[0x1E0CB76E0]))
    objc_msgSend(v5, "setValue:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D2F9F0]);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6720]), "initWithDictionary:", v5);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heartRateSettingsDefaults, 0);
}

@end
