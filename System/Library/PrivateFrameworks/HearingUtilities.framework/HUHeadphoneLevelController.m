@implementation HUHeadphoneLevelController

- (HUHeadphoneLevelController)init
{
  char *v2;
  void *v3;
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v16;
  dispatch_queue_t v17;
  void *v18;
  objc_super v20;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v20.receiver = self;
  v20.super_class = (Class)HUHeadphoneLevelController;
  v2 = -[HUHeadphoneLevelController init](&v20, sel_init);
  if (v2)
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x2050000000;
    v3 = (void *)getADAMAudioDataReceiverClass_softClass;
    v25 = getADAMAudioDataReceiverClass_softClass;
    if (!getADAMAudioDataReceiverClass_softClass)
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __getADAMAudioDataReceiverClass_block_invoke;
      v21[3] = &unk_1EA8E8270;
      v21[4] = &v22;
      __getADAMAudioDataReceiverClass_block_invoke((uint64_t)v21);
      v3 = (void *)v23[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v22, 8);
    v5 = [v4 alloc];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "initWithIdentifier:", v7);
    v9 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v8;

    objc_msgSend(*((id *)v2 + 3), "setDelegate:", v2);
    objc_msgSend(*((id *)v2 + 3), "stopReceivingAudioSampleType:", 1751213428);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.HearingUtilities.HUHeadphoneLevelController.DataQueue", v10);
    v12 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = v11;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CF3978]), "initWithTargetSerialQueue:", *((_QWORD *)v2 + 5));
    v14 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v13;

    if (objc_msgSend(MEMORY[0x1E0D2F990], "isInternalInstall"))
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_automationPlayAutomationAudioSamples, (CFStringRef)*MEMORY[0x1E0DDE160], 0, (CFNotificationSuspensionBehavior)0);
    }
    *(_WORD *)(v2 + 9) = 0;
    *((_QWORD *)v2 + 8) = 0;
    *((_QWORD *)v2 + 9) = 0;
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_queue_create("com.apple.HearingUtilities.HUHeadphoneLevelController.IDSQueue", v16);
    v18 = (void *)*((_QWORD *)v2 + 7);
    *((_QWORD *)v2 + 7) = v17;

    objc_msgSend(v2, "_startIDSConnection");
  }
  return (HUHeadphoneLevelController *)v2;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  -[ADAMAudioDataReceiver stopReceivingAudioSampleType:](self->_receiver, "stopReceivingAudioSampleType:", 1751213428);
  -[HUHeadphoneLevelController _stopIDSConnection](self, "_stopIDSConnection");
  -[HUHeadphoneLevelController _unregisterMediaNotification](self, "_unregisterMediaNotification");
  v4.receiver = self;
  v4.super_class = (Class)HUHeadphoneLevelController;
  -[HUHeadphoneLevelController dealloc](&v4, sel_dealloc);
}

+ (id)sharedController
{
  if (sharedController_onceToken != -1)
    dispatch_once(&sharedController_onceToken, &__block_literal_global);
  return (id)sharedController_Controller;
}

void __46__HUHeadphoneLevelController_sharedController__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedController_Controller;
  sharedController_Controller = v0;

}

- (id)registerForHeadphoneLevelUpdates:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint8_t v14[16];
  uint8_t buf[16];

  v4 = a3;
  objc_msgSend(v4, "payload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("ax_hearing_should_register_client_key"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  HCLogSoundMeter();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if ((_DWORD)v7)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DE311000, v8, OS_LOG_TYPE_INFO, "Local: Start receiving headphone audio updates", buf, 2u);
    }

    objc_msgSend(v4, "client");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v10;
    v12 = 1;
  }
  else
  {
    if (v9)
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1DE311000, v8, OS_LOG_TYPE_INFO, "Local: Stop receiving headphone audio updates", v14, 2u);
    }

    objc_msgSend(v4, "client");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v10;
    v12 = 0;
  }
  objc_msgSend(v11, "setWantsUpdates:forIdentifier:", v12, 0x100000);

  -[HUHeadphoneLevelController _startRecevingADAMAudioSample:](self, "_startRecevingADAMAudioSample:", v7);
  return 0;
}

- (void)_startRecevingADAMAudioSample:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  _BOOL4 v9;
  int v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  uint8_t v14[16];
  uint8_t buf[16];

  v3 = a3;
  +[AXHeardController sharedServer](AXHeardController, "sharedServer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countOfClientsListeningForIdentifier:", 0x100000);

  +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "anyGizmoLiveHeadphoneLevelEnabled");

  if (v8)
    v9 = -[HUHeadphoneLevelController shouldStreamingDataToGizmo](self, "shouldStreamingDataToGizmo");
  else
    v9 = 0;
  if (v6)
    v10 = 1;
  else
    v10 = v9;
  if (v3)
  {
    if (!v10)
      return;
    HCLogSoundMeter();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DE311000, v11, OS_LOG_TYPE_INFO, "Start receiving ADAM headphone audio data", buf, 2u);
    }

    -[HUHeadphoneLevelController receiver](self, "receiver");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "startReceivingAudioSampleType:", 1751213428);
  }
  else
  {
    if ((v10 & 1) != 0)
      return;
    HCLogSoundMeter();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1DE311000, v13, OS_LOG_TYPE_INFO, "Stop receiving ADAM headphone audio data", v14, 2u);
    }

    -[HUHeadphoneLevelController receiver](self, "receiver");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stopReceivingAudioSampleType:", 1751213428);
  }

}

