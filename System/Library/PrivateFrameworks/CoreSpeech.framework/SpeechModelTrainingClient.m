@implementation SpeechModelTrainingClient

- (SpeechModelTrainingClient)init
{
  SpeechModelTrainingClient *v2;
  uint64_t v3;
  NSXPCConnection *smtConnection;
  NSXPCConnection *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SpeechModelTrainingClient;
  v2 = -[SpeechModelTrainingClient init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.corespeech.speechmodeltraining.xpc"), 0);
    smtConnection = v2->_smtConnection;
    v2->_smtConnection = (NSXPCConnection *)v3;

    v5 = v2->_smtConnection;
    SpeechModelTrainingGetInterface();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v5, "setRemoteObjectInterface:", v6);

    -[NSXPCConnection setInterruptionHandler:](v2->_smtConnection, "setInterruptionHandler:", &__block_literal_global_8710);
    -[NSXPCConnection setInvalidationHandler:](v2->_smtConnection, "setInvalidationHandler:", &__block_literal_global_8);
    -[NSXPCConnection resume](v2->_smtConnection, "resume");
  }
  return v2;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  v3 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_INFO, "Dealloc-ing", buf, 2u);
  }
  -[NSXPCConnection invalidate](self->_smtConnection, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)SpeechModelTrainingClient;
  -[SpeechModelTrainingClient dealloc](&v4, sel_dealloc);
}

- (id)_serviceProxyWithErrorHandler:(id)a3
{
  return -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_smtConnection, "synchronousRemoteObjectProxyWithErrorHandler:", a3);
}

- (void)upperCaseString:(id)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __56__SpeechModelTrainingClient_upperCaseString_completion___block_invoke;
  v17[3] = &unk_1E7C250E0;
  v18 = v6;
  v8 = v6;
  v9 = a3;
  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __56__SpeechModelTrainingClient_upperCaseString_completion___block_invoke_2;
  v15[3] = &unk_1E7C28570;
  v10 = (id)MEMORY[0x1C3BC4734](v17);
  v16 = v10;
  -[SpeechModelTrainingClient _serviceProxyWithErrorHandler:](self, "_serviceProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __56__SpeechModelTrainingClient_upperCaseString_completion___block_invoke_3;
  v13[3] = &unk_1E7C28F38;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "upperCaseString:withReply:", v9, v13);

}

- (void)trainPersonalizedLMWithLanguage:(id)a3 configuration:(id)a4 asset:(id)a5 directory:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  SpeechModelTrainingClient *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  void (**v39)(_QWORD, _QWORD, _QWORD);
  void *v40;
  id v42;
  void (**v43)(_QWORD, _QWORD, _QWORD);
  _QWORD v44[4];
  void (**v45)(_QWORD, _QWORD, _QWORD);
  _QWORD v46[4];
  id v47;
  _QWORD v48[4];
  id v49;
  uint64_t v50;
  void *v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v42 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __102__SpeechModelTrainingClient_trainPersonalizedLMWithLanguage_configuration_asset_directory_completion___block_invoke;
  v48[3] = &unk_1E7C25108;
  v15 = v14;
  v49 = v15;
  v43 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1C3BC4734](v48);
  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "stringByAppendingPathComponent:", CFSTR("Assistant/SpeechPersonalizedLM"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringByStandardizingPath");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "stringByAppendingPathComponent:", CFSTR("Assistant/SpeechPersonalizedLM_Fides"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringByStandardizingPath");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v53 = v19;
    v54 = 2112;
    v55 = v21;
    _os_log_impl(&dword_1C2614000, v22, OS_LOG_TYPE_INFO, "personalizedLMPath=%@ fidesPersonalizedLMPath=%@", buf, 0x16u);
  }
  if (objc_msgSend(v13, "isEqualToString:", v19))
  {
    v23 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C2614000, v23, OS_LOG_TYPE_INFO, "Client is 24-hour job", buf, 2u);
    }
    v24 = self;
    v25 = v42;
    v26 = v42;
    v27 = v11;
    v28 = v12;
    v29 = 0;
