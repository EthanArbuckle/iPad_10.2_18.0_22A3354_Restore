@implementation CSVoiceTriggerAOPModeEnabledPolicyIOS

- (CSVoiceTriggerAOPModeEnabledPolicyIOS)init
{
  CSVoiceTriggerAOPModeEnabledPolicyIOS *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *recordStateQueue;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CSVoiceTriggerAOPModeEnabledPolicyIOS;
  v2 = -[CSPolicy init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("CSVoiceTriggerAOPModeEnabledPolicyIOS RecordState queue", 0);
    recordStateQueue = v2->_recordStateQueue;
    v2->_recordStateQueue = (OS_dispatch_queue *)v3;

    v2->_isAssistantClientConsideredAsRecord = 0;
    -[CSVoiceTriggerAOPModeEnabledPolicyIOS _addVoiceTriggerAOPModeEnabledConditions](v2, "_addVoiceTriggerAOPModeEnabledConditions");
    -[CSVoiceTriggerAOPModeEnabledPolicyIOS _subscribeEventMonitors](v2, "_subscribeEventMonitors");
    objc_msgSend(MEMORY[0x1E0D191F0], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "registerObserver:", v2);

    +[CSIntuitiveConvAudioCaptureMonitor sharedInstance](CSIntuitiveConvAudioCaptureMonitor, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "registerObserver:", v2);

  }
  return v2;
}

- (void)_subscribeEventMonitors
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
  id v12;

  if (objc_msgSend(MEMORY[0x1E0D19260], "isIOSDeviceSupportingBargeIn"))
  {
    objc_msgSend(MEMORY[0x1E0D19080], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v3);

    objc_msgSend(MEMORY[0x1E0D19018], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v4);

    objc_msgSend(MEMORY[0x1E0D191B8], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v5);

  }
  objc_msgSend(MEMORY[0x1E0D19210], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v6);

  objc_msgSend(MEMORY[0x1E0D18FB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v7);

  +[CSCommandControlStreamEventMonitor sharedInstance](CSCommandControlStreamEventMonitor, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v8);

  +[CSAttSiriStateMonitor sharedInstance](CSAttSiriStateMonitor, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v9);

  objc_msgSend(MEMORY[0x1E0D19048], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v10);

  if (objc_msgSend(MEMORY[0x1E0D19260], "supportHandsFree"))
  {
    objc_msgSend(MEMORY[0x1E0D191A0], "phoneCallStateMonitor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v11);

    +[CSMXRingtoneMonitor sharedInstance](CSMXRingtoneMonitor, "sharedInstance");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[CSPolicy subscribeEventMonitor:](self, "subscribeEventMonitor:", v12);

  }
}

- (void)_addVoiceTriggerAOPModeEnabledConditions
{
  void *v3;
  int v4;
  void *v5;

  if (objc_msgSend(MEMORY[0x1E0D19260], "isIOSDeviceSupportingBargeIn")
    && (objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "forceVoiceTriggerAPMode"),
        v3,
        v4))
  {
    v5 = &__block_literal_global_12551;
  }
  else
  {
    if (objc_msgSend(MEMORY[0x1E0D19260], "isIOSDeviceSupportingBargeIn"))
    {
      -[CSVoiceTriggerAOPModeEnabledPolicyIOS _addConditionsForIOSBargeIn](self, "_addConditionsForIOSBargeIn");
      return;
    }
    if (CSHasAOP())
    {
      -[CSVoiceTriggerAOPModeEnabledPolicyIOS _addConditionsForIOSAOP](self, "_addConditionsForIOSAOP");
      return;
    }
    v5 = &__block_literal_global_15_12552;
  }
  -[CSPolicy addConditions:](self, "addConditions:", v5);
}