- (void)restartADAMTimer
{
  AXDispatchTimer *adamSuspendedTimer;
  _QWORD v4[4];
  id v5;
  id location;

  -[AXDispatchTimer cancel](self->_adamSuspendedTimer, "cancel");
  objc_initWeak(&location, self);
  adamSuspendedTimer = self->_adamSuspendedTimer;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__HUHeadphoneLevelController_restartADAMTimer__block_invoke;
  v4[3] = &unk_1EA8E81D0;
  objc_copyWeak(&v5, &location);
  -[AXDispatchTimer afterDelay:processBlock:](adamSuspendedTimer, "afterDelay:processBlock:", v4, 0.2);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __46__HUHeadphoneLevelController_restartADAMTimer__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id *v3;
  id WeakRetained;
  id v5;
  double v6;
  id v7;
  double v8;
  id v9;
  id v10;
  uint8_t v11[16];

  HCLogSoundMeter();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1DE311000, v2, OS_LOG_TYPE_INFO, "Headphone level didn't receive measurements from ADAM", v11, 2u);
  }

  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "setMeasurementEnabled:", 0);

  v5 = objc_loadWeakRetained(v3);
  LODWORD(v6) = 0;
  objc_msgSend(v5, "setFastLeq:", v6);

  v7 = objc_loadWeakRetained(v3);
  LODWORD(v8) = 0;
  objc_msgSend(v7, "setSlowLeq:", v8);

  v9 = objc_loadWeakRetained(v3);
  objc_msgSend(v9, "pushValuesToLocalOrIDSListeners");

  v10 = objc_loadWeakRetained(v3);
  objc_msgSend(v10, "pushValuesToRemoteListeners");

}

- (id)_pushPayload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[HUHeadphoneLevelController slowLeq](self, "slowLeq");
  objc_msgSend(v4, "numberWithFloat:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[HUHeadphoneLevelController fastLeq](self, "fastLeq");
  objc_msgSend(v6, "numberWithFloat:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HUHeadphoneLevelController isMeasurementEnabled](self, "isMeasurementEnabled"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HUHeadphoneLevelController thresholdLevel](self, "thresholdLevel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", v5, CFSTR("HUEDSlowLeqIdentifier"), v7, CFSTR("HUEDFastLeqIdentifier"), v8, CFSTR("HUEDEnabledIdentifier"), v9, CFSTR("HUEDThresholdCrossedIdentifier"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)pushValuesToLocalOrIDSListeners
{
  NSObject *v3;
  void *v4;
  int v5;
  id v6;

  -[HUHeadphoneLevelController dataQueue](self, "dataQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HUHeadphoneLevelController _pushPayload](self, "_pushPayload");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[HUHeadphoneLevelController _pushValues:identifier:](self, "_pushValues:identifier:");
  +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "anyGizmoLiveHeadphoneLevelEnabled");

  if (v5)
    -[HUHeadphoneLevelController _publishAudioDataIDSMessage:](self, "_publishAudioDataIDSMessage:", v6);

}

- (void)pushValuesToRemoteListeners
{
  NSObject *v3;
  void *v4;
  int v5;
  id v6;

  -[HUHeadphoneLevelController dataQueue](self, "dataQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HUHeadphoneLevelController _pushPayload](self, "_pushPayload");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "anyGizmoLiveHeadphoneLevelEnabled");

  if (v5)
    -[HUHeadphoneLevelController _pushValues:identifier:](self, "_pushValues:identifier:", v6, 0x200000);

}

- (void)pushValuesToRemoteChangeListeners
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[HUHeadphoneLevelController dataQueue](self, "dataQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "anyGizmoLiveHeadphoneLevelEnabled");

  if (v5)
  {
    v8 = CFSTR("HUGizmoAudioLevelIdentifier");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HUHeadphoneLevelController streamingToGizmoAudioLevel](self, "streamingToGizmoAudioLevel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUHeadphoneLevelController _pushValues:identifier:](self, "_pushValues:identifier:", v7, 0x400000);

  }
}

- (void)_pushValues:(id)a3 identifier:(unint64_t)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  +[AXHeardController sharedServer](AXHeardController, "sharedServer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countOfClientsListeningForIdentifier:", a4);

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D2F990], "messagePayloadFromDictionary:andIdentifier:", v10, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[AXHeardController sharedServer](AXHeardController, "sharedServer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D2F9A0], "messageWithPayload:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sendUpdateMessage:forIdentifier:", v9, a4);

  }
}

- (void)receiveAudioSample:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HUHeadphoneLevelController *v9;

  v4 = a3;
  -[HUHeadphoneLevelController dataQueue](self, "dataQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__HUHeadphoneLevelController_receiveAudioSample___block_invoke;
  v7[3] = &unk_1EA8E81F8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __49__HUHeadphoneLevelController_receiveAudioSample___block_invoke(uint64_t a1)
{
  void *v2;
  float v3;
  float v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  double v9;
  void *v10;
  uint64_t v11;

  objc_msgSend(*(id *)(a1 + 32), "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v4 = v3;

  objc_msgSend(*(id *)(a1 + 32), "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  getADAFMetadataKeyHAEDataForGauge();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  v10 = *(void **)(a1 + 40);
  if (v8)
  {
    *(float *)&v9 = v4;
    objc_msgSend(v10, "setFastLeq:", v9);
  }
  else
  {
    *(float *)&v9 = v4;
    objc_msgSend(v10, "setSlowLeq:", v9);
    if (v4 < 80.0)
      v11 = 0;
    else
      v11 = 80;
    objc_msgSend(*(id *)(a1 + 40), "setThresholdLevel:", v11);
  }
  objc_msgSend(*(id *)(a1 + 40), "setMeasurementEnabled:", 1);
  objc_msgSend(*(id *)(a1 + 40), "pushValuesToLocalOrIDSListeners");
  return objc_msgSend(*(id *)(a1 + 40), "restartADAMTimer");
}

- (id)registerForRemoteHeadphoneLevelUpdates:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;

  v4 = a3;
  +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "anyGizmoLiveHeadphoneLevelEnabled");

  if (v6)
    v7 = -[HUHeadphoneLevelController _sendIDSRequestToCompanion:messageIdentifier:](self, "_sendIDSRequestToCompanion:messageIdentifier:", v4, 0x200000);

  return 0;
}

- (id)registerForRemoteHeadphoneLevelChangesUpdates:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;

  v4 = a3;
  +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "anyGizmoLiveHeadphoneLevelEnabled");

  if (v6)
    v7 = -[HUHeadphoneLevelController _sendIDSRequestToCompanion:messageIdentifier:](self, "_sendIDSRequestToCompanion:messageIdentifier:", v4, 0x400000);

  return 0;
}

