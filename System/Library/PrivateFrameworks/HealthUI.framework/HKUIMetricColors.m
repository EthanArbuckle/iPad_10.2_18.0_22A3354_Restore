@implementation HKUIMetricColors

+ (id)vitalsColors
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_vitalsKeyColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setKeyColor:", v3);

  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartOverlayPillLightColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContextViewPrimaryTextColor:", v4);

  objc_msgSend(MEMORY[0x1E0DC3658], "hk_defaultSecondaryTextColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContextViewSecondaryTextColor:", v5);

  return v2;
}

+ (id)activityColors
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_activityKeyColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setKeyColor:", v3);

  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartOverlayPillLightColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContextViewPrimaryTextColor:", v4);

  objc_msgSend(MEMORY[0x1E0DC3658], "hk_defaultSecondaryTextColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContextViewSecondaryTextColor:", v5);

  return v2;
}

+ (id)bodyMeasurementColors
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_bodyMeasurementsKeyColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setKeyColor:", v3);

  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartOverlayPillLightColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContextViewPrimaryTextColor:", v4);

  objc_msgSend(MEMORY[0x1E0DC3658], "hk_defaultSecondaryTextColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContextViewSecondaryTextColor:", v5);

  return v2;
}

+ (id)mindfulnessColors
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_mindfulnessKeyColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setKeyColor:", v3);

  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartOverlayPillDarkColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContextViewPrimaryTextColor:", v4);

  objc_msgSend(MEMORY[0x1E0DC3658], "hk_defaultSecondaryTextColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContextViewSecondaryTextColor:", v5);

  return v2;
}

+ (id)mobilityColors
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_mobilityKeyColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setKeyColor:", v3);

  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartOverlayPillDarkColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContextViewPrimaryTextColor:", v4);

  objc_msgSend(MEMORY[0x1E0DC3658], "hk_defaultSecondaryTextColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContextViewSecondaryTextColor:", v5);

  return v2;
}

+ (id)nutritionColors
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_nutritionKeyColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setKeyColor:", v3);

  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartOverlayPillDarkColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContextViewPrimaryTextColor:", v4);

  objc_msgSend(MEMORY[0x1E0DC3658], "hk_defaultSecondaryTextColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContextViewSecondaryTextColor:", v5);

  return v2;
}

+ (id)pregnancyColors
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_pregnancyKeyColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setKeyColor:", v3);

  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartOverlayPillDarkColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContextViewPrimaryTextColor:", v4);

  objc_msgSend(MEMORY[0x1E0DC3658], "hk_defaultSecondaryTextColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContextViewSecondaryTextColor:", v5);

  return v2;
}

+ (id)reproductiveHealthColors
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_reproductiveHealthKeyColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setKeyColor:", v3);

  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartOverlayPillLightColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContextViewPrimaryTextColor:", v4);

  objc_msgSend(MEMORY[0x1E0DC3658], "hk_defaultSecondaryTextColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContextViewSecondaryTextColor:", v5);

  return v2;
}

+ (id)sleepColors
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_sleepKeyColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setKeyColor:", v3);

  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartOverlayPillDarkColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContextViewPrimaryTextColor:", v4);

  objc_msgSend(MEMORY[0x1E0DC3658], "hk_defaultSecondaryTextColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContextViewSecondaryTextColor:", v5);

  return v2;
}

+ (id)sleepColorsForSleepAnalysis:(int64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_sleepColorForSleepAnalysis:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setKeyColor:", v5);

  objc_msgSend(MEMORY[0x1E0DC3658], "hk_sleepPrimaryTextColorForSleepAnalysis:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContextViewPrimaryTextColor:", v6);

  objc_msgSend(MEMORY[0x1E0DC3658], "hk_defaultSecondaryTextColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContextViewSecondaryTextColor:", v7);

  return v4;
}

+ (id)hearingHealthColors
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_hearingHealthKeyColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setKeyColor:", v3);

  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartOverlayPillLightColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContextViewPrimaryTextColor:", v4);

  objc_msgSend(MEMORY[0x1E0DC3658], "hk_defaultSecondaryTextColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContextViewSecondaryTextColor:", v5);

  return v2;
}

+ (id)respiratoryColors
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_respiratoryKeyColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setKeyColor:", v3);

  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartOverlayPillDarkColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContextViewPrimaryTextColor:", v4);

  objc_msgSend(MEMORY[0x1E0DC3658], "hk_defaultSecondaryTextColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContextViewSecondaryTextColor:", v5);

  return v2;
}

+ (id)otherColors
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_otherKeyColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setKeyColor:", v3);

  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartOverlayPillLightColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContextViewPrimaryTextColor:", v4);

  objc_msgSend(MEMORY[0x1E0DC3658], "hk_defaultSecondaryTextColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContextViewSecondaryTextColor:", v5);

  return v2;
}

