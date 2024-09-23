@implementation AAFTapToRadarHelper

- (void)tapToRadarWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (+[AFUtilities isInternalBuild](AFUtilities, "isInternalBuild"))
  {
    -[AAFTapToRadarHelper _showAlertForRequest:completion:](self, "_showAlertForRequest:completion:", v6, v7);
  }
  else
  {
    _AAFLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[AAFTapToRadarHelper tapToRadarWithRequest:completion:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.AAFTTRErrorDomain"), 1, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v16);

    }
  }

}

- (void)_showAlertForRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const __CFDictionary *v8;
  CFUserNotificationRef v9;
  CFUserNotificationRef v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  _QWORD block[5];
  id v15;
  id v16;
  CFUserNotificationRef v17;
  SInt32 error;

  v6 = a3;
  v7 = a4;
  -[AAFTapToRadarHelper _notificationDictionaryForRequest:](self, "_notificationDictionaryForRequest:", v6);
  v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  error = 0;
  v9 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0.0, 0, &error, v8);
  if (v9)
  {
    v10 = v9;
    dispatch_get_global_queue(2, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__AAFTapToRadarHelper__showAlertForRequest_completion___block_invoke;
    block[3] = &unk_1E9946680;
    v17 = v10;
    block[4] = self;
    v16 = v7;
    v15 = v6;
    dispatch_async(v11, block);

  }
  else
  {
    _AAFLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[AAFTapToRadarHelper _showAlertForRequest:completion:].cold.1(v8, (uint64_t)&error, v12);

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.AAFTTRErrorDomain"), 2, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v7 + 2))(v7, v13);

    }
  }

}

void __55__AAFTapToRadarHelper__showAlertForRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void (**v4)(void);
  CFOptionFlags responseFlags;

  responseFlags = 0;
  CFUserNotificationReceiveResponse(*(CFUserNotificationRef *)(a1 + 56), 0.0, &responseFlags);
  switch(objc_msgSend(*(id *)(a1 + 32), "_adjustedOptionFlags:", responseFlags))
  {
    case 0:
      objc_msgSend(*(id *)(a1 + 32), "_launchTTRWithRequest:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      break;
    case 1:
    case 3:
      v2 = *(_QWORD *)(a1 + 48);
      if (v2)
        (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);
      break;
    case 2:
      objc_msgSend(*(id *)(a1 + 40), "alertOtherButtonAction");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3)
      {
        objc_msgSend(*(id *)(a1 + 40), "alertOtherButtonAction");
        v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v4[2]();

      }
      break;
    default:
      break;
  }
  CFRelease(*(CFTypeRef *)(a1 + 56));
}

- (id)_notificationDictionaryForRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "alertTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0C9B800]);

  objc_msgSend(v3, "alertMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0C9B810]);

  objc_msgSend(v3, "alertDefaultButtonText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0C9B838]);

  objc_msgSend(v3, "alertCancelButtonText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0C9B830]);

  objc_msgSend(v3, "alertOtherButtonText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v3, "alertOtherButtonText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0C9B868]);

  }
  v11 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C9B820]);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0DABBB0]);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0DABB00]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "resourceURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0C9B860]);

  return v4;
}

- (unint64_t)_adjustedOptionFlags:(unint64_t)a3
{
  return a3 & 3;
}

