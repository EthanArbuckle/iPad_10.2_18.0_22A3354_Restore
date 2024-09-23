@implementation CSAudioInjectionServices

+ (id)getAudioInjectionXPCConnectionForCoreSpeechD
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0CB3B38]);
  v3 = (void *)objc_msgSend(v2, "initWithMachServiceName:options:", *MEMORY[0x1E0D18E78], 0);
  AudioInjectionXPCGetInterface();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRemoteObjectInterface:", v4);

  return v3;
}

+ (BOOL)setAudioInjectionMode:(BOOL)a3
{
  _BOOL8 v3;
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  char v8;
  BOOL v9;
  int v11;
  const char *v12;
  __int16 v13;
  _BOOL4 v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  CSLogInitIfNeeded();
  v4 = objc_msgSend(MEMORY[0x1E0D19260], "isExclaveHardware");
  v5 = *MEMORY[0x1E0D18F60];
  v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      v11 = 136315394;
      v12 = "+[CSAudioInjectionServices setAudioInjectionMode:]";
      v13 = 1024;
      v14 = v3;
      _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s Setting exclave audio injection enabled : %d", (uint8_t *)&v11, 0x12u);
    }
    objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "enableExclaveAudioInjection:", v3);
  }
  else
  {
    if (v6)
    {
      v11 = 136315394;
      v12 = "+[CSAudioInjectionServices setAudioInjectionMode:]";
      v13 = 1024;
      v14 = v3;
      _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s Setting audio injection enabled : %d", (uint8_t *)&v11, 0x12u);
    }
    objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "enableProgrammableAudioInjection:", v3);
  }
  v9 = v8;

  return v9;
}

+ (BOOL)audioInjectionEnabled
{
  int v2;
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  const char *v7;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  CSLogInitIfNeeded();
  v2 = objc_msgSend(MEMORY[0x1E0D19260], "isExclaveHardware");
  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    v5 = objc_msgSend(v3, "exclaveAudioInjectionEnabled");

    v6 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315394;
      v10 = "+[CSAudioInjectionServices audioInjectionEnabled]";
      v11 = 1024;
      v12 = v5;
      v7 = "%s Fetched exclave audio injection enabled : %d";
LABEL_6:
      _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v9, 0x12u);
    }
  }
  else
  {
    v5 = objc_msgSend(v3, "programmableAudioInjectionEnabled");

    v6 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315394;
      v10 = "+[CSAudioInjectionServices audioInjectionEnabled]";
      v11 = 1024;
      v12 = v5;
      v7 = "%s Fetched audio injection enabled : %d";
      goto LABEL_6;
    }
  }
  return v5;
}

+ (void)pingpong:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  CSLogInitIfNeeded();
  objc_msgSend(a1, "getAudioInjectionXPCConnectionForCoreSpeechD");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __48__CSAudioInjectionServices_pingpong_completion___block_invoke;
  v17[3] = &unk_1E7C28F10;
  v8 = v5;
  v18 = v8;
  objc_msgSend(v6, "setInterruptionHandler:", v17);
  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __48__CSAudioInjectionServices_pingpong_completion___block_invoke_3;
  v15[3] = &unk_1E7C28F10;
  v9 = v8;
  v16 = v9;
  objc_msgSend(v6, "setInvalidationHandler:", v15);
  objc_msgSend(v6, "resume");
  objc_msgSend(v6, "remoteObjectProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v12 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "+[CSAudioInjectionServices pingpong:completion:]";
      _os_log_error_impl(&dword_1C2614000, v12, OS_LOG_TYPE_ERROR, "%s XPC connection not exist?", buf, 0xCu);
      if (!v9)
        goto LABEL_6;
    }
    else if (!v9)
    {
      goto LABEL_6;
    }
    (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
    goto LABEL_6;
  }
  objc_msgSend(v6, "remoteObjectProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __48__CSAudioInjectionServices_pingpong_completion___block_invoke_5;
  v13[3] = &unk_1E7C28F38;
  v14 = v9;
  objc_msgSend(v11, "pingpong:completion:", CFSTR("TEST"), v13);

LABEL_6:
}

+ (void)createAudioInjectionDeviceWithType:(int64_t)a3 deviceName:(id)a4 deviceID:(id)a5 productID:(id)a6 completion:(id)a7
{
  objc_msgSend(a1, "createAudioInjectionDeviceWithType:deviceName:deviceID:productID:handlingDaemon:completion:", a3, a4, a5, a6, 0, a7);
}

