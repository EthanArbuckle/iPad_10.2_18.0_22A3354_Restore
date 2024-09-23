@implementation AFMyriadEmergencyCallPunchout

- (AFMyriadEmergencyCallPunchout)init
{
  AFMyriadEmergencyCallPunchout *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *myriadEmergencyCallingQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AFMyriadEmergencyCallPunchout;
  v2 = -[AFMyriadEmergencyCallPunchout init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.myriad_emergncy_call", 0);
    myriadEmergencyCallingQueue = v2->_myriadEmergencyCallingQueue;
    v2->_myriadEmergencyCallingQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)initiateEmergencyCallMyriad
{
  dispatch_async((dispatch_queue_t)self->_myriadEmergencyCallingQueue, &__block_literal_global_41291);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_myriadEmergencyCallingQueue, 0);
}

void __60__AFMyriadEmergencyCallPunchout_initiateEmergencyCallMyriad__block_invoke()
{
  NSObject *v0;
  id v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v0 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[AFMyriadEmergencyCallPunchout initiateEmergencyCallMyriad]_block_invoke";
    _os_log_impl(&dword_19AF50000, v0, OS_LOG_TYPE_INFO, "%s Punching out to Phone app to make emergency call", buf, 0xCu);
  }
  v1 = objc_alloc_init((Class)getTUCallProviderManagerClass());
  v2 = objc_alloc((Class)getTUDialRequestClass());
  objc_msgSend(v1, "emergencyProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithProvider:", v3);

  objc_msgSend(v4, "setPerformDialAssist:", 0);
  objc_msgSend(v4, "setDialType:", 1);
  getTUCallSourceIdentifierSpeakerRoute();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAudioSourceIdentifier:", v5);

  v6 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[AFMyriadEmergencyCallPunchout initiateEmergencyCallMyriad]_block_invoke";
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_19AF50000, v6, OS_LOG_TYPE_INFO, "%s Emergency beacon handling created dial request %@", buf, 0x16u);
  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__AFMyriadEmergencyCallPunchout_initiateEmergencyCallMyriad__block_invoke_5;
  v8[3] = &unk_1E3A36A00;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v1, "launchAppForDialRequest:completion:", v7, v8);

}

void __60__AFMyriadEmergencyCallPunchout_initiateEmergencyCallMyriad__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315394;
      v7 = "-[AFMyriadEmergencyCallPunchout initiateEmergencyCallMyriad]_block_invoke";
      v8 = 2112;
      v9 = v3;
      _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s Emergency beacon initiated call failed, error: %@", (uint8_t *)&v6, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v5 = *(void **)(a1 + 32);
    v6 = 136315394;
    v7 = "-[AFMyriadEmergencyCallPunchout initiateEmergencyCallMyriad]_block_invoke";
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s Emergency beacon initiated call created: %@", (uint8_t *)&v6, 0x16u);
  }

}

@end
