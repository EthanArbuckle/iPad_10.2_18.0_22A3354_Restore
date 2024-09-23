@implementation CSBenchmarkService

+ (id)createBenchamrkXPCConnection
{
  void *v2;
  void *v3;

  CSLogInitIfNeeded();
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.corespeech.benchmark.xpc"), 0);
  BenchmarkXPCGetInterface();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRemoteObjectInterface:", v3);

  return v2;
}

+ (void)pingpong:(id)a3 completion:(id)a4
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  +[CSBenchmarkService createBenchamrkXPCConnection](CSBenchmarkService, "createBenchamrkXPCConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __42__CSBenchmarkService_pingpong_completion___block_invoke;
  v16[3] = &unk_1E7C28F10;
  v7 = v4;
  v17 = v7;
  objc_msgSend(v5, "setInterruptionHandler:", v16);
  v14[0] = v6;
  v14[1] = 3221225472;
  v14[2] = __42__CSBenchmarkService_pingpong_completion___block_invoke_7;
  v14[3] = &unk_1E7C28F10;
  v8 = v7;
  v15 = v8;
  objc_msgSend(v5, "setInvalidationHandler:", v14);
  objc_msgSend(v5, "resume");
  objc_msgSend(v5, "remoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v11 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "+[CSBenchmarkService pingpong:completion:]";
      _os_log_error_impl(&dword_1C2614000, v11, OS_LOG_TYPE_ERROR, "%s XPC connection not exist?", buf, 0xCu);
      if (!v8)
        goto LABEL_6;
    }
    else if (!v8)
    {
      goto LABEL_6;
    }
    (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
    goto LABEL_6;
  }
  objc_msgSend(v5, "remoteObjectProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __42__CSBenchmarkService_pingpong_completion___block_invoke_10;
  v12[3] = &unk_1E7C28F38;
  v13 = v8;
  objc_msgSend(v10, "pingpong:completion:", CFSTR("TEST"), v12);

LABEL_6:
}

+ (void)runLstmPhsModelWithConfig:(id)a3 withUrl:(id)a4 withConfigRoot:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  +[CSBenchmarkService createBenchamrkXPCConnection](CSBenchmarkService, "createBenchamrkXPCConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __82__CSBenchmarkService_runLstmPhsModelWithConfig_withUrl_withConfigRoot_completion___block_invoke;
  v23[3] = &unk_1E7C28F10;
  v15 = v12;
  v24 = v15;
  objc_msgSend(v13, "setInterruptionHandler:", v23);
  v21[0] = v14;
  v21[1] = 3221225472;
  v21[2] = __82__CSBenchmarkService_runLstmPhsModelWithConfig_withUrl_withConfigRoot_completion___block_invoke_13;
  v21[3] = &unk_1E7C28F10;
  v16 = v15;
  v22 = v16;
  objc_msgSend(v13, "setInvalidationHandler:", v21);
  objc_msgSend(v13, "resume");
  objc_msgSend(v13, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_2283);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(v13, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v14;
    v19[1] = 3221225472;
    v19[2] = __82__CSBenchmarkService_runLstmPhsModelWithConfig_withUrl_withConfigRoot_completion___block_invoke_18;
    v19[3] = &unk_1E7C24008;
    v20 = v16;
    objc_msgSend(v18, "runLstmPhsModelWithConfig:withUrl:withConfigRoot:completion:", v9, v10, v11, v19);

  }
}

+ (void)runVTSecondPassModelWithConfig:(id)a3 locale:(id)a4 withUrl:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  +[CSBenchmarkService createBenchamrkXPCConnection](CSBenchmarkService, "createBenchamrkXPCConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __79__CSBenchmarkService_runVTSecondPassModelWithConfig_locale_withUrl_completion___block_invoke;
  v23[3] = &unk_1E7C28F10;
  v15 = v12;
  v24 = v15;
  objc_msgSend(v13, "setInterruptionHandler:", v23);
  v21[0] = v14;
  v21[1] = 3221225472;
  v21[2] = __79__CSBenchmarkService_runVTSecondPassModelWithConfig_locale_withUrl_completion___block_invoke_20;
  v21[3] = &unk_1E7C28F10;
  v16 = v15;
  v22 = v16;
  objc_msgSend(v13, "setInvalidationHandler:", v21);
  objc_msgSend(v13, "resume");
  objc_msgSend(v13, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_22);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(v13, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_24);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v14;
    v19[1] = 3221225472;
    v19[2] = __79__CSBenchmarkService_runVTSecondPassModelWithConfig_locale_withUrl_completion___block_invoke_25;
    v19[3] = &unk_1E7C24008;
    v20 = v16;
    objc_msgSend(v18, "runVTSecondPassModelWithConfig:locale:withUrl:completion:", v9, v10, v11, v19);

  }
}

