@implementation AVAudioDeviceTest

- (AVAudioDeviceTest)initWithXPCEndPoint:(id)a3
{
  id v4;
  AVAudioDeviceTest *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  AVAudioDeviceTest *v51;
  NSObject *v53;
  objc_super v54;
  uint8_t buf[4];
  const char *v56;
  __int16 v57;
  int v58;
  __int16 v59;
  const __CFString *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v54.receiver = self;
  v54.super_class = (Class)AVAudioDeviceTest;
  v5 = -[AVAudioDeviceTest init](&v54, sel_init);
  if (!v5)
    goto LABEL_6;
  if (v4)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", v4);
    -[AVAudioDeviceTest setConnection:](v5, "setConnection:", v6);

LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE408398);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVAudioDeviceTest connection](v5, "connection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setRemoteObjectInterface:", v9);

    -[AVAudioDeviceTest connection](v5, "connection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "remoteObjectInterface");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setClasses:forSelector:argumentIndex:ofReply:", v16, sel_startWithSequence_completion_, 0, 1);

    -[AVAudioDeviceTest connection](v5, "connection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "remoteObjectInterface");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1E0C99E60];
    v20 = objc_opt_class();
    objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setClasses:forSelector:argumentIndex:ofReply:", v21, sel_startWithSequence_completion_, 0, 0);

    -[AVAudioDeviceTest connection](v5, "connection");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "remoteObjectInterface");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)MEMORY[0x1E0C99E60];
    v25 = objc_opt_class();
    objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setClasses:forSelector:argumentIndex:ofReply:", v26, sel_playback_filePath_completion_, 0, 0);

    -[AVAudioDeviceTest connection](v5, "connection");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "remoteObjectInterface");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setClasses:forSelector:argumentIndex:ofReply:", v29, sel_playback_filePath_completion_, 0, 1);

    -[AVAudioDeviceTest connection](v5, "connection");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "remoteObjectInterface");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_playbackTone_completion_, 0, 0);

    -[AVAudioDeviceTest connection](v5, "connection");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "remoteObjectInterface");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)MEMORY[0x1E0C99E60];
    v35 = objc_opt_class();
    v36 = objc_opt_class();
    objc_msgSend(v34, "setWithObjects:", v35, v36, objc_opt_class(), 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setClasses:forSelector:argumentIndex:ofReply:", v37, sel_playbackTone_completion_, 0, 1);

    -[AVAudioDeviceTest connection](v5, "connection");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "remoteObjectInterface");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setClasses:forSelector:argumentIndex:ofReply:", v40, sel_setupAudioSessionForHearingTest_, 0, 1);

    -[AVAudioDeviceTest connection](v5, "connection");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "remoteObjectInterface");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setClasses:forSelector:argumentIndex:ofReply:", v43, sel_stopAudioSession_, 0, 1);

    -[AVAudioDeviceTest connection](v5, "connection");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_41);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVAudioDeviceTest setServiceDelegateAsync:](v5, "setServiceDelegateAsync:", v45);

    -[AVAudioDeviceTest connection](v5, "connection");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_43);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVAudioDeviceTest setServiceDelegateSync:](v5, "setServiceDelegateSync:", v47);

    -[AVAudioDeviceTest connection](v5, "connection");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setInterruptionHandler:", &__block_literal_global_45);

    -[AVAudioDeviceTest connection](v5, "connection");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setInvalidationHandler:", &__block_literal_global_47);

    -[AVAudioDeviceTest connection](v5, "connection");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "resume");

LABEL_6:
    v51 = v5;
    goto LABEL_7;
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.avfaudio.devicetest.service"));
  -[AVAudioDeviceTest setConnection:](v5, "setConnection:", v7);

  -[AVAudioDeviceTest connection](v5, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = v8 == 0;

  if (!(_DWORD)v7)
    goto LABEL_5;
  if (AVAudioDeviceTestClientLog(void)::once != -1)
    dispatch_once(&AVAudioDeviceTestClientLog(void)::once, &__block_literal_global_1941);
  v53 = objc_retainAutorelease(*(id *)AVAudioDeviceTestClientLog(void)::category);
  if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v56 = "AVAudioDeviceTest.mm";
    v57 = 1024;
    v58 = 54;
    v59 = 2112;
    v60 = CFSTR("com.apple.avfaudio.devicetest.service");
    _os_log_impl(&dword_19B733000, v53, OS_LOG_TYPE_ERROR, "%25s:%-5d Error creating XPC connection to %@", buf, 0x1Cu);
  }
  v51 = 0;