- (id)_sendIDSRequestToCompanion:(id)a3 messageIdentifier:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t *v14;
  const __CFString **v15;
  _BOOL4 v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  const __CFString *v21;
  uint64_t v22;
  const __CFString *v23;
  uint64_t v24;
  uint8_t buf[4];
  unint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("ax_hearing_should_register_client_key"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  objc_msgSend(v6, "client");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setWantsUpdates:forIdentifier:", v9, a4);
  if ((_DWORD)v9)
  {
    HCLogSoundMeter();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v26 = a4;
      _os_log_impl(&dword_1DE311000, v11, OS_LOG_TYPE_INFO, "Remote: Start requesting headphone audio updates for %llu", buf, 0xCu);
    }

    v12 = (void *)MEMORY[0x1E0D2F990];
    v23 = CFSTR("HUGizmoIDSRequestDataKey");
    v24 = MEMORY[0x1E0C9AAB0];
    v13 = (void *)MEMORY[0x1E0C99D80];
    v14 = &v24;
    v15 = &v23;
  }
  else
  {
    v16 = -[HUHeadphoneLevelController isConnectedToIDS](self, "isConnectedToIDS");
    HCLogSoundMeter();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
    if (!v16)
    {
      if (v18)
      {
        *(_DWORD *)buf = 134217984;
        v26 = a4;
        _os_log_impl(&dword_1DE311000, v17, OS_LOG_TYPE_INFO, "Remote: Don't send Stop Updates message, already stopped for %llu", buf, 0xCu);
      }
      goto LABEL_13;
    }
    if (v18)
    {
      *(_DWORD *)buf = 134217984;
      v26 = a4;
      _os_log_impl(&dword_1DE311000, v17, OS_LOG_TYPE_INFO, "Remote: Stop requesting headphone audio updates for %llu", buf, 0xCu);
    }

    v12 = (void *)MEMORY[0x1E0D2F990];
    v21 = CFSTR("HUGizmoIDSRequestDataKey");
    v22 = MEMORY[0x1E0C9AAA0];
    v13 = (void *)MEMORY[0x1E0C99D80];
    v14 = &v22;
    v15 = &v21;
  }
  objc_msgSend(v13, "dictionaryWithObjects:forKeys:count:", v14, v15, 1, v21, v22, v23, v24);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "messagePayloadFromDictionary:andIdentifier:", v19, a4);
  v17 = objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[HUHeadphoneLevelController _publishRequestAudioDataIDSMessage:](self, "_publishRequestAudioDataIDSMessage:", v17);