+ (void)runOSDAnalyzerWithConfig:(id)a3 withUrl:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  +[CSBenchmarkService createBenchamrkXPCConnection](CSBenchmarkService, "createBenchamrkXPCConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __66__CSBenchmarkService_runOSDAnalyzerWithConfig_withUrl_completion___block_invoke;
  v20[3] = &unk_1E7C28F10;
  v12 = v9;
  v21 = v12;
  objc_msgSend(v10, "setInterruptionHandler:", v20);
  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = __66__CSBenchmarkService_runOSDAnalyzerWithConfig_withUrl_completion___block_invoke_26;
  v18[3] = &unk_1E7C28F10;
  v13 = v12;
  v19 = v13;
  objc_msgSend(v10, "setInvalidationHandler:", v18);
  objc_msgSend(v10, "resume");
  objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_28);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_30);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v11;
    v16[1] = 3221225472;
    v16[2] = __66__CSBenchmarkService_runOSDAnalyzerWithConfig_withUrl_completion___block_invoke_31;
    v16[3] = &unk_1E7C24008;
    v17 = v13;
    objc_msgSend(v15, "runOSDAnalyzerWithConfig:withUrl:completion:", v7, v8, v16);

  }
}

+ (void)runODLDModelWithConfig:(id)a3 locale:(id)a4 inputText:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  +[CSBenchmarkService createBenchamrkXPCConnection](CSBenchmarkService, "createBenchamrkXPCConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __73__CSBenchmarkService_runODLDModelWithConfig_locale_inputText_completion___block_invoke;
  v23[3] = &unk_1E7C28F10;
  v15 = v12;
  v24 = v15;
  objc_msgSend(v13, "setInterruptionHandler:", v23);
  v21[0] = v14;
  v21[1] = 3221225472;
  v21[2] = __73__CSBenchmarkService_runODLDModelWithConfig_locale_inputText_completion___block_invoke_32;
  v21[3] = &unk_1E7C28F10;
  v16 = v15;
  v22 = v16;
  objc_msgSend(v13, "setInvalidationHandler:", v21);
  objc_msgSend(v13, "resume");
  objc_msgSend(v13, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_34);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(v13, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_36);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v14;
    v19[1] = 3221225472;
    v19[2] = __73__CSBenchmarkService_runODLDModelWithConfig_locale_inputText_completion___block_invoke_37;
    v19[3] = &unk_1E7C28570;
    v20 = v16;
    objc_msgSend(v18, "runODLDModelWithConfig:locale:inputText:completion:", v9, v10, v11, v19);

  }
}