LABEL_11:
    -[SpeechModelTrainingClient trainPersonalizedLMWithLanguage:configuration:asset:fides:activity:completion:](v24, "trainPersonalizedLMWithLanguage:configuration:asset:fides:activity:completion:", v26, v27, v28, v29, 0, v15);
    goto LABEL_12;
  }
  if (objc_msgSend(v13, "isEqualToString:", v21))
  {
    v30 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C2614000, v30, OS_LOG_TYPE_INFO, "Client is DictationPersonalizationFidesPlugin", buf, 2u);
    }
    v24 = self;
    v25 = v42;
    v26 = v42;
    v27 = v11;
    v28 = v12;
    v29 = 1;
    goto LABEL_11;
  }
  if (objc_msgSend(v13, "length"))
  {
    v31 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Input directory path(%@) does not match expected path"), v13);
    v32 = sLog;
    v33 = (void *)v31;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v53 = v33;
      _os_log_impl(&dword_1C2614000, v32, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }
    v34 = (void *)MEMORY[0x1E0CB35C8];
    v50 = *MEMORY[0x1E0CB2D50];
    v51 = v33;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.speechmodeltraining"), 202, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v43)[2](v43, 0, v36);

    v25 = v42;
  }
  else
  {
    v37 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C2614000, v37, OS_LOG_TYPE_INFO, "Client is PersonalizedLmFidesPlugin", buf, 2u);
    }
    v38 = MEMORY[0x1E0C809B0];
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __102__SpeechModelTrainingClient_trainPersonalizedLMWithLanguage_configuration_asset_directory_completion___block_invoke_19;
    v46[3] = &unk_1E7C28570;
    v39 = v43;
    v47 = v39;
    -[SpeechModelTrainingClient _serviceProxyWithErrorHandler:](self, "_serviceProxyWithErrorHandler:", v46);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v38;
    v44[1] = 3221225472;
    v44[2] = __102__SpeechModelTrainingClient_trainPersonalizedLMWithLanguage_configuration_asset_directory_completion___block_invoke_22;
    v44[3] = &unk_1E7C25108;
    v45 = v39;
    v25 = v42;
    objc_msgSend(v40, "trainPersonalizedLMWithLanguage:configuration:fides:write:completion:", v42, v11, 0, 0, v44);

  }
LABEL_12:

}

- (void)trainPersonalizedLMWithLanguage:(id)a3 directory:(id)a4 completion:(id)a5
{
  -[SpeechModelTrainingClient trainPersonalizedLMWithLanguage:configuration:asset:directory:completion:](self, "trainPersonalizedLMWithLanguage:configuration:asset:directory:completion:", a3, 0, 0, a4, a5);
}

- (void)trainPersonalizedLMWithLanguage:(id)a3 configuration:(id)a4 asset:(id)a5 fides:(BOOL)a6 activity:(id)a7 completion:(id)a8
{
  -[SpeechModelTrainingClient trainPersonalizedLMWithLanguage:configuration:fides:activity:completion:](self, "trainPersonalizedLMWithLanguage:configuration:fides:activity:completion:", a3, a4, a6, a7, a8);
}

