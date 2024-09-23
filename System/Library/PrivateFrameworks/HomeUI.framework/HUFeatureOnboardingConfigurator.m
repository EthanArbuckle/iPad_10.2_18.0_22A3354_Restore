@implementation HUFeatureOnboardingConfigurator

- (id)_nextViewControllerForResults:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v21;
  int v22;
  HUFeatureOnboardingConfigurator *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUConfigurator currentViewController](self, "currentViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUConfigurator configuratorDelegate](self, "configuratorDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138413314;
    v23 = self;
    v24 = 2112;
    v25 = v7;
    v26 = 2112;
    v27 = v8;
    v28 = 2112;
    v29 = v5;
    v30 = 2112;
    v31 = v9;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ Advancing configurator view controller from %@ & results %@ (note that configuratorDelegate = %@)", (uint8_t *)&v22, 0x34u);

  }
  -[HUConfigurator configuratorDelegate](self, "configuratorDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    HFLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v22 = 136315138;
      v23 = (HUFeatureOnboardingConfigurator *)"-[HUFeatureOnboardingConfigurator _nextViewControllerForResults:]";
      _os_log_error_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_ERROR, "%s The configuration flow is already finished! We should not present any more view controllers.", (uint8_t *)&v22, 0xCu);
    }

  }
  -[HUConfigurator currentViewController](self, "currentViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "conformsToProtocol:", &unk_1EF244CC8))
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  if (!v14)
  {
    HFLogForCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v22 = 136315138;
      v23 = (HUFeatureOnboardingConfigurator *)"-[HUFeatureOnboardingConfigurator _nextViewControllerForResults:]";
      _os_log_error_impl(&dword_1B8E1E000, v15, OS_LOG_TYPE_ERROR, "%s The current view controller must support the HUConfigurationViewControllerFlow protocol!", (uint8_t *)&v22, 0xCu);
    }

  }
  -[HUConfigurator configuratorDelegate](self, "configuratorDelegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "conformsToProtocol:", &unk_1EF2905F0))
    v17 = v16;
  else
    v17 = 0;
  v18 = v17;

  if (objc_msgSend(MEMORY[0x1E0D319D0], "isInternalInstall") && !v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUFeatureOnboardingConfigurator.m"), 31, CFSTR("The configuratorDelegate must support the HUFeatureOnboardingConfiguratorDelegate protocol!"));

  }
  objc_msgSend(v18, "getNextViewControllerForOnboardingInput:currentOnboardingFlowClass:", v5, objc_msgSend(v14, "onboardingFlowClass"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (void)viewControllerDidGoBack:(id)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HUFeatureOnboardingConfigurator;
  -[HUConfigurator viewControllerDidGoBack:](&v9, sel_viewControllerDidGoBack_, a3);
  -[HUConfigurator configuratorDelegate](self, "configuratorDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "conformsToProtocol:", &unk_1EF2905F0))
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUFeatureOnboardingConfigurator.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("featureOnboardingDelegate != nil"));

  }
  objc_msgSend(v7, "restartCurrentOnboarding");

}

@end