LABEL_13:

  }
  return 0;
}

- (void)_startIDSConnection
{
  void *v3;
  int v4;
  NSObject *v5;
  _QWORD block[5];

  +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "anyGizmoLiveHeadphoneLevelEnabled");

  if (v4)
  {
    -[HUHeadphoneLevelController setIsConnectedToIDS:](self, "setIsConnectedToIDS:", 1);
    -[HUHeadphoneLevelController idsQueue](self, "idsQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__HUHeadphoneLevelController__startIDSConnection__block_invoke;
    block[3] = &unk_1EA8E8220;
    block[4] = self;
    dispatch_async(v5, block);

  }
}

void __49__HUHeadphoneLevelController__startIDSConnection__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!AXIDSServicesLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1EA8E82A8;
    v8 = 0;
    AXIDSServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (AXIDSServicesLibraryCore_frameworkLibrary)
  {
    objc_msgSend(getAXIDSServicesClass(), "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "containsClient:", *(_QWORD *)(a1 + 32));

    if ((v3 & 1) == 0)
    {
      AXLogIDS();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_QWORD *)(a1 + 32);
        LODWORD(v7) = 138412290;
        *(_QWORD *)((char *)&v7 + 4) = v5;
        _os_log_impl(&dword_1DE311000, v4, OS_LOG_TYPE_DEFAULT, "_startIDSConnection %@", (uint8_t *)&v7, 0xCu);
      }

      objc_msgSend(getAXIDSServicesClass(), "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "registerForIncomingData:", *(_QWORD *)(a1 + 32));

    }
  }
}

- (void)_stopIDSConnection
{
  void *v3;
  int v4;
  NSObject *v5;
  _QWORD block[5];

  +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "anyGizmoLiveHeadphoneLevelEnabled");

  if (v4)
  {
    -[HUHeadphoneLevelController setIsConnectedToIDS:](self, "setIsConnectedToIDS:", 0);
    -[HUHeadphoneLevelController idsQueue](self, "idsQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__HUHeadphoneLevelController__stopIDSConnection__block_invoke;
    block[3] = &unk_1EA8E8220;
    block[4] = self;
    dispatch_async(v5, block);

  }
}

void __48__HUHeadphoneLevelController__stopIDSConnection__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!AXIDSServicesLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1EA8E82A8;
    v8 = 0;
    AXIDSServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (AXIDSServicesLibraryCore_frameworkLibrary)
  {
    objc_msgSend(getAXIDSServicesClass(), "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "containsClient:", *(_QWORD *)(a1 + 32));

    if (v3)
    {
      AXLogIDS();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_QWORD *)(a1 + 32);
        LODWORD(v7) = 138412290;
        *(_QWORD *)((char *)&v7 + 4) = v5;
        _os_log_impl(&dword_1DE311000, v4, OS_LOG_TYPE_DEFAULT, "_stopIDSConnection %@", (uint8_t *)&v7, 0xCu);
      }

      objc_msgSend(getAXIDSServicesClass(), "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "deregisterForIncomingData:", *(_QWORD *)(a1 + 32));

    }
  }
}

- (void)_publishAudioDataIDSMessage:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "anyGizmoLiveHeadphoneLevelEnabled");

  if (v6)
  {
    -[HUHeadphoneLevelController idsQueue](self, "idsQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __58__HUHeadphoneLevelController__publishAudioDataIDSMessage___block_invoke;
    v8[3] = &unk_1EA8E81F8;
    v8[4] = self;
    v9 = v4;
    dispatch_async(v7, v8);

  }
}

void __58__HUHeadphoneLevelController__publishAudioDataIDSMessage___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint8_t buf[16];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "shouldStreamingDataToGizmo"))
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "streamingDataToGizmoType") & 0x200000) != 0)
    {
      HCLogSoundMeter();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DE311000, v3, OS_LOG_TYPE_INFO, "Publishing audio data(HCMessageIdentifierRemoteHeadphoneLevelUpdates) to Gizmo.", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0D2F990], "messagePayloadFromDictionary:andIdentifier:", *(_QWORD *)(a1 + 40), 0x200000);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if (v2)
      {
        if (!AXIDSServicesLibraryCore_frameworkLibrary)
        {
          *(_OWORD *)buf = xmmword_1EA8E82A8;
          v16 = 0;
          AXIDSServicesLibraryCore_frameworkLibrary = _sl_dlopen();
        }
        if (AXIDSServicesLibraryCore_frameworkLibrary)
        {
          objc_msgSend(getAXIDSServicesClass(), "sharedInstance");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = (id)objc_msgSend(v4, "publishDirectIDSMessage:", v2);

        }
      }
    }
    else
    {
      v2 = 0;
    }
    if ((objc_msgSend(*(id *)(a1 + 32), "streamingDataToGizmoType") & 0x400000) != 0
      && (v6 = objc_msgSend(*(id *)(a1 + 32), "_audioLevelFromAudioDict:", *(_QWORD *)(a1 + 40)),
          objc_msgSend(*(id *)(a1 + 32), "streamingToGizmoAudioLevel") != v6))
    {
      HCLogSoundMeter();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DE311000, v8, OS_LOG_TYPE_INFO, "Publishing audio data(HCMessageIdentifierRemoteHeadphoneLevelChangesUpdates) to Gizmo.", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "setStreamingToGizmoAudioLevel:", v6);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "streamingToGizmoAudioLevel", CFSTR("HUGizmoAudioLevelIdentifier")));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D2F990], "messagePayloadFromDictionary:andIdentifier:", v10, 0x400000);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        if (!AXIDSServicesLibraryCore_frameworkLibrary)
        {
          *(_OWORD *)buf = xmmword_1EA8E82A8;
          v16 = 0;
          AXIDSServicesLibraryCore_frameworkLibrary = _sl_dlopen();
        }
        if (AXIDSServicesLibraryCore_frameworkLibrary)
        {
          objc_msgSend(getAXIDSServicesClass(), "sharedInstance");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = (id)objc_msgSend(v11, "publishDirectIDSMessage:", v7);

        }
      }

    }
    else
    {
      v7 = v2;
    }

  }
}

