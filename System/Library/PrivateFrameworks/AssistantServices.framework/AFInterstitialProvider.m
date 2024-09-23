@implementation AFInterstitialProvider

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  AFInterstitialProvider *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v6 = "-[AFInterstitialProvider dealloc]";
    v7 = 2048;
    v8 = self;
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }
  v4.receiver = self;
  v4.super_class = (Class)AFInterstitialProvider;
  -[AFInterstitialProvider dealloc](&v4, sel_dealloc);
}

- (AFInterstitialProvider)initWithStyle:(int64_t)a3 recordRoute:(id)a4 isVoiceTrigger:(BOOL)a5 isDucking:(BOOL)a6 isTwoShot:(BOOL)a7 speechEndHostTime:(unint64_t)a8 context:(id)a9 preferences:(id)a10 delegate:(id)a11
{
  _BOOL4 v12;
  _BOOL4 v13;
  _BOOL4 v14;
  id v17;
  id v18;
  id v19;
  id v20;
  AFInterstitialProvider *v21;
  void *v22;
  NSObject *v23;
  __CFString *v24;
  __CFString *v25;
  NSObject *v26;
  NSObject *v27;
  dispatch_queue_t v28;
  OS_dispatch_queue *queue;
  NSObject *v30;
  _BOOL4 v32;
  _BOOL4 v33;
  _QWORD block[4];
  id v35;
  AFInterstitialProvider *v36;
  id v37;
  id v38;
  id v39;
  int64_t v40;
  unint64_t v41;
  BOOL v42;
  BOOL v43;
  BOOL v44;
  objc_super v45;
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  AFInterstitialProvider *v49;
  __int16 v50;
  __CFString *v51;
  __int16 v52;
  id v53;
  __int16 v54;
  _BOOL4 v55;
  __int16 v56;
  _BOOL4 v57;
  __int16 v58;
  _BOOL4 v59;
  __int16 v60;
  unint64_t v61;
  __int16 v62;
  id v63;
  __int16 v64;
  id v65;
  uint64_t v66;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v66 = *MEMORY[0x1E0C80C00];
  v17 = a4;
  v18 = a9;
  v19 = a10;
  v20 = a11;
  v45.receiver = self;
  v45.super_class = (Class)AFInterstitialProvider;
  v21 = -[AFInterstitialProvider init](&v45, sel_init);
  if (v21)
  {
    v32 = v13;
    v33 = v12;
    v22 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v23 = v22;
      if ((unint64_t)a3 > 8)
        v24 = CFSTR("(unknown)");
      else
        v24 = off_1E3A35028[a3];
      v25 = v24;
      *(_DWORD *)buf = 136317442;
      v47 = "-[AFInterstitialProvider initWithStyle:recordRoute:isVoiceTrigger:isDucking:isTwoShot:speechEndHostTime:cont"
            "ext:preferences:delegate:]";
      v48 = 2048;
      v49 = v21;
      v50 = 2112;
      v51 = v25;
      v52 = 2112;
      v53 = v17;
      v54 = 1024;
      v55 = v14;
      v56 = 1024;
      v57 = v32;
      v58 = 1024;
      v59 = v33;
      v60 = 2048;
      v61 = a8;
      v62 = 2112;
      v63 = v18;
      v64 = 2112;
      v65 = v19;
      _os_log_impl(&dword_19AF50000, v23, OS_LOG_TYPE_INFO, "%s %p (style = %@, recordRoute = %@, isVoiceTrigger = %d, isDucking = %d, isTwoShot = %d, speechEndHostTime = %llu, context = %@, preferences = %@)", buf, 0x5Au);

    }
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v26 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v26, QOS_CLASS_USER_INTERACTIVE, 0);
    v27 = objc_claimAutoreleasedReturnValue();

    v28 = dispatch_queue_create("com.apple.assistant.interstitial-provider.default", v27);
    queue = v21->_queue;
    v21->_queue = (OS_dispatch_queue *)v28;

    v30 = v21->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __134__AFInterstitialProvider_initWithStyle_recordRoute_isVoiceTrigger_isDucking_isTwoShot_speechEndHostTime_context_preferences_delegate___block_invoke;
    block[3] = &unk_1E3A2CD48;
    v35 = v19;
    v36 = v21;
    v40 = a3;
    v42 = v14;
    v43 = v32;
    v44 = v33;
    v37 = v17;
    v41 = a8;
    v38 = v18;
    v39 = v20;
    dispatch_async(v30, block);

  }
  return v21;
}