- (void)trainPersonalizedLMWithLanguage:(id)a3 configuration:(id)a4 fides:(BOOL)a5 activity:(id)a6 completion:(id)a7
{
  _BOOL8 v7;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;

  v7 = a5;
  v11 = a7;
  v12 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __101__SpeechModelTrainingClient_trainPersonalizedLMWithLanguage_configuration_fides_activity_completion___block_invoke;
  v23[3] = &unk_1E7C25108;
  v24 = v11;
  v13 = v11;
  v14 = a4;
  v15 = a3;
  v21[0] = v12;
  v21[1] = 3221225472;
  v21[2] = __101__SpeechModelTrainingClient_trainPersonalizedLMWithLanguage_configuration_fides_activity_completion___block_invoke_2;
  v21[3] = &unk_1E7C28570;
  v16 = (id)MEMORY[0x1C3BC4734](v23);
  v22 = v16;
  -[SpeechModelTrainingClient _serviceProxyWithErrorHandler:](self, "_serviceProxyWithErrorHandler:", v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __101__SpeechModelTrainingClient_trainPersonalizedLMWithLanguage_configuration_fides_activity_completion___block_invoke_28;
  v19[3] = &unk_1E7C25108;
  v20 = v16;
  v18 = v16;
  objc_msgSend(v17, "trainPersonalizedLMWithLanguage:configuration:fides:write:completion:", v15, v14, v7, 1, v19);

}

- (void)trainGlobalNNLMwithFidesSessionURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75__SpeechModelTrainingClient_trainGlobalNNLMwithFidesSessionURL_completion___block_invoke;
  v10[3] = &unk_1E7C28570;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[SpeechModelTrainingClient _serviceProxyWithErrorHandler:](self, "_serviceProxyWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "trainGlobalNNLMwithFidesSessionURL:completion:", v8, v7);

}

- (void)trainAppLMWithLanguage:(id)a3 configuration:(id)a4 appBundleId:(id)a5 appLmDataFile:(id)a6 appLmDataFileSandboxExtension:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  _QWORD v22[4];
  id v23;

  v14 = a8;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __133__SpeechModelTrainingClient_trainAppLMWithLanguage_configuration_appBundleId_appLmDataFile_appLmDataFileSandboxExtension_completion___block_invoke;
  v22[3] = &unk_1E7C28570;
  v23 = v14;
  v15 = v14;
  v16 = a7;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  -[SpeechModelTrainingClient _serviceProxyWithErrorHandler:](self, "_serviceProxyWithErrorHandler:", v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "trainAppLMWithLanguage:configuration:appBundleId:appLmDataFile:appLmDataFileSandboxExtension:completion:", v20, v19, v18, v17, v16, v15);

}

- (void)trainAppLMWithLanguage:(id)a3 configuration:(id)a4 appBundleId:(id)a5 appLmDataFile:(id)a6 appLmDataFileSandboxExtension:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  -[SpeechModelTrainingClient _serviceProxyWithErrorHandler:](self, "_serviceProxyWithErrorHandler:", &__block_literal_global_29);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "trainAppLMWithLanguage:configuration:appBundleId:appLmDataFile:appLmDataFileSandboxExtension:", v16, v15, v14, v13, v12);

}

- (void)trainAppLMWithLanguage:(id)a3 configuration:(id)a4 appBundleId:(id)a5 appLmDataFile:(id)a6 appLmModelFile:(id)a7 appLmDataFileSandboxExtension:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  -[SpeechModelTrainingClient _serviceProxyWithErrorHandler:](self, "_serviceProxyWithErrorHandler:", &__block_literal_global_30_8681);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "trainAppLMWithLanguage:configuration:appBundleId:appLmDataFile:appLmModelFile:appLmDataFileSandboxExtension:", v19, v18, v17, v16, v15, v14);

}

- (void)trainAppLMWithLanguage:(id)a3 configuration:(id)a4 appBundleId:(id)a5 appLmDataFile:(id)a6 appLmModelFile:(id)a7 appLmDataFileSandboxExtension:(id)a8 completion:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;

  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  -[SpeechModelTrainingClient _serviceProxyWithErrorHandler:](self, "_serviceProxyWithErrorHandler:", &__block_literal_global_31);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "trainAppLMWithLanguage:configuration:appBundleId:appLmDataFile:appLmModelFile:appLmDataFileSandboxExtension:completion:", v22, v21, v20, v19, v18, v17, v16);

}

- (void)wakeUpWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__SpeechModelTrainingClient_wakeUpWithCompletion___block_invoke;
  v7[3] = &unk_1E7C28570;
  v8 = v4;
  v5 = v4;
  -[SpeechModelTrainingClient _serviceProxyWithErrorHandler:](self, "_serviceProxyWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "wakeUpWithCompletion:", v5);

}

- (void)trainAllAppLMWithLanguage:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__SpeechModelTrainingClient_trainAllAppLMWithLanguage_completion___block_invoke;
  v10[3] = &unk_1E7C28570;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[SpeechModelTrainingClient _serviceProxyWithErrorHandler:](self, "_serviceProxyWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "trainAllAppLMWithLanguage:completion:", v8, v7);

}

- (void)trainAllAppLMWithLanguage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SpeechModelTrainingClient _serviceProxyWithErrorHandler:](self, "_serviceProxyWithErrorHandler:", &__block_literal_global_32);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trainAllAppLMWithLanguage:", v4);

}

