@implementation AFSiriActivationHandlerCoreSpeechDaemon

- (BOOL)handleContext:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  id CSActivationEventClass;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  int v26;
  NSObject *v27;
  const char *v28;
  NSObject *v29;
  const char *v30;
  NSObject *v31;
  const char *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  int v37;
  int v38;
  uint64_t v39;
  double v40;
  void *v41;
  NSObject *v42;
  _QWORD v44[4];
  id v45;
  id v46;
  _QWORD v47[4];
  id v48;
  id v49;
  _QWORD v50[4];
  id v51;
  id v52;
  _QWORD v53[4];
  id v54;
  id v55;
  uint8_t buf[4];
  const char *v57;
  __int16 v58;
  id v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v57 = "-[AFSiriActivationHandlerCoreSpeechDaemon handleContext:completion:]";
    v58 = 2112;
    v59 = v5;
    _os_log_impl(&dword_19AF50000, v7, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
  }
  v8 = objc_msgSend(v5, "source");
  v9 = objc_msgSend(v5, "event");
  v10 = v9;
  if (v8 == 5)
  {
    objc_msgSend(v5, "deviceID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      if ((v10 & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        objc_msgSend(getCSActivationEventNotifierClass(), "sharedNotifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        CSActivationEventClass = getCSActivationEventClass();
        objc_msgSend(v5, "userInfo");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(CSActivationEventClass, "jarvisVoiceTriggerEvent:activationInfo:hostTime:", v16, v19, objc_msgSend(v5, "timestamp"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v44[0] = MEMORY[0x1E0C809B0];
        v44[1] = 3221225472;
        v44[2] = __68__AFSiriActivationHandlerCoreSpeechDaemon_handleContext_completion___block_invoke_7;
        v44[3] = &unk_1E3A31EA8;
        v45 = v5;
        v46 = v6;
        objc_msgSend(v17, "notifyActivationEvent:completion:", v20, v44);

        v15 = 1;
LABEL_24:

        goto LABEL_35;
      }
      v29 = AFSiriLogContextDaemon;
      if (!os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
LABEL_23:
        v15 = 0;
        goto LABEL_24;
      }
      *(_DWORD *)buf = 136315394;
      v57 = "-[AFSiriActivationHandlerCoreSpeechDaemon handleContext:completion:]";
      v58 = 2112;
      v59 = v5;
      v30 = "%s Unexpected event in context %@.";
    }
    else
    {
      v29 = AFSiriLogContextDaemon;
      if (!os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        goto LABEL_23;
      *(_DWORD *)buf = 136315394;
      v57 = "-[AFSiriActivationHandlerCoreSpeechDaemon handleContext:completion:]";
      v58 = 2112;
      v59 = v5;
      v30 = "%s No device ID is provided in context %@.";
    }
    _os_log_error_impl(&dword_19AF50000, v29, OS_LOG_TYPE_ERROR, v30, buf, 0x16u);
    goto LABEL_23;
  }
  if (v8 == 4)
  {
    objc_msgSend(v5, "deviceID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      if ((v10 & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        objc_msgSend(getCSActivationEventNotifierClass(), "sharedNotifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = getCSActivationEventClass();
        objc_msgSend(v5, "userInfo");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "remoteMicVoiceTriggerEvent:activationInfo:hostTime:", v21, v24, objc_msgSend(v5, "timestamp"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v50[0] = MEMORY[0x1E0C809B0];
        v50[1] = 3221225472;
        v50[2] = __68__AFSiriActivationHandlerCoreSpeechDaemon_handleContext_completion___block_invoke_3;
        v50[3] = &unk_1E3A31EA8;
        v51 = v5;
        v52 = v6;
        objc_msgSend(v22, "notifyActivationEvent:completion:", v25, v50);

        v26 = 1;
LABEL_34:

        v15 = v26 != 0;
        goto LABEL_35;
      }
      if (v10 == 6)
      {
        objc_msgSend(v5, "userInfo");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "objectForKey:", CFSTR("score"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (v34)
        {
          objc_msgSend(getCSActivationEventNotifierClass(), "sharedNotifier");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = getCSActivationEventClass();
          objc_msgSend(v34, "floatValue");
          v38 = v37;
          v39 = objc_msgSend(v5, "timestamp");
          LODWORD(v40) = v38;
          objc_msgSend(v36, "remoteMicVADEvent:vadScore:hostTime:", v21, v39, v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v47[0] = MEMORY[0x1E0C809B0];
          v47[1] = 3221225472;
          v47[2] = __68__AFSiriActivationHandlerCoreSpeechDaemon_handleContext_completion___block_invoke_2;
          v47[3] = &unk_1E3A31EA8;
          v48 = v5;
          v49 = v6;
          objc_msgSend(v35, "notifyActivationEvent:completion:", v41, v47);

          v26 = 1;
        }
        else
        {
          v42 = AFSiriLogContextDaemon;
          if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v57 = "-[AFSiriActivationHandlerCoreSpeechDaemon handleContext:completion:]";
            v58 = 2112;
            v59 = v5;
            _os_log_error_impl(&dword_19AF50000, v42, OS_LOG_TYPE_ERROR, "%s No score is provided in context %@.", buf, 0x16u);
          }
          v26 = 0;
        }

        goto LABEL_34;
      }
      v31 = AFSiriLogContextDaemon;
      if (!os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
LABEL_29:
        v26 = 0;
        goto LABEL_34;
      }
      *(_DWORD *)buf = 136315394;
      v57 = "-[AFSiriActivationHandlerCoreSpeechDaemon handleContext:completion:]";
      v58 = 2112;
      v59 = v5;
      v32 = "%s Unexpected event in context %@.";
    }
    else
    {
      v31 = AFSiriLogContextDaemon;
      if (!os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        goto LABEL_29;
      *(_DWORD *)buf = 136315394;
      v57 = "-[AFSiriActivationHandlerCoreSpeechDaemon handleContext:completion:]";
      v58 = 2112;
      v59 = v5;
      v32 = "%s No device ID is provided in context %@.";
    }
    _os_log_error_impl(&dword_19AF50000, v31, OS_LOG_TYPE_ERROR, v32, buf, 0x16u);
    goto LABEL_29;
  }
  if (v8 != 1)
  {
    v27 = AFSiriLogContextDaemon;
    if (!os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
LABEL_17:
      v15 = 0;
      goto LABEL_35;
    }
    *(_DWORD *)buf = 136315394;
    v57 = "-[AFSiriActivationHandlerCoreSpeechDaemon handleContext:completion:]";
    v58 = 2112;
    v59 = v5;
    v28 = "%s Unexpected source in context %@.";
LABEL_37:
    _os_log_error_impl(&dword_19AF50000, v27, OS_LOG_TYPE_ERROR, v28, buf, 0x16u);
    goto LABEL_17;
  }
  if ((v9 & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    v27 = AFSiriLogContextDaemon;
    if (!os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_DWORD *)buf = 136315394;
    v57 = "-[AFSiriActivationHandlerCoreSpeechDaemon handleContext:completion:]";
    v58 = 2112;
    v59 = v5;
    v28 = "%s Unexpected event in context %@.";
    goto LABEL_37;
  }
  objc_msgSend(getCSActivationEventNotifierClass(), "sharedNotifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = getCSActivationEventClass();
  objc_msgSend(v5, "userInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "builtInMicVoiceTriggerEvent:hostTime:", v13, objc_msgSend(v5, "timestamp"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __68__AFSiriActivationHandlerCoreSpeechDaemon_handleContext_completion___block_invoke;
  v53[3] = &unk_1E3A31EA8;
  v54 = v5;
  v55 = v6;
  objc_msgSend(v11, "notifyActivationEvent:completion:", v14, v53);

  v15 = 1;
LABEL_35:

  return v15;
}

void __68__AFSiriActivationHandlerCoreSpeechDaemon_handleContext_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = AFSiriLogContextDaemon;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      v12 = "-[AFSiriActivationHandlerCoreSpeechDaemon handleContext:completion:]_block_invoke";
      v13 = 2112;
      v14 = v4;
      v15 = 2112;
      v16 = v8;
      _os_log_error_impl(&dword_19AF50000, v5, OS_LOG_TYPE_ERROR, "%s CSActivationEventNotifier returned error %@ for activation context %@.", buf, 0x20u);
    }
  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __68__AFSiriActivationHandlerCoreSpeechDaemon_handleContext_completion___block_invoke_1;
    v9[3] = &unk_1E3A32DB0;
    v10 = v4;
    v7 = +[AFSiriActivationResult newWithBuilder:](AFSiriActivationResult, "newWithBuilder:", v9);
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);

  }
}

void __68__AFSiriActivationHandlerCoreSpeechDaemon_handleContext_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = AFSiriLogContextDaemon;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      v12 = "-[AFSiriActivationHandlerCoreSpeechDaemon handleContext:completion:]_block_invoke";
      v13 = 2112;
      v14 = v4;
      v15 = 2112;
      v16 = v8;
      _os_log_error_impl(&dword_19AF50000, v5, OS_LOG_TYPE_ERROR, "%s CSActivationEventNotifier returned error %@ for activation context %@.", buf, 0x20u);
    }
  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __68__AFSiriActivationHandlerCoreSpeechDaemon_handleContext_completion___block_invoke_4;
    v9[3] = &unk_1E3A32DB0;
    v10 = v4;
    v7 = +[AFSiriActivationResult newWithBuilder:](AFSiriActivationResult, "newWithBuilder:", v9);
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);

  }
}

