@implementation AFArbitrationParticipationController

- (AFArbitrationParticipationController)init
{
  AFArbitrationParticipationController *v2;
  uint64_t v3;
  NSMutableDictionary *participationsForUserFeedback;
  uint64_t v5;
  NSMutableArray *participationsPublished;
  NSObject *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AFArbitrationParticipationController;
  v2 = -[AFArbitrationParticipationController init](&v13, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    participationsForUserFeedback = v2->_participationsForUserFeedback;
    v2->_participationsForUserFeedback = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    participationsPublished = v2->_participationsPublished;
    v2->_participationsPublished = (NSMutableArray *)v5;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_USER_INTERACTIVE, 0);
    v8 = objc_claimAutoreleasedReturnValue();

    v9 = dispatch_queue_create("AFArbitrationParticipationQueue", v8);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v9;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)notificationNearMissCallback, CFSTR("com.apple.voicetrigger.NearTrigger"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);

  }
  return v2;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.voicetrigger.NearTrigger"), 0);
  v4.receiver = self;
  v4.super_class = (Class)AFArbitrationParticipationController;
  -[AFArbitrationParticipationController dealloc](&v4, sel_dealloc);
}

- (AFSettingsConnection)settingsConnection
{
  AFSettingsConnection *settingsConnection;
  AFSettingsConnection *v4;
  AFSettingsConnection *v5;

  settingsConnection = self->_settingsConnection;
  if (!settingsConnection)
  {
    v4 = objc_alloc_init(AFSettingsConnection);
    v5 = self->_settingsConnection;
    self->_settingsConnection = v4;

    -[AFSettingsConnection setXPCConnectionManagementQueue:](self->_settingsConnection, "setXPCConnectionManagementQueue:", self->_queue);
    settingsConnection = self->_settingsConnection;
  }
  return settingsConnection;
}

- (void)arbitrationSessionWillStart:(id)a3
{
  id v4;
  NSObject *queue;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (+[AFFeatureFlags isCrossDeviceArbitrationFeedbackEnabled](AFFeatureFlags, "isCrossDeviceArbitrationFeedbackEnabled"))
  {
    queue = self->_queue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __68__AFArbitrationParticipationController_arbitrationSessionWillStart___block_invoke;
    v6[3] = &unk_1E3A36FC8;
    v6[4] = self;
    v7 = v4;
    dispatch_async(queue, v6);

  }
}

- (void)arbitrationDidUpdateWithContext:(id)a3 session:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (+[AFFeatureFlags isCrossDeviceArbitrationFeedbackEnabled](AFFeatureFlags, "isCrossDeviceArbitrationFeedbackEnabled"))
  {
    queue = self->_queue;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __91__AFArbitrationParticipationController_arbitrationDidUpdateWithContext_session_completion___block_invoke;
    v12[3] = &unk_1E3A346A0;
    v12[4] = self;
    v13 = v8;
    v14 = v9;
    v15 = v10;
    dispatch_async(queue, v12);

  }
}

- (void)arbitrationEndedAdvertising:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  if (+[AFFeatureFlags isCrossDeviceArbitrationFeedbackEnabled](AFFeatureFlags, "isCrossDeviceArbitrationFeedbackEnabled", a3))
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__AFArbitrationParticipationController_arbitrationEndedAdvertising___block_invoke;
    block[3] = &unk_1E3A36F30;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

- (void)arbitrationEndedTask:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  if (+[AFFeatureFlags isCrossDeviceArbitrationFeedbackEnabled](AFFeatureFlags, "isCrossDeviceArbitrationFeedbackEnabled", a3))
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__AFArbitrationParticipationController_arbitrationEndedTask___block_invoke;
    block[3] = &unk_1E3A36F30;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

