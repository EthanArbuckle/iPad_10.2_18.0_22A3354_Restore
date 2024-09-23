@implementation HDMinorExperiencesProfileExtension

- (HDMinorExperiencesProfileExtension)initWithProfile:(id)a3
{
  id v4;
  HDMinorExperiencesProfileExtension *v5;
  HDExampleFeatureProfileExtension *v6;
  HDGlucoseExperienceProfileExtension *v7;
  HDRespiratoryRateMeasurementsProfileExtension *v8;
  HDWristTemperatureMeasurementsProfileExtension *v9;
  uint64_t v10;
  NSArray *minorExperiences;
  objc_super v13;
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HDMinorExperiencesProfileExtension;
  v5 = -[HDMinorExperiencesProfileExtension init](&v13, sel_init);
  if (v5)
  {
    v6 = -[HDExampleFeatureProfileExtension initWithProfile:]([HDExampleFeatureProfileExtension alloc], "initWithProfile:", v4);
    v14[0] = v6;
    v7 = -[HDGlucoseExperienceProfileExtension initWithProfile:]([HDGlucoseExperienceProfileExtension alloc], "initWithProfile:", v4);
    v14[1] = v7;
    v8 = -[HDRespiratoryRateMeasurementsProfileExtension initWithProfile:]([HDRespiratoryRateMeasurementsProfileExtension alloc], "initWithProfile:", v4);
    v14[2] = v8;
    v9 = -[HDWristTemperatureMeasurementsProfileExtension initWithProfile:]([HDWristTemperatureMeasurementsProfileExtension alloc], "initWithProfile:", v4);
    v14[3] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 4);
    v10 = objc_claimAutoreleasedReturnValue();
    minorExperiences = v5->_minorExperiences;
    v5->_minorExperiences = (NSArray *)v10;

  }
  return v5;
}

- (id)featureAvailabilityExtensionForFeatureIdentifier:(id)a3
{
  id v4;
  NSArray *minorExperiences;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  minorExperiences = self->_minorExperiences;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __87__HDMinorExperiencesProfileExtension_featureAvailabilityExtensionForFeatureIdentifier___block_invoke;
  v10[3] = &unk_1E6CEF750;
  v11 = v4;
  v6 = v4;
  -[NSArray hk_map:](minorExperiences, "hk_map:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __87__HDMinorExperiencesProfileExtension_featureAvailabilityExtensionForFeatureIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "featureAvailabilityExtensionForFeatureIdentifier:", *(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minorExperiences, 0);
}

@end