+ (void)runNovDetectorWithConfig:(id)a3 configRoot:(id)a4 withUrl:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  +[CSBenchmarkService createBenchamrkXPCConnection](CSBenchmarkService, "createBenchamrkXPCConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __77__CSBenchmarkService_runNovDetectorWithConfig_configRoot_withUrl_completion___block_invoke;
  v23[3] = &unk_1E7C28F10;
  v15 = v12;
  v24 = v15;
  objc_msgSend(v13, "setInterruptionHandler:", v23);
  v21[0] = v14;
  v21[1] = 3221225472;
  v21[2] = __77__CSBenchmarkService_runNovDetectorWithConfig_configRoot_withUrl_completion___block_invoke_38;
  v21[3] = &unk_1E7C28F10;
  v16 = v15;
  v22 = v16;
  objc_msgSend(v13, "setInvalidationHandler:", v21);
  objc_msgSend(v13, "resume");
  objc_msgSend(v13, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_40);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(v13, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_42);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v14;
    v19[1] = 3221225472;
    v19[2] = __77__CSBenchmarkService_runNovDetectorWithConfig_configRoot_withUrl_completion___block_invoke_43;
    v19[3] = &unk_1E7C24008;
    v20 = v16;
    objc_msgSend(v18, "runNovDetectorWithConfig:configRoot:withUrl:completion:", v9, v10, v11, v19);

  }
}

+ (void)runAudioInjectionOnly:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v5 = a3;
  v6 = a4;
  +[CSBenchmarkService createBenchamrkXPCConnection](CSBenchmarkService, "createBenchamrkXPCConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __55__CSBenchmarkService_runAudioInjectionOnly_completion___block_invoke;
  v17[3] = &unk_1E7C28F10;
  v9 = v6;
  v18 = v9;
  objc_msgSend(v7, "setInterruptionHandler:", v17);
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __55__CSBenchmarkService_runAudioInjectionOnly_completion___block_invoke_44;
  v15[3] = &unk_1E7C28F10;
  v10 = v9;
  v16 = v10;
  objc_msgSend(v7, "setInvalidationHandler:", v15);
  objc_msgSend(v7, "resume");
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_46);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_48_2279);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __55__CSBenchmarkService_runAudioInjectionOnly_completion___block_invoke_49;
    v13[3] = &unk_1E7C24008;
    v14 = v10;
    objc_msgSend(v12, "runAudioInjectionOnly:completion:", v5, v13);

  }
}

+ (void)runNCModelWithConfig:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v5 = a3;
  v6 = a4;
  +[CSBenchmarkService createBenchamrkXPCConnection](CSBenchmarkService, "createBenchamrkXPCConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __54__CSBenchmarkService_runNCModelWithConfig_completion___block_invoke;
  v17[3] = &unk_1E7C28F10;
  v9 = v6;
  v18 = v9;
  objc_msgSend(v7, "setInterruptionHandler:", v17);
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __54__CSBenchmarkService_runNCModelWithConfig_completion___block_invoke_50;
  v15[3] = &unk_1E7C28F10;
  v10 = v9;
  v16 = v10;
  objc_msgSend(v7, "setInvalidationHandler:", v15);
  objc_msgSend(v7, "resume");
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_52);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_54);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __54__CSBenchmarkService_runNCModelWithConfig_completion___block_invoke_55;
    v13[3] = &unk_1E7C28570;
    v14 = v10;
    objc_msgSend(v12, "runNCModelWithConfig:completion:", v5, v13);

  }
}

+ (void)benchmarkOnDeviceCompilationCleanup:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v3 = a3;
  +[CSBenchmarkService createBenchamrkXPCConnection](CSBenchmarkService, "createBenchamrkXPCConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __58__CSBenchmarkService_benchmarkOnDeviceCompilationCleanup___block_invoke;
  v14[3] = &unk_1E7C28F10;
  v6 = v3;
  v15 = v6;
  objc_msgSend(v4, "setInterruptionHandler:", v14);
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __58__CSBenchmarkService_benchmarkOnDeviceCompilationCleanup___block_invoke_56;
  v12[3] = &unk_1E7C28F10;
  v7 = v6;
  v13 = v7;
  objc_msgSend(v4, "setInvalidationHandler:", v12);
  objc_msgSend(v4, "resume");
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_58);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_60);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __58__CSBenchmarkService_benchmarkOnDeviceCompilationCleanup___block_invoke_61;
    v10[3] = &unk_1E7C28570;
    v11 = v7;
    objc_msgSend(v9, "benchmarkOnDeviceCompilationCleanup:", v10);

  }
}