- (void)requestWillPresentUsefulUserResult:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  if (+[AFFeatureFlags isCrossDeviceArbitrationFeedbackEnabled](AFFeatureFlags, "isCrossDeviceArbitrationFeedbackEnabled", a3))
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75__AFArbitrationParticipationController_requestWillPresentUsefulUserResult___block_invoke;
    block[3] = &unk_1E3A36F30;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

- (void)_publishFeedbackArbitrationRecordForNearMiss
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint8_t buf[4];
  const char *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v5 = (void *)MGCopyAnswer();
  objc_msgSend(v4, "setBuild:", v5);

  if (MGGetSInt32Answer())
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("#%02X"), MGGetSInt32Answer());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEnclosureColor:", v6);

  }
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "countryCode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v8, "languageCode");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "countryCode");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("%@_%@"), v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v8, "languageCode");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }

    if (objc_msgSend(v13, "length"))
      objc_msgSend(v4, "setLocale:", v13);

  }
  v14 = MGCopyAnswer();
  v15 = (void *)v14;
  if (v14)
  {
    v23[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setProductTypes:", v16);

  }
  v17 = (void *)MGCopyAnswer();
  objc_msgSend(v4, "setName:", v17);

  objc_msgSend(v3, "setDevice:", v4);
  objc_msgSend(v3, "setResult:", 1);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRequestStartDate:", v18);
  objc_msgSend(v3, "setVoiceTriggerDate:", v18);
  v19 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[AFArbitrationParticipationController _publishFeedbackArbitrationRecordForNearMiss]";
    _os_log_debug_impl(&dword_19AF50000, v19, OS_LOG_TYPE_DEBUG, "%s #myriad #feedback", buf, 0xCu);
  }
  -[AFArbitrationParticipationController settingsConnection](self, "settingsConnection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "publishFeedbackArbitrationParticipation:", v3);

}

- (void)_publishFeedbackArbitrationRecord
{
  void *v3;
  NSMutableArray *v4;
  NSMutableArray *participationsPublished;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary allValues](self->_participationsForUserFeedback, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_participationsPublished)
  {
    v4 = (NSMutableArray *)objc_opt_new();
    participationsPublished = self->_participationsPublished;
    self->_participationsPublished = v4;

  }
  v6 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    v7 = v6;
    *(_DWORD *)buf = 136315394;
    v10 = "-[AFArbitrationParticipationController _publishFeedbackArbitrationRecord]";
    v11 = 2048;
    v12 = objc_msgSend(v3, "count");
    _os_log_debug_impl(&dword_19AF50000, v7, OS_LOG_TYPE_DEBUG, "%s #myriad #feedback action: publishing %lu pariticipations", buf, 0x16u);

  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__AFArbitrationParticipationController__publishFeedbackArbitrationRecord__block_invoke;
  v8[3] = &unk_1E3A346C8;
  v8[4] = self;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v8);

}