+ (void)createAudioInjectionDeviceWithType:(int64_t)a3 deviceName:(id)a4 deviceID:(id)a5 productID:(id)a6 handlingDaemon:(int)a7 completion:(id)a8
{
  uint64_t v9;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  dispatch_semaphore_t v24;
  void *v25;
  NSObject *v26;
  dispatch_time_t v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  id v34;
  _QWORD v35[4];
  NSObject *v36;
  uint64_t *v37;
  _BYTE *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  char v49;
  _QWORD v50[4];
  id v51;
  _QWORD v52[4];
  id v53;
  _QWORD v54[4];
  id v55;
  uint8_t v56[4];
  const char *v57;
  _BYTE buf[24];
  uint64_t (*v59)(uint64_t, uint64_t);
  _BYTE v60[20];
  uint64_t v61;

  v9 = *(_QWORD *)&a7;
  v61 = *MEMORY[0x1E0C80C00];
  v33 = (uint64_t (*)(uint64_t, uint64_t))a4;
  v34 = a5;
  v13 = a6;
  v14 = a8;
  CSLogInitIfNeeded();
  v15 = MEMORY[0x1E0C809B0];
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __119__CSAudioInjectionServices_createAudioInjectionDeviceWithType_deviceName_deviceID_productID_handlingDaemon_completion___block_invoke;
  v54[3] = &unk_1E7C28F60;
  v16 = v14;
  v55 = v16;
  v17 = (void *)MEMORY[0x1C3BC4734](v54);
  +[CSAudioInjectionServices GetConnectionForDaemon:](CSAudioInjectionServices, "GetConnectionForDaemon:", v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = v15;
  v52[1] = 3221225472;
  v52[2] = __119__CSAudioInjectionServices_createAudioInjectionDeviceWithType_deviceName_deviceID_productID_handlingDaemon_completion___block_invoke_2;
  v52[3] = &unk_1E7C28F10;
  v19 = v17;
  v53 = v19;
  objc_msgSend(v18, "setInterruptionHandler:", v52);
  v50[0] = v15;
  v50[1] = 3221225472;
  v50[2] = __119__CSAudioInjectionServices_createAudioInjectionDeviceWithType_deviceName_deviceID_productID_handlingDaemon_completion___block_invoke_10;
  v50[3] = &unk_1E7C28F10;
  v20 = v19;
  v51 = v20;
  objc_msgSend(v18, "setInvalidationHandler:", v50);
  objc_msgSend(v18, "resume");
  objc_msgSend(v18, "remoteObjectProxy");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v21;
  v23 = *MEMORY[0x1E0D18F60];
  if (v21)
  {
    v32 = (void *)v21;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "+[CSAudioInjectionServices createAudioInjectionDeviceWithType:deviceName:deviceID:productID:h"
                           "andlingDaemon:completion:]";
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = a3;
      *(_WORD *)&buf[22] = 2112;
      v59 = v33;
      *(_WORD *)v60 = 2112;
      *(_QWORD *)&v60[2] = v34;
      *(_WORD *)&v60[10] = 2112;
      *(_QWORD *)&v60[12] = v13;
      _os_log_impl(&dword_1C2614000, v23, OS_LOG_TYPE_DEFAULT, "%s Request to create audio injection device type : %ld, deviceName : %@, deviceId : %@, productId : %@", buf, 0x34u);
    }
    v46 = 0;
    v47 = &v46;
    v48 = 0x2020000000;
    v49 = 0;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v59 = __Block_byref_object_copy__26148;
    *(_QWORD *)v60 = __Block_byref_object_dispose__26149;
    *(_QWORD *)&v60[8] = 0;
    v40 = 0;
    v41 = &v40;
    v42 = 0x3032000000;
    v43 = __Block_byref_object_copy__26148;
    v44 = __Block_byref_object_dispose__26149;
    v45 = 0;
    v24 = dispatch_semaphore_create(0);
    objc_msgSend(v18, "remoteObjectProxy");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v15;
    v35[1] = 3221225472;
    v35[2] = __119__CSAudioInjectionServices_createAudioInjectionDeviceWithType_deviceName_deviceID_productID_handlingDaemon_completion___block_invoke_11;
    v35[3] = &unk_1E7C28F88;
    v37 = &v46;
    v38 = buf;
    v39 = &v40;
    v26 = v24;
    v36 = v26;
    objc_msgSend(v25, "createAudioInjectionDeviceWithType:deviceName:deviceID:productID:completion:", a3, v33, v34, v13, v35);

    v22 = v32;
    v27 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(v26, v27))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 1505, 0);
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = *(void **)(*(_QWORD *)&buf[8] + 40);
      *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v28;

      v30 = *MEMORY[0x1E0D18F60];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v56 = 136315138;
        v57 = "+[CSAudioInjectionServices createAudioInjectionDeviceWithType:deviceName:deviceID:productID:handlingDaemon:completion:]";
        _os_log_error_impl(&dword_1C2614000, v30, OS_LOG_TYPE_ERROR, "%s Fetching primary device timed-out!!", v56, 0xCu);
      }
    }
    (*((void (**)(id, _QWORD, _QWORD, uint64_t))v20 + 2))(v20, *((unsigned __int8 *)v47 + 24), *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v41[5]);

    _Block_object_dispose(&v40, 8);
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(&v46, 8);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "+[CSAudioInjectionServices createAudioInjectionDeviceWithType:deviceName:deviceID:productID:h"
                           "andlingDaemon:completion:]";
      _os_log_error_impl(&dword_1C2614000, v23, OS_LOG_TYPE_ERROR, "%s XPC connection not exist?", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 1503, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *, _QWORD))v20 + 2))(v20, 0, v31, 0);

  }
}