+ (BOOL)enableBenchmarkService
{
  void *v2;
  char v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "enableBenchmarkService:", 1);

  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "enableProgrammableAudioInjection:", 1);

  return v3 & v5;
}

+ (BOOL)disableBenchmarkService
{
  void *v2;
  char v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "enableBenchmarkService:", 0);

  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "enableProgrammableAudioInjection:", 0);

  return v3 & v5;
}

void __58__CSBenchmarkService_benchmarkOnDeviceCompilationCleanup___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "+[CSBenchmarkService benchmarkOnDeviceCompilationCleanup:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s CSBenchmarkService Interrupted", (uint8_t *)&v5, 0xCu);
  }
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 2003, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  }
}

void __58__CSBenchmarkService_benchmarkOnDeviceCompilationCleanup___block_invoke_56(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "+[CSBenchmarkService benchmarkOnDeviceCompilationCleanup:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s CSBenchmarkService Invalidated", (uint8_t *)&v5, 0xCu);
  }
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 2004, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  }
}

void __58__CSBenchmarkService_benchmarkOnDeviceCompilationCleanup___block_invoke_61(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "+[CSBenchmarkService benchmarkOnDeviceCompilationCleanup:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s Result: %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __58__CSBenchmarkService_benchmarkOnDeviceCompilationCleanup___block_invoke_59(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  const __CFString *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
  {
    v4 = 136315650;
    v5 = "+[CSBenchmarkService benchmarkOnDeviceCompilationCleanup:]_block_invoke";
    v6 = 2112;
    v7 = CFSTR("Error in making synchronous call of CSBenchmarkService: ");
    v8 = 2112;
    v9 = v2;
    _os_log_error_impl(&dword_1C2614000, v3, OS_LOG_TYPE_ERROR, "%s %@: %@", (uint8_t *)&v4, 0x20u);
  }

}

void __58__CSBenchmarkService_benchmarkOnDeviceCompilationCleanup___block_invoke_57(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  const __CFString *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
  {
    v4 = 136315650;
    v5 = "+[CSBenchmarkService benchmarkOnDeviceCompilationCleanup:]_block_invoke";
    v6 = 2112;
    v7 = CFSTR("First attempt with Error in connecting with CSBenchmarkService: ");
    v8 = 2112;
    v9 = v2;
    _os_log_error_impl(&dword_1C2614000, v3, OS_LOG_TYPE_ERROR, "%s %@: %@", (uint8_t *)&v4, 0x20u);
  }

}

void __54__CSBenchmarkService_runNCModelWithConfig_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "+[CSBenchmarkService runNCModelWithConfig:completion:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s CSBenchmarkService Interrupted", (uint8_t *)&v5, 0xCu);
  }
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 2003, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  }
}

void __54__CSBenchmarkService_runNCModelWithConfig_completion___block_invoke_50(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "+[CSBenchmarkService runNCModelWithConfig:completion:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s CSBenchmarkService Invalidated", (uint8_t *)&v5, 0xCu);
  }
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 2004, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  }
}

void __54__CSBenchmarkService_runNCModelWithConfig_completion___block_invoke_55(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "+[CSBenchmarkService runNCModelWithConfig:completion:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s Result: %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __54__CSBenchmarkService_runNCModelWithConfig_completion___block_invoke_53(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  const __CFString *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
  {
    v4 = 136315650;
    v5 = "+[CSBenchmarkService runNCModelWithConfig:completion:]_block_invoke";
    v6 = 2112;
    v7 = CFSTR("Error in making synchronous call of CSBenchmarkService: ");
    v8 = 2112;
    v9 = v2;
    _os_log_error_impl(&dword_1C2614000, v3, OS_LOG_TYPE_ERROR, "%s %@: %@", (uint8_t *)&v4, 0x20u);
  }

}

