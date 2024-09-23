@implementation MRMediaRemoteServiceSetResumeHandler

void __MRMediaRemoteServiceSetResumeHandler_block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint8_t v18[16];
  uint8_t v19[16];
  uint8_t v20[16];
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained[3])
    {
      _MRLogForCategory(0);
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_193827000, v4, OS_LOG_TYPE_DEFAULT, "Re-establishing recording endpoint.", buf, 2u);
      }

      MRMediaRemoteServiceSetVoiceRecordingEndpoint(*(_QWORD **)(a1 + 56), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
    }
    if (v3[4])
    {
      _MRLogForCategory(0);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_193827000, v5, OS_LOG_TYPE_DEFAULT, "Re-establishing television endpoint.", v20, 2u);
      }

      v6 = *(_QWORD **)(a1 + 56);
      v7 = *(_QWORD **)(a1 + 32);
      v8 = v7[4];
      objc_msgSend(v7, "televisionQueue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      MRMediaRemoteServiceSetTelevisionEndpoint(v6, v8, v9);

    }
    if (v3[5])
    {
      _MRLogForCategory(0);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v19 = 0;
        _os_log_impl(&dword_193827000, v10, OS_LOG_TYPE_DEFAULT, "Re-establishing agent endpoint.", v19, 2u);
      }

      v11 = *(_QWORD **)(a1 + 56);
      v12 = *(_QWORD **)(a1 + 32);
      v13 = v12[5];
      objc_msgSend(v12, "agentQueue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      MRMediaRemoteServiceSetAgentEndpoint(v11, v13, (uint64_t)v14);

    }
    objc_msgSend(v3, "uiServiceEndpoint");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      _MRLogForCategory(0);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_193827000, v16, OS_LOG_TYPE_DEFAULT, "Re-establishing UI service endpoint.", v18, 2u);
      }

      objc_msgSend(v3, "uiServiceEndpoint");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setUIServiceRelayEndpoint:", v17);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

@end