LABEL_7:

  return v51;
}

- (AVAudioDeviceTest)init
{
  NSObject *v3;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (AVAudioDeviceTestClientLog(void)::once != -1)
    dispatch_once(&AVAudioDeviceTestClientLog(void)::once, &__block_literal_global_1941);
  v3 = objc_retainAutorelease(*(id *)AVAudioDeviceTestClientLog(void)::category);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "AVAudioDeviceTest.mm";
    v7 = 1024;
    v8 = 103;
    _os_log_impl(&dword_19B733000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Initializing AVAudioDeviceTest for out-of-process operation.", (uint8_t *)&v5, 0x12u);
  }
  return -[AVAudioDeviceTest initWithXPCEndPoint:](self, "initWithXPCEndPoint:", 0);
}

- (id)initInProcess:(BOOL)a3
{
  _BOOL4 v3;
  AVAudioDeviceTest *v4;
  NSObject *v5;
  AVAudioDeviceTestService *v6;
  NSObject *v7;
  AVAudioDeviceTest *v8;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)AVAudioDeviceTest;
  v4 = -[AVAudioDeviceTest init](&v10, sel_init);
  if (v4)
  {
    if (v3)
    {
      if (AVAudioDeviceTestClientLog(void)::once != -1)
        dispatch_once(&AVAudioDeviceTestClientLog(void)::once, &__block_literal_global_1941);
      v5 = objc_retainAutorelease(*(id *)AVAudioDeviceTestClientLog(void)::category);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v12 = "AVAudioDeviceTest.mm";
        v13 = 1024;
        v14 = 114;
        _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Initializing AVAudioDeviceTest for in-process operation.", buf, 0x12u);
      }
      v6 = objc_alloc_init(AVAudioDeviceTestService);
      -[AVAudioDeviceTest setService:](v4, "setService:", v6);

    }
    else
    {
      if (AVAudioDeviceTestClientLog(void)::once != -1)
        dispatch_once(&AVAudioDeviceTestClientLog(void)::once, &__block_literal_global_1941);
      v7 = objc_retainAutorelease(*(id *)AVAudioDeviceTestClientLog(void)::category);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v12 = "AVAudioDeviceTest.mm";
        v13 = 1024;
        v14 = 117;
        _os_log_impl(&dword_19B733000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Initializing AVAudioDeviceTest for out-of-process operation.", buf, 0x12u);
      }
      v4 = -[AVAudioDeviceTest initWithXPCEndPoint:](v4, "initWithXPCEndPoint:", 0);
    }
  }
  v8 = v4;

  return v8;
}