+ (void)injectAudio:(id)a3 toDeviceWithUUID:(id)a4 completion:(id)a5
{
  objc_msgSend(a1, "injectAudio:toDeviceWithUUID:handlingDaemon:completion:", a3, a4, 0, a5);
}

+ (void)injectAudio:(id)a3 toDeviceWithUUID:(id)a4 handlingDaemon:(int)a5 completion:(id)a6
{
  objc_msgSend(a1, "injectAudio:toDeviceWithUUID:withfadingTimeWindowLength:handlingDaemon:completion:", a3, a4, 100, *(_QWORD *)&a5, a6);
}

+ (void)injectAudio:(id)a3 toDeviceWithUUID:(id)a4 withfadingTimeWindowLength:(unint64_t)a5 completion:(id)a6
{
  objc_msgSend(a1, "injectAudio:toDeviceWithUUID:withfadingTimeWindowLength:handlingDaemon:completion:", a3, a4, a5, 0, a6);
}

+ (void)injectAudio:(id)a3 toDeviceWithUUID:(id)a4 withfadingTimeWindowLength:(unint64_t)a5 handlingDaemon:(int)a6 completion:(id)a7
{
  uint64_t v8;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  float v21;
  NSObject *v22;
  NSObject *v23;
  double v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v8 = *(_QWORD *)&a6;
  v38 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a7;
  CSLogInitIfNeeded();
  v14 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __110__CSAudioInjectionServices_injectAudio_toDeviceWithUUID_withfadingTimeWindowLength_handlingDaemon_completion___block_invoke;
  v30[3] = &unk_1E7C28FB0;
  v15 = v13;
  v31 = v15;
  v16 = (void *)MEMORY[0x1C3BC4734](v30);
  +[CSAudioInjectionServices GetConnectionForDaemon:](CSAudioInjectionServices, "GetConnectionForDaemon:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v14;
  v28[1] = 3221225472;
  v28[2] = __110__CSAudioInjectionServices_injectAudio_toDeviceWithUUID_withfadingTimeWindowLength_handlingDaemon_completion___block_invoke_2;
  v28[3] = &unk_1E7C28F10;
  v18 = v16;
  v29 = v18;
  objc_msgSend(v17, "setInterruptionHandler:", v28);
  v26[0] = v14;
  v26[1] = 3221225472;
  v26[2] = __110__CSAudioInjectionServices_injectAudio_toDeviceWithUUID_withfadingTimeWindowLength_handlingDaemon_completion___block_invoke_13;
  v26[3] = &unk_1E7C28F10;
  v19 = v18;
  v27 = v19;
  objc_msgSend(v17, "setInvalidationHandler:", v26);
  objc_msgSend(v17, "resume");
  objc_msgSend(v17, "remoteObjectProxy");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5)
    v21 = 1.0 / (float)a5;
  else
    v21 = 1.0;
  v22 = *MEMORY[0x1E0D18F60];
  v23 = *MEMORY[0x1E0D18F60];
  if (v20)
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v33 = "+[CSAudioInjectionServices injectAudio:toDeviceWithUUID:withfadingTimeWindowLength:handlingDaemon:completion:]";
      v34 = 2112;
      v35 = v11;
      v36 = 2112;
      v37 = v12;
      _os_log_impl(&dword_1C2614000, v22, OS_LOG_TYPE_DEFAULT, "%s Request to inject audio %@ to deviceUUID %@", buf, 0x20u);
    }
    *(float *)&v24 = v21;
    objc_msgSend(v20, "injectAudio:toDeviceWithUUID:withScaleFactor:completion:", v11, v12, v15, v24);
  }
  else
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v33 = "+[CSAudioInjectionServices injectAudio:toDeviceWithUUID:withfadingTimeWindowLength:handlingDaemon:completion:]";
      _os_log_error_impl(&dword_1C2614000, v22, OS_LOG_TYPE_ERROR, "%s XPC connection not exist?", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 1503, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *, _QWORD, _QWORD))v19 + 2))(v19, 0, v25, 0, 0);

  }
}

+ (void)injectAudio:(id)a3 toDeviceWithUUID:(id)a4 withNumChannels:(unint64_t)a5 completion:(id)a6
{
  objc_msgSend(a1, "injectAudio:toDeviceWithUUID:withNumChannels:handlingDaemon:completion:", a3, a4, a5, 0, a6);
}

+ (void)injectAudio:(id)a3 toDeviceWithUUID:(id)a4 withNumChannels:(unint64_t)a5 handlingDaemon:(int)a6 completion:(id)a7
{
  objc_msgSend(a1, "injectAudio:toDeviceWithUUID:withNumChannels:withUserIntentOptions:handlingDaemon:completion:", a3, a4, a5, 0, *(_QWORD *)&a6, a7);
}

