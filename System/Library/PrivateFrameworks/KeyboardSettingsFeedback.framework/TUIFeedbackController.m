@implementation TUIFeedbackController

+ (id)controller
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (BOOL)shouldCompleteStudyWithPreferenceValue:(BOOL)a3
{
  _BOOL4 v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  BOOL v9;
  NSObject *v10;

  v4 = -[TUIFeedbackController feedbackFeatureEnabled](self, "feedbackFeatureEnabled");
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BEB4D30], "getSupportedLangRegion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");

    if (IXACanLogMessageAtLevel())
    {
      IXAFeedbackLogFacility();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[TUIFeedbackController shouldCompleteStudyWithPreferenceValue:].cold.2(v6 != 0);

    }
    v8 = objc_msgSend(MEMORY[0x24BEB4D30], "getFeedbackState");
    LOBYTE(v4) = 0;
    if (v6)
      v9 = v8 == 2;
    else
      v9 = 0;
    if (v9 && !a3)
    {
      if (IXACanLogMessageAtLevel())
      {
        IXAFeedbackLogFacility();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          -[TUIFeedbackController shouldCompleteStudyWithPreferenceValue:].cold.1();

      }
      LOBYTE(v4) = 1;
    }
  }
  return v4;
}

- (void)completeStudyWithFinalPreferenceValue:(BOOL)a3 parentController:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[6];

  v4 = a3;
  v6 = (void *)MEMORY[0x24BEB4D30];
  v7 = a4;
  v8 = objc_msgSend(v6, "getFeedbackState");
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIFeedbackController _updateStudyDataWithFinalPreferenceValue:finalTimestamp:](self, "_updateStudyDataWithFinalPreferenceValue:finalTimestamp:", v4, v9);

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __80__TUIFeedbackController_completeStudyWithFinalPreferenceValue_parentController___block_invoke;
  v10[3] = &unk_251083EE8;
  v10[4] = self;
  v10[5] = v8;
  -[TUIFeedbackController _presentSurveyWithParentController:completionHandler:](self, "_presentSurveyWithParentController:completionHandler:", v7, v10);

}

uint64_t __80__TUIFeedbackController_completeStudyWithFinalPreferenceValue_parentController___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateStudyDataWithSurveyOutcome:surveyError:initialState:", a2, a3, *(_QWORD *)(a1 + 40));
}

- (void)_presentSurveyWithParentController:(id)a3 completionHandler:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  TUIFeedbackController *v12;
  id v13;

  v5 = a4;
  objc_msgSend(MEMORY[0x24BEB4D30], "getFormIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BE31368];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __78__TUIFeedbackController__presentSurveyWithParentController_completionHandler___block_invoke;
  v10[3] = &unk_251083F38;
  v12 = self;
  v13 = v5;
  v11 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "fetchCountsForFormWithIdentifier:completion:", v8, v10);

}

void __78__TUIFeedbackController__presentSurveyWithParentController_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  void (*v7)(void);
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  _QWORD v25[4];
  id v26;

  v5 = a3;
  if (v5)
  {
    if (IXACanLogMessageAtLevel())
    {
      IXADefaultLogFacility();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        __78__TUIFeedbackController__presentSurveyWithParentController_completionHandler___block_invoke_cold_3((uint64_t)v5);

    }
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_13:
    v7();
    goto LABEL_14;
  }
  objc_msgSend(a2, "currentCampaign");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (IXACanLogMessageAtLevel())
    {
      IXADefaultLogFacility();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        __78__TUIFeedbackController__presentSurveyWithParentController_completionHandler___block_invoke_cold_2();

    }
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    goto LABEL_13;
  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE31370]), "initWithIdentifier:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v10, "prefill:answer:", CFSTR(":like_purchase"), CFSTR("Yes, no or maybe"));
  objc_msgSend(*(id *)(a1 + 40), "computeSurveyMetadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "initialPreferenceValue"))
    v12 = CFSTR("1");
  else
    v12 = CFSTR("0");
  objc_msgSend(v10, "prefill:answer:", CFSTR(":initialPreferenceValue"), v12);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v11, "duration"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "prefill:answer:", CFSTR(":duration"), v13);

  objc_msgSend(v10, "setAuthenticationMethod:", 1);
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE31360]), "initWithFeedbackForm:", v10);
  v14 = objc_alloc_init(MEMORY[0x24BE31378]);
  objc_msgSend(v14, "setPromptStyle:", 1);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("FEEDBACK_AUTOCORRECTION_DISABLED_TITLE"), &stru_251084198, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setLocalizedPromptTitle:", v16);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("FEEDBACK_AUTOCORRECTION_DISABLED_MESSAGE"), &stru_251084198, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setLocalizedPromptMessage:", v18);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("FEEDBACK_DECLINE_ACTION_LABEL"), &stru_251084198, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setLocalizedAlertViewDeclineButtonTitle:", v20);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("FEEDBACK_ACCEPT_ACTION_LABEL"), &stru_251084198, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setLocalizedAlertViewProceedButtonTitle:", v22);

  if (IXACanLogMessageAtLevel())
  {
    IXADefaultLogFacility();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      __78__TUIFeedbackController__presentSurveyWithParentController_completionHandler___block_invoke_cold_1((_QWORD *)(a1 + 32));

  }
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __78__TUIFeedbackController__presentSurveyWithParentController_completionHandler___block_invoke_120;
  v25[3] = &unk_251083F10;
  v26 = *(id *)(a1 + 48);
  objc_msgSend(v24, "collectFeedbackWithLaunchConfiguration:completion:", v14, v25);