- (void)startWithSequence:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (AVAudioDeviceTestClientLog(void)::once != -1)
    dispatch_once(&AVAudioDeviceTestClientLog(void)::once, &__block_literal_global_1941);
  v8 = objc_retainAutorelease(*(id *)AVAudioDeviceTestClientLog(void)::category);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v28 = "AVAudioDeviceTest.mm";
    v29 = 1024;
    v30 = 127;
    _os_log_impl(&dword_19B733000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d starting sequence on client side", buf, 0x12u);
  }
  -[AVAudioDeviceTest service](self, "service");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9 == 0;

  if (v10)
  {
    objc_msgSend(v6, "stimulusURL");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v13, "fileSystemRepresentation");
    v14 = *MEMORY[0x1E0C80000];
    v15 = (void *)sandbox_extension_issue_file();

    if (AVAudioDeviceTestClientLog(void)::once != -1)
      dispatch_once(&AVAudioDeviceTestClientLog(void)::once, &__block_literal_global_1941);
    v16 = objc_retainAutorelease(*(id *)AVAudioDeviceTestClientLog(void)::category);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "stimulusURL");
      v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v18 = objc_msgSend(v17, "fileSystemRepresentation");
      *(_DWORD *)buf = 136315906;
      v28 = "AVAudioDeviceTest.mm";
      v29 = 1024;
      v30 = 139;
      v31 = 2080;
      v32 = v14;
      v33 = 2080;
      v34 = v18;
      _os_log_impl(&dword_19B733000, v16, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Issuing sandbox %s for path %s", buf, 0x26u);

    }
    if (v15)
    {
      -[AVAudioDeviceTest serviceDelegateSync](self, "serviceDelegateSync");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v15);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "passExtensionToken:", v20);

      free(v15);
    }
    else
    {
      if (AVAudioDeviceTestClientLog(void)::once != -1)
        dispatch_once(&AVAudioDeviceTestClientLog(void)::once, &__block_literal_global_1941);
      v21 = objc_retainAutorelease(*(id *)AVAudioDeviceTestClientLog(void)::category);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v28 = "AVAudioDeviceTest.mm";
        v29 = 1024;
        v30 = 146;
        _os_log_impl(&dword_19B733000, v21, OS_LOG_TYPE_ERROR, "%25s:%-5d failed to extend the service's sandbox", buf, 0x12u);
      }
    }
    if (-[AVAudioDeviceTest processSequenceAsynchronously](self, "processSequenceAsynchronously"))
      -[AVAudioDeviceTest serviceDelegateAsync](self, "serviceDelegateAsync");
    else
      -[AVAudioDeviceTest serviceDelegateSync](self, "serviceDelegateSync");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __50__AVAudioDeviceTest_startWithSequence_completion___block_invoke_50;
    v23[3] = &unk_1E3BEB7D8;
    v24 = v7;
    objc_msgSend(v12, "startWithSequence:completion:", v6, v23);
    if (AVAudioDeviceTestClientLog(void)::once != -1)
      dispatch_once(&AVAudioDeviceTestClientLog(void)::once, &__block_literal_global_1941);
    v22 = objc_retainAutorelease(*(id *)AVAudioDeviceTestClientLog(void)::category);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v28 = "AVAudioDeviceTest.mm";
      v29 = 1024;
      v30 = 157;
      _os_log_impl(&dword_19B733000, v22, OS_LOG_TYPE_DEFAULT, "%25s:%-5d finishing sequence on client side", buf, 0x12u);
    }

  }
  else
  {
    -[AVAudioDeviceTest service](self, "service");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __50__AVAudioDeviceTest_startWithSequence_completion___block_invoke;
    v25[3] = &unk_1E3BEB7D8;
    v26 = v7;
    objc_msgSend(v11, "startWithSequence:completion:", v6, v25);

    v12 = v26;
  }

}

- (void)playback:(id)a3 filePath:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  int v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (AVAudioDeviceTestClientLog(void)::once != -1)
    dispatch_once(&AVAudioDeviceTestClientLog(void)::once, &__block_literal_global_1941);
  v11 = objc_retainAutorelease(*(id *)AVAudioDeviceTestClientLog(void)::category);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 136315394;
    v22 = "AVAudioDeviceTest.mm";
    v23 = 1024;
    v24 = 163;
    _os_log_impl(&dword_19B733000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d playback on client side", (uint8_t *)&v21, 0x12u);
  }
  -[AVAudioDeviceTest service](self, "service");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12 == 0;

  if (v13)
  {
    v15 = (void *)sandbox_extension_issue_generic();
    if (AVAudioDeviceTestClientLog(void)::once != -1)
      dispatch_once(&AVAudioDeviceTestClientLog(void)::once, &__block_literal_global_1941);
    v16 = objc_retainAutorelease(*(id *)AVAudioDeviceTestClientLog(void)::category);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *MEMORY[0x1E0C80000];
      v21 = 136315906;
      v22 = "AVAudioDeviceTest.mm";
      v23 = 1024;
      v24 = 170;
      v25 = 2080;
      v26 = v17;
      v27 = 2112;
      v28 = v9;
      _os_log_impl(&dword_19B733000, v16, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Issuing sandbox %s for path %@", (uint8_t *)&v21, 0x26u);
    }
    if (v15)
    {
      -[AVAudioDeviceTest serviceDelegateSync](self, "serviceDelegateSync");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "passExtensionToken:", v19);

      free(v15);
    }
    else
    {
      if (AVAudioDeviceTestClientLog(void)::once != -1)
        dispatch_once(&AVAudioDeviceTestClientLog(void)::once, &__block_literal_global_1941);
      v20 = objc_retainAutorelease(*(id *)AVAudioDeviceTestClientLog(void)::category);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = 136315394;
        v22 = "AVAudioDeviceTest.mm";
        v23 = 1024;
        v24 = 177;
        _os_log_impl(&dword_19B733000, v20, OS_LOG_TYPE_ERROR, "%25s:%-5d failed to extend the service's sandbox", (uint8_t *)&v21, 0x12u);
      }
    }
    if (-[AVAudioDeviceTest processSequenceAsynchronously](self, "processSequenceAsynchronously"))
      -[AVAudioDeviceTest serviceDelegateAsync](self, "serviceDelegateAsync");
    else
      -[AVAudioDeviceTest serviceDelegateSync](self, "serviceDelegateSync");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "playback:filePath:completion:", v8, v9, v10);
  }
  else
  {
    -[AVAudioDeviceTest service](self, "service");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "playback:filePath:completion:", v8, v9, v10);
  }

}