- (unint64_t)_audioLevelFromAudioDict:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  float v7;
  float v8;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("HUEDEnabledIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("HUEDSlowLeqIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "floatValue");
  v8 = v7;

  if (!v5)
    return 1;
  if (v8 >= 0.0 && v8 < 80.0)
    return 2;
  if (v8 >= 80.0)
    return 3;
  return 0;
}

- (void)_publishRequestAudioDataIDSMessage:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;

  v4 = a3;
  +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "anyGizmoLiveHeadphoneLevelEnabled");

  if (v6)
  {
    -[HUHeadphoneLevelController idsQueue](self, "idsQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__HUHeadphoneLevelController__publishRequestAudioDataIDSMessage___block_invoke;
    block[3] = &unk_1EA8E8220;
    v9 = v4;
    dispatch_async(v7, block);

  }
}

void __65__HUHeadphoneLevelController__publishRequestAudioDataIDSMessage___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  HCLogSoundMeter();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    LOWORD(v5) = 0;
    _os_log_impl(&dword_1DE311000, v2, OS_LOG_TYPE_INFO, "Publishing request audio data to Companion.", (uint8_t *)&v5, 2u);
  }

  if (!AXIDSServicesLibraryCore_frameworkLibrary)
  {
    v5 = xmmword_1EA8E82A8;
    v6 = 0;
    AXIDSServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (AXIDSServicesLibraryCore_frameworkLibrary)
  {
    objc_msgSend(getAXIDSServicesClass(), "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)objc_msgSend(v3, "publishDirectIDSMessage:", *(_QWORD *)(a1 + 32));

  }
}

- (void)didReceiveIncomingData:(id)a3
{
  id v4;
  void *v5;
  int v6;
  _QWORD *AXIDSServiceMessageKeySymbolLoc;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[5];
  id v17;
  uint64_t v18;
  _QWORD block[4];
  id v20;
  HUHeadphoneLevelController *v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "anyGizmoLiveHeadphoneLevelEnabled");

  if (v6)
  {
    if (!AXIDSServicesLibraryCore_frameworkLibrary)
    {
      v23 = xmmword_1EA8E82A8;
      v24 = 0;
      AXIDSServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    }
    if (AXIDSServicesLibraryCore_frameworkLibrary && getAXIDSServiceMessageKeySymbolLoc())
    {
      AXIDSServiceMessageKeySymbolLoc = getAXIDSServiceMessageKeySymbolLoc();
      if (!AXIDSServiceMessageKeySymbolLoc)
        getADAFMetadataKeyHAEDataForGauge_cold_1();
      objc_msgSend(v4, "objectForKeyedSubscript:", *AXIDSServiceMessageKeySymbolLoc);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = (void *)MEMORY[0x1E0C9AA70];
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D2F8F8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "unsignedLongLongValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D2F900]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("HUGizmoIDSRequestDataKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[HUHeadphoneLevelController idsQueue](self, "idsQueue");
      v13 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __53__HUHeadphoneLevelController_didReceiveIncomingData___block_invoke;
      block[3] = &unk_1EA8E8248;
      v20 = v11;
      v21 = self;
      v22 = v10;
      dispatch_async(v13, block);

      v14 = v20;
    }
    else
    {
      if (!v11)
      {
LABEL_14:

        goto LABEL_15;
      }
      -[HUHeadphoneLevelController dataQueue](self, "dataQueue");
      v15 = objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __53__HUHeadphoneLevelController_didReceiveIncomingData___block_invoke_14;
      v16[3] = &unk_1EA8E8248;
      v18 = v10;
      v16[4] = self;
      v17 = v11;
      dispatch_async(v15, v16);

      v14 = v17;
    }

    goto LABEL_14;
  }
LABEL_15:

}