- (AFInterstitialProvider)initWithStyle:(int64_t)a3 recordRoute:(id)a4 isVoiceTrigger:(BOOL)a5 isDucking:(BOOL)a6 isTwoShot:(BOOL)a7 speechEndHostTime:(unint64_t)a8 context:(id)a9 delegate:(id)a10
{
  _BOOL8 v10;
  _BOOL8 v11;
  _BOOL8 v12;
  id v16;
  id v17;
  id v18;
  void *v19;
  AFPreferences *v20;
  AFInterstitialProvider *v21;

  v10 = a7;
  v11 = a6;
  v12 = a5;
  v16 = a10;
  v17 = a9;
  v18 = a4;
  +[AFInstanceContext currentContext](AFInstanceContext, "currentContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[AFPreferences initWithInstanceContext:]([AFPreferences alloc], "initWithInstanceContext:", v19);
  v21 = -[AFInterstitialProvider initWithStyle:recordRoute:isVoiceTrigger:isDucking:isTwoShot:speechEndHostTime:context:preferences:delegate:](self, "initWithStyle:recordRoute:isVoiceTrigger:isDucking:isTwoShot:speechEndHostTime:context:preferences:delegate:", a3, v18, v12, v11, v10, a8, v17, v20, v16);

  return v21;
}

- (void)invalidate
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  AFInterstitialProvider *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v7 = "-[AFInterstitialProvider invalidate]";
    v8 = 2048;
    v9 = self;
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__AFInterstitialProvider_invalidate__block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_invalidate
{
  AFInterstitialConfiguration *configuration;
  NSMutableArray *pendingActions;
  id context;

  configuration = self->_configuration;
  self->_configuration = 0;

  pendingActions = self->_pendingActions;
  self->_pendingActions = 0;

  context = self->_context;
  self->_context = 0;

}

- (void)_performNextActionWithExpectedDelay:(double)a3
{
  void *v5;
  AFOneArgumentSafetyBlock *v6;
  unint64_t v7;
  double v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  NSObject *v18;
  double v19;
  dispatch_time_t v20;
  NSObject *queue;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  __CFString *v28;
  __CFString *v29;
  OS_dispatch_queue *v30;
  id WeakRetained;
  id context;
  OS_dispatch_queue *v33;
  void *v34;
  void *v35;
  void *v36;
  AFOneArgumentSafetyBlock *v37;
  _QWORD block[4];
  AFOneArgumentSafetyBlock *v39;
  double v40;
  _QWORD v41[4];
  OS_dispatch_queue *v42;
  AFOneArgumentSafetyBlock *v43;
  _QWORD v44[4];
  id v45;
  id location;
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  __CFString *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  double v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableArray count](self->_pendingActions, "count"))
  {
    -[NSMutableArray objectAtIndex:](self->_pendingActions, "objectAtIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObjectAtIndex:](self->_pendingActions, "removeObjectAtIndex:", 0);
    objc_initWeak(&location, self);
    v6 = [AFOneArgumentSafetyBlock alloc];
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __62__AFInterstitialProvider__performNextActionWithExpectedDelay___block_invoke;
    v44[3] = &unk_1E3A2CD70;
    objc_copyWeak(&v45, &location);
    v37 = -[AFOneArgumentSafetyBlock initWithBlock:](v6, "initWithBlock:", v44);
    v7 = objc_msgSend(v5, "phase");
    objc_msgSend(v5, "duration");
    if (v7)
    {
      -[AFInterstitialConfiguration languageCode](self->_configuration, "languageCode");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[AFInterstitialConfiguration gender](self->_configuration, "gender");
      v36 = v9;
      v11 = 0;
      v12 = 0;
      if (objc_msgSend(v9, "length") && v10)
      {
        objc_msgSend(v5, "displayKey");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v13;
        if (v13)
        {
          _AFInterstitialGetLocalizationKey(v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            +[AFLocalization sharedInstance](AFLocalization, "sharedInstance", v34);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "localizedStringForKey:gender:table:bundle:languageCode:", v14, v10, CFSTR("Interstitials"), v16, v36);
            v12 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v12 = 0;
          }

        }
        else
        {
          v12 = 0;
        }
        objc_msgSend(v5, "speakableKey", v34);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22;
        if (v22)
        {
          _AFInterstitialGetLocalizationKey(v22);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (v24)
          {
            +[AFLocalization sharedInstance](AFLocalization, "sharedInstance");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "localizedStringForKey:gender:table:bundle:languageCode:", v24, v10, CFSTR("Interstitials"), v26, v36);
            v11 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v11 = 0;
          }

        }
        else
        {
          v11 = 0;
        }

      }
      v27 = (id)AFSiriLogContextConnection;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        if (v7 > 4)
          v28 = CFSTR("(unknown)");
        else
          v28 = off_1E3A32208[v7];
        v29 = v28;
        *(_DWORD *)buf = 136316162;
        v48 = "-[AFInterstitialProvider _performNextActionWithExpectedDelay:]";
        v49 = 2112;
        v50 = v29;
        v51 = 2112;
        v52 = v12;
        v53 = 2112;
        v54 = v11;
        v55 = 2048;
        v56 = a3;
        _os_log_impl(&dword_19AF50000, v27, OS_LOG_TYPE_INFO, "%s phase = %@, displayText = %@, speakableText = %@, expectedDelay = %f", buf, 0x34u);

      }
      v30 = self->_queue;
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      context = self->_context;
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __62__AFInterstitialProvider__performNextActionWithExpectedDelay___block_invoke_14;
      v41[3] = &unk_1E3A36FC8;
      v33 = v30;
      v42 = v33;
      v43 = v37;
      objc_msgSend(WeakRetained, "interstitialProvider:handlePhase:displayText:speakableText:expectedDelay:context:completion:", self, v7, v12, v11, context, v41, a3);

    }
    else
    {
      v17 = v8;
      if (v8 <= 0.0)
      {
LABEL_29:

        objc_destroyWeak(&v45);
        objc_destroyWeak(&location);

        return;
      }
      v18 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v48 = "-[AFInterstitialProvider _performNextActionWithExpectedDelay:]";
        v49 = 2048;
        v50 = *(__CFString **)&v17;
        _os_log_impl(&dword_19AF50000, v18, OS_LOG_TYPE_INFO, "%s duration = %f", buf, 0x16u);
      }
      objc_msgSend(v5, "duration");
      v20 = dispatch_time(0, (uint64_t)(v19 * 1000000000.0));
      queue = self->_queue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __62__AFInterstitialProvider__performNextActionWithExpectedDelay___block_invoke_15;
      block[3] = &unk_1E3A353C0;
      v39 = v37;
      v40 = v17;
      dispatch_after(v20, queue, block);
      v12 = v39;
    }

    goto LABEL_29;
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong((id *)&self->_pendingActions, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __62__AFInterstitialProvider__performNextActionWithExpectedDelay___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  double v4;
  double v5;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  objc_msgSend(WeakRetained, "_performNextActionWithExpectedDelay:", v5);
}