- (void)_addConditionsForIOSBargeIn
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __68__CSVoiceTriggerAOPModeEnabledPolicyIOS__addConditionsForIOSBargeIn__block_invoke;
  v14[3] = &unk_1E7C26130;
  objc_copyWeak(&v15, &location);
  -[CSPolicy addConditions:](self, "addConditions:", v14);
  -[CSPolicy addConditions:](self, "addConditions:", &__block_literal_global_18_12530);
  v12[0] = v3;
  v12[1] = 3221225472;
  v12[2] = __68__CSVoiceTriggerAOPModeEnabledPolicyIOS__addConditionsForIOSBargeIn__block_invoke_19;
  v12[3] = &unk_1E7C26130;
  objc_copyWeak(&v13, &location);
  -[CSPolicy addConditions:](self, "addConditions:", v12);
  v10[0] = v3;
  v10[1] = 3221225472;
  v10[2] = __68__CSVoiceTriggerAOPModeEnabledPolicyIOS__addConditionsForIOSBargeIn__block_invoke_20;
  v10[3] = &unk_1E7C26130;
  objc_copyWeak(&v11, &location);
  -[CSPolicy addConditions:](self, "addConditions:", v10);
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __68__CSVoiceTriggerAOPModeEnabledPolicyIOS__addConditionsForIOSBargeIn__block_invoke_23;
  v8[3] = &unk_1E7C26130;
  objc_copyWeak(&v9, &location);
  -[CSPolicy addConditions:](self, "addConditions:", v8);
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __68__CSVoiceTriggerAOPModeEnabledPolicyIOS__addConditionsForIOSBargeIn__block_invoke_24;
  v6[3] = &unk_1E7C26130;
  objc_copyWeak(&v7, &location);
  -[CSPolicy addConditions:](self, "addConditions:", v6);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __68__CSVoiceTriggerAOPModeEnabledPolicyIOS__addConditionsForIOSBargeIn__block_invoke_25;
  v4[3] = &unk_1E7C26130;
  objc_copyWeak(&v5, &location);
  -[CSPolicy addConditions:](self, "addConditions:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)_addConditionsForIOSAOP
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__CSVoiceTriggerAOPModeEnabledPolicyIOS__addConditionsForIOSAOP__block_invoke;
  v10[3] = &unk_1E7C26130;
  objc_copyWeak(&v11, &location);
  -[CSPolicy addConditions:](self, "addConditions:", v10);
  -[CSPolicy addConditions:](self, "addConditions:", &__block_literal_global_27_12516);
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __64__CSVoiceTriggerAOPModeEnabledPolicyIOS__addConditionsForIOSAOP__block_invoke_28;
  v8[3] = &unk_1E7C26130;
  objc_copyWeak(&v9, &location);
  -[CSPolicy addConditions:](self, "addConditions:", v8);
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __64__CSVoiceTriggerAOPModeEnabledPolicyIOS__addConditionsForIOSAOP__block_invoke_29;
  v6[3] = &unk_1E7C26130;
  objc_copyWeak(&v7, &location);
  -[CSPolicy addConditions:](self, "addConditions:", v6);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __64__CSVoiceTriggerAOPModeEnabledPolicyIOS__addConditionsForIOSAOP__block_invoke_30;
  v4[3] = &unk_1E7C26130;
  objc_copyWeak(&v5, &location);
  -[CSPolicy addConditions:](self, "addConditions:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (BOOL)_isSpeechDetectionDevicePresent
{
  void *v2;
  char v3;
  NSObject *v4;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D19210], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPresent");

  if ((v3 & 1) == 0)
  {
    v4 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315138;
      v7 = "-[CSVoiceTriggerAOPModeEnabledPolicyIOS _isSpeechDetectionDevicePresent]";
      _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s Speech Detection VAD is not available, we will still running in AOP mode", (uint8_t *)&v6, 0xCu);
    }
  }
  return v3;
}

- (BOOL)_isJarvisRouted
{
  void *v2;
  char v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0D19018], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "jarvisConnected");

  objc_msgSend(MEMORY[0x1E0D19018], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hearstRouteStatus");

  if ((unint64_t)(v5 - 3) < 0xFFFFFFFFFFFFFFFELL)
    return v3;
  else
    return 0;
}

- (BOOL)_isHearstRoutedAndWithNoPhoneCall
{
  void *v2;
  uint64_t v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0D19018], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hearstRouteStatus");

  v4 = v3 - 1;
  objc_msgSend(MEMORY[0x1E0D191A0], "phoneCallStateMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "phoneCallState");

  return v4 < 2 && v6 < 2;
}