void __54__CSBenchmarkService_runNCModelWithConfig_completion___block_invoke_51(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  const __CFString *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
  {
    v4 = 136315650;
    v5 = "+[CSBenchmarkService runNCModelWithConfig:completion:]_block_invoke";
    v6 = 2112;
    v7 = CFSTR("First attempt with Error in connecting with CSBenchmarkService: ");
    v8 = 2112;
    v9 = v2;
    _os_log_error_impl(&dword_1C2614000, v3, OS_LOG_TYPE_ERROR, "%s %@: %@", (uint8_t *)&v4, 0x20u);
  }

}

void __55__CSBenchmarkService_runAudioInjectionOnly_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "+[CSBenchmarkService runAudioInjectionOnly:completion:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s CSBenchmarkService Interrupted", (uint8_t *)&v5, 0xCu);
  }
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 2003, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, uint64_t, double))(v3 + 16))(v3, v4, -1, 0.0);

  }
}

void __55__CSBenchmarkService_runAudioInjectionOnly_completion___block_invoke_44(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "+[CSBenchmarkService runAudioInjectionOnly:completion:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s CSBenchmarkService Invalidated", (uint8_t *)&v5, 0xCu);
  }
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 2004, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, uint64_t, double))(v3 + 16))(v3, v4, -1, 0.0);

  }
}

void __55__CSBenchmarkService_runAudioInjectionOnly_completion___block_invoke_49(uint64_t a1, void *a2, uint64_t a3, double a4)
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "+[CSBenchmarkService runAudioInjectionOnly:completion:]_block_invoke";
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s Result: %@", (uint8_t *)&v10, 0x16u);
  }
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, id, uint64_t, double))(v9 + 16))(v9, v7, a3, a4);

}

void __55__CSBenchmarkService_runAudioInjectionOnly_completion___block_invoke_47(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  const __CFString *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
  {
    v4 = 136315650;
    v5 = "+[CSBenchmarkService runAudioInjectionOnly:completion:]_block_invoke";
    v6 = 2112;
    v7 = CFSTR("Error in making synchronous call of CSBenchmarkService: ");
    v8 = 2112;
    v9 = v2;
    _os_log_error_impl(&dword_1C2614000, v3, OS_LOG_TYPE_ERROR, "%s %@: %@", (uint8_t *)&v4, 0x20u);
  }

}

void __55__CSBenchmarkService_runAudioInjectionOnly_completion___block_invoke_45(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  const __CFString *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
  {
    v4 = 136315650;
    v5 = "+[CSBenchmarkService runAudioInjectionOnly:completion:]_block_invoke";
    v6 = 2112;
    v7 = CFSTR("First attempt with Error in connecting with CSBenchmarkService: ");
    v8 = 2112;
    v9 = v2;
    _os_log_error_impl(&dword_1C2614000, v3, OS_LOG_TYPE_ERROR, "%s %@: %@", (uint8_t *)&v4, 0x20u);
  }

}

void __77__CSBenchmarkService_runNovDetectorWithConfig_configRoot_withUrl_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "+[CSBenchmarkService runNovDetectorWithConfig:configRoot:withUrl:completion:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s CSBenchmarkService Interrupted", (uint8_t *)&v5, 0xCu);
  }
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 2003, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, uint64_t, double))(v3 + 16))(v3, v4, -1, 0.0);

  }
}

void __77__CSBenchmarkService_runNovDetectorWithConfig_configRoot_withUrl_completion___block_invoke_38(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "+[CSBenchmarkService runNovDetectorWithConfig:configRoot:withUrl:completion:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s CSBenchmarkService Invalidated", (uint8_t *)&v5, 0xCu);
  }
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 2004, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, uint64_t, double))(v3 + 16))(v3, v4, -1, 0.0);

  }
}

void __77__CSBenchmarkService_runNovDetectorWithConfig_configRoot_withUrl_completion___block_invoke_43(uint64_t a1, void *a2, uint64_t a3, double a4)
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "+[CSBenchmarkService runNovDetectorWithConfig:configRoot:withUrl:completion:]_block_invoke";
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s Result: %@", (uint8_t *)&v10, 0x16u);
  }
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, id, uint64_t, double))(v9 + 16))(v9, v7, a3, a4);

}