- (void)trainPartialAllAppLMWithLanguage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SpeechModelTrainingClient _serviceProxyWithErrorHandler:](self, "_serviceProxyWithErrorHandler:", &__block_literal_global_33);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trainPartialAllAppLMWithLanguage:", v4);

}

- (void)trainPartialAllAppLMWithLanguage:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[SpeechModelTrainingClient _serviceProxyWithErrorHandler:](self, "_serviceProxyWithErrorHandler:", &__block_literal_global_34_8674);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trainPartialAllAppLMWithLanguage:completion:", v7, v6);

}

- (void)extractBundledOovs:(id)a3 appLmDataFileSandboxExtension:(id)a4 appBundleId:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;

  v10 = a6;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __101__SpeechModelTrainingClient_extractBundledOovs_appLmDataFileSandboxExtension_appBundleId_completion___block_invoke;
  v16[3] = &unk_1E7C28570;
  v17 = v10;
  v11 = v10;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  -[SpeechModelTrainingClient _serviceProxyWithErrorHandler:](self, "_serviceProxyWithErrorHandler:", v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "extractBundledOovs:appLmDataFileSandboxExtension:appBundleId:completion:", v14, v13, v12, v11);

}

- (void)buildSpeechProfileForLanguage:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (_os_feature_enabled_impl())
  {
    NSLog(CFSTR("buildSpeechProfile is unavailable when siri_vocabulary_speech_profile feature flag is enabled."));
  }
  else
  {
    -[SpeechModelTrainingClient _serviceProxyWithErrorHandler:](self, "_serviceProxyWithErrorHandler:", &__block_literal_global_39);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "buildSpeechProfileForLanguage:", v5);

  }
}

- (void)buildPhoneticMatchWithLanguage:(id)a3 saveIntermediateFsts:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v5 = a4;
  v8 = a5;
  v9 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __92__SpeechModelTrainingClient_buildPhoneticMatchWithLanguage_saveIntermediateFsts_completion___block_invoke;
  v19[3] = &unk_1E7C25108;
  v20 = v8;
  v10 = v8;
  v11 = a3;
  v14 = v9;
  v15 = 3221225472;
  v16 = __92__SpeechModelTrainingClient_buildPhoneticMatchWithLanguage_saveIntermediateFsts_completion___block_invoke_2;
  v17 = &unk_1E7C28570;
  v18 = (id)MEMORY[0x1C3BC4734](v19);
  v12 = v18;
  -[SpeechModelTrainingClient _serviceProxyWithErrorHandler:](self, "_serviceProxyWithErrorHandler:", &v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "buildPhoneticMatchWithLanguage:saveIntermediateFsts:completion:", v11, v5, v10, v14, v15, v16, v17);

}

- (void)generateAudioWithTexts:(id)a3 language:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __72__SpeechModelTrainingClient_generateAudioWithTexts_language_completion___block_invoke;
  v13[3] = &unk_1E7C28570;
  v14 = v8;
  v9 = v8;
  v10 = a4;
  v11 = a3;
  -[SpeechModelTrainingClient _serviceProxyWithErrorHandler:](self, "_serviceProxyWithErrorHandler:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "generateAudioWithTexts:language:completion:", v11, v10, v9);

}

- (void)generateConfusionPairsWithUUID:(id)a3 parameters:(id)a4 language:(id)a5 task:(id)a6 samplingRate:(unint64_t)a7 recognizedTokens:(id)a8 recognizedText:(id)a9 correctedText:(id)a10 selectedAlternatives:(id)a11 completion:(id)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  _QWORD v30[4];
  id v31;

  v18 = a12;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __176__SpeechModelTrainingClient_generateConfusionPairsWithUUID_parameters_language_task_samplingRate_recognizedTokens_recognizedText_correctedText_selectedAlternatives_completion___block_invoke;
  v30[3] = &unk_1E7C28570;
  v31 = v18;
  v19 = v18;
  v20 = a11;
  v21 = a10;
  v22 = a9;
  v23 = a8;
  v24 = a6;
  v25 = a5;
  v26 = a4;
  v27 = a3;
  -[SpeechModelTrainingClient _serviceProxyWithErrorHandler:](self, "_serviceProxyWithErrorHandler:", v30);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "generateConfusionPairsWithUUID:parameters:language:task:samplingRate:recognizedTokens:recognizedText:correctedText:selectedAlternatives:completion:", v27, v26, v25, v24, a7, v23, v22, v21, v20, v19);

}