- (void)_updateUserFeedbackParticipationAllAdvertisements:(id)a3 session:(id)a4 ownRecord:(id)a5 won:(BOOL)a6 triggerType:(id)a7 lastActivationTime:(double)a8 requestStartDate:(id)a9 voiceTriggerDate:(id)a10 scoreBoosters:(id)a11 deviceClass:(unsigned __int8)a12
{
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  NSObject *v52;
  NSMutableDictionary *participationsForUserFeedback;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  float v68;
  id v69;
  void *v70;
  float v71;
  id v72;
  void *v73;
  float v74;
  id v75;
  void *v76;
  float v77;
  id v78;
  void *v79;
  float v80;
  id v81;
  void *v82;
  float v83;
  id v84;
  void *v85;
  float v86;
  void *v87;
  id v88;
  id v89;
  void *v90;
  _BOOL4 v91;
  id v92;
  void *v93;
  void *v94;
  id v95;
  id v96;
  id v97;
  id v98;
  void *v99;
  _QWORD v100[4];
  id v101;
  id v102;
  id v103;
  _BYTE *v104;
  _QWORD *v105;
  _QWORD v106[5];
  id v107;
  void *v108;
  uint8_t v109[4];
  const char *v110;
  __int16 v111;
  id v112;
  _BYTE buf[24];
  uint64_t (*v114)(uint64_t, uint64_t);
  void (*v115)(uint64_t);
  id v116;
  void *v117;
  _QWORD v118[4];

  v91 = a6;
  v118[1] = *MEMORY[0x1E0C80C00];
  v96 = a3;
  v18 = a4;
  v19 = a5;
  v95 = a7;
  v97 = a9;
  v98 = a10;
  v20 = a11;
  v94 = v18;
  objc_msgSend(v18, "sessionId");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "UUIDString");
  v99 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = v99;
  if (objc_msgSend(v99, "length"))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_participationsForUserFeedback, "objectForKeyedSubscript:", v99);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v23)
    {
      v52 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[AFArbitrationParticipationController _updateUserFeedbackParticipationAllAdvertisements:se"
                             "ssion:ownRecord:won:triggerType:lastActivationTime:requestStartDate:voiceTriggerDate:scoreB"
                             "oosters:deviceClass:]";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v99;
        _os_log_debug_impl(&dword_19AF50000, v52, OS_LOG_TYPE_DEBUG, "%s #myriad #feedback unable to find SCDAFParticipation with myriad sessionId: %@", buf, 0x16u);
        v52 = AFSiriLogContextConnection;
      }
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
      {
        participationsForUserFeedback = self->_participationsForUserFeedback;
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[AFArbitrationParticipationController _updateUserFeedbackParticipationAllAdvertisements:se"
                             "ssion:ownRecord:won:triggerType:lastActivationTime:requestStartDate:voiceTriggerDate:scoreB"
                             "oosters:deviceClass:]";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = participationsForUserFeedback;
        _os_log_debug_impl(&dword_19AF50000, v52, OS_LOG_TYPE_DEBUG, "%s #myriad #feedback unable to find SCDAFParticipation in: %@", buf, 0x16u);
      }
      goto LABEL_63;
    }
    objc_msgSend(v23, "setRawGoodnessScore:", (double)objc_msgSend(v19, "rawAudioGoodnessScore"));
    objc_msgSend(v23, "setRequestStartDate:", v97);
    if (v98)
      objc_msgSend(v23, "setVoiceTriggerDate:");
    objc_msgSend(v23, "setCdaId:", v99);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v23, "performSelector:withObject:", sel_setTriggerType_, v95);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "timeIntervalSinceDate:", v98);
    v26 = v25;

    if (v26 > 0.0 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v26 * 1000.0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "performSelector:withObject:", sel_setTimeSinceTriggerInMilliseconds_, v27);

    }
    v28 = 0.0;
    if (a8 > 0.0)
    {
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "systemUptime");
      v31 = v30;

      v28 = v31 - a8;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v28 * 1000.0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "performSelector:withObject:", sel_setTimeSinceLastWinInMilliseconds_, v32);

    }
    if (v91)
      v33 = 3;
    else
      v33 = 2;
    objc_msgSend(v23, "setResult:", v33);
    v34 = objc_alloc_init(MEMORY[0x1E0D97D00]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", objc_msgSend(v19, "userConfidence"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setConfidence:", objc_msgSend(v35, "integerValue"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", objc_msgSend(v19, "goodness"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setGoodnessScore:", objc_msgSend(v36, "integerValue"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v19, "pHash"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setAdvertHash:", v37);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", objc_msgSend(v19, "deviceClass"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setDeviceClass:", objc_msgSend(v38, "integerValue"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", objc_msgSend(v19, "tieBreaker"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setTieBreaker:", objc_msgSend(v39, "integerValue"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", objc_msgSend(v19, "productType"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setProductType:", objc_msgSend(v40, "integerValue"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", objc_msgSend(v19, "deviceGroup"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setDeviceGroup:", objc_msgSend(v41, "integerValue"));

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", objc_msgSend(v19, "deviceGroup"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "performSelector:withObject:", sel_setDeviceGroupWithNumber_, v42);

    }
    objc_msgSend(v23, "setAdvertisement:", v34);
    v43 = objc_alloc_init(MEMORY[0x1E0D97D10]);
    v44 = (void *)MGCopyAnswer();
    objc_msgSend(v43, "setBuild:", v44);

    if (MGGetSInt32Answer())
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("#%02X"), MGGetSInt32Answer());
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setEnclosureColor:", v45);

    }
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    if (v93)
    {
      objc_msgSend(v93, "countryCode");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      if (v46)
      {
        v47 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v93, "languageCode");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "countryCode");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "stringWithFormat:", CFSTR("%@_%@"), v48, v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v93, "languageCode");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
      }

      if (objc_msgSend(v50, "length"))
        objc_msgSend(v43, "setLocale:", v50);

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a12);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v118[0] = v54;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v118, 1);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setDeviceClass:", v55);

    v90 = (void *)MGCopyAnswer();
    if (v90)
    {
      v117 = v90;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v117, 1);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setProductTypes:", v56);

    }
    v57 = (void *)MGCopyAnswer();
    objc_msgSend(v43, "setName:", v57);

    objc_msgSend(v23, "setDevice:", v43);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v114 = __Block_byref_object_copy__33882;
    v115 = __Block_byref_object_dispose__33883;
    if (v91)
      v58 = v34;
    else
      v58 = 0;
    v116 = v58;
    v106[0] = 0;
    v106[1] = v106;
    v106[2] = 0x3032000000;
    v106[3] = __Block_byref_object_copy__33882;
    v106[4] = __Block_byref_object_dispose__33883;
    v107 = 0;
    v92 = v96;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v100[0] = MEMORY[0x1E0C809B0];
    v100[1] = 3221225472;
    v100[2] = __203__AFArbitrationParticipationController__updateUserFeedbackParticipationAllAdvertisements_session_ownRecord_won_triggerType_lastActivationTime_requestStartDate_voiceTriggerDate_scoreBoosters_deviceClass___block_invoke;
    v100[3] = &unk_1E3A346F0;
    v101 = v19;
    v88 = v34;
    v102 = v88;
    v89 = v59;
    v103 = v89;
    v104 = buf;
    v105 = v106;
    objc_msgSend(v92, "enumerateObjectsUsingBlock:", v100);
    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
      objc_msgSend(v23, "setWinnerAdvertisement:");
    v60 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v109 = 136315394;
      v110 = "-[AFArbitrationParticipationController _updateUserFeedbackParticipationAllAdvertisements:session:ownRecord:"
             "won:triggerType:lastActivationTime:requestStartDate:voiceTriggerDate:scoreBoosters:deviceClass:]";
      v111 = 2112;
      v112 = v20;
      _os_log_debug_impl(&dword_19AF50000, v60, OS_LOG_TYPE_DEBUG, "%s #myriad #feedback scoreBoosters from myriadInstrumentation: %@", v109, 0x16u);
      if (v20)
      {
LABEL_43:
        if (objc_msgSend(v20, "isTrump")
          && (v61 = objc_msgSend(v20, "trumpReason") - 1, v61 < 8))
        {
          v62 = v61 + 1;
        }
        else
        {
          v62 = 0;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v108 = v63;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v108, 1);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setTrumpReasons:", v64);

        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "deviceBoost"))
        {
          v66 = objc_alloc_init(MEMORY[0x1E0D97D08]);
          objc_msgSend(v66, "setKind:", 0);
          objc_msgSend(v66, "setType:", 0);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v20, "deviceBoost"));
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "floatValue");
          objc_msgSend(v66, "setBoostValue:", v68);

          objc_msgSend(v65, "addObject:", v66);
        }
        if (objc_msgSend(v20, "recentAlarmBoost"))
        {
          v69 = objc_alloc_init(MEMORY[0x1E0D97D08]);
          objc_msgSend(v69, "setKind:", 6);
          objc_msgSend(v69, "setType:", 0);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v20, "recentAlarmBoost"));
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "floatValue");
          objc_msgSend(v69, "setBoostValue:", v71);

          objc_msgSend(v65, "addObject:", v69);
        }
        if (objc_msgSend(v20, "recentMotionBoost"))
        {
          v72 = objc_alloc_init(MEMORY[0x1E0D97D08]);
          objc_msgSend(v72, "setKind:", 4);
          objc_msgSend(v72, "setType:", 0);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v20, "recentMotionBoost"));
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "floatValue");
          objc_msgSend(v72, "setBoostValue:", v74);

          objc_msgSend(v65, "addObject:", v72);
        }
        if (objc_msgSend(v20, "recentUnlockBoost"))
        {
          v75 = objc_alloc_init(MEMORY[0x1E0D97D08]);
          objc_msgSend(v75, "setKind:", 1);
          objc_msgSend(v75, "setType:", 0);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v20, "recentUnlockBoost"));
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "floatValue");
          objc_msgSend(v75, "setBoostValue:", v77);

          objc_msgSend(v65, "addObject:", v75);
        }
        if (objc_msgSend(v20, "recentPlaybackBoost"))
        {
          v78 = objc_alloc_init(MEMORY[0x1E0D97D08]);
          objc_msgSend(v78, "setKind:", 5);
          objc_msgSend(v78, "setType:", 0);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v20, "recentPlaybackBoost"));
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "floatValue");
          objc_msgSend(v78, "setBoostValue:", v80);

          objc_msgSend(v65, "addObject:", v78);
        }
        if (objc_msgSend(v20, "recentSiriRequestBoost"))
        {
          v81 = objc_alloc_init(MEMORY[0x1E0D97D08]);
          objc_msgSend(v81, "setKind:", 3);
          objc_msgSend(v81, "setType:", 0);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v20, "recentSiriRequestBoost"));
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "floatValue");
          objc_msgSend(v81, "setBoostValue:", v83);

          objc_msgSend(v65, "addObject:", v81);
        }
        if (objc_msgSend(v20, "recentRaiseToWakeBoost"))
        {
          v84 = objc_alloc_init(MEMORY[0x1E0D97D08]);
          objc_msgSend(v84, "setKind:", 2);
          objc_msgSend(v84, "setType:", 0);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v20, "recentRaiseToWakeBoost"));
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "floatValue");
          objc_msgSend(v84, "setBoostValue:", v86);

          objc_msgSend(v65, "addObject:", v84);
        }
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v65);
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setBoosts:", v87);

      }
    }
    else if (v20)
    {
      goto LABEL_43;
    }
    objc_msgSend(v23, "setSeenAdvertisements:", v89);

    _Block_object_dispose(v106, 8);
    _Block_object_dispose(buf, 8);

