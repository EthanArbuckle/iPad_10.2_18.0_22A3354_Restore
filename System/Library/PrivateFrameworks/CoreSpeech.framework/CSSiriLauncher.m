@implementation CSSiriLauncher

- (void)notifyBuiltInVoiceTriggerPrewarm:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  mach_absolute_time();
  v8 = v5;
  v7 = v5;
  AFSiriActivationVoiceTriggerPrewarm();

}

- (void)notifyBuiltInVoiceTrigger:(id)a3 myriadPHash:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  char v12;
  void *v13;
  id *v14;
  _QWORD *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  char v28;
  _QWORD v29[4];
  id v30;
  char v31;

  v7 = a3;
  v22 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = MEMORY[0x1E0CFE660];
  if (v7)
  {
    objc_msgSend(v9, "setObject:forKey:", v7, *(_QWORD *)(MEMORY[0x1E0CFE660] + 8), v22);
    v12 = objc_msgSend(MEMORY[0x1E0D19260], "isFirstPassSourceTypeRingtoneWithVTEI:", v7);
  }
  else
  {
    v12 = 0;
  }
  if (objc_msgSend(MEMORY[0x1E0D19260], "supportsSCDAFramework", v22))
  {
    v13 = (void *)MEMORY[0x1E0D97CD8];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __67__CSSiriLauncher_notifyBuiltInVoiceTrigger_myriadPHash_completion___block_invoke;
    v29[3] = &unk_1E7C25AB8;
    v14 = &v30;
    v30 = v23;
    v31 = v12;
    v15 = v29;
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0CFE930];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __67__CSSiriLauncher_notifyBuiltInVoiceTrigger_myriadPHash_completion___block_invoke_10;
    v26[3] = &unk_1E7C25AE0;
    v14 = &v27;
    v27 = v23;
    v28 = v12;
    v15 = v26;
  }
  v16 = (void *)objc_msgSend(v13, "newWithBuilder:", v15);

  if (v16)
  {
    v17 = objc_msgSend(MEMORY[0x1E0D19260], "supportsSCDAFramework");
    v18 = 16;
    if (v17)
      v18 = 80;
    objc_msgSend(v10, "setObject:forKey:", v16, *(_QWORD *)(v11 + v18));
  }
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D19120], "sharedLogger");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "logSiriLaunchStartedWithVoiceTriggerEventInfo:", v7);

  }
  mach_absolute_time();
  v24 = v7;
  v25 = v8;
  v20 = v8;
  v21 = v7;
  AFSiriActivationVoiceTriggerActivate();

}

- (void)notifyWakeKeywordSpokenInBuiltInMic:(id)a3
{
  mach_absolute_time();
  AFSiriActivationVoiceKeywordDetected();
}

- (void)notifyCarPlayVoiceTriggerPrewarm:(id)a3 deviceId:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  mach_absolute_time();
  v11 = v7;
  v10 = v7;
  AFSiriActivationVoiceTriggerPrewarm();

}

- (void)notifyCarPlayVoiceTrigger:(id)a3 deviceId:(id)a4 myriadPHash:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id *v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  v12 = (void *)MEMORY[0x1E0D19260];
  v13 = a4;
  if (objc_msgSend(v12, "supportsSCDAFramework"))
  {
    v14 = (void *)MEMORY[0x1E0D97CD8];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __76__CSSiriLauncher_notifyCarPlayVoiceTrigger_deviceId_myriadPHash_completion___block_invoke;
    v30[3] = &unk_1E7C25B70;
    v15 = &v31;
    v31 = v10;
    v16 = v30;
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0CFE930];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __76__CSSiriLauncher_notifyCarPlayVoiceTrigger_deviceId_myriadPHash_completion___block_invoke_2;
    v28[3] = &unk_1E7C25B98;
    v15 = &v29;
    v29 = v10;
    v16 = v28;
  }
  v17 = (void *)objc_msgSend(v14, "newWithBuilder:", v16);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  v20 = MEMORY[0x1E0CFE660];
  if (v9)
    objc_msgSend(v18, "setObject:forKey:", v9, *(_QWORD *)(MEMORY[0x1E0CFE660] + 8));
  if (v17)
  {
    v21 = objc_msgSend(MEMORY[0x1E0D19260], "supportsSCDAFramework");
    v22 = 16;
    if (v21)
      v22 = 80;
    objc_msgSend(v19, "setObject:forKey:", v17, *(_QWORD *)(v20 + v22));
  }
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0D19120], "sharedLogger");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "logSiriLaunchStartedWithVoiceTriggerEventInfo:", v9);

  }
  mach_absolute_time();
  v26 = v9;
  v27 = v11;
  v24 = v11;
  v25 = v9;
  AFSiriActivationVoiceTriggerActivate();

}