- (void)playbackTone:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  BOOL v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (AVAudioDeviceTestClientLog(void)::once != -1)
    dispatch_once(&AVAudioDeviceTestClientLog(void)::once, &__block_literal_global_1941);
  v8 = objc_retainAutorelease(*(id *)AVAudioDeviceTestClientLog(void)::category);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315394;
    v13 = "AVAudioDeviceTest.mm";
    v14 = 1024;
    v15 = 187;
    _os_log_impl(&dword_19B733000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d playback tone on client side", (uint8_t *)&v12, 0x12u);
  }
  -[AVAudioDeviceTest service](self, "service");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9 == 0;

  if (v10)
  {
    if (-[AVAudioDeviceTest processSequenceAsynchronously](self, "processSequenceAsynchronously"))
      -[AVAudioDeviceTest serviceDelegateAsync](self, "serviceDelegateAsync");
    else
      -[AVAudioDeviceTest serviceDelegateSync](self, "serviceDelegateSync");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "playbackTone:completion:", v6, v7);
  }
  else
  {
    -[AVAudioDeviceTest service](self, "service");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "playbackTone:completion:", v6, v7);
  }

}

- (void)stopPlayback
{
  NSObject *v3;
  void *v4;
  BOOL v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (AVAudioDeviceTestClientLog(void)::once != -1)
    dispatch_once(&AVAudioDeviceTestClientLog(void)::once, &__block_literal_global_1941);
  v3 = objc_retainAutorelease(*(id *)AVAudioDeviceTestClientLog(void)::category);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "AVAudioDeviceTest.mm";
    v9 = 1024;
    v10 = 199;
    _os_log_impl(&dword_19B733000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d stopping playback tone on client side", (uint8_t *)&v7, 0x12u);
  }
  -[AVAudioDeviceTest service](self, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == 0;

  if (v5)
  {
    if (-[AVAudioDeviceTest processSequenceAsynchronously](self, "processSequenceAsynchronously"))
      -[AVAudioDeviceTest serviceDelegateAsync](self, "serviceDelegateAsync");
    else
      -[AVAudioDeviceTest serviceDelegateSync](self, "serviceDelegateSync");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stopPlayback");
  }
  else
  {
    -[AVAudioDeviceTest service](self, "service");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stopPlayback");
  }

}

- (void)startRecording:(id)a3 filePath:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  BOOL v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  int v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (AVAudioDeviceTestClientLog(void)::once != -1)
    dispatch_once(&AVAudioDeviceTestClientLog(void)::once, &__block_literal_global_1941);
  v11 = objc_retainAutorelease(*(id *)AVAudioDeviceTestClientLog(void)::category);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 136315650;
    v23 = "AVAudioDeviceTest.mm";
    v24 = 1024;
    v25 = 211;
    v26 = 2112;
    v27 = v9;
    _os_log_impl(&dword_19B733000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d starting recording on client side %@", (uint8_t *)&v22, 0x1Cu);
  }
  -[AVAudioDeviceTest service](self, "service");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12 == 0;

  if (v13)
  {
    v15 = objc_retainAutorelease(v9);
    objc_msgSend(v15, "fileSystemRepresentation");
    v16 = (void *)*MEMORY[0x1E0C80008];
    v17 = (void *)sandbox_extension_issue_file();
    if (AVAudioDeviceTestClientLog(void)::once != -1)
      dispatch_once(&AVAudioDeviceTestClientLog(void)::once, &__block_literal_global_1941);
    v18 = objc_retainAutorelease(*(id *)AVAudioDeviceTestClientLog(void)::category);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 136315906;
      v23 = "AVAudioDeviceTest.mm";
      v24 = 1024;
      v25 = 218;
      v26 = 2080;
      v27 = v16;
      v28 = 2112;
      v29 = v15;
      _os_log_impl(&dword_19B733000, v18, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Issuing sandbox %s for path %@", (uint8_t *)&v22, 0x26u);
    }
    if (v17)
    {
      -[AVAudioDeviceTest serviceDelegateSync](self, "serviceDelegateSync");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "passExtensionToken:", v20);

      free(v17);
    }
    else
    {
      if (AVAudioDeviceTestClientLog(void)::once != -1)
        dispatch_once(&AVAudioDeviceTestClientLog(void)::once, &__block_literal_global_1941);
      v21 = objc_retainAutorelease(*(id *)AVAudioDeviceTestClientLog(void)::category);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = 136315394;
        v23 = "AVAudioDeviceTest.mm";
        v24 = 1024;
        v25 = 225;
        _os_log_impl(&dword_19B733000, v21, OS_LOG_TYPE_ERROR, "%25s:%-5d failed to extend the service's sandbox", (uint8_t *)&v22, 0x12u);
      }
    }
    if (-[AVAudioDeviceTest processSequenceAsynchronously](self, "processSequenceAsynchronously"))
      -[AVAudioDeviceTest serviceDelegateAsync](self, "serviceDelegateAsync");
    else
      -[AVAudioDeviceTest serviceDelegateSync](self, "serviceDelegateSync");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "startRecording:filePath:completion:", v8, v15, v10);
  }
  else
  {
    -[AVAudioDeviceTest service](self, "service");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "startRecording:filePath:completion:", v8, v9, v10);
  }

}

