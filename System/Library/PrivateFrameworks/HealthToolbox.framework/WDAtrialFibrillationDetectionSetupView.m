@implementation WDAtrialFibrillationDetectionSetupView

- (id)createHeroView
{
  return objc_alloc_init(MEMORY[0x24BE4C0C0]);
}

- (id)titleString
{
  void *v2;
  void *v3;

  WDBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_SETUP_TITLE"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable-Antimony"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)bodyString
{
  void *v2;
  void *v3;

  WDBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_SETUP_BODY"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable-Antimony"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)buttonTitleString
{
  void *v2;
  void *v3;

  WDBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_SETUP_BUTTON_TITLE"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable-Antimony"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)accessibilityGroupID
{
  return 2;
}

@end
