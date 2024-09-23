@implementation HRAtrialFibrillationEducationSection

- (id)initForSinglePlayer:(BOOL)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HRAtrialFibrillationEducationSection;
  result = -[HRAtrialFibrillationEducationSection init](&v5, sel_init);
  if (result)
    *((_BYTE *)result + 8) = a3;
  return result;
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
  -[HRAtrialFibrillationEducationSection _cellTitleForEducationRow:](self, "_cellTitleForEducationRow:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v9);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Education.%@"), v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "healthAccessibilityIdentifier:suffix:", 2, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityIdentifier:", v12);

  return v6;
}

- (void)selectCellForIndex:(unint64_t)a3 navigationController:(id)a4 animated:(BOOL)a5
{
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  -[HRAtrialFibrillationEducationSection _viewControllerForEducationRow:](self, "_viewControllerForEducationRow:", a3);
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
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;

  switch(a3)
  {
    case 0uLL:
      HRHeartRhythmUIFrameworkBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_INTRO_ROW_TITLE");
      goto LABEL_6;
    case 1uLL:
      HRHeartRhythmUIFrameworkBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_HOW_TITLE");
      goto LABEL_6;
    case 2uLL:
      HRHeartRhythmUIFrameworkBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_SHOULD_KNOW_TITLE");
      goto LABEL_6;
    case 3uLL:
      HRHeartRhythmUIFrameworkBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("ATRIAL_FIBRILLATION_DETECTION_ENABLE_NOTIFICATION_TITLE");
LABEL_6:
      objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Antimony"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      return v3;
  }
  return v3;
}

- (id)_viewControllerForEducationRow:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  HRAtrialFibrillationIntroViewController *v5;
  __objc2_class *v6;

  switch(a3)
  {
    case 0uLL:
      v5 = objc_alloc_init(HRAtrialFibrillationIntroViewController);
      return v5;
    case 1uLL:
      v6 = HROnboardingAtrialFibrillationWhatIsViewController;
      goto LABEL_8;
    case 2uLL:
      v6 = HROnboardingAtrialFibrillationLimitationViewController;
      goto LABEL_8;
    case 3uLL:
      v6 = HROnboardingAtrialFibrillationEnableViewController;
LABEL_8:
      v5 = (HRAtrialFibrillationIntroViewController *)objc_msgSend([v6 alloc], "initForOnboarding:", 0, v3, v4);
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (BOOL)forSinglePlayer
{
  return self->_forSinglePlayer;
}

@end