void __62__AFInterstitialProvider__performNextActionWithExpectedDelay___block_invoke_14(uint64_t a1)
{
  NSObject *v1;
  _QWORD block[4];
  id v3;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__AFInterstitialProvider__performNextActionWithExpectedDelay___block_invoke_2;
  block[3] = &unk_1E3A36F30;
  v1 = *(NSObject **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);

}

void __62__AFInterstitialProvider__performNextActionWithExpectedDelay___block_invoke_15(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invokeWithValue:", v2);

}

uint64_t __62__AFInterstitialProvider__performNextActionWithExpectedDelay___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invokeWithValue:", 0);
}

uint64_t __36__AFInterstitialProvider_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

void __134__AFInterstitialProvider_initWithStyle_recordRoute_isVoiceTrigger_isDucking_isTwoShot_speechEndHostTime_context_preferences_delegate___block_invoke(uint64_t a1)
{
  void *v2;
  AFPreferences *v3;
  AFPreferences *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  AFInterstitialConfiguration *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  double InitialInterstitialDelay;
  double v20;
  NSObject *v21;
  uint64_t v22;
  unint64_t v23;
  double v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  NSObject *v31;
  _AFInterstitialAction *v32;
  uint64_t v33;
  _AFInterstitialAction *v34;
  _AFInterstitialAction *v35;
  void *v36;
  void *v37;
  void *v38;
  _AFInterstitialAction *v39;
  _AFInterstitialAction *v40;
  double v41;
  uint64_t v42;
  void *v43;
  _AFInterstitialAction *v44;
  _AFInterstitialAction *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  NSObject *v50;
  uint64_t v51;
  uint64_t v52;
  _AFInterstitialAction *v53;
  int v54;
  char v55;
  char v56;
  double InitialInterstitialDelayForVoiceTriggerOneShotWithoutAudioDucking;
  NSObject *v58;
  void *v59;
  double v60;
  NSObject *v61;
  uint64_t v62;
  _AFInterstitialAction *v63;
  _AFInterstitialAction *v64;
  _AFInterstitialAction *v65;
  id v66;
  void *v67;
  void *v68;
  AFPreferences *v69;
  _BYTE buf[24];
  _AFInterstitialAction *v71;
  _AFInterstitialAction *v72;
  _AFInterstitialAction *v73;
  _AFInterstitialAction *v74;
  _AFInterstitialAction *v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = v2;
  }
  else
  {
    v4 = [AFPreferences alloc];
    +[AFInstanceContext currentContext](AFInstanceContext, "currentContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = -[AFPreferences initWithInstanceContext:](v4, "initWithInstanceContext:", v5);

  }
  -[AFPreferences languageCode](v3, "languageCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    v7 = v6;
  }
  else
  {
    -[AFPreferences bestSupportedLanguageCodeForLanguageCode:](v3, "bestSupportedLanguageCodeForLanguageCode:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[AFInterstitialProvider initWithStyle:recordRoute:isVoiceTrigger:isDucking:isTwoShot:speechE"
                           "ndHostTime:context:preferences:delegate:]_block_invoke";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v7;
      _os_log_error_impl(&dword_19AF50000, v8, OS_LOG_TYPE_ERROR, "%s No language preference, using best supported language: %@", buf, 0x16u);
    }
  }
  +[AFPreferences sharedPreferences](AFPreferences, "sharedPreferences");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "outputVoice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "gender");
  if (!v11)
    v11 = +[AFVoiceInfo defaultGenderForOutputVoiceLanguageCode:](AFVoiceInfo, "defaultGenderForOutputVoiceLanguageCode:", v7);
  v12 = [AFInterstitialConfiguration alloc];
  LOBYTE(v62) = *(_BYTE *)(a1 + 90);
  v13 = -[AFInterstitialConfiguration initWithStyle:languageCode:gender:recordRoute:isVoiceTrigger:isDucking:isTwoShot:speechEndHostTime:](v12, "initWithStyle:languageCode:gender:recordRoute:isVoiceTrigger:isDucking:isTwoShot:speechEndHostTime:", *(_QWORD *)(a1 + 72), v7, v11, *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 88), *(unsigned __int8 *)(a1 + 89), v62, *(_QWORD *)(a1 + 80));
  v14 = *(_QWORD *)(a1 + 40);
  v15 = *(void **)(v14 + 16);
  *(_QWORD *)(v14 + 16) = v13;

  v16 = *(id *)(*(_QWORD *)(a1 + 40) + 16);
  v17 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "_AFInterstitialActionsCreate";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v16;
    _os_log_impl(&dword_19AF50000, v17, OS_LOG_TYPE_INFO, "%s configuration = %@", buf, 0x16u);
  }
  CFPreferencesAppSynchronize(CFSTR("com.apple.assistant"));
  v18 = objc_msgSend(v16, "style");
  InitialInterstitialDelay = _AFPreferencesGetInitialInterstitialDelay(v18);
  if (InitialInterstitialDelay <= 0.0)
    v20 = 3.5;
  else
    v20 = InitialInterstitialDelay;
  v21 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "_AFInterstitialActionsCreate";
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = v20;
    _os_log_impl(&dword_19AF50000, v21, OS_LOG_TYPE_INFO, "%s initialInterstitialDelay = %f", buf, 0x16u);
    v21 = AFSiriLogContextConnection;
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "_AFInterstitialActionsCreate";
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = v20;
    _os_log_impl(&dword_19AF50000, v21, OS_LOG_TYPE_INFO, "%s delayBeforeInitial = %f", buf, 0x16u);
  }
  v22 = objc_msgSend(v16, "speechEndHostTime");
  if (v22)
  {
    v23 = mach_absolute_time() - v22;
    if (_AFMachAbsoluteTimeRate_onceToken != -1)
      dispatch_once(&_AFMachAbsoluteTimeRate_onceToken, &__block_literal_global_652);
    v24 = *(double *)&_AFMachAbsoluteTimeRate_rate * (double)v23 / 1000000000.0;
  }
  else
  {
    v24 = 0.0;
  }
  v68 = v7;
  v69 = v3;
  v66 = v16;
  v67 = v10;
  switch(v18)
  {
    case 1:
    case 2:
    case 5:
    case 6:
      goto LABEL_25;
    case 3:
      v54 = objc_msgSend(v16, "isVoiceTrigger");
      v55 = objc_msgSend(v16, "isDucking");
      v56 = objc_msgSend(v16, "isTwoShot");
      if (v54 && (v55 & 1) == 0 && (v56 & 1) == 0)
      {
        InitialInterstitialDelayForVoiceTriggerOneShotWithoutAudioDucking = _AFPreferencesGetInitialInterstitialDelayForVoiceTriggerOneShotWithoutAudioDucking();
        if (InitialInterstitialDelayForVoiceTriggerOneShotWithoutAudioDucking <= 0.0)
          v20 = 1.75;
        else
          v20 = InitialInterstitialDelayForVoiceTriggerOneShotWithoutAudioDucking;
        v58 = AFSiriLogContextConnection;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "_AFInterstitialActionsCreate";
          *(_WORD *)&buf[12] = 2048;
          *(double *)&buf[14] = v20;
          _os_log_impl(&dword_19AF50000, v58, OS_LOG_TYPE_INFO, "%s initialInterstitialDelayForVoiceTriggerOneShotWithoutAudioDucking = %f", buf, 0x16u);
          v58 = AFSiriLogContextConnection;
        }
        if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "_AFInterstitialActionsCreate";
          *(_WORD *)&buf[12] = 2048;
          *(double *)&buf[14] = v20;
          _os_log_impl(&dword_19AF50000, v58, OS_LOG_TYPE_INFO, "%s delayBeforeInitial = %f (adjustment based on speech request info for Hearst)", buf, 0x16u);
        }
      }