- (void)notifyWakeKeywordSpokenCarPlay:(id)a3 deviceId:(id)a4
{
  id v4;

  v4 = a4;
  mach_absolute_time();
  AFSiriActivationVoiceKeywordDetected();

}

- (void)notifyBluetoothDeviceVoiceTriggerPrewarm:(id)a3 deviceId:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  mach_absolute_time();
  v11 = v7;
  v10 = v7;
  AFSiriActivationVoiceTriggerPrewarm();

}

- (void)notifyBluetoothDeviceVoiceTrigger:(id)a3 deviceId:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;

  v7 = a3;
  v8 = a5;
  v9 = (void *)MEMORY[0x1E0C99E08];
  v10 = a4;
  objc_msgSend(v9, "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v7)
  {
    objc_msgSend(v11, "setObject:forKey:", v7, *(_QWORD *)(MEMORY[0x1E0CFE660] + 8));
    objc_msgSend(MEMORY[0x1E0D19120], "sharedLogger");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "logSiriLaunchStartedWithVoiceTriggerEventInfo:", v7);

  }
  mach_absolute_time();
  v16 = v7;
  v17 = v8;
  v14 = v8;
  v15 = v7;
  AFSiriActivationVoiceTriggerActivate();

}

- (void)notifyWakeKeywordSpokenBluetoothDevice:(id)a3 deviceId:(id)a4
{
  id v4;

  v4 = a4;
  mach_absolute_time();
  AFSiriActivationVoiceKeywordDetected();

}

- (void)notifyRemoraVoiceTriggerPrewarm:(id)a3 deviceId:(id)a4 completion:(id)a5
{
  void *v6;
  uint64_t v7;
  id v8;
  id v9;

  if (a5)
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = *MEMORY[0x1E0D18E80];
    v8 = a5;
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 1852, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, id))a5 + 2))(v8, 0, v9);

  }
}

- (void)notifyRemoraVoiceTrigger:(id)a3 myriadPHash:(id)a4 deviceId:(id)a5 completion:(id)a6
{
  if (a6)
    (*((void (**)(id))a6 + 2))(a6);
}

- (void)notifyContinuousConversationActivation:(id)a3 deviceId:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[CSSiriLauncher notifyContinuousConversationActivation:deviceId:completion:]";
    _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  mach_absolute_time();
  v12 = v9;
  v11 = v9;
  AFSiriActivationContinuousConversation();

}

- (void)deactivateSiriActivationConnectionWithReason:(int64_t)a3 withOptions:(unint64_t)a4 withContext:(id)a5
{
  objc_class *v7;
  id v8;
  void *v9;
  _QWORD v10[5];

  v7 = (objc_class *)MEMORY[0x1E0CFE9B8];
  v8 = a5;
  v9 = (void *)objc_msgSend([v7 alloc], "initWithServicePort:", AFSiriActivationServiceGetPort());
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __87__CSSiriLauncher_deactivateSiriActivationConnectionWithReason_withOptions_withContext___block_invoke;
  v10[3] = &__block_descriptor_40_e32_v16__0__AFSiriActivationResult_8l;
  v10[4] = a3;
  objc_msgSend(v9, "deactivateForReason:options:context:completion:", a3, a4, v8, v10);

}