LABEL_63:
    v22 = v99;
    goto LABEL_64;
  }
  v51 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[AFArbitrationParticipationController _updateUserFeedbackParticipationAllAdvertisements:sessio"
                         "n:ownRecord:won:triggerType:lastActivationTime:requestStartDate:voiceTriggerDate:scoreBoosters:deviceClass:]";
    _os_log_debug_impl(&dword_19AF50000, v51, OS_LOG_TYPE_DEBUG, "%s #myriad #feedback myriad sessionid is nil. Returning", buf, 0xCu);
  }
LABEL_64:

}

- (void)_resetSettingsConnection
{
  AFSettingsConnection *settingsConnection;

  settingsConnection = self->_settingsConnection;
  if (settingsConnection)
  {
    self->_settingsConnection = 0;

  }
}

- (void)setSettingsConnection:(id)a3
{
  objc_storeStrong((id *)&self->_settingsConnection, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSMutableDictionary)participationsForUserFeedback
{
  return self->_participationsForUserFeedback;
}

- (void)setParticipationsForUserFeedback:(id)a3
{
  objc_storeStrong((id *)&self->_participationsForUserFeedback, a3);
}

- (NSMutableArray)participationsPublished
{
  return self->_participationsPublished;
}

- (void)setParticipationsPublished:(id)a3
{
  objc_storeStrong((id *)&self->_participationsPublished, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participationsPublished, 0);
  objc_storeStrong((id *)&self->_participationsForUserFeedback, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_settingsConnection, 0);
}

void __203__AFArbitrationParticipationController__updateUserFeedbackParticipationAllAdvertisements_session_ownRecord_won_triggerType_lastActivationTime_requestStartDate_voiceTriggerDate_scoreBoosters_deviceClass___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id *v16;
  uint64_t v17;
  id v18;

  v18 = a2;
  v6 = objc_alloc_init(MEMORY[0x1E0D97D00]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", objc_msgSend(v18, "userConfidence"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setConfidence:", objc_msgSend(v7, "integerValue"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", objc_msgSend(v18, "goodness"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setGoodnessScore:", objc_msgSend(v8, "integerValue"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v18, "pHash"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAdvertHash:", v9);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", objc_msgSend(v18, "deviceClass"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDeviceClass:", objc_msgSend(v10, "integerValue"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", objc_msgSend(v18, "tieBreaker"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTieBreaker:", objc_msgSend(v11, "integerValue"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", objc_msgSend(v18, "productType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProductType:", objc_msgSend(v12, "integerValue"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", objc_msgSend(v18, "deviceGroup"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDeviceGroup:", objc_msgSend(v13, "integerValue"));

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", objc_msgSend(*(id *)(a1 + 32), "deviceGroup"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "performSelector:withObject:", sel_setDeviceGroupWithNumber_, v14);

  }
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);
  if (!a3)
  {
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v17 = *(_QWORD *)(v15 + 40);
    v16 = (id *)(v15 + 40);
    if (!v17)
    {
      objc_storeStrong(v16, v6);
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a2);
    }
  }

}

void __73__AFArbitrationParticipationController__publishFeedbackArbitrationRecord__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "result") || (objc_msgSend(v3, "rawGoodnessScore"), v9 != 0.0))
  {
    objc_msgSend(v3, "requestStartDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
      objc_msgSend(v3, "requestStartDate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v5) = objc_msgSend(v5, "containsObject:", v6);

      if (!(_DWORD)v5)
      {
        objc_msgSend(*(id *)(a1 + 32), "settingsConnection");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "publishFeedbackArbitrationParticipation:", v3);

        v11 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
        objc_msgSend(v3, "requestStartDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v12);

        goto LABEL_13;
      }
      v7 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
      {
        v13 = 136315138;
        v14 = "-[AFArbitrationParticipationController _publishFeedbackArbitrationRecord]_block_invoke";
        v8 = "%s #myriad #feedback participation already published throwing out.";
LABEL_11:
        _os_log_debug_impl(&dword_19AF50000, v7, OS_LOG_TYPE_DEBUG, v8, (uint8_t *)&v13, 0xCu);
      }
    }
    else
    {
      v7 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
      {
        v13 = 136315138;
        v14 = "-[AFArbitrationParticipationController _publishFeedbackArbitrationRecord]_block_invoke";
        v8 = "%s #myriad #feedback participation without request start date, throwing out";
        goto LABEL_11;
      }
    }
  }
  else
  {
    v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      v13 = 136315138;
      v14 = "-[AFArbitrationParticipationController _publishFeedbackArbitrationRecord]_block_invoke";
      v8 = "%s #myriad #feedback removing participation with nil result";
      goto LABEL_11;
    }
  }
LABEL_13:

}

