@implementation WFSpeechRecognitionAccessResource

+ (BOOL)isSystemResource
{
  return 1;
}

- (id)name
{
  return WFLocalizedString(CFSTR("Speech Recognition"));
}

- (id)icon
{
  return (id)objc_msgSend(MEMORY[0x24BEC14E0], "actionKitImageNamed:", CFSTR("SpeechRecognition"));
}

- (id)localizedProtectedResourceDescriptionWithContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  WFLocalizedStringResourceWithKey(CFSTR("speech recognition"), CFSTR("speech recognition"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localize:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)status
{
  void *v2;
  id v3;
  void *v4;
  unint64_t v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v2 = (void *)getAFPreferencesClass_softClass_6720;
  v11 = getAFPreferencesClass_softClass_6720;
  if (!getAFPreferencesClass_softClass_6720)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __getAFPreferencesClass_block_invoke_6721;
    v7[3] = &unk_24F8BB430;
    v7[4] = &v8;
    __getAFPreferencesClass_block_invoke_6721((uint64_t)v7);
    v2 = (void *)v9[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v8, 8);
  objc_msgSend(v3, "sharedPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "dictationIsEnabled"))
    v5 = 4;
  else
    v5 = 3;

  return v5;
}

- (id)localizedErrorReasonForStatus:(unint64_t)a3
{
  return WFLocalizedString(CFSTR("In order to use this action, enable Dictation in Keyboard Settings."));
}

- (id)localizedErrorRecoveryOptionsForStatus:(unint64_t)a3
{
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  WFLocalizedString(CFSTR("Enable Dictation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)attemptRecoveryFromErrorWithOptionIndex:(unint64_t)a3 userInterface:(id)a4 completionHandler:(id)a5
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a5;
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=General&path=Keyboard/DictationSettings"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE193A0], "sharedContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __109__WFSpeechRecognitionAccessResource_attemptRecoveryFromErrorWithOptionIndex_userInterface_completionHandler___block_invoke;
  v9[3] = &unk_24F8B4CD0;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "openURL:completionHandler:", v6, v9);

}

uint64_t __109__WFSpeechRecognitionAccessResource_attemptRecoveryFromErrorWithOptionIndex_userInterface_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