void __77__CSBenchmarkService_runNovDetectorWithConfig_configRoot_withUrl_completion___block_invoke_41(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  const __CFString *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
  {
    v4 = 136315650;
    v5 = "+[CSBenchmarkService runNovDetectorWithConfig:configRoot:withUrl:completion:]_block_invoke";
    v6 = 2112;
    v7 = CFSTR("Error in making synchronous call of CSBenchmarkService: ");
    v8 = 2112;
    v9 = v2;
    _os_log_error_impl(&dword_1C2614000, v3, OS_LOG_TYPE_ERROR, "%s %@: %@", (uint8_t *)&v4, 0x20u);
  }

}

void __77__CSBenchmarkService_runNovDetectorWithConfig_configRoot_withUrl_completion___block_invoke_39(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  const __CFString *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
  {
    v4 = 136315650;
    v5 = "+[CSBenchmarkService runNovDetectorWithConfig:configRoot:withUrl:completion:]_block_invoke";
    v6 = 2112;
    v7 = CFSTR("First attempt with Error in connecting with CSBenchmarkService: ");
    v8 = 2112;
    v9 = v2;
    _os_log_error_impl(&dword_1C2614000, v3, OS_LOG_TYPE_ERROR, "%s %@: %@", (uint8_t *)&v4, 0x20u);
  }

}

void __73__CSBenchmarkService_runODLDModelWithConfig_locale_inputText_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "+[CSBenchmarkService runODLDModelWithConfig:locale:inputText:completion:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s CSBenchmarkService Interrupted", (uint8_t *)&v5, 0xCu);
  }
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 2003, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  }
}

void __73__CSBenchmarkService_runODLDModelWithConfig_locale_inputText_completion___block_invoke_32(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "+[CSBenchmarkService runODLDModelWithConfig:locale:inputText:completion:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s CSBenchmarkService Invalidated", (uint8_t *)&v5, 0xCu);
  }
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 2004, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  }
}

void __73__CSBenchmarkService_runODLDModelWithConfig_locale_inputText_completion___block_invoke_37(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "+[CSBenchmarkService runODLDModelWithConfig:locale:inputText:completion:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s Result: %@", (uint8_t *)&v6, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __73__CSBenchmarkService_runODLDModelWithConfig_locale_inputText_completion___block_invoke_35(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  const __CFString *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
  {
    v4 = 136315650;
    v5 = "+[CSBenchmarkService runODLDModelWithConfig:locale:inputText:completion:]_block_invoke";
    v6 = 2112;
    v7 = CFSTR("Error in making synchronous call of CSBenchmarkService: ");
    v8 = 2112;
    v9 = v2;
    _os_log_error_impl(&dword_1C2614000, v3, OS_LOG_TYPE_ERROR, "%s %@: %@", (uint8_t *)&v4, 0x20u);
  }

}

void __73__CSBenchmarkService_runODLDModelWithConfig_locale_inputText_completion___block_invoke_33(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  const __CFString *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
  {
    v4 = 136315650;
    v5 = "+[CSBenchmarkService runODLDModelWithConfig:locale:inputText:completion:]_block_invoke";
    v6 = 2112;
    v7 = CFSTR("First attempt with Error in connecting with CSBenchmarkService: ");
    v8 = 2112;
    v9 = v2;
    _os_log_error_impl(&dword_1C2614000, v3, OS_LOG_TYPE_ERROR, "%s %@: %@", (uint8_t *)&v4, 0x20u);
  }

}

void __66__CSBenchmarkService_runOSDAnalyzerWithConfig_withUrl_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "+[CSBenchmarkService runOSDAnalyzerWithConfig:withUrl:completion:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s CSBenchmarkService Interrupted", (uint8_t *)&v5, 0xCu);
  }
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 2003, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, uint64_t, double))(v3 + 16))(v3, v4, -1, 0.0);

  }
}