- (BOOL)_isAudioRouteIneligibleForAP
{
  _BOOL4 v3;
  _BOOL4 v4;
  _BOOL4 v5;
  int v6;
  _BOOL4 v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  _BOOL4 v13;
  __int16 v14;
  _BOOL4 v15;
  __int16 v16;
  _BOOL4 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = -[CSVoiceTriggerAOPModeEnabledPolicyIOS _isSpeechDetectionDevicePresent](self, "_isSpeechDetectionDevicePresent");
  v4 = -[CSVoiceTriggerAOPModeEnabledPolicyIOS _isHearstRoutedAndWithNoPhoneCall](self, "_isHearstRoutedAndWithNoPhoneCall");
  v5 = -[CSVoiceTriggerAOPModeEnabledPolicyIOS _isJarvisRouted](self, "_isJarvisRouted");
  v6 = !v3 || v4 || v5;
  if (v6 == 1)
  {
    v7 = v5;
    v8 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_INFO))
    {
      v10 = 136315906;
      v11 = "-[CSVoiceTriggerAOPModeEnabledPolicyIOS _isAudioRouteIneligibleForAP]";
      v12 = 1024;
      v13 = v3;
      v14 = 1024;
      v15 = v4;
      v16 = 1024;
      v17 = v7;
      _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_INFO, "%s VAD is not present (%d) or Hearst routed without phone call (%d) or Jarvis routed (%d)", (uint8_t *)&v10, 0x1Eu);
    }
  }
  return v6;
}

- (BOOL)_isInPhoneCallStateWithHSPhoneCallCapableRoute
{
  void *v2;
  uint64_t v3;
  int v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  int v9;
  int v10;
  _BOOL4 v11;
  uint64_t v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  NSObject *v16;
  int v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  __int16 v31;
  _BOOL4 v32;
  __int16 v33;
  _BOOL4 v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D191A0], "phoneCallStateMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "phoneCallState");

  if (v3 == 2)
    v4 = objc_msgSend(MEMORY[0x1E0D19260], "supportRingtoneA2DP") ^ 1;
  else
    v4 = 0;
  objc_msgSend(MEMORY[0x1E0D19260], "fetchHypotheticalBluetoothRouteProductIdFromAudioSessionId:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = AFBTProductIDSupportsAnnounce();
  else
    v6 = 0;
  v7 = objc_msgSend(MEMORY[0x1E0D19260], "fetchHypotheticalRouteType");
  +[CSMXRingtoneMonitor sharedInstance](CSMXRingtoneMonitor, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isAnyRingtoneCurrentlyPlaying");

  if (objc_msgSend(MEMORY[0x1E0D19260], "supportHandsFree")
    && ((v4 & 1) != 0 || ((unint64_t)(v3 - 3) < 2 ? (v10 = 1) : (v10 = v9), v10 == 1)))
  {
    if (v7 == 1)
      v11 = 1;
    else
      v11 = v6;
  }
  else
  {
    v11 = 0;
  }
  v12 = _isInPhoneCallStateWithHSPhoneCallCapableRoute_heartbeat;
  if (__ROR8__(0xCCCCCCCCCCCCCCCDLL * _isInPhoneCallStateWithHSPhoneCallCapableRoute_heartbeat, 2) <= 0xCCCCCCCCCCCCCCCuLL)
  {
    v18 = v4;
    v13 = (void *)*MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v14 = v7 == 1;
      v15 = (void *)MEMORY[0x1E0D19260];
      v16 = v13;
      *(_DWORD *)buf = 136316930;
      v20 = "-[CSVoiceTriggerAOPModeEnabledPolicyIOS _isInPhoneCallStateWithHSPhoneCallCapableRoute]";
      v21 = 1024;
      v22 = objc_msgSend(v15, "supportHandsFree");
      v23 = 1024;
      v24 = v18;
      v25 = 1024;
      v26 = v9;
      v27 = 1024;
      v28 = v3;
      v29 = 1024;
      v30 = v6;
      v31 = 1024;
      v32 = v14;
      v33 = 1024;
      v34 = v11;
      _os_log_impl(&dword_1C2614000, v16, OS_LOG_TYPE_DEFAULT, "%s #PhoneStates: SpprtHF(%d) RingtoneHFP(%d) RingtoneNotfcn(%d) phoneCallState(%u) hsCallHeadsetCnnctd(%d) builtInRoute(%d). Result(%d)", buf, 0x36u);

      v12 = _isInPhoneCallStateWithHSPhoneCallCapableRoute_heartbeat;
    }
  }
  _isInPhoneCallStateWithHSPhoneCallCapableRoute_heartbeat = v12 + 1;

  return v11;
}