- (void)stopRecording:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  BOOL v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (AVAudioDeviceTestClientLog(void)::once != -1)
    dispatch_once(&AVAudioDeviceTestClientLog(void)::once, &__block_literal_global_1941);
  v5 = objc_retainAutorelease(*(id *)AVAudioDeviceTestClientLog(void)::category);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "AVAudioDeviceTest.mm";
    v11 = 1024;
    v12 = 235;
    _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d stopping recording on client side", (uint8_t *)&v9, 0x12u);
  }
  -[AVAudioDeviceTest service](self, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 == 0;

  if (v7)
  {
    if (-[AVAudioDeviceTest processSequenceAsynchronously](self, "processSequenceAsynchronously"))
      -[AVAudioDeviceTest serviceDelegateAsync](self, "serviceDelegateAsync");
    else
      -[AVAudioDeviceTest serviceDelegateSync](self, "serviceDelegateSync");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stopRecording:", v4);
  }
  else
  {
    -[AVAudioDeviceTest service](self, "service");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stopRecording:", v4);
  }

}

- (void)setupAudioSessionForHearingTest:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (AVAudioDeviceTestClientLog(void)::once != -1)
    dispatch_once(&AVAudioDeviceTestClientLog(void)::once, &__block_literal_global_1941);
  v5 = objc_retainAutorelease(*(id *)AVAudioDeviceTestClientLog(void)::category);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    -[AVAudioDeviceTest connection](self, "connection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315650;
    v11 = "AVAudioDeviceTest.mm";
    v12 = 1024;
    v13 = 247;
    v14 = 1024;
    v15 = objc_msgSend(v6, "processIdentifier");
    _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_INFO, "%25s:%-5d Setting up hearing test audio session. { pid=%d }", (uint8_t *)&v10, 0x18u);

  }
  -[AVAudioDeviceTest service](self, "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v8)
  {
    if (-[AVAudioDeviceTest processSequenceAsynchronously](self, "processSequenceAsynchronously"))
      -[AVAudioDeviceTest serviceDelegateAsync](self, "serviceDelegateAsync");
    else
      -[AVAudioDeviceTest serviceDelegateSync](self, "serviceDelegateSync");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setupAudioSessionForHearingTest:", v4);
  }
  else
  {
    -[AVAudioDeviceTest service](self, "service");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setupAudioSessionForHearingTest:", v4);
  }

}

