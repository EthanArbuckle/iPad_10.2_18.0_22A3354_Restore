@implementation NTKDArgonServiceXPCWrapper

- (void)queryForNewFaces:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[NTKDArgonService sharedService](NTKDArgonService, "sharedService");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queryForNewFaces:", v3);

}

+ (id)sharedXPCWrapper
{
  if (sharedXPCWrapper_onceToken != -1)
    dispatch_once(&sharedXPCWrapper_onceToken, &__block_literal_global_11);
  return (id)sharedXPCWrapper_wrapper;
}

void __46__NTKDArgonServiceXPCWrapper_sharedXPCWrapper__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedXPCWrapper_wrapper;
  sharedXPCWrapper_wrapper = v0;

}

- (void)ingestKeyDescriptor:(id)a3 withMethod:(unint64_t)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  if (a5)
  {
    v7 = a5;
    v8 = a3;
    +[NTKFaceSupportUnlockAttemptEventRecorder sharedRecorder](NTKFaceSupportUnlockAttemptEventRecorder, "sharedRecorder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fileName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __72__NTKDArgonServiceXPCWrapper_ingestKeyDescriptor_withMethod_completion___block_invoke;
    v13[3] = &unk_1E6BCE728;
    v14 = v10;
    v11 = v10;
    objc_msgSend(v9, "beginRecordingForIdentifier:method:completion:", v11, a4, v13);
    +[NTKDArgonService sharedService](NTKDArgonService, "sharedService");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ingestKeyDescriptor:withMethod:completion:", v8, a4, v7);

  }
}

void __72__NTKDArgonServiceXPCWrapper_ingestKeyDescriptor_withMethod_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __72__NTKDArgonServiceXPCWrapper_ingestKeyDescriptor_withMethod_completion___block_invoke_cold_1();

  }
}

- (void)requestResetOnNextLaunch:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[NTKDArgonService sharedService](NTKDArgonService, "sharedService");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestResetOnNextLaunch:", v3);

}

- (void)knownKeyDescriptors:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[NTKDArgonService sharedService](NTKDArgonService, "sharedService");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "knownKeyDescriptors:", v3);

}

- (void)displayUserNotificationForKeyDescriptor:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[NTKDArgonService sharedService](NTKDArgonService, "sharedService");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayUserNotificationForKeyDescriptor:completion:", v6, v5);

}

- (void)requestCurrentEnvironment:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[NTKDArgonService sharedService](NTKDArgonService, "sharedService");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestCurrentEnvironment:", v3);

}

- (void)setCurrentEnvironment:(int64_t)a3 completion:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  +[NTKDArgonService sharedService](NTKDArgonService, "sharedService");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCurrentEnvironment:completion:", a3, v5);

}

void __72__NTKDArgonServiceXPCWrapper_ingestKeyDescriptor_withMethod_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_0(&dword_1B72A3000, v0, v1, "Couldn't ingest key from JSON %@ - %@");
  OUTLINED_FUNCTION_1();
}

@end
