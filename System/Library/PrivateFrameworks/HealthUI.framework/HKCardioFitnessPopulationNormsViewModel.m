@implementation HKCardioFitnessPopulationNormsViewModel

- (id)associatedSampleType
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6B00], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5DA0]);
}

- (id)classificationIndexForSampleValue:(double)a3 age:(int64_t)a4 sex:(int64_t)a5
{
  int64_t v6;
  void *v7;

  v6 = +[HKCardioFitnessUtilities cardioFitnessLevelForVO2Max:biologicalSex:age:](HKCardioFitnessUtilities, "cardioFitnessLevelForVO2Max:biologicalSex:age:", a5, a4, a3);
  if (v6 == -1)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HKPopulationNormsAbstractViewModel classificationIndexForLevelIndex:](self, "classificationIndexForLevelIndex:", v6));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (id)viewTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("CARDIO_FITNESS_POPULATION_CHART_VIEW_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-CardioFitness"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)chartTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("CARDIO_FITNESS_POPULATION_CHART_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-CardioFitness"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)levelsTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("CARDIO_FITNESS_LEVELS_VIEW_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-CardioFitness"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)quantityUnitTitle
{
  void *v2;
  void *v3;

  HKHealthKitFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("CARDIO_FITNESS_NUMBERLESS_UNIT"), &stru_1E9C4C428, CFSTR("Localizable-CardioFitness"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)ageBucketsTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("CARDIO_FITNESS_POPULATION_CHART_AGE_BUCKETS_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-CardioFitness"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)footerText
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("CARDIO_FITNESS_LEVELS_ATTRIBUTION"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-CardioFitness"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)seriesHighlightedColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "hk_vitalsKeyColor");
}

- (id)seriesHighlightedSegmentColor
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.588235294, 0.666666667, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.741176471, 0.2, 0.31372549, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIDynamicColorWithColors(v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)numberOfClassifications
{
  return 4;
}

- (BOOL)shouldShowClassificationTitle
{
  return 0;
}

- (id)localizedClassificationTitleForIndex:(unint64_t)a3
{
  return +[HKCardioFitnessUtilities localizedStringForCardioFitnessTitle:](HKCardioFitnessUtilities, "localizedStringForCardioFitnessTitle:", -[HKPopulationNormsAbstractViewModel classificationIndexForLevelIndex:](self, "classificationIndexForLevelIndex:", a3));
}

- (id)classificationIdentifierForIndex:(unint64_t)a3
{
  return +[HKCardioFitnessUtilities classificationIdentifierForIndex:](HKCardioFitnessUtilities, "classificationIdentifierForIndex:", -[HKPopulationNormsAbstractViewModel classificationIndexForLevelIndex:](self, "classificationIndexForLevelIndex:", a3));
}

- (id)localizedClassificationDescriptionForIndex:(unint64_t)a3
{
  unint64_t v4;
  void *v5;
  void *v6;

  v4 = -[HKPopulationNormsAbstractViewModel classificationIndexForLevelIndex:](self, "classificationIndexForLevelIndex:", a3);
  -[HKPopulationNormsAbstractViewModel currentAgeInYears](self, "currentAgeInYears");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKCardioFitnessUtilities localizedStringForCardioFitnessDescription:age:](HKCardioFitnessUtilities, "localizedStringForCardioFitnessDescription:age:", v4, objc_msgSend(v5, "integerValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)localizedClassificationNameForIndex:(unint64_t)a3
{
  return +[HKCardioFitnessUtilities localizedStringForCardioFitnessLevelName:](HKCardioFitnessUtilities, "localizedStringForCardioFitnessLevelName:", -[HKPopulationNormsAbstractViewModel classificationIndexForLevelIndex:](self, "classificationIndexForLevelIndex:", a3));
}

- (id)currentDataForBiologicalSex
{
  return +[HKCardioFitnessUtilities flattenedCardioFitnessDataForBiologicalSex:](HKCardioFitnessUtilities, "flattenedCardioFitnessDataForBiologicalSex:", -[HKPopulationNormsAbstractViewModel currentBiologicalSex](self, "currentBiologicalSex"));
}

- (unint64_t)maximumUserAgeBucketIndex
{
  void *v2;
  unint64_t v3;

  -[HKCardioFitnessPopulationNormsViewModel currentDataForBiologicalSex](self, "currentDataForBiologicalSex");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
    v3 = objc_msgSend(v2, "count") - 1;
  else
    v3 = 0;

  return v3;
}

- (double)maximumSampleValueQuantity
{
  return 70.0;
}

- (double)minimumSampleValueQuantity
{
  return 10.0;
}

- (id)hk_UIAutomationIdentifier
{
  return CFSTR("CardioFitness");
}

@end