- (void)setupAudioSessionForHearingTestWithStatus:(id)a3 success:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (AVAudioDeviceTestClientLog(void)::once != -1)
    dispatch_once(&AVAudioDeviceTestClientLog(void)::once, &__block_literal_global_1941);
  v8 = objc_retainAutorelease(*(id *)AVAudioDeviceTestClientLog(void)::category);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    -[AVAudioDeviceTest connection](self, "connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136315650;
    v14 = "AVAudioDeviceTest.mm";
    v15 = 1024;
    v16 = 260;
    v17 = 1024;
    v18 = objc_msgSend(v9, "processIdentifier");
    _os_log_impl(&dword_19B733000, v8, OS_LOG_TYPE_INFO, "%25s:%-5d Setting up hearing test audio session. { pid=%d }", (uint8_t *)&v13, 0x18u);

  }
  -[AVAudioDeviceTest service](self, "service");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10 == 0;

  if (v11)
  {
    if (-[AVAudioDeviceTest processSequenceAsynchronously](self, "processSequenceAsynchronously"))
      -[AVAudioDeviceTest serviceDelegateAsync](self, "serviceDelegateAsync");
    else
      -[AVAudioDeviceTest serviceDelegateSync](self, "serviceDelegateSync");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setupAudioSessionForHearingTestWithStatus:success:", v6, v7);
  }
  else
  {
    -[AVAudioDeviceTest service](self, "service");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setupAudioSessionForHearingTestWithStatus:success:", v6, v7);
  }

}

- (void)stopAudioSession:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (AVAudioDeviceTestClientLog(void)::once != -1)
    dispatch_once(&AVAudioDeviceTestClientLog(void)::once, &__block_literal_global_1941);
  v5 = objc_retainAutorelease(*(id *)AVAudioDeviceTestClientLog(void)::category);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    -[AVAudioDeviceTest connection](self, "connection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315650;
    v11 = "AVAudioDeviceTest.mm";
    v12 = 1024;
    v13 = 272;
    v14 = 1024;
    v15 = objc_msgSend(v6, "processIdentifier");
    _os_log_impl(&dword_19B733000, v5, OS_LOG_TYPE_INFO, "%25s:%-5d Stopping audio session. { pid=%d }", (uint8_t *)&v10, 0x18u);

  }
  -[AVAudioDeviceTest service](self, "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v8)
  {
    if (-[AVAudioDeviceTest processSequenceAsynchronously](self, "processSequenceAsynchronously"))
      -[AVAudioDeviceTest serviceDelegateAsync](self, "serviceDelegateAsync");
    else
      -[AVAudioDeviceTest serviceDelegateSync](self, "serviceDelegateSync");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stopAudioSession:", v4);
  }
  else
  {
    -[AVAudioDeviceTest service](self, "service");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stopAudioSession:", v4);
  }

}