- (void)notifyDarwinVoiceTriggerPrewarmWithCompletion:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  mach_absolute_time();
  v5 = v3;
  v4 = v3;
  AFSiriActivationVoiceTriggerPrewarm();

}

- (void)notifyDarwinVoiceTrigger:(id)a3 deviceId:(id)a4 myriadPHash:(id)a5 myriadLateActivationExpirationTime:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id *v18;
  id *v19;
  _QWORD *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = (void *)MEMORY[0x1E0D19260];
  v16 = a4;
  if (objc_msgSend(v15, "supportsSCDAFramework"))
  {
    v17 = (void *)MEMORY[0x1E0D97CD8];
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __110__CSSiriLauncher_notifyDarwinVoiceTrigger_deviceId_myriadPHash_myriadLateActivationExpirationTime_completion___block_invoke;
    v36[3] = &unk_1E7C25BE0;
    v18 = &v37;
    v37 = v12;
    v19 = &v38;
    v38 = v13;
    v20 = v36;
  }
  else
  {
    v17 = (void *)MEMORY[0x1E0CFE930];
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __110__CSSiriLauncher_notifyDarwinVoiceTrigger_deviceId_myriadPHash_myriadLateActivationExpirationTime_completion___block_invoke_2;
    v33[3] = &unk_1E7C25C08;
    v18 = &v34;
    v34 = v12;
    v19 = &v35;
    v35 = v13;
    v20 = v33;
  }
  v21 = (void *)objc_msgSend(v17, "newWithBuilder:", v20, v12);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  v24 = MEMORY[0x1E0CFE660];
  if (v11)
    objc_msgSend(v22, "setObject:forKey:", v11, *(_QWORD *)(MEMORY[0x1E0CFE660] + 8));
  if (v21)
  {
    v25 = objc_msgSend(MEMORY[0x1E0D19260], "supportsSCDAFramework");
    v26 = 16;
    if (v25)
      v26 = 80;
    objc_msgSend(v23, "setObject:forKey:", v21, *(_QWORD *)(v24 + v26));
  }
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0D19120], "sharedLogger");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "logSiriLaunchStartedWithVoiceTriggerEventInfo:", v11);

  }
  mach_absolute_time();
  v31 = v11;
  v32 = v14;
  v28 = v14;
  v29 = v11;
  AFSiriActivationHoneycombDeviceVoiceTrigger();

}

void __110__CSSiriLauncher_notifyDarwinVoiceTrigger_deviceId_myriadPHash_myriadLateActivationExpirationTime_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setTimestamp:", mach_absolute_time());
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D97CF8]), "initWithData:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setPerceptualAudioHash:", v3);

  objc_msgSend(v4, "setActivationSource:", 13);
  objc_msgSend(v4, "setActivationExpirationTime:", objc_msgSend(*(id *)(a1 + 40), "unsignedLongLongValue"));

}

void __110__CSSiriLauncher_notifyDarwinVoiceTrigger_deviceId_myriadPHash_myriadLateActivationExpirationTime_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setTimestamp:", mach_absolute_time());
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFE950]), "initWithData:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setPerceptualAudioHash:", v3);

  objc_msgSend(v4, "setActivationSource:", 13);
  objc_msgSend(v4, "setActivationExpirationTime:", objc_msgSend(*(id *)(a1 + 40), "unsignedLongLongValue"));

}