+ (void)injectAudio:(id)a3 toDeviceWithUUID:(id)a4 withNumChannels:(unint64_t)a5 withUserIntentOptions:(id)a6 completion:(id)a7
{
  objc_msgSend(a1, "injectAudio:toDeviceWithUUID:withNumChannels:withUserIntentOptions:handlingDaemon:completion:", a3, a4, a5, a6, 0, a7);
}

+ (void)injectAudio:(id)a3 toDeviceWithUUID:(id)a4 withNumChannels:(unint64_t)a5 withUserIntentOptions:(id)a6 handlingDaemon:(int)a7 completion:(id)a8
{
  uint64_t v9;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  NSObject *v24;
  double v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v9 = *(_QWORD *)&a7;
  v39 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a8;
  CSLogInitIfNeeded();
  v17 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __121__CSAudioInjectionServices_injectAudio_toDeviceWithUUID_withNumChannels_withUserIntentOptions_handlingDaemon_completion___block_invoke;
  v31[3] = &unk_1E7C28FB0;
  v18 = v16;
  v32 = v18;
  v19 = (void *)MEMORY[0x1C3BC4734](v31);
  +[CSAudioInjectionServices GetConnectionForDaemon:](CSAudioInjectionServices, "GetConnectionForDaemon:", v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v17;
  v29[1] = 3221225472;
  v29[2] = __121__CSAudioInjectionServices_injectAudio_toDeviceWithUUID_withNumChannels_withUserIntentOptions_handlingDaemon_completion___block_invoke_2;
  v29[3] = &unk_1E7C28F10;
  v21 = v19;
  v30 = v21;
  objc_msgSend(v20, "setInterruptionHandler:", v29);
  v27[0] = v17;
  v27[1] = 3221225472;
  v27[2] = __121__CSAudioInjectionServices_injectAudio_toDeviceWithUUID_withNumChannels_withUserIntentOptions_handlingDaemon_completion___block_invoke_14;
  v27[3] = &unk_1E7C28F10;
  v22 = v21;
  v28 = v22;
  objc_msgSend(v20, "setInvalidationHandler:", v27);
  objc_msgSend(v20, "resume");
  objc_msgSend(v20, "remoteObjectProxy");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = *MEMORY[0x1E0D18F60];
  if (v23)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v34 = "+[CSAudioInjectionServices injectAudio:toDeviceWithUUID:withNumChannels:withUserIntentOptions:handlingDaemon:completion:]";
      v35 = 2112;
      v36 = v13;
      v37 = 2112;
      v38 = v14;
      _os_log_impl(&dword_1C2614000, v24, OS_LOG_TYPE_DEFAULT, "%s Request to inject audio %@ to deviceUUID %@", buf, 0x20u);
    }
    LODWORD(v25) = 1120403456;
    objc_msgSend(v23, "injectAudio:toDeviceWithUUID:withScaleFactor:withNumChannels:withUserIntentOptions:completion:", v13, v14, a5, v15, v18, v25);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v34 = "+[CSAudioInjectionServices injectAudio:toDeviceWithUUID:withNumChannels:withUserIntentOptions:handlingDaemon:completion:]";
      _os_log_error_impl(&dword_1C2614000, v24, OS_LOG_TYPE_ERROR, "%s XPC connection not exist?", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 1503, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *, _QWORD, _QWORD))v22 + 2))(v22, 0, v26, 0, 0);

  }
}

+ (void)connectDeviceWithUUID:(id)a3 completion:(id)a4
{
  objc_msgSend(a1, "connectDeviceWithUUID:handlingDaemon:completion:", a3, 0, a4);
}

