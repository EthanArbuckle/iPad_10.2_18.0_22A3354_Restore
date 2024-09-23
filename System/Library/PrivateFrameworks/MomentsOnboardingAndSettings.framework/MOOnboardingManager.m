@implementation MOOnboardingManager

- (MOOnboardingManager)init
{
  MOOnboardingManager *v2;
  MOOnboardingManager *v3;
  _TtC28MomentsOnboardingAndSettings21MOOnboardingManagerUI *ui;
  MOOnboardingManager *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MOOnboardingManager;
  v2 = -[MOOnboardingManager init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    ui = v2->ui;
    v2->ui = 0;

    *(_WORD *)&v3->hasCheckedOnboardingStatus = 0;
    v5 = v3;
  }

  return v3;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__MOOnboardingManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, block);
  return (id)sharedInstance_shared_2;
}

void __37__MOOnboardingManager_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_shared_2;
  sharedInstance_shared_2 = (uint64_t)v1;

}

- (id)_getOnboardingManagerUI
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__MOOnboardingManager__getOnboardingManagerUI__block_invoke;
  block[3] = &unk_25133F698;
  block[4] = self;
  if (_getOnboardingManagerUI_onceToken != -1)
    dispatch_once(&_getOnboardingManagerUI_onceToken, block);
  return self->ui;
}

void __46__MOOnboardingManager__getOnboardingManagerUI__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_opt_new();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

}

- (id)getSheetOnboardingViewController
{
  void *v2;
  void *v3;

  -[MOOnboardingManager _getOnboardingManagerUI](self, "_getOnboardingManagerUI");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createSheetOnboardingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)getSheetOnboardingViewControllerWithDelegate:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MOOnboardingManager _getOnboardingManagerUI](self, "_getOnboardingManagerUI");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createSheetOnboardingViewControllerWith:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)onboardingFlowCompletionStatus
{
  void *v2;
  unint64_t v3;

  self->hasCheckedOnboardingStatus = 1;
  +[MOOnboardingAndSettingsManager sharedInstance](MOOnboardingAndSettingsManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "getOnboardingFlowCompletionStatus");

  return v3;
}

- (void)setOnboardingFlowCompletionStatus:(unint64_t)a3
{
  NSObject *v6;
  void *v7;
  void *v8;

  if (!self->hasCheckedOnboardingStatus)
  {
    _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[MOOnboardingManager setOnboardingFlowCompletionStatus:].cold.1();

    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOOnboardingManager.m"), 73, CFSTR("Can't set onboarding status if you have not checked what it was before trying to set it (in %s:%d)"), "-[MOOnboardingManager setOnboardingFlowCompletionStatus:]", 73);

  }
  self->hasSetOnboardingStatus = 1;
  +[MOOnboardingAndSettingsManager sharedInstance](MOOnboardingAndSettingsManager, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setOnboardingFlowCompletionStatus:", a3);

}

- (unint64_t)onboardingFlowRefreshCompletionStatus
{
  NSObject *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  if (!self->hasSetOnboardingStatus)
  {
    _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[MOOnboardingManager onboardingFlowRefreshCompletionStatus].cold.1();

    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOOnboardingManager.m"), 80, CFSTR("Can't check onboarding refresh status if you have not changed onboarding status (in %s:%d)"), "-[MOOnboardingManager onboardingFlowRefreshCompletionStatus]", 80);

  }
  +[MOOnboardingAndSettingsManager sharedInstance](MOOnboardingAndSettingsManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "getOnboardingFlowRefreshCompletionStatus");

  return v7;
}

- (BOOL)isOnboarded
{
  return (-[MOOnboardingManager onboardingFlowCompletionStatus](self, "onboardingFlowCompletionStatus") & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (MOOnboardingManagerDelegate)delegate
{
  void *v2;
  void *v3;

  +[MOOnboardingAndSettingsManager sharedInstance](MOOnboardingAndSettingsManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "onboardingManagerDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MOOnboardingManagerDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[MOOnboardingAndSettingsManager sharedInstance](MOOnboardingAndSettingsManager, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOnboardingManagerDelegate:", v3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->ui, 0);
}

- (void)setOnboardingFlowCompletionStatus:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_2422B0000, v0, v1, "Can't set onboarding status if you have not checked what it was before trying to set it (in %s:%d)", v2, v3, v4, v5, v6);
}

- (void)onboardingFlowRefreshCompletionStatus
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_2422B0000, v0, v1, "Can't check onboarding refresh status if you have not changed onboarding status (in %s:%d)", v2, v3, v4, v5, v6);
}

@end
