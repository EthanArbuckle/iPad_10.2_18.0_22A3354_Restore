@implementation UIColor(HKMenstrualCyclesUI)

+ (id)hkmc_calendarTodayLabelColor
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIDynamicColorWithColors();
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)_hkmcui_colorWithAssetName:()HKMenstrualCyclesUI
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BEBD4B8];
  v4 = (void *)MEMORY[0x24BDD1488];
  v5 = a3;
  objc_msgSend(v4, "hkmcui_bundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorNamed:inBundle:compatibleWithTraitCollection:", v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (uint64_t)hkmc_cycleHistoryFilterBackgroundColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "_hkmcui_colorWithAssetName:", CFSTR("CycleHistoryFilterBackground"));
}

+ (id)hkmc_cycleHistoryFilterLabelColor
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIDynamicColorWithColors();
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (uint64_t)hkmc_cycleHistorySectionCellBackgroundColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "tertiarySystemBackgroundColor");
}

+ (uint64_t)hkmc_cycleHistoryGradientFadeColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "tertiarySystemBackgroundColor");
}

+ (id)hkmc_doneButtonLoggingCarouselColor
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x24BEBD4B8], "_hkmcui_colorWithAssetName:", CFSTR("DoneButtonLoggingCarousel"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "tertiarySystemBackgroundColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIDynamicColorWithColors();
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (uint64_t)hkmc_fertileWindowColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "systemTealColor");
}

+ (uint64_t)hkmc_fertilityBackgroundColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "_hkmcui_colorWithAssetName:", CFSTR("Fertility Background"));
}

+ (uint64_t)hkmc_fertilityBackgroundFadedColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "_hkmcui_colorWithAssetName:", CFSTR("Fertility Background Faded"));
}

+ (id)hkmc_fertilityProjectionColor
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x24BEBD4B8];
  objc_msgSend(MEMORY[0x24BEBD640], "hkmc_fertilityProjectionImage");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorWithPatternImage:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)hkmc_loggingCardBackgroundColor
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGray4Color");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorWithAlphaComponent:", 0.13);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGray4Color");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIDynamicColorWithColors();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (uint64_t)hkmc_menstruationColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "_hkmcui_colorWithAssetName:", CFSTR("Menstruation"));
}

+ (id)hkmc_menstruationCalendarFutureColor
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BEBD4B8], "hkmc_menstruationColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorWithAlphaComponent:", 0.2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (uint64_t)hkmc_menstruationTimelineFutureColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "_hkmcui_colorWithAssetName:", CFSTR("Menstruation Timeline Future"));
}

+ (id)hkmc_menstruationBackgroundColor
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BEBD4B8], "hkmc_menstruationColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorWithAlphaComponent:", 0.08);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD4B8], "hkmc_menstruationColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.24);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  HKUIDynamicColorWithColors();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (uint64_t)hkmc_menstruationLoggingCardGradientAColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "_hkmcui_colorWithAssetName:", CFSTR("MenstruationLoggingCardGradientA"));
}

+ (uint64_t)hkmc_menstruationLoggingCardGradientBColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "_hkmcui_colorWithAssetName:", CFSTR("MenstruationLoggingCardGradientB"));
}

+ (id)hkmc_menstruationProjectionHighColor
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x24BEBD4B8];
  objc_msgSend(MEMORY[0x24BEBD640], "hkmc_menstruationProjectionHighImage");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorWithPatternImage:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)hkmc_menstruationProjectionLowColor
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x24BEBD4B8];
  objc_msgSend(MEMORY[0x24BEBD640], "hkmc_menstruationProjectionLowImage");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorWithPatternImage:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)hkmc_projectionTextColor
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIDynamicColorWithColors();
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (uint64_t)hkmc_regularDayColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "_hkmcui_colorWithAssetName:", CFSTR("RegularDay"));
}

+ (uint64_t)hkmc_supplementaryDataColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "_hkmcui_colorWithAssetName:", CFSTR("Supplementary Data"));
}

+ (id)hkmc_supplementaryDataBackgroundColor
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BEBD4B8], "hkmc_supplementaryDataTextColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorWithAlphaComponent:", 0.08);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD4B8], "hkmc_supplementaryDataTextColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.24);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  HKUIDynamicColorWithColors();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)hkmc_cycleLogCellBackgroundColor
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BEBD4B8], "secondarySystemBackgroundColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorWithAlphaComponent:", 0.8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD4B8], "secondarySystemBackgroundColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIDynamicColorWithColors();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)hkmc_cycleFactorsTimeIntervalBackgroundColor
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x24BEBD4B8], "hkmc_regularDayColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "quaternarySystemFillColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIDynamicColorWithColors();
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)hkmc_highContrastCycleFactorsTimeIntervalBackgroundColor
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x24BEBD4B8], "hkmc_highContrastRegularDayColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "quaternarySystemFillColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIDynamicColorWithColors();
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (uint64_t)hkmc_supplementaryDataTextColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "_hkmcui_colorWithAssetName:", CFSTR("Supplementary Data Text"));
}