+ (void)connectDeviceWithUUID:(id)a3 handlingDaemon:(int)a4 completion:(id)a5
{
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  os_log_t *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  dispatch_time_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, char, id);
  void *v28;
  NSObject *v29;
  uint64_t *v30;
  _BYTE *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  uint8_t v42[4];
  const char *v43;
  _BYTE buf[24];
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;

  v6 = *(_QWORD *)&a4;
  v48 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  CSLogInitIfNeeded();
  v9 = MEMORY[0x1E0C809B0];
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __76__CSAudioInjectionServices_connectDeviceWithUUID_handlingDaemon_completion___block_invoke;
  v40[3] = &unk_1E7C290D8;
  v10 = v8;
  v41 = v10;
  v11 = (void *)MEMORY[0x1C3BC4734](v40);
  +[CSAudioInjectionServices GetConnectionForDaemon:](CSAudioInjectionServices, "GetConnectionForDaemon:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v9;
  v38[1] = 3221225472;
  v38[2] = __76__CSAudioInjectionServices_connectDeviceWithUUID_handlingDaemon_completion___block_invoke_2;
  v38[3] = &unk_1E7C28F10;
  v13 = v11;
  v39 = v13;
  objc_msgSend(v12, "setInterruptionHandler:", v38);
  v36[0] = v9;
  v36[1] = 3221225472;
  v36[2] = __76__CSAudioInjectionServices_connectDeviceWithUUID_handlingDaemon_completion___block_invoke_16;
  v36[3] = &unk_1E7C28F10;
  v14 = v13;
  v37 = v14;
  objc_msgSend(v12, "setInvalidationHandler:", v36);
  objc_msgSend(v12, "resume");
  objc_msgSend(v12, "remoteObjectProxy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (os_log_t *)MEMORY[0x1E0D18F60];
  v17 = *MEMORY[0x1E0D18F60];
  v18 = *MEMORY[0x1E0D18F60];
  if (v15)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "+[CSAudioInjectionServices connectDeviceWithUUID:handlingDaemon:completion:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v7;
      _os_log_impl(&dword_1C2614000, v17, OS_LOG_TYPE_DEFAULT, "%s Request to connect device with UUID %@", buf, 0x16u);
    }
    v32 = 0;
    v33 = &v32;
    v34 = 0x2020000000;
    v35 = 0;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v45 = __Block_byref_object_copy__26148;
    v46 = __Block_byref_object_dispose__26149;
    v47 = 0;
    v25 = v9;
    v26 = 3221225472;
    v27 = __76__CSAudioInjectionServices_connectDeviceWithUUID_handlingDaemon_completion___block_invoke_17;
    v28 = &unk_1E7C28FD8;
    v30 = &v32;
    v31 = buf;
    v19 = dispatch_semaphore_create(0);
    v29 = v19;
    objc_msgSend(v15, "connectDeviceWithUUID:completion:", v7, &v25);
    v20 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(v19, v20))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 1505, 0, v25, v26, v27, v28);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = *(void **)(*(_QWORD *)&buf[8] + 40);
      *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v21;

      v23 = *v16;
      if (os_log_type_enabled(*v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v42 = 136315138;
        v43 = "+[CSAudioInjectionServices connectDeviceWithUUID:handlingDaemon:completion:]";
        _os_log_error_impl(&dword_1C2614000, v23, OS_LOG_TYPE_ERROR, "%s Connect device timed-out!!", v42, 0xCu);
      }
    }
    (*((void (**)(id, _QWORD, _QWORD))v14 + 2))(v14, *((unsigned __int8 *)v33 + 24), *(_QWORD *)(*(_QWORD *)&buf[8] + 40));

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v32, 8);
  }
  else
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "+[CSAudioInjectionServices connectDeviceWithUUID:handlingDaemon:completion:]";
      _os_log_error_impl(&dword_1C2614000, v17, OS_LOG_TYPE_ERROR, "%s XPC connection not exist?", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 1503, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v14 + 2))(v14, 0, v24);

  }
}

+ (void)disconnectDeviceWithUUID:(id)a3 completion:(id)a4
{
  objc_msgSend(a1, "disconnectDeviceWithUUID:handlingDaemon:completion:", a3, 0, a4);
}

+ (void)disconnectDeviceWithUUID:(id)a3 handlingDaemon:(int)a4 completion:(id)a5
{
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  os_log_t *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  dispatch_time_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, char, id);
  void *v28;
  NSObject *v29;
  uint64_t *v30;
  _BYTE *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  uint8_t v42[4];
  const char *v43;
  _BYTE buf[24];
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;

  v6 = *(_QWORD *)&a4;
  v48 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  CSLogInitIfNeeded();
  v9 = MEMORY[0x1E0C809B0];
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __79__CSAudioInjectionServices_disconnectDeviceWithUUID_handlingDaemon_completion___block_invoke;
  v40[3] = &unk_1E7C290D8;
  v10 = v8;
  v41 = v10;
  v11 = (void *)MEMORY[0x1C3BC4734](v40);
  +[CSAudioInjectionServices GetConnectionForDaemon:](CSAudioInjectionServices, "GetConnectionForDaemon:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v9;
  v38[1] = 3221225472;
  v38[2] = __79__CSAudioInjectionServices_disconnectDeviceWithUUID_handlingDaemon_completion___block_invoke_2;
  v38[3] = &unk_1E7C28F10;
  v13 = v11;
  v39 = v13;
  objc_msgSend(v12, "setInterruptionHandler:", v38);
  v36[0] = v9;
  v36[1] = 3221225472;
  v36[2] = __79__CSAudioInjectionServices_disconnectDeviceWithUUID_handlingDaemon_completion___block_invoke_18;
  v36[3] = &unk_1E7C28F10;
  v14 = v13;
  v37 = v14;
  objc_msgSend(v12, "setInvalidationHandler:", v36);
  objc_msgSend(v12, "resume");
  objc_msgSend(v12, "remoteObjectProxy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (os_log_t *)MEMORY[0x1E0D18F60];
  v17 = *MEMORY[0x1E0D18F60];
  v18 = *MEMORY[0x1E0D18F60];
  if (v15)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "+[CSAudioInjectionServices disconnectDeviceWithUUID:handlingDaemon:completion:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v7;
      _os_log_impl(&dword_1C2614000, v17, OS_LOG_TYPE_DEFAULT, "%s Request to disconnect device with UUID %@", buf, 0x16u);
    }
    v32 = 0;
    v33 = &v32;
    v34 = 0x2020000000;
    v35 = 0;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v45 = __Block_byref_object_copy__26148;
    v46 = __Block_byref_object_dispose__26149;
    v47 = 0;
    v25 = v9;
    v26 = 3221225472;
    v27 = __79__CSAudioInjectionServices_disconnectDeviceWithUUID_handlingDaemon_completion___block_invoke_19;
    v28 = &unk_1E7C28FD8;
    v30 = &v32;
    v31 = buf;
    v19 = dispatch_semaphore_create(0);
    v29 = v19;
    objc_msgSend(v15, "disconnectDeviceWithUUID:completion:", v7, &v25);
    v20 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(v19, v20))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 1505, 0, v25, v26, v27, v28);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = *(void **)(*(_QWORD *)&buf[8] + 40);
      *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v21;

      v23 = *v16;
      if (os_log_type_enabled(*v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v42 = 136315138;
        v43 = "+[CSAudioInjectionServices disconnectDeviceWithUUID:handlingDaemon:completion:]";
        _os_log_error_impl(&dword_1C2614000, v23, OS_LOG_TYPE_ERROR, "%s Disconnect device timed-out!!", v42, 0xCu);
      }
    }
    (*((void (**)(id, _QWORD, _QWORD))v14 + 2))(v14, *((unsigned __int8 *)v33 + 24), *(_QWORD *)(*(_QWORD *)&buf[8] + 40));

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v32, 8);
  }
  else
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "+[CSAudioInjectionServices disconnectDeviceWithUUID:handlingDaemon:completion:]";
      _os_log_error_impl(&dword_1C2614000, v17, OS_LOG_TYPE_ERROR, "%s XPC connection not exist?", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 1503, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v14 + 2))(v14, 0, v24);

  }
}