- (void)_handleClientRecordStateDidChange:(BOOL)a3 eventUUID:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  dispatch_time_t v8;
  NSObject *recordStateQueue;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v4 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v4)
  {
    -[CSVoiceTriggerAOPModeEnabledPolicyIOS setIsAssistantClientConsideredAsRecord:](self, "setIsAssistantClientConsideredAsRecord:", 1);
    -[CSVoiceTriggerAOPModeEnabledPolicyIOS setPendingRecordingStopUUID:](self, "setPendingRecordingStopUUID:", 0);
    -[CSPolicy notifyCallbackWithOption:](self, "notifyCallbackWithOption:", 0);
  }
  else
  {
    -[CSVoiceTriggerAOPModeEnabledPolicyIOS setPendingRecordingStopUUID:](self, "setPendingRecordingStopUUID:", v6);
    v7 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v14 = "-[CSVoiceTriggerAOPModeEnabledPolicyIOS _handleClientRecordStateDidChange:eventUUID:]";
      v15 = 2050;
      v16 = 0x4010000000000000;
      v17 = 2114;
      v18 = v6;
      _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s Will notify Siri Client record state change to STOPPED in %{public}f seconds, eventUUID = %{public}@", buf, 0x20u);
    }
    objc_initWeak((id *)buf, self);
    v8 = dispatch_time(0, 4000000000);
    recordStateQueue = self->_recordStateQueue;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __85__CSVoiceTriggerAOPModeEnabledPolicyIOS__handleClientRecordStateDidChange_eventUUID___block_invoke;
    v10[3] = &unk_1E7C28E78;
    objc_copyWeak(&v12, (id *)buf);
    v11 = v6;
    dispatch_after(v8, recordStateQueue, v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }

}

- (void)intuitiveConvAudioCaptureMonitor:(id)a3 didStartAudioCaptureSuccessfully:(BOOL)a4 option:(id)a5 eventUUID:(id)a6
{
  id v8;
  NSObject *recordStateQueue;
  id v10;
  _QWORD block[5];
  id v12;
  BOOL v13;

  v8 = a6;
  recordStateQueue = self->_recordStateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __124__CSVoiceTriggerAOPModeEnabledPolicyIOS_intuitiveConvAudioCaptureMonitor_didStartAudioCaptureSuccessfully_option_eventUUID___block_invoke;
  block[3] = &unk_1E7C28888;
  v13 = a4;
  block[4] = self;
  v12 = v8;
  v10 = v8;
  dispatch_async(recordStateQueue, block);

}

- (void)intuitiveConvAudioCaptureMonitorDidStopAudioCapture:(id)a3 stopStreamOption:(id)a4 eventUUID:(id)a5
{
  id v6;
  NSObject *recordStateQueue;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a5;
  recordStateQueue = self->_recordStateQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __120__CSVoiceTriggerAOPModeEnabledPolicyIOS_intuitiveConvAudioCaptureMonitorDidStopAudioCapture_stopStreamOption_eventUUID___block_invoke;
  v9[3] = &unk_1E7C292A0;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(recordStateQueue, v9);

}

- (void)siriClientBehaviorMonitor:(id)a3 didChangedRecordState:(BOOL)a4 withEventUUID:(id)a5 withContext:(id)a6
{
  id v8;
  NSObject *recordStateQueue;
  id v10;
  _QWORD block[5];
  id v12;
  BOOL v13;

  v8 = a5;
  recordStateQueue = self->_recordStateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __115__CSVoiceTriggerAOPModeEnabledPolicyIOS_siriClientBehaviorMonitor_didChangedRecordState_withEventUUID_withContext___block_invoke;
  block[3] = &unk_1E7C28888;
  v13 = a4;
  block[4] = self;
  v12 = v8;
  v10 = v8;
  dispatch_async(recordStateQueue, block);

}

- (BOOL)isAssistantClientConsideredAsRecord
{
  return self->_isAssistantClientConsideredAsRecord;
}

- (void)setIsAssistantClientConsideredAsRecord:(BOOL)a3
{
  self->_isAssistantClientConsideredAsRecord = a3;
}

- (NSString)pendingRecordingStopUUID
{
  return self->_pendingRecordingStopUUID;
}

- (void)setPendingRecordingStopUUID:(id)a3
{
  objc_storeStrong((id *)&self->_pendingRecordingStopUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingRecordingStopUUID, 0);
  objc_storeStrong((id *)&self->_recordStateQueue, 0);
}