void __66__CSBenchmarkService_runOSDAnalyzerWithConfig_withUrl_completion___block_invoke_26(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "+[CSBenchmarkService runOSDAnalyzerWithConfig:withUrl:completion:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s CSBenchmarkService Invalidated", (uint8_t *)&v5, 0xCu);
  }
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 2004, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, uint64_t, double))(v3 + 16))(v3, v4, -1, 0.0);

  }
}

void __66__CSBenchmarkService_runOSDAnalyzerWithConfig_withUrl_completion___block_invoke_31(uint64_t a1, void *a2, uint64_t a3, double a4)
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "+[CSBenchmarkService runOSDAnalyzerWithConfig:withUrl:completion:]_block_invoke";
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s Result: %@", (uint8_t *)&v10, 0x16u);
  }
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, id, uint64_t, double))(v9 + 16))(v9, v7, a3, a4);

}

void __66__CSBenchmarkService_runOSDAnalyzerWithConfig_withUrl_completion___block_invoke_29(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  const __CFString *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
  {
    v4 = 136315650;
    v5 = "+[CSBenchmarkService runOSDAnalyzerWithConfig:withUrl:completion:]_block_invoke";
    v6 = 2112;
    v7 = CFSTR("Error in making synchronous call of CSBenchmarkService: ");
    v8 = 2112;
    v9 = v2;
    _os_log_error_impl(&dword_1C2614000, v3, OS_LOG_TYPE_ERROR, "%s %@: %@", (uint8_t *)&v4, 0x20u);
  }

}

void __66__CSBenchmarkService_runOSDAnalyzerWithConfig_withUrl_completion___block_invoke_27(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  const __CFString *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
  {
    v4 = 136315650;
    v5 = "+[CSBenchmarkService runOSDAnalyzerWithConfig:withUrl:completion:]_block_invoke";
    v6 = 2112;
    v7 = CFSTR("First attempt with Error in connecting with CSBenchmarkService: ");
    v8 = 2112;
    v9 = v2;
    _os_log_error_impl(&dword_1C2614000, v3, OS_LOG_TYPE_ERROR, "%s %@: %@", (uint8_t *)&v4, 0x20u);
  }

}

void __79__CSBenchmarkService_runVTSecondPassModelWithConfig_locale_withUrl_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "+[CSBenchmarkService runVTSecondPassModelWithConfig:locale:withUrl:completion:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s CSBenchmarkService Interrupted", (uint8_t *)&v5, 0xCu);
  }
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 2003, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, uint64_t, double))(v3 + 16))(v3, v4, -1, 0.0);

  }
}

void __79__CSBenchmarkService_runVTSecondPassModelWithConfig_locale_withUrl_completion___block_invoke_20(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "+[CSBenchmarkService runVTSecondPassModelWithConfig:locale:withUrl:completion:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s CSBenchmarkService Invalidated", (uint8_t *)&v5, 0xCu);
  }
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 2004, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, uint64_t, double))(v3 + 16))(v3, v4, -1, 0.0);

  }
}

void __79__CSBenchmarkService_runVTSecondPassModelWithConfig_locale_withUrl_completion___block_invoke_25(uint64_t a1, void *a2, uint64_t a3, double a4)
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "+[CSBenchmarkService runVTSecondPassModelWithConfig:locale:withUrl:completion:]_block_invoke";
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s Result: %@", (uint8_t *)&v10, 0x16u);
  }
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, id, uint64_t, double))(v9 + 16))(v9, v7, a3, a4);

}

void __79__CSBenchmarkService_runVTSecondPassModelWithConfig_locale_withUrl_completion___block_invoke_23(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  const __CFString *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
  {
    v4 = 136315650;
    v5 = "+[CSBenchmarkService runVTSecondPassModelWithConfig:locale:withUrl:completion:]_block_invoke";
    v6 = 2112;
    v7 = CFSTR("Error in making synchronous call of CSBenchmarkService: ");
    v8 = 2112;
    v9 = v2;
    _os_log_error_impl(&dword_1C2614000, v3, OS_LOG_TYPE_ERROR, "%s %@: %@", (uint8_t *)&v4, 0x20u);
  }

}