void __110__CSSiriLauncher_notifyDarwinVoiceTrigger_deviceId_myriadPHash_myriadLateActivationExpirationTime_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *MEMORY[0x1E0D18F60];
  v6 = *MEMORY[0x1E0D18F60];
  if (v4)
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    v7 = v5;
    objc_msgSend(v3, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 136315394;
    v13 = "-[CSSiriLauncher notifyDarwinVoiceTrigger:deviceId:myriadPHash:myriadLateActivationExpirationTime:completion:]_block_invoke";
    v14 = 2114;
    v15 = v9;
    _os_log_error_impl(&dword_1C2614000, v7, OS_LOG_TYPE_ERROR, "%s Cannot invoke Siri client for voice trigger from Darwin : %{public}@", (uint8_t *)&v12, 0x16u);

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315138;
      v13 = "-[CSSiriLauncher notifyDarwinVoiceTrigger:deviceId:myriadPHash:myriadLateActivationExpirationTime:completion"
            ":]_block_invoke_3";
      _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s Invoked Siri client for voice trigger from Darwin", (uint8_t *)&v12, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject setVoiceTriggerEverUsed](v7, "setVoiceTriggerEverUsed");
  }

LABEL_8:
  objc_msgSend(MEMORY[0x1E0D19120], "sharedLogger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "logSiriLaunchCompletedWithVoiceTriggerEventInfo:", *(_QWORD *)(a1 + 32));

  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(void))(v11 + 16))();

}

void __64__CSSiriLauncher_notifyDarwinVoiceTriggerPrewarmWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v6, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, BOOL, void *))(v4 + 16))(v4, v3 == 0, v5);

  }
}

void __87__CSSiriLauncher_deactivateSiriActivationConnectionWithReason_withOptions_withContext___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 136315394;
    v5 = "-[CSSiriLauncher deactivateSiriActivationConnectionWithReason:withOptions:withContext:]_block_invoke";
    v6 = 2048;
    v7 = v3;
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s SiriActivationConnection deactivated due to %ld", (uint8_t *)&v4, 0x16u);
  }
}

void __77__CSSiriLauncher_notifyContinuousConversationActivation_deviceId_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _BOOL8 v5;
  uint64_t v6;
  id v7;

  if (*(_QWORD *)(a1 + 32))
  {
    v3 = a2;
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 == 0;

    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "error");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, _BOOL8, id))(v6 + 16))(v6, v5, v7);
  }
}

void __66__CSSiriLauncher_notifyWakeKeywordSpokenBluetoothDevice_deviceId___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)*MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      objc_msgSend(v2, "error");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 136315394;
      v9 = "-[CSSiriLauncher notifyWakeKeywordSpokenBluetoothDevice:deviceId:]_block_invoke";
      v10 = 2114;
      v11 = v7;
      _os_log_error_impl(&dword_1C2614000, v5, OS_LOG_TYPE_ERROR, "%s Cannot notify wake keyword spoken event : %{public}@", (uint8_t *)&v8, 0x16u);

    }
  }

}

void __72__CSSiriLauncher_notifyBluetoothDeviceVoiceTrigger_deviceId_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *MEMORY[0x1E0D18F60];
  v6 = *MEMORY[0x1E0D18F60];
  if (v4)
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    v7 = v5;
    objc_msgSend(v3, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 136315394;
    v13 = "-[CSSiriLauncher notifyBluetoothDeviceVoiceTrigger:deviceId:completion:]_block_invoke";
    v14 = 2114;
    v15 = v9;
    _os_log_error_impl(&dword_1C2614000, v7, OS_LOG_TYPE_ERROR, "%s Cannot invoke Siri client : %{public}@", (uint8_t *)&v12, 0x16u);

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315138;
      v13 = "-[CSSiriLauncher notifyBluetoothDeviceVoiceTrigger:deviceId:completion:]_block_invoke";
      _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s Invoked Siri client", (uint8_t *)&v12, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject setVoiceTriggerEverUsed](v7, "setVoiceTriggerEverUsed");
  }

LABEL_8:
  objc_msgSend(MEMORY[0x1E0D19120], "sharedLogger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "logSiriLaunchCompletedWithVoiceTriggerEventInfo:", *(_QWORD *)(a1 + 32));

  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(void))(v11 + 16))();

}

void __79__CSSiriLauncher_notifyBluetoothDeviceVoiceTriggerPrewarm_deviceId_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    if (v4)
    {
      objc_msgSend(v6, "error");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v5);

    }
  }
  else if (v4)
  {
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v4 + 16))(v4, 1, 0);
  }

}