uint64_t __75__AFArbitrationParticipationController_requestWillPresentUsefulUserResult___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    v4 = 136315138;
    v5 = "-[AFArbitrationParticipationController requestWillPresentUsefulUserResult:]_block_invoke";
    _os_log_debug_impl(&dword_19AF50000, v2, OS_LOG_TYPE_DEBUG, "%s #myriad #feedback event: requestWillPresentUsefulUserResult", (uint8_t *)&v4, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_publishFeedbackArbitrationRecord");
}

uint64_t __61__AFArbitrationParticipationController_arbitrationEndedTask___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    v4 = 136315138;
    v5 = "-[AFArbitrationParticipationController arbitrationEndedTask:]_block_invoke";
    _os_log_debug_impl(&dword_19AF50000, v2, OS_LOG_TYPE_DEBUG, "%s #myriad #feedback event: arbitrationEndedTask", (uint8_t *)&v4, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_publishFeedbackArbitrationRecord");
}

uint64_t __68__AFArbitrationParticipationController_arbitrationEndedAdvertising___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    v4 = 136315138;
    v5 = "-[AFArbitrationParticipationController arbitrationEndedAdvertising:]_block_invoke";
    _os_log_debug_impl(&dword_19AF50000, v2, OS_LOG_TYPE_DEBUG, "%s #myriad #feedback event: arbitrationEndedAdvertising", (uint8_t *)&v4, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_resetSettingsConnection");
}

