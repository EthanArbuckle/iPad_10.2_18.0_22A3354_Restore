@implementation ARUIRingGroup(HKActivitySummary)

- (uint64_t)hk_configureWithActivitySummary:()HKActivitySummary animated:
{
  return objc_msgSend(a1, "hk_configureWithActivitySummary:animated:completion:", a3, a4, 0);
}

- (void)hk_configureWithActivitySummary:()HKActivitySummary animated:completion:
{
  void *v8;
  id v9;
  id v10;
  id v11;

  v8 = (void *)MEMORY[0x24BDD4198];
  v9 = a5;
  v10 = a3;
  objc_msgSend(v8, "sharedBehavior");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "hk_configureWithActivitySummary:isStandaloneFallback:animated:completion:", v10, objc_msgSend(v11, "isStandalonePhoneFitnessMode"), a4, v9);

}

- (void)hk_configureWithActivitySummary:()HKActivitySummary isStandaloneFallback:animated:completion:
{
  id v10;
  double v11;
  int v12;
  id v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  float v18;
  double v19;
  float v20;
  double v21;
  float v22;
  double v23;
  double v24;
  double v25;
  id v26;

  v26 = a3;
  if (v26)
  {
    v10 = a6;
    if (objc_msgSend(v26, "activityMoveMode") == 2)
      objc_msgSend(v26, "_moveMinutesCompletionPercentage");
    else
      objc_msgSend(v26, "_activeEnergyCompletionPercentage");
    v18 = v11;
    objc_msgSend(v26, "_exerciseTimeCompletionPercentage");
    v20 = v19;
    objc_msgSend(v26, "_standHoursCompletionPercentage");
    v22 = v21;
    objc_msgSend(a1, "setIsStandalonePhoneFitnessMode:animated:", objc_msgSend(v26, "_isStandalonePhoneSummary"), 0);
    *(float *)&v23 = v18;
    *(float *)&v24 = v20;
    *(float *)&v25 = v22;
    objc_msgSend(a1, "setActiveEnergyPercentage:exerciseMinutesPercentage:standHoursPercentage:animated:completion:", a5, v10, v23, v24, v25);

    v17 = objc_msgSend(v26, "isPaused");
  }
  else
  {
    v12 = *MEMORY[0x24BE01C70];
    v13 = a6;
    objc_msgSend(a1, "setIsStandalonePhoneFitnessMode:animated:", a4, 0);
    LODWORD(v14) = v12;
    LODWORD(v15) = v12;
    LODWORD(v16) = v12;
    objc_msgSend(a1, "setActiveEnergyPercentage:exerciseMinutesPercentage:standHoursPercentage:animated:completion:", a5, v13, v14, v15, v16);

    v17 = 0;
  }
  objc_msgSend(a1, "setIsPaused:", v17);

}

@end