void __58__CSSiriLauncher_notifyWakeKeywordSpokenCarPlay_deviceId___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)*MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      objc_msgSend(v2, "error");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 136315394;
      v9 = "-[CSSiriLauncher notifyWakeKeywordSpokenCarPlay:deviceId:]_block_invoke";
      v10 = 2114;
      v11 = v7;
      _os_log_error_impl(&dword_1C2614000, v5, OS_LOG_TYPE_ERROR, "%s Cannot notify wake keyword spoken event : %{public}@", (uint8_t *)&v8, 0x16u);

    }
  }

}

void __76__CSSiriLauncher_notifyCarPlayVoiceTrigger_deviceId_myriadPHash_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_msgSend(v3, "setTimestamp:", mach_absolute_time());
  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D97CF8]), "initWithData:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setPerceptualAudioHash:", v4);

}

void __76__CSSiriLauncher_notifyCarPlayVoiceTrigger_deviceId_myriadPHash_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_msgSend(v3, "setTimestamp:", mach_absolute_time());
  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CFE950]), "initWithData:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setPerceptualAudioHash:", v4);

}

void __76__CSSiriLauncher_notifyCarPlayVoiceTrigger_deviceId_myriadPHash_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *MEMORY[0x1E0D18F60];
  v6 = *MEMORY[0x1E0D18F60];
  if (v4)
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    v7 = v5;
    objc_msgSend(v3, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 136315394;
    v13 = "-[CSSiriLauncher notifyCarPlayVoiceTrigger:deviceId:myriadPHash:completion:]_block_invoke";
    v14 = 2114;
    v15 = v9;
    _os_log_error_impl(&dword_1C2614000, v7, OS_LOG_TYPE_ERROR, "%s Cannot invoke Siri client for voice trigger from Jarvis : %{public}@", (uint8_t *)&v12, 0x16u);

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315138;
      v13 = "-[CSSiriLauncher notifyCarPlayVoiceTrigger:deviceId:myriadPHash:completion:]_block_invoke_3";
      _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s Invoked Siri client for voice trigger from Jarvis", (uint8_t *)&v12, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject setVoiceTriggerEverUsed](v7, "setVoiceTriggerEverUsed");
  }

LABEL_8:
  objc_msgSend(MEMORY[0x1E0D19120], "sharedLogger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "logSiriLaunchCompletedWithVoiceTriggerEventInfo:", *(_QWORD *)(a1 + 32));

  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(void))(v11 + 16))();

}

void __71__CSSiriLauncher_notifyCarPlayVoiceTriggerPrewarm_deviceId_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *MEMORY[0x1E0D18F60];
  v6 = *MEMORY[0x1E0D18F60];
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = v5;
      objc_msgSend(v3, "error");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 136315394;
      v12 = "-[CSSiriLauncher notifyCarPlayVoiceTriggerPrewarm:deviceId:completion:]_block_invoke";
      v13 = 2114;
      v14 = v9;
      _os_log_error_impl(&dword_1C2614000, v7, OS_LOG_TYPE_ERROR, "%s AFSiriActivationCarPlayDeviceVoiceTriggerPrewarm failed : %{public}@", (uint8_t *)&v11, 0x16u);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315138;
    v12 = "-[CSSiriLauncher notifyCarPlayVoiceTriggerPrewarm:deviceId:completion:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s AFSiriActivationCarPlayDeviceVoiceTriggerPrewarm success", (uint8_t *)&v11, 0xCu);
  }
  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    (*(void (**)(void))(v10 + 16))();

}

void __54__CSSiriLauncher_notifyWakeKeywordSpokenInBuiltInMic___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)*MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      objc_msgSend(v2, "error");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 136315394;
      v9 = "-[CSSiriLauncher notifyWakeKeywordSpokenInBuiltInMic:]_block_invoke";
      v10 = 2114;
      v11 = v7;
      _os_log_error_impl(&dword_1C2614000, v5, OS_LOG_TYPE_ERROR, "%s Cannot notify wake keyword spoken event : %{public}@", (uint8_t *)&v8, 0x16u);

    }
  }

}