+ (void)primaryInputDeviceUUIDWithCompletion:(id)a3
{
  objc_msgSend(a1, "primaryInputDeviceUUIDWithhandlingDaemon:WithCompletion:", 0, a3);
}

+ (void)primaryInputDeviceUUIDWithhandlingDaemon:(int)a3 WithCompletion:(id)a4
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  os_log_t *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  dispatch_time_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  _QWORD v22[4];
  NSObject *v23;
  uint64_t *v24;
  __int128 *p_buf;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  uint8_t v43[4];
  const char *v44;
  __int128 buf;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;

  v4 = *(_QWORD *)&a3;
  v50 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  CSLogInitIfNeeded();
  v6 = MEMORY[0x1E0C809B0];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __84__CSAudioInjectionServices_primaryInputDeviceUUIDWithhandlingDaemon_WithCompletion___block_invoke;
  v41[3] = &unk_1E7C28F60;
  v7 = v5;
  v42 = v7;
  v8 = (void *)MEMORY[0x1C3BC4734](v41);
  +[CSAudioInjectionServices GetConnectionForDaemon:](CSAudioInjectionServices, "GetConnectionForDaemon:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v6;
  v39[1] = 3221225472;
  v39[2] = __84__CSAudioInjectionServices_primaryInputDeviceUUIDWithhandlingDaemon_WithCompletion___block_invoke_2;
  v39[3] = &unk_1E7C28F10;
  v10 = v8;
  v40 = v10;
  objc_msgSend(v9, "setInterruptionHandler:", v39);
  v37[0] = v6;
  v37[1] = 3221225472;
  v37[2] = __84__CSAudioInjectionServices_primaryInputDeviceUUIDWithhandlingDaemon_WithCompletion___block_invoke_20;
  v37[3] = &unk_1E7C28F10;
  v11 = v10;
  v38 = v11;
  objc_msgSend(v9, "setInvalidationHandler:", v37);
  objc_msgSend(v9, "resume");
  objc_msgSend(v9, "remoteObjectProxy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (os_log_t *)MEMORY[0x1E0D18F60];
  v14 = *MEMORY[0x1E0D18F60];
  v15 = *MEMORY[0x1E0D18F60];
  if (v12)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "+[CSAudioInjectionServices primaryInputDeviceUUIDWithhandlingDaemon:WithCompletion:]";
      _os_log_impl(&dword_1C2614000, v14, OS_LOG_TYPE_DEFAULT, "%s Request to fetch primary device", (uint8_t *)&buf, 0xCu);
    }
    v33 = 0;
    v34 = &v33;
    v35 = 0x2020000000;
    v36 = 0;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v46 = 0x3032000000;
    v47 = __Block_byref_object_copy__26148;
    v48 = __Block_byref_object_dispose__26149;
    v49 = 0;
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__26148;
    v31 = __Block_byref_object_dispose__26149;
    v32 = 0;
    v22[0] = v6;
    v22[1] = 3221225472;
    v22[2] = __84__CSAudioInjectionServices_primaryInputDeviceUUIDWithhandlingDaemon_WithCompletion___block_invoke_21;
    v22[3] = &unk_1E7C28F88;
    v24 = &v33;
    p_buf = &buf;
    v26 = &v27;
    v16 = dispatch_semaphore_create(0);
    v23 = v16;
    objc_msgSend(v12, "primaryInputDeviceUUIDWithCompletion:", v22);
    v17 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(v16, v17))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 1505, 0);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = *(void **)(*((_QWORD *)&buf + 1) + 40);
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v18;

      v20 = *v13;
      if (os_log_type_enabled(*v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v43 = 136315138;
        v44 = "+[CSAudioInjectionServices primaryInputDeviceUUIDWithhandlingDaemon:WithCompletion:]";
        _os_log_error_impl(&dword_1C2614000, v20, OS_LOG_TYPE_ERROR, "%s Fetching primary device timed-out!!", v43, 0xCu);
      }
    }
    (*((void (**)(id, _QWORD, _QWORD, uint64_t))v11 + 2))(v11, *((unsigned __int8 *)v34 + 24), *(_QWORD *)(*((_QWORD *)&buf + 1) + 40), v28[5]);

    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(&buf, 8);

    _Block_object_dispose(&v33, 8);
  }
  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "+[CSAudioInjectionServices primaryInputDeviceUUIDWithhandlingDaemon:WithCompletion:]";
      _os_log_error_impl(&dword_1C2614000, v14, OS_LOG_TYPE_ERROR, "%s XPC connection not exist?", (uint8_t *)&buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 1503, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *, _QWORD))v11 + 2))(v11, 0, v21, 0);

  }
}

