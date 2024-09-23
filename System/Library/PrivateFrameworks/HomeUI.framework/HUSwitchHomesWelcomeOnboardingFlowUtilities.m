@implementation HUSwitchHomesWelcomeOnboardingFlowUtilities

+ (id)currentUserHasUnfinishedFeatureOnboardingForHome:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  _QWORD v17[9];

  v17[8] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v17[0] = objc_opt_class();
  v17[1] = objc_opt_class();
  v17[2] = objc_opt_class();
  v17[3] = objc_opt_class();
  v17[4] = objc_opt_class();
  v17[5] = objc_opt_class();
  v17[6] = objc_opt_class();
  v17[7] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __96__HUSwitchHomesWelcomeOnboardingFlowUtilities_currentUserHasUnfinishedFeatureOnboardingForHome___block_invoke;
  v15 = &unk_1E6F58258;
  v16 = v3;
  v5 = v3;
  objc_msgSend(v4, "na_map:", &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler", v12, v13, v14, v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "combineAllFutures:ignoringErrors:scheduler:", v6, 1, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "flatMap:", &__block_literal_global_155);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __96__HUSwitchHomesWelcomeOnboardingFlowUtilities_currentUserHasUnfinishedFeatureOnboardingForHome___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "needsOnboardingForHome:options:", *(_QWORD *)(a1 + 32), MEMORY[0x1E0C9AA70]);
}

id __96__HUSwitchHomesWelcomeOnboardingFlowUtilities_currentUserHasUnfinishedFeatureOnboardingForHome___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_msgSend(a2, "na_any:", &__block_literal_global_13_1);
  v3 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "futureWithResult:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __96__HUSwitchHomesWelcomeOnboardingFlowUtilities_currentUserHasUnfinishedFeatureOnboardingForHome___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  v6 = objc_msgSend(v5, "BOOLValue");
  return v6;
}

@end