- (void)_launchTTRWithRequest:(id)a3 completion:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  _QWORD v36[4];
  id v37;

  v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E0CB3998];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  objc_msgSend(v8, "setScheme:", CFSTR("tap-to-radar"));
  objc_msgSend(v8, "setHost:", CFSTR("new"));
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc(MEMORY[0x1E0CB39D8]);
  objc_msgSend(v7, "componentName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithName:value:", CFSTR("ComponentName"), v11);
  objc_msgSend(v9, "addObject:", v12);

  v13 = objc_alloc(MEMORY[0x1E0CB39D8]);
  objc_msgSend(v7, "componentVersion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithName:value:", CFSTR("ComponentVersion"), v14);
  objc_msgSend(v9, "addObject:", v15);

  v16 = objc_alloc(MEMORY[0x1E0CB39D8]);
  objc_msgSend(v7, "componentID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithName:value:", CFSTR("ComponentID"), v17);
  objc_msgSend(v9, "addObject:", v18);

  v19 = objc_alloc(MEMORY[0x1E0CB39D8]);
  objc_msgSend(v7, "radarTitle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v19, "initWithName:value:", CFSTR("Title"), v20);
  objc_msgSend(v9, "addObject:", v21);

  v22 = objc_alloc(MEMORY[0x1E0CB39D8]);
  objc_msgSend(v7, "radarDescription");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v22, "initWithName:value:", CFSTR("Description"), v23);
  objc_msgSend(v9, "addObject:", v24);

  v25 = objc_alloc(MEMORY[0x1E0CB39D8]);
  objc_msgSend(v7, "formattedKeywords");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v25, "initWithName:value:", CFSTR("Keywords"), v26);
  objc_msgSend(v9, "addObject:", v27);

  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("Classification"), CFSTR("Serious Bug"));
  objc_msgSend(v9, "addObject:", v28);

  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("Reproducibility"), CFSTR("I Didn't Try"));
  objc_msgSend(v9, "addObject:", v29);

  LODWORD(v29) = objc_msgSend(v7, "fullDiagnostic");
  v30 = objc_alloc(MEMORY[0x1E0CB39D8]);
  if ((_DWORD)v29)
    v31 = CFSTR("full-log-archive");
  else
    v31 = CFSTR("phone");
  v32 = (void *)objc_msgSend(v30, "initWithName:value:", CFSTR("AutoDiagnostics"), v31);
  objc_msgSend(v9, "addObject:", v32);

  objc_msgSend(v8, "setQueryItems:", v9);
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URL");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __56__AAFTapToRadarHelper__launchTTRWithRequest_completion___block_invoke;
  v36[3] = &unk_1E99466A8;
  v37 = v5;
  v35 = v5;
  objc_msgSend(v33, "openURL:configuration:completionHandler:", v34, 0, v36);

}

void __56__AAFTapToRadarHelper__launchTTRWithRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;

  v5 = a2;
  v6 = a3;
  _AAFLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __56__AAFTapToRadarHelper__launchTTRWithRequest_completion___block_invoke_cold_2();
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    __56__AAFTapToRadarHelper__launchTTRWithRequest_completion___block_invoke_cold_1();
  }

  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v6);

}

- (void)silentTapToRadarWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (getTapToRadarServiceClass())
  {
    if (+[AFUtilities isInternalBuild](AFUtilities, "isInternalBuild"))
    {
      -[AAFTapToRadarHelper handleRadarRequest:completion:](self, "handleRadarRequest:completion:", v6, v7);
      goto LABEL_13;
    }
    _AAFLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[AAFTapToRadarHelper tapToRadarWithRequest:completion:].cold.1(v18, v19, v20, v21, v22, v23, v24, v25);

    if (v7)
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v17 = 1;
      goto LABEL_12;
    }
  }
  else
  {
    _AAFLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[AAFTapToRadarHelper silentTapToRadarWithRequest:completion:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);

    if (v7)
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v17 = 3;
LABEL_12:
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("com.apple.AAFTTRErrorDomain"), v17, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v26);

    }
  }
LABEL_13:

}