+ (id)GetConnectionForDaemon:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (a3)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(a1, "getAudioInjectionXPCConnectionForCoreSpeechD", v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

uint64_t __84__CSAudioInjectionServices_primaryInputDeviceUUIDWithhandlingDaemon_WithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __84__CSAudioInjectionServices_primaryInputDeviceUUIDWithhandlingDaemon_WithCompletion___block_invoke_2(uint64_t a1)
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
    v6 = "+[CSAudioInjectionServices primaryInputDeviceUUIDWithhandlingDaemon:WithCompletion:]_block_invoke_2";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s CSAudioInjectionServices Interrupted", (uint8_t *)&v5, 0xCu);
  }
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 1502, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *, _QWORD))(v3 + 16))(v3, 0, v4, 0);

}

void __84__CSAudioInjectionServices_primaryInputDeviceUUIDWithhandlingDaemon_WithCompletion___block_invoke_20(uint64_t a1)
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
    v6 = "+[CSAudioInjectionServices primaryInputDeviceUUIDWithhandlingDaemon:WithCompletion:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s CSAudioInjectionServices Invalidated", (uint8_t *)&v5, 0xCu);
  }
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 1501, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *, _QWORD))(v3 + 16))(v3, 0, v4, 0);

}

void __84__CSAudioInjectionServices_primaryInputDeviceUUIDWithhandlingDaemon_WithCompletion___block_invoke_21(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;

  v7 = a3;
  v8 = a4;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v7;
  v14 = v7;

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v8;
  v13 = v8;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __79__CSAudioInjectionServices_disconnectDeviceWithUUID_handlingDaemon_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __79__CSAudioInjectionServices_disconnectDeviceWithUUID_handlingDaemon_completion___block_invoke_2(uint64_t a1)
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
    v6 = "+[CSAudioInjectionServices disconnectDeviceWithUUID:handlingDaemon:completion:]_block_invoke_2";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s CSAudioInjectionServices Interrupted", (uint8_t *)&v5, 0xCu);
  }
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 1502, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v4);

}

void __79__CSAudioInjectionServices_disconnectDeviceWithUUID_handlingDaemon_completion___block_invoke_18(uint64_t a1)
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
    v6 = "+[CSAudioInjectionServices disconnectDeviceWithUUID:handlingDaemon:completion:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s CSAudioInjectionServices Invalidated", (uint8_t *)&v5, 0xCu);
  }
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 1501, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v4);

}

void __79__CSAudioInjectionServices_disconnectDeviceWithUUID_handlingDaemon_completion___block_invoke_19(uint64_t a1, char a2, id obj)
{
  id v5;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

uint64_t __76__CSAudioInjectionServices_connectDeviceWithUUID_handlingDaemon_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __76__CSAudioInjectionServices_connectDeviceWithUUID_handlingDaemon_completion___block_invoke_2(uint64_t a1)
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
    v6 = "+[CSAudioInjectionServices connectDeviceWithUUID:handlingDaemon:completion:]_block_invoke_2";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s CSAudioInjectionServices Interrupted", (uint8_t *)&v5, 0xCu);
  }
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 1502, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v4);

}

void __76__CSAudioInjectionServices_connectDeviceWithUUID_handlingDaemon_completion___block_invoke_16(uint64_t a1)
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
    v6 = "+[CSAudioInjectionServices connectDeviceWithUUID:handlingDaemon:completion:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s CSAudioInjectionServices Invalidated", (uint8_t *)&v5, 0xCu);
  }
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 1501, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v4);

}