- (void)cancel
{
  void *v3;
  id v4;

  -[AVAudioDeviceTest service](self, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[AVAudioDeviceTest serviceDelegateAsync](self, "serviceDelegateAsync");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancel");

  }
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[AVAudioDeviceTest service](self, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[AVAudioDeviceTest connection](self, "connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

  }
  v5.receiver = self;
  v5.super_class = (Class)AVAudioDeviceTest;
  -[AVAudioDeviceTest dealloc](&v5, sel_dealloc);
}

- (BOOL)processSequenceAsynchronously
{
  return self->_processSequenceAsynchronously;
}

- (void)setProcessSequenceAsynchronously:(BOOL)a3
{
  self->_processSequenceAsynchronously = a3;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (AVAudioDeviceTestServiceProtocol)serviceDelegateAsync
{
  return self->_serviceDelegateAsync;
}

- (void)setServiceDelegateAsync:(id)a3
{
  objc_storeStrong((id *)&self->_serviceDelegateAsync, a3);
}

- (AVAudioDeviceTestServiceProtocol)serviceDelegateSync
{
  return self->_serviceDelegateSync;
}

- (void)setServiceDelegateSync:(id)a3
{
  objc_storeStrong((id *)&self->_serviceDelegateSync, a3);
}

- (AVAudioDeviceTestService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_serviceDelegateSync, 0);
  objc_storeStrong((id *)&self->_serviceDelegateAsync, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __50__AVAudioDeviceTest_startWithSequence_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v15 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v33, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v18;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v7);
        if (AVAudioDeviceTestClientLog(void)::once != -1)
          dispatch_once(&AVAudioDeviceTestClientLog(void)::once, &__block_literal_global_1941);
        v9 = objc_retainAutorelease(*(id *)AVAudioDeviceTestClientLog(void)::category);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v8, "data");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v8, "outputID");
          v12 = objc_msgSend(v8, "inputID");
          objc_msgSend(v8, "sampleRate");
          *(_DWORD *)buf = 136316418;
          v22 = "AVAudioDeviceTest.mm";
          v23 = 1024;
          v24 = 132;
          v25 = 2112;
          v26 = v10;
          v27 = 2048;
          v28 = v11;
          v29 = 2048;
          v30 = v12;
          v31 = 2048;
          v32 = v13;
          _os_log_impl(&dword_19B733000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d result data %@ output %li input %li sample rate %f", buf, 0x3Au);

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v33, 16);
    }
    while (v5);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __50__AVAudioDeviceTest_startWithSequence_completion___block_invoke_50(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v15 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v33, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v18;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v7);
        if (AVAudioDeviceTestClientLog(void)::once != -1)
          dispatch_once(&AVAudioDeviceTestClientLog(void)::once, &__block_literal_global_1941);
        v9 = objc_retainAutorelease(*(id *)AVAudioDeviceTestClientLog(void)::category);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v8, "data");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v8, "outputID");
          v12 = objc_msgSend(v8, "inputID");
          objc_msgSend(v8, "sampleRate");
          *(_DWORD *)buf = 136316418;
          v22 = "AVAudioDeviceTest.mm";
          v23 = 1024;
          v24 = 153;
          v25 = 2112;
          v26 = v10;
          v27 = 2048;
          v28 = v11;
          v29 = 2048;
          v30 = v12;
          v31 = 2048;
          v32 = v13;
          _os_log_impl(&dword_19B733000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d result data %@ output %li input %li sample rate %f", buf, 0x3Au);

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v33, 16);
    }
    while (v5);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __41__AVAudioDeviceTest_initWithXPCEndPoint___block_invoke_46()
{
  NSObject *v0;
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (AVAudioDeviceTestClientLog(void)::once != -1)
    dispatch_once(&AVAudioDeviceTestClientLog(void)::once, &__block_literal_global_1941);
  v0 = objc_retainAutorelease(*(id *)AVAudioDeviceTestClientLog(void)::category);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    v1 = 136315394;
    v2 = "AVAudioDeviceTest.mm";
    v3 = 1024;
    v4 = 92;
    _os_log_impl(&dword_19B733000, v0, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalidation Handler: client exited", (uint8_t *)&v1, 0x12u);
  }
}

void __41__AVAudioDeviceTest_initWithXPCEndPoint___block_invoke_44()
{
  NSObject *v0;
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (AVAudioDeviceTestClientLog(void)::once != -1)
    dispatch_once(&AVAudioDeviceTestClientLog(void)::once, &__block_literal_global_1941);
  v0 = objc_retainAutorelease(*(id *)AVAudioDeviceTestClientLog(void)::category);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    v1 = 136315394;
    v2 = "AVAudioDeviceTest.mm";
    v3 = 1024;
    v4 = 89;
    _os_log_impl(&dword_19B733000, v0, OS_LOG_TYPE_ERROR, "%25s:%-5d Interruption Handler: connection got interrupted", (uint8_t *)&v1, 0x12u);
  }
}

void __41__AVAudioDeviceTest_initWithXPCEndPoint___block_invoke_42(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (AVAudioDeviceTestClientLog(void)::once != -1)
    dispatch_once(&AVAudioDeviceTestClientLog(void)::once, &__block_literal_global_1941);
  v3 = objc_retainAutorelease(*(id *)AVAudioDeviceTestClientLog(void)::category);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v2, "localizedDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 136315650;
    v6 = "AVAudioDeviceTest.mm";
    v7 = 1024;
    v8 = 84;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_19B733000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d %@", (uint8_t *)&v5, 0x1Cu);

  }
}

void __41__AVAudioDeviceTest_initWithXPCEndPoint___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (AVAudioDeviceTestClientLog(void)::once != -1)
    dispatch_once(&AVAudioDeviceTestClientLog(void)::once, &__block_literal_global_1941);
  v3 = objc_retainAutorelease(*(id *)AVAudioDeviceTestClientLog(void)::category);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v2, "localizedDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 136315650;
    v6 = "AVAudioDeviceTest.mm";
    v7 = 1024;
    v8 = 79;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_19B733000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d %@", (uint8_t *)&v5, 0x1Cu);

  }
}

@end