void __79__CSBenchmarkService_runVTSecondPassModelWithConfig_locale_withUrl_completion___block_invoke_21(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  const __CFString *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
  {
    v4 = 136315650;
    v5 = "+[CSBenchmarkService runVTSecondPassModelWithConfig:locale:withUrl:completion:]_block_invoke";
    v6 = 2112;
    v7 = CFSTR("First attempt with Error in connecting with CSBenchmarkService: ");
    v8 = 2112;
    v9 = v2;
    _os_log_error_impl(&dword_1C2614000, v3, OS_LOG_TYPE_ERROR, "%s %@: %@", (uint8_t *)&v4, 0x20u);
  }

}

void __82__CSBenchmarkService_runLstmPhsModelWithConfig_withUrl_withConfigRoot_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "+[CSBenchmarkService runLstmPhsModelWithConfig:withUrl:withConfigRoot:completion:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s CSBenchmarkService Interrupted", (uint8_t *)&v5, 0xCu);
  }
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 2003, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, uint64_t, double))(v3 + 16))(v3, v4, -1, 0.0);

  }
}

void __82__CSBenchmarkService_runLstmPhsModelWithConfig_withUrl_withConfigRoot_completion___block_invoke_13(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "+[CSBenchmarkService runLstmPhsModelWithConfig:withUrl:withConfigRoot:completion:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s CSBenchmarkService Invalidated", (uint8_t *)&v5, 0xCu);
  }
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 2004, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, uint64_t, double))(v3 + 16))(v3, v4, -1, 0.0);

  }
}

void __82__CSBenchmarkService_runLstmPhsModelWithConfig_withUrl_withConfigRoot_completion___block_invoke_18(uint64_t a1, void *a2, uint64_t a3, double a4)
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "+[CSBenchmarkService runLstmPhsModelWithConfig:withUrl:withConfigRoot:completion:]_block_invoke";
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s Result: %@", (uint8_t *)&v10, 0x16u);
  }
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, id, uint64_t, double))(v9 + 16))(v9, v7, a3, a4);

}

void __82__CSBenchmarkService_runLstmPhsModelWithConfig_withUrl_withConfigRoot_completion___block_invoke_16(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  const __CFString *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
  {
    v4 = 136315650;
    v5 = "+[CSBenchmarkService runLstmPhsModelWithConfig:withUrl:withConfigRoot:completion:]_block_invoke";
    v6 = 2112;
    v7 = CFSTR("Error in making synchronous call of CSBenchmarkService: ");
    v8 = 2112;
    v9 = v2;
    _os_log_error_impl(&dword_1C2614000, v3, OS_LOG_TYPE_ERROR, "%s %@: %@", (uint8_t *)&v4, 0x20u);
  }

}

void __82__CSBenchmarkService_runLstmPhsModelWithConfig_withUrl_withConfigRoot_completion___block_invoke_14(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  const __CFString *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
  {
    v4 = 136315650;
    v5 = "+[CSBenchmarkService runLstmPhsModelWithConfig:withUrl:withConfigRoot:completion:]_block_invoke";
    v6 = 2112;
    v7 = CFSTR("First attempt with Error in connecting with CSBenchmarkService: ");
    v8 = 2112;
    v9 = v2;
    _os_log_error_impl(&dword_1C2614000, v3, OS_LOG_TYPE_ERROR, "%s %@: %@", (uint8_t *)&v4, 0x20u);
  }

}

uint64_t __42__CSBenchmarkService_pingpong_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "+[CSBenchmarkService pingpong:completion:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s CSBenchmarkService Interrupted", (uint8_t *)&v4, 0xCu);
  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __42__CSBenchmarkService_pingpong_completion___block_invoke_7(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "+[CSBenchmarkService pingpong:completion:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s CSBenchmarkService Invalidated", (uint8_t *)&v4, 0xCu);
  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __42__CSBenchmarkService_pingpong_completion___block_invoke_10(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