- (void)generateConfusionPairsWithUUID:(id)a3 parameters:(id)a4 language:(id)a5 task:(id)a6 samplingRate:(unint64_t)a7 recognizedNbest:(id)a8 recognizedText:(id)a9 correctedText:(id)a10 selectedAlternatives:(id)a11 completion:(id)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  _QWORD v30[4];
  id v31;

  v18 = a12;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __175__SpeechModelTrainingClient_generateConfusionPairsWithUUID_parameters_language_task_samplingRate_recognizedNbest_recognizedText_correctedText_selectedAlternatives_completion___block_invoke;
  v30[3] = &unk_1E7C28570;
  v31 = v18;
  v19 = v18;
  v20 = a11;
  v21 = a10;
  v22 = a9;
  v23 = a8;
  v24 = a6;
  v25 = a5;
  v26 = a4;
  v27 = a3;
  -[SpeechModelTrainingClient _serviceProxyWithErrorHandler:](self, "_serviceProxyWithErrorHandler:", v30);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "generateConfusionPairsWithUUID:parameters:language:task:samplingRate:recognizedNbest:recognizedText:correctedText:selectedAlternatives:completion:", v27, v26, v25, v24, a7, v23, v22, v21, v20, v19);

}

- (void)xpcExitClean
{
  id v2;

  -[SpeechModelTrainingClient _serviceProxyWithErrorHandler:](self, "_serviceProxyWithErrorHandler:", &__block_literal_global_40_8657);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "xpcExitClean");

}

- (void)invalidate
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_INFO, "Invalidating", v4, 2u);
  }
  -[NSXPCConnection invalidate](self->_smtConnection, "invalidate");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smtConnection, 0);
}

void __41__SpeechModelTrainingClient_xpcExitClean__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  uint8_t buf[4];
  const __CFString *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v6 = CFSTR("com.apple.corespeech.speechmodeltraining.xpc");
    v7 = 2112;
    v8 = v2;
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_INFO, "Received an error while accessing %@ service: %@", buf, 0x16u);
  }
  objc_msgSend(v2, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Received Error %@"), v4);

}

void __175__SpeechModelTrainingClient_generateConfusionPairsWithUUID_parameters_language_task_samplingRate_recognizedNbest_recognizedText_correctedText_selectedAlternatives_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint8_t buf[4];
  const __CFString *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v8 = CFSTR("com.apple.corespeech.speechmodeltraining.xpc");
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_INFO, "Received an error while accessing %@ service: %@", buf, 0x16u);
  }
  objc_msgSend(v3, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Received Error %@"), v5);

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, 0, v3);

}

void __176__SpeechModelTrainingClient_generateConfusionPairsWithUUID_parameters_language_task_samplingRate_recognizedTokens_recognizedText_correctedText_selectedAlternatives_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint8_t buf[4];
  const __CFString *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v8 = CFSTR("com.apple.corespeech.speechmodeltraining.xpc");
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_INFO, "Received an error while accessing %@ service: %@", buf, 0x16u);
  }
  objc_msgSend(v3, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Received Error %@"), v5);

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, 0, v3);

}

void __72__SpeechModelTrainingClient_generateAudioWithTexts_language_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint8_t buf[4];
  const __CFString *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v8 = CFSTR("com.apple.corespeech.speechmodeltraining.xpc");
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_INFO, "Received an error while accessing %@ service: %@", buf, 0x16u);
  }
  objc_msgSend(v3, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Received Error %@"), v5);

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, 0, v3);

}