void __76__CSAudioInjectionServices_connectDeviceWithUUID_handlingDaemon_completion___block_invoke_17(uint64_t a1, char a2, id obj)
{
  id v5;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

uint64_t __121__CSAudioInjectionServices_injectAudio_toDeviceWithUUID_withNumChannels_withUserIntentOptions_handlingDaemon_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __121__CSAudioInjectionServices_injectAudio_toDeviceWithUUID_withNumChannels_withUserIntentOptions_handlingDaemon_completion___block_invoke_2(uint64_t a1)
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
    v6 = "+[CSAudioInjectionServices injectAudio:toDeviceWithUUID:withNumChannels:withUserIntentOptions:handlingDaemon:co"
         "mpletion:]_block_invoke_2";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s CSAudioInjectionServices Interrupted", (uint8_t *)&v5, 0xCu);
  }
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 1502, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *, _QWORD, _QWORD))(v3 + 16))(v3, 0, v4, 0, 0);

}

void __121__CSAudioInjectionServices_injectAudio_toDeviceWithUUID_withNumChannels_withUserIntentOptions_handlingDaemon_completion___block_invoke_14(uint64_t a1)
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
    v6 = "+[CSAudioInjectionServices injectAudio:toDeviceWithUUID:withNumChannels:withUserIntentOptions:handlingDaemon:co"
         "mpletion:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s CSAudioInjectionServices Invalidated", (uint8_t *)&v5, 0xCu);
  }
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 1501, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *, _QWORD, _QWORD))(v3 + 16))(v3, 0, v4, 0, 0);

}

uint64_t __110__CSAudioInjectionServices_injectAudio_toDeviceWithUUID_withfadingTimeWindowLength_handlingDaemon_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __110__CSAudioInjectionServices_injectAudio_toDeviceWithUUID_withfadingTimeWindowLength_handlingDaemon_completion___block_invoke_2(uint64_t a1)
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
    v6 = "+[CSAudioInjectionServices injectAudio:toDeviceWithUUID:withfadingTimeWindowLength:handlingDaemon:completion:]_block_invoke_2";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s CSAudioInjectionServices Interrupted", (uint8_t *)&v5, 0xCu);
  }
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 1502, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *, _QWORD, _QWORD))(v3 + 16))(v3, 0, v4, 0, 0);

}

void __110__CSAudioInjectionServices_injectAudio_toDeviceWithUUID_withfadingTimeWindowLength_handlingDaemon_completion___block_invoke_13(uint64_t a1)
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
    v6 = "+[CSAudioInjectionServices injectAudio:toDeviceWithUUID:withfadingTimeWindowLength:handlingDaemon:completion:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s CSAudioInjectionServices Invalidated", (uint8_t *)&v5, 0xCu);
  }
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 1501, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *, _QWORD, _QWORD))(v3 + 16))(v3, 0, v4, 0, 0);

}

uint64_t __119__CSAudioInjectionServices_createAudioInjectionDeviceWithType_deviceName_deviceID_productID_handlingDaemon_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __119__CSAudioInjectionServices_createAudioInjectionDeviceWithType_deviceName_deviceID_productID_handlingDaemon_completion___block_invoke_2(uint64_t a1)
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
    v6 = "+[CSAudioInjectionServices createAudioInjectionDeviceWithType:deviceName:deviceID:productID:handlingDaemon:comp"
         "letion:]_block_invoke_2";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s CSAudioInjectionServices Interrupted", (uint8_t *)&v5, 0xCu);
  }
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 1502, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *, _QWORD))(v3 + 16))(v3, 0, v4, 0);

}

void __119__CSAudioInjectionServices_createAudioInjectionDeviceWithType_deviceName_deviceID_productID_handlingDaemon_completion___block_invoke_10(uint64_t a1)
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
    v6 = "+[CSAudioInjectionServices createAudioInjectionDeviceWithType:deviceName:deviceID:productID:handlingDaemon:comp"
         "letion:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s CSAudioInjectionServices Invalidated", (uint8_t *)&v5, 0xCu);
  }
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 1501, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *, _QWORD))(v3 + 16))(v3, 0, v4, 0);

}

void __119__CSAudioInjectionServices_createAudioInjectionDeviceWithType_deviceName_deviceID_productID_handlingDaemon_completion___block_invoke_11(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;

  v7 = a3;
  v8 = a4;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v7;
  v14 = v7;

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v8;
  v13 = v8;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __48__CSAudioInjectionServices_pingpong_completion___block_invoke(uint64_t a1)
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
    v5 = "+[CSAudioInjectionServices pingpong:completion:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s CSAudioInjectionServices Interrupted", (uint8_t *)&v4, 0xCu);
  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __48__CSAudioInjectionServices_pingpong_completion___block_invoke_3(uint64_t a1)
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
    v5 = "+[CSAudioInjectionServices pingpong:completion:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s CSAudioInjectionServices Invalidated", (uint8_t *)&v4, 0xCu);
  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __48__CSAudioInjectionServices_pingpong_completion___block_invoke_5(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