uint64_t __91__AFArbitrationParticipationController_arbitrationDidUpdateWithContext_session_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[AFArbitrationParticipationController arbitrationDidUpdateWithContext:session:completion:]_block_invoke";
    _os_log_debug_impl(&dword_19AF50000, v2, OS_LOG_TYPE_DEBUG, "%s #myriad #feedback event: arbitrationDidUpdateWithContext", buf, 0xCu);
  }
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "advertisements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "ownAdvertisement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(*(id *)(a1 + 40), "decisionIsWon");
  objc_msgSend(*(id *)(a1 + 40), "triggerType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "lastActivationTime");
  v10 = v9;
  objc_msgSend(*(id *)(a1 + 40), "requestStartDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "voiceTriggerDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "scoreBoosters");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v15) = objc_msgSend(*(id *)(a1 + 40), "deviceClass");
  objc_msgSend(v3, "_updateUserFeedbackParticipationAllAdvertisements:session:ownRecord:won:triggerType:lastActivationTime:requestStartDate:voiceTriggerDate:scoreBoosters:deviceClass:", v4, v5, v6, v7, v8, v11, v10, v12, v13, v15);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __68__AFArbitrationParticipationController_arbitrationSessionWillStart___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    v9 = 136315138;
    v10 = "-[AFArbitrationParticipationController arbitrationSessionWillStart:]_block_invoke";
    _os_log_debug_impl(&dword_19AF50000, v2, OS_LOG_TYPE_DEBUG, "%s #myriad #feedback event: arbitrationSessionWillStart", (uint8_t *)&v9, 0xCu);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeAllObjects");
  objc_msgSend(*(id *)(a1 + 40), "sessionId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    v6 = (void *)objc_opt_new();
    objc_msgSend(v5, "setValue:forKey:", v6, v4);

    v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      v9 = 136315394;
      v10 = "-[AFArbitrationParticipationController arbitrationSessionWillStart:]_block_invoke";
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_19AF50000, v7, OS_LOG_TYPE_INFO, "%s #myriad #feedback Created participation for %@", (uint8_t *)&v9, 0x16u);
    }
  }
  else
  {
    v8 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      v9 = 136315138;
      v10 = "-[AFArbitrationParticipationController arbitrationSessionWillStart:]_block_invoke";
      _os_log_debug_impl(&dword_19AF50000, v8, OS_LOG_TYPE_DEBUG, "%s #myriad #feedback myriad sessionid is nil. Returning", (uint8_t *)&v9, 0xCu);
    }
  }

}

@end