void __53__HUHeadphoneLevelController_didReceiveIncomingData___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  _DWORD v11[2];
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("HUGizmoIDSRequestDataKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  v4 = *(void **)(a1 + 40);
  if (v3)
  {
    v5 = *(_QWORD *)(a1 + 48) | objc_msgSend(*(id *)(a1 + 40), "streamingDataToGizmoType");
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 48);
    v5 = objc_msgSend(*(id *)(a1 + 40), "streamingDataToGizmoType") & ~v6;
  }
  objc_msgSend(v4, "setStreamingDataToGizmoType:", v5);
  if (*(_QWORD *)(a1 + 48) == 0x400000)
    objc_msgSend(*(id *)(a1 + 40), "setStreamingToGizmoAudioLevel:", 1);
  if ((objc_msgSend(*(id *)(a1 + 40), "streamingDataToGizmoType") & 0x200000) != 0)
    v7 = 1;
  else
    v7 = ((unint64_t)objc_msgSend(*(id *)(a1 + 40), "streamingDataToGizmoType") >> 22) & 1;
  objc_msgSend(*(id *)(a1 + 40), "setShouldStreamingDataToGizmo:", v7);
  objc_msgSend(*(id *)(a1 + 40), "_startRecevingADAMAudioSample:", objc_msgSend(*(id *)(a1 + 40), "shouldStreamingDataToGizmo"));
  HCLogSoundMeter();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = objc_msgSend(*(id *)(a1 + 40), "shouldStreamingDataToGizmo");
    v10 = objc_msgSend(*(id *)(a1 + 40), "streamingDataToGizmoType");
    v11[0] = 67109376;
    v11[1] = v9;
    v12 = 2048;
    v13 = v10;
    _os_log_impl(&dword_1DE311000, v8, OS_LOG_TYPE_INFO, "Receiving request audio data from Gizmo. shouldStreamingDataToGizmo: %i, streamingDataToGizmoType: %llu", (uint8_t *)v11, 0x12u);
  }

}

void __53__HUHeadphoneLevelController_didReceiveIncomingData___block_invoke_14(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  float v8;
  void *v9;
  uint8_t v10[16];

  HCLogSoundMeter();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1DE311000, v2, OS_LOG_TYPE_INFO, "Receiving audio data from Companion.", v10, 2u);
  }

  v3 = *(_QWORD *)(a1 + 48);
  if (v3 == 0x400000)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("HUGizmoAudioLevelIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setStreamingToGizmoAudioLevel:", objc_msgSend(v9, "unsignedIntegerValue"));

    objc_msgSend(*(id *)(a1 + 32), "pushValuesToRemoteChangeListeners");
  }
  else if (v3 == 0x200000)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("HUEDSlowLeqIdentifier"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "floatValue");
    objc_msgSend(*(id *)(a1 + 32), "setSlowLeq:");

    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("HUEDFastLeqIdentifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "floatValue");
    objc_msgSend(*(id *)(a1 + 32), "setFastLeq:");

    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("HUEDEnabledIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setMeasurementEnabled:", objc_msgSend(v6, "BOOLValue"));

    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("HUEDThresholdCrossedIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "floatValue");
    objc_msgSend(*(id *)(a1 + 32), "setThresholdLevel:", (unint64_t)v8);

    objc_msgSend(*(id *)(a1 + 32), "pushValuesToRemoteListeners");
  }
}

- (void)connectedDevicesDidChange:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  if (!objc_msgSend(a3, "count")
    && -[HUHeadphoneLevelController shouldStreamingDataToGizmo](self, "shouldStreamingDataToGizmo"))
  {
    HCLogSoundMeter();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1DE311000, v4, OS_LOG_TYPE_INFO, "Gizmo is not connected anymore. Stop streaming to Gizmo.", v5, 2u);
    }

    -[HUHeadphoneLevelController setShouldStreamingDataToGizmo:](self, "setShouldStreamingDataToGizmo:", 0);
    -[HUHeadphoneLevelController _startRecevingADAMAudioSample:](self, "_startRecevingADAMAudioSample:", -[HUHeadphoneLevelController shouldStreamingDataToGizmo](self, "shouldStreamingDataToGizmo"));
  }
}

- (void)serverConnectionWasInterrupted
{
  NSObject *v3;
  uint8_t buf[16];

  HCLogSoundMeter();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DE311000, v3, OS_LOG_TYPE_INFO, "Lost connection to AXUIServer", buf, 2u);
  }

  -[HUHeadphoneLevelController setIsConnectedToIDS:](self, "setIsConnectedToIDS:", 0);
  if (-[HUHeadphoneLevelController shouldStreamingDataToGizmo](self, "shouldStreamingDataToGizmo"))
    AXPerformBlockOnMainThreadAfterDelay();
  else
    -[HUHeadphoneLevelController _registerMediaNotification](self, "_registerMediaNotification");
}