uint64_t __115__CSVoiceTriggerAOPModeEnabledPolicyIOS_siriClientBehaviorMonitor_didChangedRecordState_withEventUUID_withContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleClientRecordStateDidChange:eventUUID:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

uint64_t __120__CSVoiceTriggerAOPModeEnabledPolicyIOS_intuitiveConvAudioCaptureMonitorDidStopAudioCapture_stopStreamOption_eventUUID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleClientRecordStateDidChange:eventUUID:", 0, *(_QWORD *)(a1 + 40));
}

uint64_t __124__CSVoiceTriggerAOPModeEnabledPolicyIOS_intuitiveConvAudioCaptureMonitor_didStartAudioCaptureSuccessfully_option_eventUUID___block_invoke(uint64_t result)
{
  if (*(_BYTE *)(result + 48))
    return objc_msgSend(*(id *)(result + 32), "_handleClientRecordStateDidChange:eventUUID:", 1, *(_QWORD *)(result + 40));
  return result;
}

void __85__CSVoiceTriggerAOPModeEnabledPolicyIOS__handleClientRecordStateDidChange_eventUUID___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  int v5;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  uint64_t v16;
  int v17;
  const char *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "pendingRecordingStopUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v5)
  {
    v6 = objc_loadWeakRetained(v2);
    objc_msgSend(v6, "setIsAssistantClientConsideredAsRecord:", 0);

    v7 = objc_loadWeakRetained(v2);
    objc_msgSend(v7, "notifyCallbackWithOption:", 0);

    v8 = (void *)*MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      v10 = objc_loadWeakRetained(v2);
      objc_msgSend(v10, "pendingRecordingStopUUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 136315394;
      v18 = "-[CSVoiceTriggerAOPModeEnabledPolicyIOS _handleClientRecordStateDidChange:eventUUID:]_block_invoke";
      v19 = 2114;
      v20 = v11;
      _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s Notifying Siri Client record state change to STOPPED, eventUUID = %{public}@", (uint8_t *)&v17, 0x16u);

    }
  }
  else
  {
    v12 = (void *)*MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v13 = v12;
      v14 = objc_loadWeakRetained(v2);
      objc_msgSend(v14, "pendingRecordingStopUUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(a1 + 32);
      v17 = 136315650;
      v18 = "-[CSVoiceTriggerAOPModeEnabledPolicyIOS _handleClientRecordStateDidChange:eventUUID:]_block_invoke";
      v19 = 2114;
      v20 = v15;
      v21 = 2114;
      v22 = v16;
      _os_log_impl(&dword_1C2614000, v13, OS_LOG_TYPE_DEFAULT, "%s There is no pending event to timeout : pendingRecordingStopUUID = %{public}@, timeoutTargetUUID = %{public}@", (uint8_t *)&v17, 0x20u);

    }
  }
}

uint64_t __64__CSVoiceTriggerAOPModeEnabledPolicyIOS__addConditionsForIOSAOP__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  id WeakRetained;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t result;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D191F8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEnabled");

  if (!v3)
    return 1;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = objc_msgSend(WeakRetained, "_isInPhoneCallStateWithHSPhoneCallCapableRoute");

  if (!v5)
    return 1;
  v6 = *MEMORY[0x1E0D18F60];
  v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v7)
  {
    v9 = 136315138;
    v10 = "-[CSVoiceTriggerAOPModeEnabledPolicyIOS _addConditionsForIOSAOP]_block_invoke";
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s Turn on AP mode since device is hands free state with HS phone-call capable route connected", (uint8_t *)&v9, 0xCu);
    return 0;
  }
  return result;
}

uint64_t __64__CSVoiceTriggerAOPModeEnabledPolicyIOS__addConditionsForIOSAOP__block_invoke_28(uint64_t a1)
{
  void *v2;
  unsigned int v3;
  NSObject *v4;
  id WeakRetained;
  int v6;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D18FB8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEnabled");

  if ((v3 & 1) == 0)
  {
    v4 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = "-[CSVoiceTriggerAOPModeEnabledPolicyIOS _addConditionsForIOSAOP]_block_invoke";
      _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s AOP Listening is disabled", (uint8_t *)&v8, 0xCu);
    }
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = objc_msgSend(WeakRetained, "_isAudioRouteIneligibleForAP");

  return v6 | v3;
}