LABEL_14:
}

uint64_t __78__TUIFeedbackController__presentSurveyWithParentController_completionHandler___block_invoke_120(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_updateStudyDataWithFinalPreferenceValue:(BOOL)a3 finalTimestamp:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v4 = a3;
  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[TUIFeedbackController currentInputModes](self, "currentInputModes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEB4D30], "setFeedbackState:", 1);
  objc_msgSend(MEMORY[0x24BEB4D30], "setFinalInputModes:", v7);
  objc_msgSend(MEMORY[0x24BEB4D30], "setFinalTimestamp:", v6);
  objc_msgSend(MEMORY[0x24BEB4D30], "setFinalPreferenceValue:", v4);
  if (IXACanLogMessageAtLevel())
  {
    IXAFeedbackLogFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BEB4D30], "getStudyID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("%s Feedback %@: completeStudy finalPreferenceValue: %d finalInputModes: %@ finalTimestamp: %@"), "-[TUIFeedbackController _updateStudyDataWithFinalPreferenceValue:finalTimestamp:]", v10, v4, v7, v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v13 = v11;
      _os_log_debug_impl(&dword_2401E2000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
  }

}

- (void)_updateStudyDataWithSurveyOutcome:(int64_t)a3 surveyError:(id)a4 initialState:(int64_t)a5
{
  __CFString *v6;
  NSObject *v7;

  v6 = (__CFString *)a4;
  objc_msgSend(MEMORY[0x24BEB4D30], "setFeedbackState:", 3);
  objc_msgSend(MEMORY[0x24BEB4D30], "setSurveyOutcome:", a3);
  if (IXACanLogMessageAtLevel())
  {
    IXAFeedbackLogFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[TUIFeedbackController _updateStudyDataWithSurveyOutcome:surveyError:initialState:].cold.1(v6, a3);

  }
}

- (id)computeSurveyMetadata
{
  void *v3;
  TUIFeedbackSurveyMetadata *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  TUIFeedbackSurveyMetadata *v17;
  uint64_t v19;
  const __CFString *v20;
  const __CFString *v21;
  void *v22;
  void *v23;

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [TUIFeedbackSurveyMetadata alloc];
  -[TUIFeedbackController build](self, "build");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIFeedbackController model](self, "model");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "languageCode");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = &stru_251084198;
  v21 = v7;
  objc_msgSend(v3, "countryCode");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = &stru_251084198;
  v20 = v10;
  v11 = objc_msgSend(MEMORY[0x24BEB4D30], "getInitialPreferenceValue");
  objc_msgSend(MEMORY[0x24BEB4D30], "getInitialInputModes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEB4D30], "getInitialTimestamp");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(MEMORY[0x24BEB4D30], "getFinalPreferenceValue");
  objc_msgSend(MEMORY[0x24BEB4D30], "getFinalInputModes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEB4D30], "getFinalTimestamp");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v19) = v14;
  v17 = -[TUIFeedbackSurveyMetadata initWithBuild:model:language:region:initialPreferenceValue:initialInputModes:initialTimestamp:finalPreferenceValue:finalInputModes:finalTimestamp:](v4, "initWithBuild:model:language:region:initialPreferenceValue:initialInputModes:initialTimestamp:finalPreferenceValue:finalInputModes:finalTimestamp:", v23, v22, v21, v20, v11, v12, v13, v19, v15, v16);

  return v17;
}

- (id)currentInputModes
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDF6B48], "sharedInputModeController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enabledInputModeIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)feedbackFeatureEnabled
{
  void *v2;
  char v3;
  NSObject *v4;

  if (feedbackFeatureEnabled_once_token != -1)
    dispatch_once(&feedbackFeatureEnabled_once_token, &__block_literal_global);
  if (feedbackFeatureEnabled_is_internal_install)
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.keyboard"));
    v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("feedbackFeatureEnabled"));

  }
  else
  {
    v3 = 0;
  }
  if (IXACanLogMessageAtLevel())
  {
    IXAFeedbackLogFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[TUIFeedbackController feedbackFeatureEnabled].cold.1(v3);

  }
  return v3;
}