uint64_t __60__HUHeadphoneLevelController_serverConnectionWasInterrupted__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  HCLogSoundMeter();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DE311000, v2, OS_LOG_TYPE_INFO, "Restarting AXUIServer + IDS connection", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_startIDSConnection");
}

- (void)_registerMediaNotification
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint8_t v7[16];

  HCLogSoundMeter();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1DE311000, v3, OS_LOG_TYPE_INFO, "Start observing media playback", v7, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0D48000];
  objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__mediaPlaybackDidChange_, v5, v6);

}

- (void)_unregisterMediaNotification
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint8_t v7[16];

  HCLogSoundMeter();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1DE311000, v3, OS_LOG_TYPE_INFO, "Stop observing media playback", v7, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0D48000];
  objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, v5, v6);

}

- (void)_mediaPlaybackDidChange:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  _DWORD v8[2];
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D48008]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  HCLogSoundMeter();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8[0] = 67109376;
    v8[1] = v6;
    v9 = 1024;
    v10 = -[HUHeadphoneLevelController isConnectedToIDS](self, "isConnectedToIDS");
    _os_log_impl(&dword_1DE311000, v7, OS_LOG_TYPE_INFO, "Receive play back notification. isPlaying %i, isCompanionConnectedToIDS %i", (uint8_t *)v8, 0xEu);
  }

  if (v6)
  {
    if (!-[HUHeadphoneLevelController isConnectedToIDS](self, "isConnectedToIDS"))
    {
      -[HUHeadphoneLevelController _startIDSConnection](self, "_startIDSConnection");
      -[HUHeadphoneLevelController _unregisterMediaNotification](self, "_unregisterMediaNotification");
    }
  }
}

- (void)_automationStartPlayingSampleData:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  double v9;
  void *v10;
  dispatch_time_t v11;
  NSObject *dataQueue;
  _QWORD block[5];
  id v14;
  double v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HCLogSoundMeter();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DE311000, v5, OS_LOG_TYPE_INFO, "Received automation request for sample headphone level data", buf, 2u);
  }

  if (objc_msgSend(v4, "count"))
  {
    -[HUHeadphoneLevelController automationSampleData](self, "automationSampleData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      HCLogSoundMeter();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v17 = 0x3FB999999999999ALL;
        _os_log_impl(&dword_1DE311000, v8, OS_LOG_TYPE_INFO, "Waiting %fs for current automation sample to finish", buf, 0xCu);
      }

      -[HUHeadphoneLevelController setAutomationSampleData:](self, "setAutomationSampleData:", 0);
      v9 = 0.1;
    }
    else
    {
      v10 = (void *)objc_msgSend(v4, "mutableCopy");
      -[HUHeadphoneLevelController setAutomationSampleData:](self, "setAutomationSampleData:", v10);

      v9 = 0.0;
    }
    v11 = dispatch_time(0, (uint64_t)(v9 * 1000000000.0));
    dataQueue = self->_dataQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__HUHeadphoneLevelController__automationStartPlayingSampleData___block_invoke;
    block[3] = &unk_1EA8E8248;
    v15 = v9;
    block[4] = self;
    v14 = v4;
    dispatch_after(v11, dataQueue, block);

  }
  else
  {
    -[HUHeadphoneLevelController setAutomationSampleData:](self, "setAutomationSampleData:", 0);
  }

}

uint64_t __64__HUHeadphoneLevelController__automationStartPlayingSampleData___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v5[16];

  HCLogSoundMeter();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1DE311000, v2, OS_LOG_TYPE_INFO, "Starting new automation sample", v5, 2u);
  }

  if (*(double *)(a1 + 48) != 0.0)
  {
    v3 = (void *)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
    objc_msgSend(*(id *)(a1 + 32), "setAutomationSampleData:", v3);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_automationPlaySampleData");
}