uint64_t __64__CSVoiceTriggerAOPModeEnabledPolicyIOS__addConditionsForIOSAOP__block_invoke_29(uint64_t a1)
{
  id WeakRetained;
  int v2;
  NSObject *v3;
  void *v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t result;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "_isAudioRouteIneligibleForAP");

  if (v2)
  {
    v3 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315138;
      v10 = "-[CSVoiceTriggerAOPModeEnabledPolicyIOS _addConditionsForIOSAOP]_block_invoke";
      _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Audio route ineligible for AP, we should remain in AOP mode", (uint8_t *)&v9, 0xCu);
    }
    return 1;
  }
  +[CSAttSiriStateMonitor sharedInstance](CSAttSiriStateMonitor, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAttending");

  if (!v5)
    return 1;
  v6 = *MEMORY[0x1E0D18F60];
  v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v7)
  {
    v9 = 136315138;
    v10 = "-[CSVoiceTriggerAOPModeEnabledPolicyIOS _addConditionsForIOSAOP]_block_invoke";
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s Turn on AP mode since siri is in attending state", (uint8_t *)&v9, 0xCu);
    return 0;
  }
  return result;
}

uint64_t __64__CSVoiceTriggerAOPModeEnabledPolicyIOS__addConditionsForIOSAOP__block_invoke_30(uint64_t a1)
{
  id WeakRetained;
  char v2;
  void *v3;
  int v4;
  NSObject *v5;
  void *v7;
  int v8;
  NSObject *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "_isAudioRouteIneligibleForAP");

  if ((v2 & 1) != 0)
    return 1;
  objc_msgSend(MEMORY[0x1E0D19018], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "jarvisConnected");

  if (v4)
  {
    v5 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315138;
      v11 = "-[CSVoiceTriggerAOPModeEnabledPolicyIOS _addConditionsForIOSAOP]_block_invoke";
      _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger AOP mode is turned on since jarvis is connected", (uint8_t *)&v10, 0xCu);
    }
    return 1;
  }
  objc_msgSend(MEMORY[0x1E0D19048], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasNonVoiceTriggerStreamsOrStreamHoldersActive");

  if (v8)
  {
    v9 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315138;
      v11 = "-[CSVoiceTriggerAOPModeEnabledPolicyIOS _addConditionsForIOSAOP]_block_invoke";
      _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger AOP mode cannot be turned on since other non-built-in VoiceTrigger clients are running", (uint8_t *)&v10, 0xCu);
    }
  }
  return v8 ^ 1u;
}

uint64_t __64__CSVoiceTriggerAOPModeEnabledPolicyIOS__addConditionsForIOSAOP__block_invoke_26()
{
  void *v0;
  int v1;
  os_log_t *v2;
  NSObject *v3;
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  +[CSCommandControlStreamEventMonitor sharedInstance](CSCommandControlStreamEventMonitor, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isStreaming");

  v2 = (os_log_t *)MEMORY[0x1E0D18F60];
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[CSVoiceTriggerAOPModeEnabledPolicyIOS _addConditionsForIOSAOP]_block_invoke";
    v8 = 1026;
    v9 = v1;
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s CommandControl Streaming = %{public}d", (uint8_t *)&v6, 0x12u);
  }
  if (v1)
  {
    v4 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315138;
      v7 = "-[CSVoiceTriggerAOPModeEnabledPolicyIOS _addConditionsForIOSAOP]_block_invoke";
      _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s Turn on AP mode since command control is streaming", (uint8_t *)&v6, 0xCu);
    }
  }
  return v1 ^ 1u;
}

uint64_t __68__CSVoiceTriggerAOPModeEnabledPolicyIOS__addConditionsForIOSBargeIn__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  id WeakRetained;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t result;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D191F8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEnabled");

  if (!v3)
    return 1;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = objc_msgSend(WeakRetained, "_isInPhoneCallStateWithHSPhoneCallCapableRoute");

  if (!v5)
    return 1;
  v6 = *MEMORY[0x1E0D18F60];
  v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v7)
  {
    v9 = 136315138;
    v10 = "-[CSVoiceTriggerAOPModeEnabledPolicyIOS _addConditionsForIOSBargeIn]_block_invoke";
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s Turn on AP mode since device is hands free state with HS phone-call capable route connected", (uint8_t *)&v9, 0xCu);
    return 0;
  }
  return result;
}