- (void)handleRadarRequest:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  Class Class;
  objc_class *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  Class v15;
  objc_class *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;

  v5 = a3;
  v6 = a4;
  _AAFLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[AAFTapToRadarHelper handleRadarRequest:completion:].cold.1(v5, v7);

  v30 = 0;
  v31 = &v30;
  v32 = 0x2050000000;
  Class = (Class)getRadarDraftClass_softClass;
  v33 = getRadarDraftClass_softClass;
  if (!getRadarDraftClass_softClass)
  {
    TapToRadarKitLibraryCore();
    Class = objc_getClass("RadarDraft");
    v31[3] = (uint64_t)Class;
    getRadarDraftClass_softClass = (uint64_t)Class;
  }
  v9 = objc_retainAutorelease(Class);
  _Block_object_dispose(&v30, 8);
  v10 = objc_alloc_init(v9);
  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "componentName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ detected an error"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "radarTitle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitle:", v14);

  v30 = 0;
  v31 = &v30;
  v32 = 0x2050000000;
  v15 = (Class)getRadarComponentClass_softClass;
  v33 = getRadarComponentClass_softClass;
  if (!getRadarComponentClass_softClass)
  {
    TapToRadarKitLibraryCore();
    v15 = objc_getClass("RadarComponent");
    v31[3] = (uint64_t)v15;
    getRadarComponentClass_softClass = (uint64_t)v15;
  }
  v16 = objc_retainAutorelease(v15);
  _Block_object_dispose(&v30, 8);
  v17 = [v16 alloc];
  objc_msgSend(v5, "componentName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentVersion");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v17, "initWithName:version:identifier:", v18, v19, (int)objc_msgSend(v20, "intValue"));
  objc_msgSend(v10, "setComponent:", v21);

  objc_msgSend(v5, "radarDescription");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setProblemDescription:", v22);

  objc_msgSend(v10, "setReproducibility:", 6);
  objc_msgSend(v10, "setClassification:", 7);
  objc_msgSend(v5, "keywordIDs");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setKeywords:", v23);

  if (objc_msgSend(v5, "fullDiagnostic"))
    objc_msgSend(v10, "setAutoDiagnostics:", 6);
  -[objc_class shared](getTapToRadarServiceClass(), "shared");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __53__AAFTapToRadarHelper_handleRadarRequest_completion___block_invoke;
  v27[3] = &unk_1E99466D0;
  v28 = v13;
  v29 = v6;
  v25 = v6;
  v26 = v13;
  objc_msgSend(v24, "createDraft:forProcessNamed:withDisplayReason:completionHandler:", v10, 0, v26, v27);

}

void __53__AAFTapToRadarHelper_handleRadarRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;

  v3 = a2;
  _AAFLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __53__AAFTapToRadarHelper_handleRadarRequest_completion___block_invoke_cold_2();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __53__AAFTapToRadarHelper_handleRadarRequest_completion___block_invoke_cold_1(a1, v5, v6);
  }

  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);

}

- (void)tapToRadarWithRequest:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D51A2000, a1, a3, "Received request for TTR on non-internal build, ignoring.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)_showAlertForRequest:(NSObject *)a3 completion:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  int v5;
  uint8_t v6[12];
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "objectForKeyedSubscript:", *MEMORY[0x1E0C9B800]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  v7 = 1024;
  v8 = v5;
  _os_log_error_impl(&dword_1D51A2000, a3, OS_LOG_TYPE_ERROR, "Showing alert (%@) failed, user notification is nil!. Error: %d", v6, 0x12u);

}

void __56__AAFTapToRadarHelper__launchTTRWithRequest_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_2(&dword_1D51A2000, v0, v1, "Tap-to-radar launched with result: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __56__AAFTapToRadarHelper__launchTTRWithRequest_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1D51A2000, v0, v1, "Tap-to-radar failed to launch with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)silentTapToRadarWithRequest:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D51A2000, a1, a3, "TapToRadarService does not exist. A radar cannot be started\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)handleRadarRequest:(void *)a1 completion:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "componentID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_2(&dword_1D51A2000, a2, v4, "Handling Silent Radar Request with id: %@", v5);

}

void __53__AAFTapToRadarHelper_handleRadarRequest_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_1_2(&dword_1D51A2000, a2, a3, "Successfully created draft with title: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1_0();
}

void __53__AAFTapToRadarHelper_handleRadarRequest_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1D51A2000, v0, v1, "Created draft with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