void __67__CSSiriLauncher_notifyBuiltInVoiceTrigger_myriadPHash_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "setTimestamp:", mach_absolute_time());
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D97CF8]), "initWithData:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setPerceptualAudioHash:", v4);

  if (*(_BYTE *)(a1 + 40))
  {
    v5 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315138;
      v8 = "-[CSSiriLauncher notifyBuiltInVoiceTrigger:myriadPHash:completion:]_block_invoke";
      _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s Overriding Myriad state as request was made during a ringtone", (uint8_t *)&v7, 0xCu);
    }
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D97CE8]), "initWithOverrideOption:reason:", 1, CFSTR("Trigger was during a ringtone"));
    objc_msgSend(v3, "setOverrideState:", v6);

  }
}

void __67__CSSiriLauncher_notifyBuiltInVoiceTrigger_myriadPHash_completion___block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "setTimestamp:", mach_absolute_time());
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFE950]), "initWithData:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setPerceptualAudioHash:", v4);

  if (*(_BYTE *)(a1 + 40))
  {
    v5 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315138;
      v8 = "-[CSSiriLauncher notifyBuiltInVoiceTrigger:myriadPHash:completion:]_block_invoke";
      _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s Overriding Myriad state as request was made during a ringtone", (uint8_t *)&v7, 0xCu);
    }
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFE940]), "initWithOverrideOption:reason:", 1, CFSTR("Trigger was during a ringtone"));
    objc_msgSend(v3, "setOverrideState:", v6);

  }
}

void __67__CSSiriLauncher_notifyBuiltInVoiceTrigger_myriadPHash_completion___block_invoke_15(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *MEMORY[0x1E0D18F60];
  v6 = *MEMORY[0x1E0D18F60];
  if (v4)
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    v7 = v5;
    objc_msgSend(v3, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 136315394;
    v13 = "-[CSSiriLauncher notifyBuiltInVoiceTrigger:myriadPHash:completion:]_block_invoke";
    v14 = 2114;
    v15 = v9;
    _os_log_error_impl(&dword_1C2614000, v7, OS_LOG_TYPE_ERROR, "%s Cannot invoke Siri client : %{public}@", (uint8_t *)&v12, 0x16u);

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315138;
      v13 = "-[CSSiriLauncher notifyBuiltInVoiceTrigger:myriadPHash:completion:]_block_invoke";
      _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s Invoked Siri client", (uint8_t *)&v12, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject setVoiceTriggerEverUsed](v7, "setVoiceTriggerEverUsed");
  }

LABEL_8:
  objc_msgSend(MEMORY[0x1E0D19120], "sharedLogger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "logSiriLaunchCompletedWithVoiceTriggerEventInfo:", *(_QWORD *)(a1 + 32));

  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(void))(v11 + 16))();

}

void __62__CSSiriLauncher_notifyBuiltInVoiceTriggerPrewarm_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v6, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, BOOL, void *))(v4 + 16))(v4, v3 == 0, v5);

  }
}

+ (id)sharedLauncher
{
  if ((objc_msgSend(MEMORY[0x1E0D19260], "isDarwinOS") & 1) != 0)
    return 0;
  if (sharedLauncher_onceToken != -1)
    dispatch_once(&sharedLauncher_onceToken, &__block_literal_global_11421);
  return (id)sharedLauncher_sharedLauncher;
}

void __32__CSSiriLauncher_sharedLauncher__block_invoke()
{
  CSSiriLauncher *v0;
  void *v1;

  v0 = objc_alloc_init(CSSiriLauncher);
  v1 = (void *)sharedLauncher_sharedLauncher;
  sharedLauncher_sharedLauncher = (uint64_t)v0;

}

@end