uint64_t __68__CSVoiceTriggerAOPModeEnabledPolicyIOS__addConditionsForIOSBargeIn__block_invoke_19(uint64_t a1)
{
  id WeakRetained;
  int v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t result;
  NSObject *v10;
  _BOOL4 v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "_isAudioRouteIneligibleForAP");

  if (v2)
  {
    v3 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315138;
      v13 = "-[CSVoiceTriggerAOPModeEnabledPolicyIOS _addConditionsForIOSBargeIn]_block_invoke";
      _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Audio route ineligible for AP, we should remain in AOP mode", (uint8_t *)&v12, 0xCu);
    }
    return 1;
  }
  objc_msgSend(MEMORY[0x1E0D19080], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "currentBuiltinSpeakerState");

  objc_msgSend(MEMORY[0x1E0D191B8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "playbackVolumeStatus");

  if (v5 != 1 || v7 != 0)
    return 1;
  v10 = *MEMORY[0x1E0D18F60];
  v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v11)
  {
    v12 = 136315138;
    v13 = "-[CSVoiceTriggerAOPModeEnabledPolicyIOS _addConditionsForIOSBargeIn]_block_invoke";
    _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger AOP mode cannot be turned on since builtIn speaker is active and playback volume is high", (uint8_t *)&v12, 0xCu);
    return 0;
  }
  return result;
}

uint64_t __68__CSVoiceTriggerAOPModeEnabledPolicyIOS__addConditionsForIOSBargeIn__block_invoke_20(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  char v3;
  id v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  os_log_t *v10;
  NSObject *v11;
  void *v12;
  int v13;
  NSObject *v14;
  uint64_t result;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  NSObject *v23;
  NSObject *v24;
  _BOOL4 v25;
  int v26;
  const char *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "_isAudioRouteIneligibleForAP");

  if ((v3 & 1) != 0)
    return 1;
  v4 = objc_loadWeakRetained(v1);
  v5 = objc_msgSend(v4, "isAssistantClientConsideredAsRecord");

  if (!v5)
    return 1;
  objc_msgSend(MEMORY[0x1E0D191F8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEnabled");

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D191F0], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "audioRecordContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  v10 = (os_log_t *)MEMORY[0x1E0D18F60];
  v11 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v26 = 136315394;
    v27 = "-[CSVoiceTriggerAOPModeEnabledPolicyIOS _addConditionsForIOSBargeIn]_block_invoke";
    v28 = 2114;
    v29 = v9;
    _os_log_impl(&dword_1C2614000, v11, OS_LOG_TYPE_DEFAULT, "%s AudioRecordContext = %{public}@, recordState = RECORDING", (uint8_t *)&v26, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E0D19018], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "carPlayConnected");

  if (v13)
  {
    v14 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      v26 = 136315138;
      v27 = "-[CSVoiceTriggerAOPModeEnabledPolicyIOS _addConditionsForIOSBargeIn]_block_invoke";
      _os_log_impl(&dword_1C2614000, v14, OS_LOG_TYPE_DEFAULT, "%s CarPlay is connected, we will still run AOP mode", (uint8_t *)&v26, 0xCu);
    }
LABEL_11:

    return 1;
  }
  if (objc_msgSend(v9, "isBuiltInVoiceTriggered"))
  {
    objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "pickedRoute");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      v26 = 136315394;
      v27 = "-[CSVoiceTriggerAOPModeEnabledPolicyIOS _addConditionsForIOSBargeIn]_block_invoke";
      v28 = 2114;
      v29 = v17;
      _os_log_impl(&dword_1C2614000, v18, OS_LOG_TYPE_DEFAULT, "%s hypotheticalRoute = %{public}@", (uint8_t *)&v26, 0x16u);
    }
    if (v17)
    {
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("BTDetails_IsHFPRoute"));
      v19 = objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        v20 = (void *)v19;
        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("BTDetails_IsHFPRoute"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "BOOLValue");

        if (v22)
        {
          v23 = *v10;
          if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
          {
            v26 = 136315138;
            v27 = "-[CSVoiceTriggerAOPModeEnabledPolicyIOS _addConditionsForIOSBargeIn]_block_invoke";
            _os_log_impl(&dword_1C2614000, v23, OS_LOG_TYPE_DEFAULT, "%s Audio route changing to HFP is expected", (uint8_t *)&v26, 0xCu);
          }

          goto LABEL_11;
        }
      }
    }

  }
  v24 = *v10;
  v25 = os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v25)
  {
    v26 = 136315138;
    v27 = "-[CSVoiceTriggerAOPModeEnabledPolicyIOS _addConditionsForIOSBargeIn]_block_invoke";
    _os_log_impl(&dword_1C2614000, v24, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger AOP mode cannot be turned on since Siri client is recording", (uint8_t *)&v26, 0xCu);
    return 0;
  }
  return result;
}