uint64_t __92__SpeechModelTrainingClient_buildPhoneticMatchWithLanguage_saveIntermediateFsts_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __92__SpeechModelTrainingClient_buildPhoneticMatchWithLanguage_saveIntermediateFsts_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t buf[4];
  const __CFString *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v6 = CFSTR("com.apple.corespeech.speechmodeltraining.xpc");
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_INFO, "Received an error while accessing %@ service: %@", buf, 0x16u);
  }
  NSLog(CFSTR("Received Error %@"), v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __59__SpeechModelTrainingClient_buildSpeechProfileForLanguage___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  uint8_t buf[4];
  const __CFString *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v6 = CFSTR("com.apple.corespeech.speechmodeltraining.xpc");
    v7 = 2112;
    v8 = v2;
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_INFO, "Received an error while accessing %@ service: %@", buf, 0x16u);
  }
  objc_msgSend(v2, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Received Error %@"), v4);

}

void __101__SpeechModelTrainingClient_extractBundledOovs_appLmDataFileSandboxExtension_appBundleId_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint8_t buf[4];
  const __CFString *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v8 = CFSTR("com.apple.corespeech.speechmodeltraining.xpc");
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_INFO, "Received an error while accessing %@ service: %@", buf, 0x16u);
  }
  objc_msgSend(v3, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Received Error %@"), v5);

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v6 + 16))(v6, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA70], v3);

}

void __73__SpeechModelTrainingClient_trainPartialAllAppLMWithLanguage_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  uint8_t buf[4];
  const __CFString *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v6 = CFSTR("com.apple.corespeech.speechmodeltraining.xpc");
    v7 = 2112;
    v8 = v2;
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_INFO, "Received an error while accessing %@ service: %@", buf, 0x16u);
  }
  objc_msgSend(v2, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Received Error %@"), v4);

}

void __62__SpeechModelTrainingClient_trainPartialAllAppLMWithLanguage___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  uint8_t buf[4];
  const __CFString *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v6 = CFSTR("com.apple.corespeech.speechmodeltraining.xpc");
    v7 = 2112;
    v8 = v2;
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_INFO, "Received an error while accessing %@ service: %@", buf, 0x16u);
  }
  objc_msgSend(v2, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Received Error %@"), v4);

}

void __55__SpeechModelTrainingClient_trainAllAppLMWithLanguage___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  uint8_t buf[4];
  const __CFString *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v6 = CFSTR("com.apple.corespeech.speechmodeltraining.xpc");
    v7 = 2112;
    v8 = v2;
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_INFO, "Received an error while accessing %@ service: %@", buf, 0x16u);
  }
  objc_msgSend(v2, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Received Error %@"), v4);

}

void __66__SpeechModelTrainingClient_trainAllAppLMWithLanguage_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint8_t buf[4];
  const __CFString *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v8 = CFSTR("com.apple.corespeech.speechmodeltraining.xpc");
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_INFO, "Received an error while accessing %@ service: %@", buf, 0x16u);
  }
  objc_msgSend(v3, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Received Error %@"), v5);

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, MEMORY[0x1E0C9AA70], v3);

}

void __50__SpeechModelTrainingClient_wakeUpWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint8_t buf[4];
  const __CFString *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v8 = CFSTR("com.apple.corespeech.speechmodeltraining.xpc");
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_INFO, "Received an error while accessing %@ service: %@", buf, 0x16u);
  }
  objc_msgSend(v3, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Received Error %@"), v5);

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(void))(v6 + 16))();

}

void __148__SpeechModelTrainingClient_trainAppLMWithLanguage_configuration_appBundleId_appLmDataFile_appLmModelFile_appLmDataFileSandboxExtension_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  uint8_t buf[4];
  const __CFString *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v6 = CFSTR("com.apple.corespeech.speechmodeltraining.xpc");
    v7 = 2112;
    v8 = v2;
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_INFO, "Received an error while accessing %@ service: %@", buf, 0x16u);
  }
  objc_msgSend(v2, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Received Error %@"), v4);

}

void __137__SpeechModelTrainingClient_trainAppLMWithLanguage_configuration_appBundleId_appLmDataFile_appLmModelFile_appLmDataFileSandboxExtension___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  uint8_t buf[4];
  const __CFString *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v6 = CFSTR("com.apple.corespeech.speechmodeltraining.xpc");
    v7 = 2112;
    v8 = v2;
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_INFO, "Received an error while accessing %@ service: %@", buf, 0x16u);
  }
  objc_msgSend(v2, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Received Error %@"), v4);

}