LABEL_25:
      if (v24 > 0.0)
      {
        v20 = v20 - v24 >= 0.0 ? v20 - v24 : 0.0;
        v25 = AFSiriLogContextConnection;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "_AFInterstitialActionsCreate";
          *(_WORD *)&buf[12] = 2048;
          *(double *)&buf[14] = v20;
          _os_log_impl(&dword_19AF50000, v25, OS_LOG_TYPE_INFO, "%s delayBeforeInitial = %f (adjustment based on end-of-speech info)", buf, 0x16u);
        }
      }
      v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("INITIAL_%u"), arc4random_uniform(3u));
      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("FOLLOW_UP_%u"), arc4random_uniform(3u));
      v28 = 0;
      do
      {
        v29 = v28;
        v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("FOLLOW_UP_%u"), arc4random_uniform(3u));

      }
      while ((objc_msgSend(v28, "isEqualToString:", v27) & 1) != 0);
      if (v20 + -0.4 >= 0.0)
        v30 = v20 + -0.4;
      else
        v30 = 0.0;
      v31 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "_AFInterstitialActionsCreate";
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = v30;
        _os_log_impl(&dword_19AF50000, v31, OS_LOG_TYPE_INFO, "%s delayBeforeInitial = %f (adjustment for frontend UI)", buf, 0x16u);
      }
      v65 = -[_AFInterstitialAction initWithDuration:]([_AFInterstitialAction alloc], "initWithDuration:", v30);
      *(_QWORD *)buf = v65;
      v64 = -[_AFInterstitialAction initWithPhase:displayKey:speakableKey:]([_AFInterstitialAction alloc], "initWithPhase:displayKey:speakableKey:", 1, v26, v26);
      *(_QWORD *)&buf[8] = v64;
      v63 = -[_AFInterstitialAction initWithDuration:]([_AFInterstitialAction alloc], "initWithDuration:", 5.6);
      *(_QWORD *)&buf[16] = v63;
      v32 = -[_AFInterstitialAction initWithPhase:displayKey:speakableKey:]([_AFInterstitialAction alloc], "initWithPhase:displayKey:speakableKey:", 2, v27, v27);
      v71 = v32;
      v33 = 0x401E666666666666;
      v34 = -[_AFInterstitialAction initWithDuration:]([_AFInterstitialAction alloc], "initWithDuration:", 7.6);
      v72 = v34;
      v35 = [_AFInterstitialAction alloc];
      v36 = v28;
      v37 = v28;
      goto LABEL_39;
    case 4:
    case 7:
      v42 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("INITIAL_%u"), arc4random_uniform(3u));
      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("FOLLOW_UP_%u"), arc4random_uniform(3u));
      v28 = 0;
      do
      {
        v43 = v28;
        v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("FOLLOW_UP_%u"), arc4random_uniform(3u));

      }
      while ((objc_msgSend(v28, "isEqualToString:", v27) & 1) != 0);
      v65 = -[_AFInterstitialAction initWithDuration:]([_AFInterstitialAction alloc], "initWithDuration:", v20);
      *(_QWORD *)buf = v65;
      v64 = -[_AFInterstitialAction initWithPhase:displayKey:speakableKey:]([_AFInterstitialAction alloc], "initWithPhase:displayKey:speakableKey:", 1, 0, v42);
      *(_QWORD *)&buf[8] = v64;
      v63 = -[_AFInterstitialAction initWithDuration:]([_AFInterstitialAction alloc], "initWithDuration:", 6.0);
      *(_QWORD *)&buf[16] = v63;
      v32 = -[_AFInterstitialAction initWithPhase:displayKey:speakableKey:]([_AFInterstitialAction alloc], "initWithPhase:displayKey:speakableKey:", 2, 0, v27);
      v71 = v32;
      v34 = -[_AFInterstitialAction initWithDuration:]([_AFInterstitialAction alloc], "initWithDuration:", 8.0);
      v72 = v34;
      v38 = (void *)v42;
      v39 = -[_AFInterstitialAction initWithPhase:displayKey:speakableKey:]([_AFInterstitialAction alloc], "initWithPhase:displayKey:speakableKey:", 3, 0, v28);
      v73 = v39;
      v40 = [_AFInterstitialAction alloc];
      v41 = 8.0;
      goto LABEL_43;
    case 8:
      v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("INITIAL_%u"), arc4random_uniform(3u));
      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("FOLLOW_UP_%u"), arc4random_uniform(3u));
      v28 = 0;
      do
      {
        v59 = v28;
        v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("FOLLOW_UP_%u"), arc4random_uniform(3u));

      }
      while ((objc_msgSend(v28, "isEqualToString:", v27) & 1) != 0);
      v60 = 0.0;
      if (+[AFFeatureFlags isNanoSiriUIRefreshEnabled](AFFeatureFlags, "isNanoSiriUIRefreshEnabled"))
      {
        v61 = AFSiriLogContextConnection;
        if (v24 > 0.0)
        {
          v20 = v20 - v24 >= 0.0 ? v20 - v24 : 0.0;
          if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)&buf[4] = "_AFInterstitialActionsCreate";
            *(_WORD *)&buf[12] = 2048;
            *(double *)&buf[14] = v20;
            _os_log_impl(&dword_19AF50000, v61, OS_LOG_TYPE_INFO, "%s delayBeforeInitial = %f (adjustment based on end-of-speech info)", buf, 0x16u);
            v61 = AFSiriLogContextConnection;
          }
        }
        if (v20 + -0.6 >= 0.0)
          v60 = v20 + -0.6;
        else
          v60 = 0.0;
        if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "_AFInterstitialActionsCreate";
          *(_WORD *)&buf[12] = 2048;
          *(double *)&buf[14] = v60;
          _os_log_impl(&dword_19AF50000, v61, OS_LOG_TYPE_INFO, "%s delayBeforeInitial = %f (adjustment for frontend UI)", buf, 0x16u);
        }
      }
      v65 = -[_AFInterstitialAction initWithDuration:]([_AFInterstitialAction alloc], "initWithDuration:", v60);
      *(_QWORD *)buf = v65;
      v64 = -[_AFInterstitialAction initWithPhase:displayKey:speakableKey:]([_AFInterstitialAction alloc], "initWithPhase:displayKey:speakableKey:", 1, v26, 0);
      *(_QWORD *)&buf[8] = v64;
      v63 = -[_AFInterstitialAction initWithDuration:]([_AFInterstitialAction alloc], "initWithDuration:", 5.4);
      *(_QWORD *)&buf[16] = v63;
      v32 = -[_AFInterstitialAction initWithPhase:displayKey:speakableKey:]([_AFInterstitialAction alloc], "initWithPhase:displayKey:speakableKey:", 2, v27, 0);
      v71 = v32;
      v33 = 0x401D99999999999ALL;
      v34 = -[_AFInterstitialAction initWithDuration:]([_AFInterstitialAction alloc], "initWithDuration:", 7.4);
      v72 = v34;
      v35 = [_AFInterstitialAction alloc];
      v36 = v28;
      v37 = 0;