uint64_t __47__TUIFeedbackController_feedbackFeatureEnabled__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  feedbackFeatureEnabled_is_internal_install = result;
  return result;
}

- (id)build
{
  if (build_onceToken != -1)
    dispatch_once(&build_onceToken, &__block_literal_global_140);
  return (id)build_build;
}

void __30__TUIFeedbackController_build__block_invoke()
{
  __CFString *v0;
  __CFString *v1;

  v1 = (__CFString *)MGCopyAnswer();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v0 = v1;
  else
    v0 = &stru_251084198;
  objc_storeStrong((id *)&build_build, v0);

}

- (id)model
{
  if (model_onceToken != -1)
    dispatch_once(&model_onceToken, &__block_literal_global_143);
  return (id)model_deviceModelName;
}

void __30__TUIFeedbackController_model__block_invoke()
{
  __CFString *v0;
  __CFString *v1;

  v1 = (__CFString *)MGCopyAnswer();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v0 = v1;
  else
    v0 = &stru_251084198;
  objc_storeStrong((id *)&model_deviceModelName, v0);

}

- (void)shouldCompleteStudyWithPreferenceValue:.cold.1()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BEB4D30], "getStudyID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%s Feedback %@: action: completionPending"), "-[TUIFeedbackController shouldCompleteStudyWithPreferenceValue:]", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v2;
  OUTLINED_FUNCTION_0(&dword_2401E2000, v3, v4, "%@", (uint8_t *)&v5);

  OUTLINED_FUNCTION_3();
}

- (void)shouldCompleteStudyWithPreferenceValue:(char)a1 .cold.2(char a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BEB4D30], "getStudyID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%s Feedback %@: eligible: %d"), "-[TUIFeedbackController shouldCompleteStudyWithPreferenceValue:]", v3, a1 & 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2401E2000, v5, v6, "%@", v7);

  OUTLINED_FUNCTION_1();
}

void __78__TUIFeedbackController__presentSurveyWithParentController_completionHandler___block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BEB4D30], "getStudyID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%s Feedback %@: launching survey: %@"), "-[TUIFeedbackController _presentSurveyWithParentController:completionHandler:]_block_invoke", v3, *a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2401E2000, v5, v6, "%@", v7);

  OUTLINED_FUNCTION_1();
}

void __78__TUIFeedbackController__presentSurveyWithParentController_completionHandler___block_invoke_cold_2()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BEB4D30], "getStudyID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%s Feedback %@: already running a campaign - should not happen"), "-[TUIFeedbackController _presentSurveyWithParentController:completionHandler:]_block_invoke", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v2;
  OUTLINED_FUNCTION_0(&dword_2401E2000, v3, v4, "%@", (uint8_t *)&v5);

  OUTLINED_FUNCTION_3();
}

void __78__TUIFeedbackController__presentSurveyWithParentController_completionHandler___block_invoke_cold_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BEB4D30], "getStudyID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%s Feedback %@: error getting response from feedback service: %@"), "-[TUIFeedbackController _presentSurveyWithParentController:completionHandler:]_block_invoke", v3, a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2401E2000, v5, v6, "%@", v7);

  OUTLINED_FUNCTION_1();
}

- (void)_updateStudyDataWithSurveyOutcome:(const __CFString *)a1 surveyError:(uint64_t)a2 initialState:.cold.1(const __CFString *a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BEB4D30], "getStudyID");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = CFSTR("none");
  if (a1)
    v7 = a1;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%s Feedback %@: completeStudy surveyOutcome: %ld surveyError: %@"), "-[TUIFeedbackController _updateStudyDataWithSurveyOutcome:surveyError:initialState:]", v5, a2, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2401E2000, v9, v10, "%@", v11);

}

- (void)feedbackFeatureEnabled
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BEB4D30], "getStudyID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%s Feedback %@: RC_SEED_BUILD: 0 enabled: %d"), "-[TUIFeedbackController feedbackFeatureEnabled]", v3, a1 & 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2401E2000, v5, v6, "%@", v7);

  OUTLINED_FUNCTION_1();
}

@end