+ (id)hkmc_supplementaryDataTextFutureColor
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "hkmc_supplementaryDataTextColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "colorWithAlphaComponent:", 0.2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (uint64_t)hkmc_supplementaryDataTimelineFutureColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "_hkmcui_colorWithAssetName:", CFSTR("Supplementary Data Timeline Future"));
}

+ (uint64_t)hkmc_supplementaryLoggingCardGradientAColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "_hkmcui_colorWithAssetName:", CFSTR("SupplementaryLoggingCardGradientA"));
}

+ (uint64_t)hkmc_supplementaryLoggingCardGradientBColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "_hkmcui_colorWithAssetName:", CFSTR("SupplementaryLoggingCardGradientB"));
}

+ (uint64_t)hkmc_menstruationSelectionTintColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "_hkmcui_colorWithAssetName:", CFSTR("MenstruationSelectionTint"));
}

+ (uint64_t)hkmc_supplementaryDataSelectionTintColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "_hkmcui_colorWithAssetName:", CFSTR("SupplementaryDataSelectionTint"));
}

+ (uint64_t)hkmc_highContrastRegularDayColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "_hkmcui_colorWithAssetName:", CFSTR("HighContrastRegularDay"));
}

+ (uint64_t)hkmc_highContrastMenstruationColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "_hkmcui_colorWithAssetName:", CFSTR("HighContrastMenstruation"));
}

+ (id)hkmc_highContrastMenstruationBackgroundColor
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BEBD4B8], "hkmc_highContrastMenstruationColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorWithAlphaComponent:", 0.08);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD4B8], "hkmc_highContrastMenstruationColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.24);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  HKUIDynamicColorWithColors();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (uint64_t)hkmc_highContrastSupplementaryDataTextColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "_hkmcui_colorWithAssetName:", CFSTR("HighContrastSupplementaryData"));
}

+ (id)hkmc_highContrastSupplementaryDataBackgroundColor
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BEBD4B8], "hkmc_highContrastSupplementaryDataTextColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorWithAlphaComponent:", 0.08);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD4B8], "hkmc_highContrastSupplementaryDataTextColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.24);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  HKUIDynamicColorWithColors();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (uint64_t)hkmc_highContrastSupplementaryLoggingCardGradientAColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "_hkmcui_colorWithAssetName:", CFSTR("HighContrastSupplementaryLoggingCardGradientA"));
}

+ (uint64_t)hkmc_highContrastSupplementaryLoggingCardGradientBColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "_hkmcui_colorWithAssetName:", CFSTR("HighContrastSupplementaryLoggingCardGradientB"));
}

+ (uint64_t)hkmc_highContrastMenstruationLoggingCardGradientAColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "_hkmcui_colorWithAssetName:", CFSTR("HighContrastMenstruationLoggingCardGradientA"));
}

+ (uint64_t)hkmc_highContrastMenstruationLoggingCardGradientBColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "_hkmcui_colorWithAssetName:", CFSTR("HighContrastMenstruationLoggingCardGradientB"));
}

+ (uint64_t)hkmc_ovulationDayColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "_hkmcui_colorWithAssetName:", CFSTR("Ovulation Day"));
}

+ (id)hkmc_ovulationDayCycleTimelineColor
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x24BEBD4B8];
  objc_msgSend(MEMORY[0x24BEBD640], "hkmc_ovulationDayImage");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorWithPatternImage:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)hkmc_ovulationDayCycleTimelineReversedColor
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x24BEBD4B8];
  objc_msgSend(MEMORY[0x24BEBD640], "hkmc_ovulationDayReversedImage");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorWithPatternImage:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (uint64_t)hkmc_ovulationDayCycleHistoryColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "_hkmcui_colorWithAssetName:", CFSTR("Ovulation Day Cycle History"));
}

+ (uint64_t)hkmc_ovulationDayCycleHistoryFadedColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "_hkmcui_colorWithAssetName:", CFSTR("Ovulation Day Cycle History Faded"));
}

@end
