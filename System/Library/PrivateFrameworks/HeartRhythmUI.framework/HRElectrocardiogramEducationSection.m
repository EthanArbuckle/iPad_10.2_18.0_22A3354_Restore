@implementation HRElectrocardiogramEducationSection

- (HRElectrocardiogramEducationSection)initWithHealthStore:(id)a3 forSinglePlayer:(BOOL)a4 activeAlgorithmVersion:(id)a5
{
  id v9;
  id v10;
  HRElectrocardiogramEducationSection *v11;
  HRElectrocardiogramEducationSection *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HRElectrocardiogramEducationSection;
  v11 = -[HRElectrocardiogramEducationSection init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_store, a3);
    v12->_forSinglePlayer = a4;
    objc_storeStrong((id *)&v12->_activeAlgorithmVersion, a5);
  }

  return v12;
}

- (id)fetchActiveECGAlgorithmVersion
{
  NSNumber *activeAlgorithmVersion;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  id v14;

  activeAlgorithmVersion = self->_activeAlgorithmVersion;
  if (activeAlgorithmVersion)
    return activeAlgorithmVersion;
  -[HRElectrocardiogramEducationSection store](self, "store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "profileIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "type");

  if (v7 == 1)
  {
    v8 = (void *)MEMORY[0x24BDD3B70];
    -[HRElectrocardiogramEducationSection store](self, "store");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    objc_msgSend(v8, "versionWithHealthStore:error:", v9, &v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v14;

    if (v11)
    {
      _HKInitializeLogging();
      v12 = *MEMORY[0x24BDD3010];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_ERROR))
        -[HRElectrocardiogramEducationSection fetchActiveECGAlgorithmVersion].cold.1((uint64_t)v11, v12, v13);
    }

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)sectionTitle
{
  return 0;
}

- (unint64_t)numberOfRowsInSection
{
  if (self->_forSinglePlayer)
    return 4;
  else
    return 3;
}

- (id)cellForIndex:(unint64_t)a3 tableView:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(a4, "dequeueReusableCellWithIdentifier:", CFSTR("UITableViewCell"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 1, CFSTR("UITableViewCell"));
    objc_msgSend(v6, "textLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAdjustsFontForContentSizeCategory:", 1);

    objc_msgSend(v6, "textLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNumberOfLines:", 0);

    objc_msgSend(v6, "setAccessoryType:", 1);
  }
  -[HRElectrocardiogramEducationSection _cellTitleForEducationRow:](self, "_cellTitleForEducationRow:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v9);

  objc_msgSend(v6, "detailTextLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", 0);

  objc_msgSend(CFSTR("Education"), "stringByAppendingFormat:", CFSTR(".Cell.%@"), v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "healthAccessibilityIdentifier:suffix:", 1, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityIdentifier:", v13);

  return v6;
}

- (void)selectCellForIndex:(unint64_t)a3 navigationController:(id)a4 animated:(BOOL)a5
{
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  -[HRElectrocardiogramEducationSection _viewControllerForEducationRow:](self, "_viewControllerForEducationRow:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v9, "topViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "showAdaptively:sender:animated:", v7, 0, 1);

  }
}

- (id)_cellTitleForEducationRow:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  __CFString *v6;

  v6 = CFSTR("ECG_ONBOARDING_2_TITLE");
  switch(a3)
  {
    case 0uLL:
      goto LABEL_8;
    case 1uLL:
      v6 = CFSTR("ECG_EDUCATION_3_TITLE");
      goto LABEL_8;
    case 2uLL:
      if (-[HRElectrocardiogramEducationSection _hasOnboardedBefore](self, "_hasOnboardedBefore", v3, v4))
        v6 = CFSTR("ECG_V2_ONBOARDING_4_TITLE");
      else
        v6 = CFSTR("ECG_ONBOARDING_4_TITLE");
      goto LABEL_8;
    case 3uLL:
      v6 = CFSTR("ECG_EDUCATION_5_TITLE");
LABEL_8:
      HRUIECGLocalizedString(v6);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return v6;
  }
  return v6;
}

- (id)_viewControllerForEducationRow:(unint64_t)a3
{
  __objc2_class *v4;
  void *v5;
  void *v6;
  void *v7;

  switch(a3)
  {
    case 0uLL:
      v4 = HROnboardingElectrocardiogramExplanationViewController;
      goto LABEL_8;
    case 1uLL:
      -[HRElectrocardiogramEducationSection fetchActiveECGAlgorithmVersion](self, "fetchActiveECGAlgorithmVersion");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        +[HRElectrocardiogramOnboardingManager electrocardiogramPossibleResultsViewControllerForAlgorithmVersion:forOnboarding:](HRElectrocardiogramOnboardingManager, "electrocardiogramPossibleResultsViewControllerForAlgorithmVersion:forOnboarding:", objc_msgSend(v6, "integerValue"), 0);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v5 = 0;
      }

      break;
    case 2uLL:
      v4 = HROnboardingElectrocardiogramFeatureLimitationsViewController;
      goto LABEL_8;
    case 3uLL:
      v4 = HROnboardingElectrocardiogramTakeRecordingViewController;
LABEL_8:
      v5 = (void *)objc_msgSend([v4 alloc], "initForOnboarding:", 0);
      break;
    default:
      v5 = 0;
      break;
  }
  objc_msgSend(v5, "setDelegate:", self);
  return v5;
}

- (BOOL)_hasOnboardedBefore
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  char v10;
  id v12;

  v3 = objc_alloc(MEMORY[0x24BDD3BF8]);
  v4 = *MEMORY[0x24BDD2DE0];
  -[HRElectrocardiogramEducationSection store](self, "store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFeatureIdentifier:healthStore:", v4, v5);

  v12 = 0;
  objc_msgSend(v6, "featureStatusWithError:", &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;
  if (!v7)
  {
    _HKInitializeLogging();
    v9 = *MEMORY[0x24BDD3010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_ERROR))
      -[HRElectrocardiogramEducationSection _hasOnboardedBefore].cold.1((uint64_t)self, (uint64_t)v8, v9);
  }
  v10 = objc_msgSend(v7, "isOnboardingRecordPresent");

  return v10;
}

- (id)dateCache
{
  return 0;
}

- (NSMutableDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (BOOL)firstTimeOnboarding
{
  return self->_firstTimeOnboarding;
}

- (HKHealthStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
  objc_storeStrong((id *)&self->_store, a3);
}

- (BOOL)forSinglePlayer
{
  return self->_forSinglePlayer;
}

- (NSNumber)activeAlgorithmVersion
{
  return self->_activeAlgorithmVersion;
}

- (void)setActiveAlgorithmVersion:(id)a3
{
  objc_storeStrong((id *)&self->_activeAlgorithmVersion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeAlgorithmVersion, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
}

- (void)fetchActiveECGAlgorithmVersion
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 136446466;
  v4 = "-[HRElectrocardiogramEducationSection fetchActiveECGAlgorithmVersion]";
  v5 = 2114;
  v6 = a1;
  OUTLINED_FUNCTION_0(&dword_215454000, a2, a3, "[%{public}s] Failed to fetch algorithm version: %{public}@", (uint8_t *)&v3);
}

- (void)_hasOnboardedBefore
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  OUTLINED_FUNCTION_0(&dword_215454000, a3, (uint64_t)a3, "[%{public}@] Failed to get feature status with error: %@", (uint8_t *)&v3);
}

@end
