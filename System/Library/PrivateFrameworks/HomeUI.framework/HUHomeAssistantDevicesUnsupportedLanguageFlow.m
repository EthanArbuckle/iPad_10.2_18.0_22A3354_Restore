@implementation HUHomeAssistantDevicesUnsupportedLanguageFlow

- (HUHomeAssistantDevicesUnsupportedLanguageFlow)initWithHomeAssistantDevicesHavingLanguageMismatch:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  HUHomeAssistantDevicesUnsupportedLanguageFlow *v8;
  HUHomeAssistantDevicesUnsupportedLanguageFlow *v9;
  void *v10;
  uint64_t v11;
  NAFuture *onboardingFuture;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HUHomeAssistantDevicesUnsupportedLanguageFlow;
  v8 = -[HUHomeAssistantDevicesUnsupportedLanguageFlow init](&v18, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_home, a4);
    objc_initWeak(&location, v9);
    objc_msgSend((id)objc_opt_class(), "needsOnboardingForHome:options:", v7, MEMORY[0x1E0C9AA70]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __105__HUHomeAssistantDevicesUnsupportedLanguageFlow_initWithHomeAssistantDevicesHavingLanguageMismatch_home___block_invoke;
    v14[3] = &unk_1E6F4E9B8;
    objc_copyWeak(&v16, &location);
    v15 = v6;
    objc_msgSend(v10, "flatMap:", v14);
    v11 = objc_claimAutoreleasedReturnValue();
    onboardingFuture = v9->_onboardingFuture;
    v9->_onboardingFuture = (NAFuture *)v11;

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v9;
}

id __105__HUHomeAssistantDevicesUnsupportedLanguageFlow_initWithHomeAssistantDevicesHavingLanguageMismatch_home___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0D519C0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __105__HUHomeAssistantDevicesUnsupportedLanguageFlow_initWithHomeAssistantDevicesHavingLanguageMismatch_home___block_invoke_2;
  v8[3] = &unk_1E6F4E990;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  v5 = v3;
  v9 = v5;
  v10 = *(id *)(a1 + 32);
  objc_msgSend(v4, "futureWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v11);
  return v6;
}

void __105__HUHomeAssistantDevicesUnsupportedLanguageFlow_initWithHomeAssistantDevicesHavingLanguageMismatch_home___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  HUHomeAssistantDevicesUnsupportedLanguageViewController *v4;
  uint64_t v5;
  void *v6;
  HUHomeAssistantDevicesUnsupportedLanguageViewController *v7;
  id v8;

  v8 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (objc_msgSend(*(id *)(a1 + 32), "BOOLValue"))
  {
    v4 = [HUHomeAssistantDevicesUnsupportedLanguageViewController alloc];
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(WeakRetained, "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HUHomeAssistantDevicesUnsupportedLanguageViewController initWithHomeAssistantDevicesHavingLanguageMismatch:home:](v4, "initWithHomeAssistantDevicesHavingLanguageMismatch:home:", v5, v6);
    objc_msgSend(WeakRetained, "setInitialViewController:", v7);

  }
  else
  {
    objc_msgSend(v8, "finishWithNoResult");
  }

}

- (NSString)description
{
  return (NSString *)CFSTR("Unsupported HomePods");
}

- (id)processUserInput:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v11;
  uint8_t buf[4];
  HUHomeAssistantDevicesUnsupportedLanguageFlow *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HULanguageOnboardingKey_UnsupportedLanguage_UserInput"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v13 = self;
    v14 = 2112;
    v15 = v8;
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ with input results: %@", buf, 0x20u);

  }
  if (objc_msgSend(v6, "integerValue") != 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUHomeAssistantDevicesUnsupportedLanguageFlow.m"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(userInputValue.integerValue == HULanguageOnboardingValue_UnsupportedLanguage_Completed)"));

  }
  if (objc_msgSend(v6, "integerValue") == 6)
  {
    -[HUHomeAssistantDevicesUnsupportedLanguageFlow onboardingFuture](self, "onboardingFuture");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "finishWithNoResult");

  }
  return 0;
}

+ (id)needsOnboardingForHome:(id)a3 options:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AAB0], a4);
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (NAFuture)onboardingFuture
{
  return self->_onboardingFuture;
}

- (void)setOnboardingFuture:(id)a3
{
  objc_storeStrong((id *)&self->_onboardingFuture, a3);
}

- (HUConfigurationViewController)initialViewController
{
  return self->_initialViewController;
}

- (void)setInitialViewController:(id)a3
{
  objc_storeStrong((id *)&self->_initialViewController, a3);
}

- (BOOL)shouldAbortThisOnboardingFlowGroup
{
  return self->_shouldAbortThisOnboardingFlowGroup;
}

- (void)setShouldAbortThisOnboardingFlowGroup:(BOOL)a3
{
  self->_shouldAbortThisOnboardingFlowGroup = a3;
}

- (BOOL)shouldAbortAllOnboarding
{
  return self->_shouldAbortAllOnboarding;
}

- (void)setShouldAbortAllOnboarding:(BOOL)a3
{
  self->_shouldAbortAllOnboarding = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialViewController, 0);
  objc_storeStrong((id *)&self->_onboardingFuture, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