LABEL_39:
      v38 = (void *)v26;
      v39 = -[_AFInterstitialAction initWithPhase:displayKey:speakableKey:](v35, "initWithPhase:displayKey:speakableKey:", 3, v36, v37);
      v73 = v39;
      v40 = [_AFInterstitialAction alloc];
      v41 = *(double *)&v33;
LABEL_43:
      v44 = -[_AFInterstitialAction initWithDuration:](v40, "initWithDuration:", v41);
      v74 = v44;
      v45 = -[_AFInterstitialAction initWithPhase:displayKey:speakableKey:]([_AFInterstitialAction alloc], "initWithPhase:displayKey:speakableKey:", 4, 0, 0);
      v75 = v45;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 8);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = v68;
      v3 = v69;
      v16 = v66;
      v10 = v67;
      break;
    default:
      v46 = 0;
      break;
  }

  v47 = objc_msgSend(v46, "mutableCopy");
  v48 = *(_QWORD *)(a1 + 40);
  v49 = *(void **)(v48 + 24);
  *(_QWORD *)(v48 + 24) = v47;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 32), *(id *)(a1 + 56));
  objc_storeWeak((id *)(*(_QWORD *)(a1 + 40) + 40), *(id *)(a1 + 64));
  v50 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v51 = *(_QWORD *)(a1 + 40);
    v52 = *(_QWORD *)(v51 + 16);
    v53 = *(_AFInterstitialAction **)(v51 + 32);
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[AFInterstitialProvider initWithStyle:recordRoute:isVoiceTrigger:isDucking:isTwoShot:speechEnd"
                         "HostTime:context:preferences:delegate:]_block_invoke";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v52;
    *(_WORD *)&buf[22] = 2112;
    v71 = v53;
    _os_log_impl(&dword_19AF50000, v50, OS_LOG_TYPE_INFO, "%s configuration = %@, context = %@", buf, 0x20u);
  }
  objc_msgSend(*(id *)(a1 + 40), "_performNextActionWithExpectedDelay:", 0.0);

}

@end