void __68__AFSiriActivationHandlerCoreSpeechDaemon_handleContext_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = AFSiriLogContextDaemon;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      v12 = "-[AFSiriActivationHandlerCoreSpeechDaemon handleContext:completion:]_block_invoke_2";
      v13 = 2112;
      v14 = v4;
      v15 = 2112;
      v16 = v8;
      _os_log_error_impl(&dword_19AF50000, v5, OS_LOG_TYPE_ERROR, "%s CSActivationEventNotifier returned error %@ for activation context %@.", buf, 0x20u);
    }
  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __68__AFSiriActivationHandlerCoreSpeechDaemon_handleContext_completion___block_invoke_6;
    v9[3] = &unk_1E3A32DB0;
    v10 = v4;
    v7 = +[AFSiriActivationResult newWithBuilder:](AFSiriActivationResult, "newWithBuilder:", v9);
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);

  }
}

void __68__AFSiriActivationHandlerCoreSpeechDaemon_handleContext_completion___block_invoke_7(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = AFSiriLogContextDaemon;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      v12 = "-[AFSiriActivationHandlerCoreSpeechDaemon handleContext:completion:]_block_invoke";
      v13 = 2112;
      v14 = v4;
      v15 = 2112;
      v16 = v8;
      _os_log_error_impl(&dword_19AF50000, v5, OS_LOG_TYPE_ERROR, "%s CSActivationEventNotifier returned error %@ for activation context %@.", buf, 0x20u);
    }
  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __68__AFSiriActivationHandlerCoreSpeechDaemon_handleContext_completion___block_invoke_8;
    v9[3] = &unk_1E3A32DB0;
    v10 = v4;
    v7 = +[AFSiriActivationResult newWithBuilder:](AFSiriActivationResult, "newWithBuilder:", v9);
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);

  }
}

void __68__AFSiriActivationHandlerCoreSpeechDaemon_handleContext_completion___block_invoke_8(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setActionType:", 4);
  objc_msgSend(v3, "setError:", *(_QWORD *)(a1 + 32));

}

void __68__AFSiriActivationHandlerCoreSpeechDaemon_handleContext_completion___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setActionType:", 4);
  objc_msgSend(v3, "setError:", *(_QWORD *)(a1 + 32));

}

void __68__AFSiriActivationHandlerCoreSpeechDaemon_handleContext_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setActionType:", 4);
  objc_msgSend(v3, "setError:", *(_QWORD *)(a1 + 32));

}

void __68__AFSiriActivationHandlerCoreSpeechDaemon_handleContext_completion___block_invoke_1(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setActionType:", 4);
  objc_msgSend(v3, "setError:", *(_QWORD *)(a1 + 32));

}

@end