+ (id)symptomsColors
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_symptomsKeyColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setKeyColor:", v3);

  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartOverlayPillLightColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContextViewPrimaryTextColor:", v4);

  objc_msgSend(MEMORY[0x1E0DC3658], "hk_defaultSecondaryTextColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContextViewSecondaryTextColor:", v5);

  return v2;
}

+ (id)categoryColorsWithColor:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setKeyColor:", v3);

  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartOverlayPillLightColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContextViewPrimaryTextColor:", v5);

  objc_msgSend(MEMORY[0x1E0DC3658], "hk_defaultSecondaryTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContextViewSecondaryTextColor:", v6);

  return v4;
}

+ (id)defaultContextViewColorsUsingColor:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setKeyColor:", v3);

  objc_msgSend(MEMORY[0x1E0DC3658], "hk_defaultPrimaryTextColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContextViewPrimaryTextColor:", v5);

  objc_msgSend(MEMORY[0x1E0DC3658], "hk_defaultSecondaryTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContextViewSecondaryTextColor:", v6);

  return v4;
}

+ (id)disabledContextViewColor
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGray4Color");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setKeyColor:", v3);

  objc_msgSend(MEMORY[0x1E0DC3658], "hk_defaultSecondaryTextColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContextViewPrimaryTextColor:", v4);

  objc_msgSend(MEMORY[0x1E0DC3658], "hk_defaultSecondaryTextColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContextViewSecondaryTextColor:", v5);

  return v2;
}

+ (id)workoutContextViewColors
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_workoutKeyColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setKeyColor:", v3);

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContextViewPrimaryTextColor:", v4);

  objc_msgSend(MEMORY[0x1E0DC3658], "hk_defaultSecondaryTextColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContextViewSecondaryTextColor:", v5);

  return v2;
}

- (UIColor)keyColor
{
  return self->_keyColor;
}

- (void)setKeyColor:(id)a3
{
  objc_storeStrong((id *)&self->_keyColor, a3);
}

- (UIColor)contextViewPrimaryTextColor
{
  return self->_contextViewPrimaryTextColor;
}

- (void)setContextViewPrimaryTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_contextViewPrimaryTextColor, a3);
}

- (UIColor)contextViewSecondaryTextColor
{
  return self->_contextViewSecondaryTextColor;
}

- (void)setContextViewSecondaryTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_contextViewSecondaryTextColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextViewSecondaryTextColor, 0);
  objc_storeStrong((id *)&self->_contextViewPrimaryTextColor, 0);
  objc_storeStrong((id *)&self->_keyColor, 0);
}

+ (id)defaultClinicalColors
{
  id v2;
  void *v3;

  v2 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDynamicProvider:", &__block_literal_global_48);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContextViewPrimaryTextColor:", v3);
  objc_msgSend(v2, "setContextViewSecondaryTextColor:", v3);

  return v2;
}

id __51__HKUIMetricColors_Clinical__defaultClinicalColors__block_invoke(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "userInterfaceStyle") == 2)
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)allergiesClinicalColors
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "defaultClinicalColors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_allergiesClinicalKeyColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setKeyColor:", v3);

  return v2;
}

+ (id)carePlansClinicalColors
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "defaultClinicalColors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_carePlansClinicalKeyColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setKeyColor:", v3);

  return v2;
}

+ (id)clinicalNotesClinicalColors
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "defaultClinicalColors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_clinicalNotesClinicalKeyColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setKeyColor:", v3);

  return v2;
}

+ (id)conditionsClinicalColors
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "defaultClinicalColors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_conditionsClinicalKeyColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setKeyColor:", v3);

  return v2;
}

+ (id)devicesClinicalColors
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "defaultClinicalColors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_devicesClinicalKeyColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setKeyColor:", v3);

  return v2;
}

+ (id)immunizationsClinicalColors
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "defaultClinicalColors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_immunizationsClinicalKeyColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setKeyColor:", v3);

  return v2;
}

+ (id)insuranceClinicalColors
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "defaultClinicalColors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_insuranceClinicalKeyColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setKeyColor:", v3);

  return v2;
}

+ (id)labResultsClinicalColors
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "defaultClinicalColors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_labResultsClinicalKeyColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setKeyColor:", v3);

  return v2;
}

+ (id)medicationsClinicalColors
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "defaultClinicalColors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_medicationsClinicalKeyColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setKeyColor:", v3);

  return v2;
}

+ (id)medicationTrackingColors
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "defaultClinicalColors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_medicationTrackingKeyColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setKeyColor:", v3);

  return v2;
}

+ (id)proceduresClinicalColors
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "defaultClinicalColors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_proceduresClinicalKeyColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setKeyColor:", v3);

  return v2;
}

+ (id)socialHistoryClinicalColors
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "defaultClinicalColors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_socialHistoryClinicalKeyColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setKeyColor:", v3);

  return v2;
}

+ (id)vitalsClinicalColors
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "defaultClinicalColors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_vitalsClinicalKeyColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setKeyColor:", v3);

  return v2;
}

+ (id)unknownCategoryClinicalColors
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "defaultClinicalColors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_unknownCategoryClinicalKeyColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setKeyColor:", v3);

  return v2;
}

@end