- (void)_automationPlaySampleData
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  double v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  objc_class *v16;
  id v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  dispatch_time_t v25;
  NSObject *dataQueue;
  _QWORD block[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  __int128 buf;
  HUComfortSoundsAssetManager *(*v35)(uint64_t);
  void *v36;
  uint64_t *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  -[HUHeadphoneLevelController automationSampleData](self, "automationSampleData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4
    && objc_msgSend(MEMORY[0x1E0D2F990], "isInternalInstall")
    && _AXSAutomationEnabled())
  {
    -[HUHeadphoneLevelController automationSampleData](self, "automationSampleData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "floatValue");
    v8 = v7;

    -[HUHeadphoneLevelController automationSampleData](self, "automationSampleData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeLastObject");

    v10 = fmod((double)v4, 10.0);
    v11 = objc_alloc(MEMORY[0x1E0CB3588]);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "initWithStartDate:duration:", v12, 0.100000001);

    v28 = 0;
    v29 = &v28;
    v30 = 0x2050000000;
    v14 = (void *)getADAMAudioDataAnalysisSampleClass_softClass;
    v31 = getADAMAudioDataAnalysisSampleClass_softClass;
    v15 = MEMORY[0x1E0C809B0];
    if (!getADAMAudioDataAnalysisSampleClass_softClass)
    {
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v35 = __getADAMAudioDataAnalysisSampleClass_block_invoke;
      v36 = &unk_1EA8E8270;
      v37 = &v28;
      __getADAMAudioDataAnalysisSampleClass_block_invoke((uint64_t)&buf);
      v14 = (void *)v29[3];
    }
    v16 = objc_retainAutorelease(v14);
    _Block_object_dispose(&v28, 8);
    v17 = [v16 alloc];
    LODWORD(v18) = v8;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    getADAFMetadataKeyHAEDataForGauge();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v20;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10 != 0.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v17, "initAudioSampleWithType:data:dateInterval:metadata:", 1751213428, v19, v13, v22);

    HCLogSoundMeter();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v23;
      _os_log_impl(&dword_1DE311000, v24, OS_LOG_TYPE_INFO, "Processing automation request for sample %@", (uint8_t *)&buf, 0xCu);
    }

    -[HUHeadphoneLevelController receiveAudioSample:](self, "receiveAudioSample:", v23);
    v25 = dispatch_time(0, 100000001);
    dataQueue = self->_dataQueue;
    block[0] = v15;
    block[1] = 3221225472;
    block[2] = __55__HUHeadphoneLevelController__automationPlaySampleData__block_invoke;
    block[3] = &unk_1EA8E8220;
    block[4] = self;
    dispatch_after(v25, dataQueue, block);

  }
  else
  {
    HCLogSoundMeter();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1DE311000, v13, OS_LOG_TYPE_INFO, "No automation sample data left", (uint8_t *)&buf, 2u);
    }
  }

}

uint64_t __55__HUHeadphoneLevelController__automationPlaySampleData__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_automationPlaySampleData");
}

- (BOOL)isMeasurementEnabled
{
  return self->_measurementEnabled;
}

- (void)setMeasurementEnabled:(BOOL)a3
{
  self->_measurementEnabled = a3;
}

- (ADAMAudioDataReceiver)receiver
{
  return self->_receiver;
}

- (void)setReceiver:(id)a3
{
  objc_storeStrong((id *)&self->_receiver, a3);
}

- (AXDispatchTimer)adamSuspendedTimer
{
  return self->_adamSuspendedTimer;
}

- (void)setAdamSuspendedTimer:(id)a3
{
  objc_storeStrong((id *)&self->_adamSuspendedTimer, a3);
}

- (OS_dispatch_queue)dataQueue
{
  return self->_dataQueue;
}

- (void)setDataQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dataQueue, a3);
}

- (float)slowLeq
{
  return self->_slowLeq;
}

- (void)setSlowLeq:(float)a3
{
  self->_slowLeq = a3;
}

- (float)fastLeq
{
  return self->_fastLeq;
}

- (void)setFastLeq:(float)a3
{
  self->_fastLeq = a3;
}

- (unint64_t)thresholdLevel
{
  return self->_thresholdLevel;
}

- (void)setThresholdLevel:(unint64_t)a3
{
  self->_thresholdLevel = a3;
}

- (BOOL)isConnectedToIDS
{
  return self->_isConnectedToIDS;
}

- (void)setIsConnectedToIDS:(BOOL)a3
{
  self->_isConnectedToIDS = a3;
}

- (OS_dispatch_queue)idsQueue
{
  return self->_idsQueue;
}

- (void)setIdsQueue:(id)a3
{
  objc_storeStrong((id *)&self->_idsQueue, a3);
}

- (BOOL)shouldStreamingDataToGizmo
{
  return self->_shouldStreamingDataToGizmo;
}

- (void)setShouldStreamingDataToGizmo:(BOOL)a3
{
  self->_shouldStreamingDataToGizmo = a3;
}

- (unint64_t)streamingDataToGizmoType
{
  return self->_streamingDataToGizmoType;
}

- (void)setStreamingDataToGizmoType:(unint64_t)a3
{
  self->_streamingDataToGizmoType = a3;
}

- (unint64_t)streamingToGizmoAudioLevel
{
  return self->_streamingToGizmoAudioLevel;
}

- (void)setStreamingToGizmoAudioLevel:(unint64_t)a3
{
  self->_streamingToGizmoAudioLevel = a3;
}

- (NSMutableArray)automationSampleData
{
  return self->_automationSampleData;
}

- (void)setAutomationSampleData:(id)a3
{
  objc_storeStrong((id *)&self->_automationSampleData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_automationSampleData, 0);
  objc_storeStrong((id *)&self->_idsQueue, 0);
  objc_storeStrong((id *)&self->_dataQueue, 0);
  objc_storeStrong((id *)&self->_adamSuspendedTimer, 0);
  objc_storeStrong((id *)&self->_receiver, 0);
}

@end