uint64_t __68__CSVoiceTriggerAOPModeEnabledPolicyIOS__addConditionsForIOSBargeIn__block_invoke_23(uint64_t a1)
{
  void *v2;
  unsigned int v3;
  NSObject *v4;
  id WeakRetained;
  int v6;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D18FB8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEnabled");

  if ((v3 & 1) == 0)
  {
    v4 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = "-[CSVoiceTriggerAOPModeEnabledPolicyIOS _addConditionsForIOSBargeIn]_block_invoke";
      _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s AOP Listening is disabled", (uint8_t *)&v8, 0xCu);
    }
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = objc_msgSend(WeakRetained, "_isAudioRouteIneligibleForAP");

  return v6 | v3;
}

uint64_t __68__CSVoiceTriggerAOPModeEnabledPolicyIOS__addConditionsForIOSBargeIn__block_invoke_24(uint64_t a1)
{
  id WeakRetained;
  char v2;
  void *v3;
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t result;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "_isAudioRouteIneligibleForAP");

  if ((v2 & 1) != 0)
    return 1;
  +[CSAttSiriStateMonitor sharedInstance](CSAttSiriStateMonitor, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAttending");

  if (!v4)
    return 1;
  v5 = *MEMORY[0x1E0D18F60];
  v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v6)
  {
    v8 = 136315138;
    v9 = "-[CSVoiceTriggerAOPModeEnabledPolicyIOS _addConditionsForIOSBargeIn]_block_invoke";
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s Turn on AP mode since siri is in attending state", (uint8_t *)&v8, 0xCu);
    return 0;
  }
  return result;
}

uint64_t __68__CSVoiceTriggerAOPModeEnabledPolicyIOS__addConditionsForIOSBargeIn__block_invoke_25(uint64_t a1)
{
  id WeakRetained;
  char v2;
  void *v4;
  int v5;
  NSObject *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "_isAudioRouteIneligibleForAP");

  if ((v2 & 1) != 0)
    return 1;
  objc_msgSend(MEMORY[0x1E0D19048], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasNonVoiceTriggerStreamsOrStreamHoldersActive");

  if (v5)
  {
    v6 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315138;
      v8 = "-[CSVoiceTriggerAOPModeEnabledPolicyIOS _addConditionsForIOSBargeIn]_block_invoke";
      _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger AOP mode cannot be turned on since other non-built-in VoiceTrigger clients are running", (uint8_t *)&v7, 0xCu);
    }
  }
  return v5 ^ 1u;
}

uint64_t __68__CSVoiceTriggerAOPModeEnabledPolicyIOS__addConditionsForIOSBargeIn__block_invoke_17()
{
  void *v0;
  int v1;
  os_log_t *v2;
  NSObject *v3;
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  +[CSCommandControlStreamEventMonitor sharedInstance](CSCommandControlStreamEventMonitor, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isStreaming");

  v2 = (os_log_t *)MEMORY[0x1E0D18F60];
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[CSVoiceTriggerAOPModeEnabledPolicyIOS _addConditionsForIOSBargeIn]_block_invoke";
    v8 = 1026;
    v9 = v1;
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s CommandControl Streaming = %{public}d", (uint8_t *)&v6, 0x12u);
  }
  if (v1)
  {
    v4 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315138;
      v7 = "-[CSVoiceTriggerAOPModeEnabledPolicyIOS _addConditionsForIOSBargeIn]_block_invoke";
      _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s Turn on AP mode since command control is streaming", (uint8_t *)&v6, 0xCu);
    }
  }
  return v1 ^ 1u;
}

uint64_t __81__CSVoiceTriggerAOPModeEnabledPolicyIOS__addVoiceTriggerAOPModeEnabledConditions__block_invoke_2()
{
  return 0;
}

uint64_t __81__CSVoiceTriggerAOPModeEnabledPolicyIOS__addVoiceTriggerAOPModeEnabledConditions__block_invoke()
{
  return 0;
}

@end