void __122__SpeechModelTrainingClient_trainAppLMWithLanguage_configuration_appBundleId_appLmDataFile_appLmDataFileSandboxExtension___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  uint8_t buf[4];
  const __CFString *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v6 = CFSTR("com.apple.corespeech.speechmodeltraining.xpc");
    v7 = 2112;
    v8 = v2;
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_INFO, "Received an error while accessing %@ service: %@", buf, 0x16u);
  }
  objc_msgSend(v2, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Received Error %@"), v4);

}

void __133__SpeechModelTrainingClient_trainAppLMWithLanguage_configuration_appBundleId_appLmDataFile_appLmDataFileSandboxExtension_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint8_t buf[4];
  const __CFString *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v8 = CFSTR("com.apple.corespeech.speechmodeltraining.xpc");
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_INFO, "Received an error while accessing %@ service: %@", buf, 0x16u);
  }
  objc_msgSend(v3, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Received Error %@"), v5);

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v6 + 16))(v6, MEMORY[0x1E0C9AA70], MEMORY[0x1E0C9AA60], v3);

}

void __75__SpeechModelTrainingClient_trainGlobalNNLMwithFidesSessionURL_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint8_t buf[4];
  const __CFString *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v8 = CFSTR("com.apple.corespeech.speechmodeltraining.xpc");
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_INFO, "Received an error while accessing %@ service: %@", buf, 0x16u);
  }
  objc_msgSend(v3, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Received Error %@"), v5);

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

uint64_t __101__SpeechModelTrainingClient_trainPersonalizedLMWithLanguage_configuration_fides_activity_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __101__SpeechModelTrainingClient_trainPersonalizedLMWithLanguage_configuration_fides_activity_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t buf[4];
  const __CFString *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v6 = CFSTR("com.apple.corespeech.speechmodeltraining.xpc");
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_INFO, "Received an error while accessing %@ service: %@", buf, 0x16u);
  }
  NSLog(CFSTR("Received Error %@"), v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __101__SpeechModelTrainingClient_trainPersonalizedLMWithLanguage_configuration_fides_activity_completion___block_invoke_28(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __102__SpeechModelTrainingClient_trainPersonalizedLMWithLanguage_configuration_asset_directory_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __102__SpeechModelTrainingClient_trainPersonalizedLMWithLanguage_configuration_asset_directory_completion___block_invoke_19(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t buf[4];
  const __CFString *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v6 = CFSTR("com.apple.corespeech.speechmodeltraining.xpc");
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_INFO, "Received an error while accessing %@ service: %@", buf, 0x16u);
  }
  NSLog(CFSTR("Received Error %@"), v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __102__SpeechModelTrainingClient_trainPersonalizedLMWithLanguage_configuration_asset_directory_completion___block_invoke_22(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __56__SpeechModelTrainingClient_upperCaseString_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __56__SpeechModelTrainingClient_upperCaseString_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __56__SpeechModelTrainingClient_upperCaseString_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __33__SpeechModelTrainingClient_init__block_invoke_7()
{
  NSObject *v0;
  int v1;
  const __CFString *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    v1 = 138412290;
    v2 = CFSTR("com.apple.corespeech.speechmodeltraining.xpc");
    _os_log_impl(&dword_1C2614000, v0, OS_LOG_TYPE_INFO, "%@ Invalidated", (uint8_t *)&v1, 0xCu);
  }
}

void __33__SpeechModelTrainingClient_init__block_invoke()
{
  NSObject *v0;
  int v1;
  const __CFString *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    v1 = 138412290;
    v2 = CFSTR("com.apple.corespeech.speechmodeltraining.xpc");
    _os_log_impl(&dword_1C2614000, v0, OS_LOG_TYPE_INFO, "%@ Interrupted", (uint8_t *)&v1, 0xCu);
  }
}

+ (void)initialize
{
  os_log_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = os_log_create("com.apple.speech.speechmodeltraining", "SpeechModelTrainingClient");
    v3 = (void *)sLog;
    sLog = (uint64_t)v2;

  }
}

@end
