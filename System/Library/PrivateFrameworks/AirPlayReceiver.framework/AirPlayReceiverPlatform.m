@implementation AirPlayReceiverPlatform

- (void)handleMRCommand:(unsigned int)a3 translatedAPCommand:(unsigned int)a4 withOptions:(__CFDictionary *)a5
{
  NSObject *var14;
  _QWORD block[6];
  unsigned int v11;
  unsigned int v12;

  CFRetain(self->_server);
  if (a5)
    CFRetain(a5);
  var14 = self->_server->var14;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75__AirPlayReceiverPlatform_handleMRCommand_translatedAPCommand_withOptions___block_invoke;
  block[3] = &unk_24E21E660;
  v11 = a3;
  v12 = a4;
  block[4] = self;
  block[5] = a5;
  dispatch_async(var14, block);
}

- (void)_handleNowPlayingAppStartedPlaying:(id)a3
{
  int v5;
  void *v6;
  int v7;
  AirPlayReceiverPlatform *v8;
  id v9;
  NSObject *var14;
  _QWORD block[6];
  int v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKeyedSubscript:", CFSTR("APReceiverMediaRemoteHelperUserInfoKeyNowPlayingAppProcessIdentifier")), "intValue");
  v6 = (void *)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKeyedSubscript:", CFSTR("kAPReceiverMediaRemoteHelperUserInfoKeyNowPlayingAppProcessDisplayName"));
  v7 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKeyedSubscript:", CFSTR("APReceiverMediaRemoteHelperUserInfoKeyNowPlayingAppIsPlaying")), "BOOLValue");
  if (v5 != getpid() && v7 && !self->_server->var40)
  {
    v8 = self;
    v9 = v6;
    var14 = self->_server->var14;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __62__AirPlayReceiverPlatform__handleNowPlayingAppStartedPlaying___block_invoke;
    block[3] = &unk_24E21E688;
    block[4] = self;
    block[5] = v6;
    v12 = v5;
    dispatch_async(var14, block);
  }
  CFObjectSetProperty();
}

- (void)_avSystemControllerVolumeConfigChanged:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a3, "userInfo");
  objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE15830]), "BOOLValue");
  if (gLogCategory_AirPlayReceiverPlatform <= 50
    && (gLogCategory_AirPlayReceiverPlatform != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[AirPlayReceiverPlatform _handleVolumeControlTypeChange](self, "_handleVolumeControlTypeChange");
}

- (int)_updateVolume:(float)a3 andMute:(unsigned __int8)a4 becauseVolumeChanged:(unsigned __int8)a5
{
  int v5;
  int v6;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v9;
  int v10;
  const void *v11;
  const void *v12;
  const void *v13;
  const void *v14;
  int v15;
  int v16;

  v5 = a5;
  v6 = a4;
  if (gLogCategory_AirPlayReceiverPlatform <= 50
    && (gLogCategory_AirPlayReceiverPlatform != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (Mutable)
  {
    v9 = Mutable;
    v10 = CFDictionarySetDouble();
    if (v10)
    {
      v16 = v10;
    }
    else
    {
      v11 = (const void *)*MEMORY[0x24BDBD270];
      v12 = (const void *)*MEMORY[0x24BDBD268];
      if (v6)
        v13 = (const void *)*MEMORY[0x24BDBD270];
      else
        v13 = (const void *)*MEMORY[0x24BDBD268];
      CFDictionarySetValue(v9, CFSTR("isMuted"), v13);
      if (v5)
        v14 = v11;
      else
        v14 = v12;
      CFDictionarySetValue(v9, CFSTR("isVolumeUpdate"), v14);
      v16 = AirPlayReceiverServerControl((uint64_t)self->_server, v15, CFSTR("sendVolumeUpdate"), 0, v9, 0);
      if (!v16)
      {
        CFRelease(v9);
        return v16;
      }
    }
    APSLogErrorAt();
    CFRelease(v9);
  }
  else
  {
    APSLogErrorAt();
    v16 = -6728;
  }
  if (gLogCategory_AirPlayReceiverPlatform <= 50
    && (gLogCategory_AirPlayReceiverPlatform != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return v16;
}

- (void)_avSystemControllerVolumeChanged:(id)a3
{
  void *v4;
  float HWVolumeSliderValue;
  void *v6;
  uint64_t v7;
  double v8;
  NSObject *var14;
  _QWORD v10[5];
  float v11;

  v4 = (void *)objc_msgSend(a3, "userInfo");
  if (objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE15830]), "isEqual:", CFSTR("Audio/Video")))
  {
    HWVolumeSliderValue = _GetHWVolumeSliderValue();
    v6 = (void *)objc_msgSend(MEMORY[0x24BE15888], "sharedAVSystemController");
    v7 = objc_msgSend((id)objc_msgSend(v6, "attributeForKey:", *MEMORY[0x24BE15840]), "BOOLValue");
    *(float *)&v8 = HWVolumeSliderValue;
    -[AirPlayReceiverPlatform _updateVolume:andMute:becauseVolumeChanged:](self, "_updateVolume:andMute:becauseVolumeChanged:", v7, 1, v8);
    var14 = self->_server->var14;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __60__AirPlayReceiverPlatform__avSystemControllerVolumeChanged___block_invoke;
    v10[3] = &unk_24E21E6B0;
    v10[4] = self;
    v11 = HWVolumeSliderValue;
    dispatch_async(var14, v10);
    APSVolumeConvertSliderValueToDB();
    CFObjectSetPropertyDouble();
  }
}

- (void)_avSystemControllerMuteChanged:(id)a3
{
  float HWVolumeSliderValue;
  void *v5;
  uint64_t v6;
  double v7;
  NSObject *var14;
  _QWORD v9[5];
  char v10;

  HWVolumeSliderValue = _GetHWVolumeSliderValue();
  v5 = (void *)objc_msgSend(MEMORY[0x24BE15888], "sharedAVSystemController");
  v6 = objc_msgSend((id)objc_msgSend(v5, "attributeForKey:", *MEMORY[0x24BE15840]), "BOOLValue");
  *(float *)&v7 = HWVolumeSliderValue;
  -[AirPlayReceiverPlatform _updateVolume:andMute:becauseVolumeChanged:](self, "_updateVolume:andMute:becauseVolumeChanged:", v6, 0, v7);
  var14 = self->_server->var14;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __58__AirPlayReceiverPlatform__avSystemControllerMuteChanged___block_invoke;
  v9[3] = &unk_24E21E6D8;
  v9[4] = self;
  v10 = v6;
  dispatch_async(var14, v9);
  CFObjectSetProperty();
}

- (void)_avSystemControllerConnectionDied:(id)a3
{
  NSObject *var14;
  AirPlayReceiverPlatform *v5;
  _QWORD block[5];

  if (gLogCategory_AirPlayReceiverPlatform <= 90
    && (gLogCategory_AirPlayReceiverPlatform != -1 || _LogCategory_Initialize()))
  {
    v5 = self;
    LogPrintF();
  }
  -[AirPlayReceiverPlatform _unregisterAVSystemControllerNotifications](self, "_unregisterAVSystemControllerNotifications", v5);
  -[AirPlayReceiverPlatform _registerAVSystemControllerNotifications](self, "_registerAVSystemControllerNotifications");
  var14 = self->_server->var14;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__AirPlayReceiverPlatform__avSystemControllerConnectionDied___block_invoke;
  block[3] = &unk_24E21FC00;
  block[4] = self;
  dispatch_sync(var14, block);
}

- (void)_fetchInitialStates
{
  void *v3;
  AirPlayReceiverPlatform *v4;

  if (gLogCategory_AirPlayReceiverPlatform <= 50
    && (gLogCategory_AirPlayReceiverPlatform != -1 || _LogCategory_Initialize()))
  {
    v4 = self;
    LogPrintF();
  }
  -[AirPlayReceiverPlatform _handleVolumeControlTypeChange](self, "_handleVolumeControlTypeChange", v4);
  if (APSIsAPMSpeaker())
  {
    self->_state.volumeSliderValue = _GetHWVolumeSliderValue();
    APSVolumeConvertSliderValueToDB();
    CFObjectSetPropertyDouble();
    v3 = (void *)objc_msgSend(MEMORY[0x24BE15888], "sharedAVSystemController");
    self->_state.isMuted = objc_msgSend((id)objc_msgSend(v3, "attributeForKey:", *MEMORY[0x24BE15840]), "BOOLValue");
    CFObjectSetProperty();
    if (gLogCategory_AirPlayReceiverPlatform <= 50
      && (gLogCategory_AirPlayReceiverPlatform != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_registerAVSystemControllerNotifications
{
  void *v3;
  void *v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  AirPlayReceiverPlatform *v12;
  _QWORD v13[5];

  v13[4] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_msgSend(MEMORY[0x24BE15888], "sharedAVSystemController");
  if (gLogCategory_AirPlayReceiverPlatform <= 50
    && (gLogCategory_AirPlayReceiverPlatform != -1 || _LogCategory_Initialize()))
  {
    v12 = self;
    LogPrintF();
  }
  v5 = (_QWORD *)MEMORY[0x24BE15850];
  v6 = (_QWORD *)MEMORY[0x24BE15860];
  v7 = *MEMORY[0x24BE15860];
  v13[0] = *MEMORY[0x24BE15850];
  v13[1] = v7;
  v8 = (_QWORD *)MEMORY[0x24BE15848];
  v9 = (_QWORD *)MEMORY[0x24BE15838];
  v10 = *MEMORY[0x24BE15838];
  v13[2] = *MEMORY[0x24BE15848];
  v13[3] = v10;
  v11 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 4, v12);
  objc_msgSend(v4, "setAttribute:forKey:error:", v11, *MEMORY[0x24BE15858], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__avSystemControllerConnectionDied_, *v5, v4);
  if (APSIsAPMSpeaker())
  {
    if (gLogCategory_AirPlayReceiverPlatform <= 50
      && (gLogCategory_AirPlayReceiverPlatform != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__avSystemControllerVolumeChanged_, *v6, v4);
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__avSystemControllerMuteChanged_, *v8, v4);
  }
  if (objc_msgSend(v4, "currentRouteHasVolumeControl"))
  {
    if (gLogCategory_AirPlayReceiverPlatform <= 50
      && (gLogCategory_AirPlayReceiverPlatform != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__avSystemControllerVolumeConfigChanged_, *v9, v4);
  }
}

- (void)_unregisterAVSystemControllerNotifications
{
  void *v3;
  AirPlayReceiverPlatform *v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  if (gLogCategory_AirPlayReceiverPlatform <= 50
    && (gLogCategory_AirPlayReceiverPlatform != -1 || _LogCategory_Initialize()))
  {
    v4 = self;
    LogPrintF();
  }
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE15850], 0, v4);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE15860], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE15848], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE15838], 0);
}

- (void)_handleVolumeControlTypeChange
{
  IsAppleTV();
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BE15888], "sharedAVSystemController"), "currentRouteHasVolumeControl");
  if (gLogCategory_AirPlayReceiverPlatform <= 50
    && (gLogCategory_AirPlayReceiverPlatform != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFObjectSetPropertyInt64();
}

- (void)updateActiveSessionRegistration:(AirPlayReceiverSessionPrivate *)a3 regType:(int)a4 regOp:(int)a5
{
  Class *v6;
  __CFSet *v7;
  CFIndex Count;
  unsigned int v11;
  OpaqueAPAdvertiser *var4;
  int v13;
  unsigned int activeNANLinkRetainCount;

  if (a4 > 3 || (v6 = &self->super.isa + a4, (v7 = v6[2]) == 0))
  {
    APSLogErrorAt();
    return;
  }
  Count = CFSetGetCount(v6[2]);
  if (a5)
    CFSetRemoveValue(v7, a3);
  else
    CFSetAddValue(v7, a3);
  -[AirPlayReceiverPlatform setIsAmbientAudioActive:](self, "setIsAmbientAudioActive:", CFSetGetCount(self->_state.auxAudioSessions) > 0);
  -[AirPlayReceiverPlatform setIsMediaAudioActive:](self, "setIsMediaAudioActive:", CFSetGetCount(self->_state.mediaAudioSessions) > 0);
  -[AirPlayReceiverPlatform setIsVideoActive:](self, "setIsVideoActive:", CFSetGetCount(self->_state.mediaVideoSessions) > 0);
  -[AirPlayReceiverPlatform setIsScreenActive:](self, "setIsScreenActive:", CFSetGetCount(self->_state.screenSessions) > 0);
  if (Count != CFSetGetCount(v7) && a3->var11 == 128)
  {
    if (a5)
    {
      if (a5 == 1)
      {
        v11 = self->_state.activeNANLinkRetainCount - 1;
        self->_state.activeNANLinkRetainCount = v11;
        if (!v11)
        {
          var4 = self->_server->var4;
          v13 = 0;
LABEL_16:
          APAdvertiserUpdateNANLinkStatus((uint64_t)var4, v13);
        }
      }
    }
    else
    {
      activeNANLinkRetainCount = self->_state.activeNANLinkRetainCount;
      self->_state.activeNANLinkRetainCount = activeNANLinkRetainCount + 1;
      if (!activeNANLinkRetainCount)
      {
        var4 = self->_server->var4;
        v13 = 1;
        goto LABEL_16;
      }
    }
  }
}

- (void)setReceiverSessionCountAndUpdateStateIfNeeded:(unint64_t)a3
{
  unint64_t receiverSessionCount;
  int v6;
  const char *v7;
  const char *v8;
  CFTypeRef v9;
  unint64_t v10;
  unint64_t v11;
  CFTypeRef cf;

  receiverSessionCount = self->_state.receiverSessionCount;
  if (receiverSessionCount == a3)
    return;
  if (gLogCategory_AirPlayReceiverPlatform <= 50)
  {
    if (gLogCategory_AirPlayReceiverPlatform != -1
      || (v6 = _LogCategory_Initialize(), receiverSessionCount = self->_state.receiverSessionCount, v6))
    {
      v10 = receiverSessionCount;
      v11 = a3;
      LogPrintF();
      receiverSessionCount = self->_state.receiverSessionCount;
    }
  }
  if (!a3 || !receiverSessionCount)
  {
    cf = 0;
    if (a3)
    {
      if (gLogCategory_AirPlayReceiverPlatform <= 50
        && (gLogCategory_AirPlayReceiverPlatform != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      APSEnsureCanInitiatePlayback();
    }
    if (-[APAVAudioSessionManager setActive:error:](+[APAVAudioSessionManager mediaSessionManager](APAVAudioSessionManager, "mediaSessionManager", v10, v11), "setActive:error:", a3 != 0, &cf))
    {
      if (gLogCategory_AirPlayReceiverPlatform > 50
        || gLogCategory_AirPlayReceiverPlatform == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_29;
      }
      v7 = "de";
      if (a3)
        v7 = "";
      v10 = (unint64_t)v7;
    }
    else
    {
      if (gLogCategory_AirPlayReceiverPlatform > 90
        || gLogCategory_AirPlayReceiverPlatform == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_29;
      }
      v8 = "de";
      if (a3)
        v8 = "";
      v10 = (unint64_t)v8;
      v11 = (unint64_t)cf;
    }
    LogPrintF();
  }
LABEL_29:
  if (APSIsAPMSpeaker()
    && (APSIsMemberOfHTGroup()
     || APSSettingsIsFeatureEnabled() && APSIsMemberOfStereoPair())
    && a3
    && self->_state.receiverSessionCount > a3
    && !self->_useMediaRemotePerPlayerAPI)
  {
    cf = 0;
    APReceiverSessionManagerCopyAirPlaySessionWithAttribute((uint64_t)self->_server->var33, 4, 0, &cf);
    v9 = cf;
    if (cf)
      goto LABEL_42;
    if (gLogCategory_AirPlayReceiverPlatform <= 50
      && (gLogCategory_AirPlayReceiverPlatform != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    -[AirPlayReceiverMediaRemoteHelper setMRPlaybackState:](self->_mediaRemoteHelper, "setMRPlaybackState:", 3, v10, v11);
    v9 = cf;
    if (cf)
LABEL_42:
      CFRelease(v9);
  }
  self->_state.receiverSessionCount = a3;
  if (!APSMultiPrimariesEnabled())
    -[AirPlayReceiverPlatform updateMRNowPlayingAppStateForSinglePrimary](self, "updateMRNowPlayingAppStateForSinglePrimary");
}

- (void)setMainMediaReceiverSession:(OpaqueAPReceiverRequestProcessor *)a3
{
  OpaqueAPReceiverRequestProcessor *mainMediaReceiverSession;
  OpaqueAPReceiverRequestProcessor **p_mainMediaReceiverSession;
  OpaqueAPReceiverRequestProcessor *v7;
  OpaqueAPReceiverRequestProcessor *v8;
  OpaqueAPReceiverRequestProcessor *v9;

  if (!APSMultiPrimariesEnabled())
  {
    APSLogErrorAt();
    if (gLogCategory_AirPlayReceiverPlatform <= 90
      && (gLogCategory_AirPlayReceiverPlatform != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    goto LABEL_27;
  }
  p_mainMediaReceiverSession = &self->_state.nowPlaying.multiPrimaries.mainMediaReceiverSession;
  mainMediaReceiverSession = self->_state.nowPlaying.multiPrimaries.mainMediaReceiverSession;
  if (mainMediaReceiverSession == a3)
    goto LABEL_27;
  if (gLogCategory_AirPlayReceiverPlatform <= 50)
  {
    if (gLogCategory_AirPlayReceiverPlatform != -1)
    {
LABEL_5:
      v8 = mainMediaReceiverSession;
      v9 = a3;
      LogPrintF();
      goto LABEL_7;
    }
    if (_LogCategory_Initialize())
    {
      mainMediaReceiverSession = *p_mainMediaReceiverSession;
      goto LABEL_5;
    }
  }
LABEL_7:
  if (!self->_useMediaRemotePerPlayerAPI)
  {
    if (*p_mainMediaReceiverSession && self->_state.nowPlaying.singlePrimary.isAirPlayReceiverMRNowPlayingApp)
    {
      -[AirPlayReceiverMediaRemoteHelper stopNowPlayingSession](self->_mediaRemoteHelper, "stopNowPlayingSession");
      -[AirPlayReceiverPlatform setShouldHandleMRCommands:](self, "setShouldHandleMRCommands:", 0);
      self->_state.nowPlaying.singlePrimary.isAirPlayReceiverMRNowPlayingApp = 0;
    }
    if (a3)
    {
      if (!self->_state.nowPlaying.singlePrimary.isAirPlayReceiverMRNowPlayingApp)
      {
        -[AirPlayReceiverMediaRemoteHelper startNowPlayingSession](self->_mediaRemoteHelper, "startNowPlayingSession");
        self->_state.nowPlaying.singlePrimary.isAirPlayReceiverMRNowPlayingApp = 1;
        -[AirPlayReceiverPlatform setShouldHandleMRCommands:](self, "setShouldHandleMRCommands:", 1);
        if (self->_server->var43)
          -[AirPlayReceiverMediaRemoteHelper broadcastPauseCommand](self->_mediaRemoteHelper, "broadcastPauseCommand");
        -[AirPlayReceiverMediaRemoteHelper associateNowPlayingSessionWithAudioSession:](self->_mediaRemoteHelper, "associateNowPlayingSessionWithAudioSession:", -[AVAudioSession opaqueSessionID](-[APAVAudioSessionManager session](+[APAVAudioSessionManager mediaSessionManager](APAVAudioSessionManager, "mediaSessionManager", v8, v9), "session"), "opaqueSessionID"));
      }
      v7 = *p_mainMediaReceiverSession;
      goto LABEL_17;
    }
    v7 = *p_mainMediaReceiverSession;
    goto LABEL_19;
  }
LABEL_27:
  v7 = self->_state.nowPlaying.multiPrimaries.mainMediaReceiverSession;
  p_mainMediaReceiverSession = &self->_state.nowPlaying.multiPrimaries.mainMediaReceiverSession;
  if (a3)
LABEL_17:
    CFRetain(a3);
LABEL_19:
  *p_mainMediaReceiverSession = a3;
  if (v7)
    CFRelease(v7);
}

- (void)setIsAmbientAudioActive:(unsigned __int8)a3
{
  unsigned int isAmbientAudioActive;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  isAmbientAudioActive = self->_state.isAmbientAudioActive;
  if (isAmbientAudioActive != a3)
  {
    v4 = a3;
    if (gLogCategory_AirPlayReceiverPlatform > 50)
      goto LABEL_6;
    if (gLogCategory_AirPlayReceiverPlatform == -1)
    {
      if (!_LogCategory_Initialize())
      {
LABEL_6:
        v8 = 0;
        if (-[APAVAudioSessionManager setActive:error:](+[APAVAudioSessionManager ambientSessionManager](APAVAudioSessionManager, "ambientSessionManager", v6, v7), "setActive:error:", (_DWORD)v4 != 0, &v8))
        {
          if (gLogCategory_AirPlayReceiverPlatform > 50
            || gLogCategory_AirPlayReceiverPlatform == -1 && !_LogCategory_Initialize())
          {
            goto LABEL_16;
          }
        }
        else if (gLogCategory_AirPlayReceiverPlatform > 90
               || gLogCategory_AirPlayReceiverPlatform == -1 && !_LogCategory_Initialize())
        {
          goto LABEL_16;
        }
        LogPrintF();
LABEL_16:
        _NotifyIsPlayingAmbientAudio(v4);
        self->_state.isAmbientAudioActive = v4;
        return;
      }
      isAmbientAudioActive = self->_state.isAmbientAudioActive;
    }
    v6 = isAmbientAudioActive;
    v7 = v4;
    LogPrintF();
    goto LABEL_6;
  }
}

- (void)setIsMediaAudioActive:(unsigned __int8)a3
{
  unsigned int isMediaAudioActive;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;

  isMediaAudioActive = self->_state.isMediaAudioActive;
  if (isMediaAudioActive != a3)
  {
    v4 = a3;
    if (gLogCategory_AirPlayReceiverPlatform > 50)
      goto LABEL_6;
    if (gLogCategory_AirPlayReceiverPlatform == -1)
    {
      if (!_LogCategory_Initialize())
      {
LABEL_6:
        -[AirPlayReceiverPlatform _updateMediaSessionActivationStateBasedOnMediaAudioActiveState:andVideoActiveState:](self, "_updateMediaSessionActivationStateBasedOnMediaAudioActiveState:andVideoActiveState:", v4, self->_state.isVideoActive, v6, v7);
        self->_state.isMediaAudioActive = v4;
        if (!APSMultiPrimariesEnabled())
          -[AirPlayReceiverPlatform updateMRNowPlayingAppStateForSinglePrimary](self, "updateMRNowPlayingAppStateForSinglePrimary");
        return;
      }
      isMediaAudioActive = self->_state.isMediaAudioActive;
    }
    v6 = isMediaAudioActive;
    v7 = v4;
    LogPrintF();
    goto LABEL_6;
  }
}

- (void)setIsVideoActive:(unsigned __int8)a3
{
  unsigned int isVideoActive;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;

  isVideoActive = self->_state.isVideoActive;
  if (isVideoActive == a3)
    return;
  v4 = a3;
  if (gLogCategory_AirPlayReceiverPlatform <= 50)
  {
    if (gLogCategory_AirPlayReceiverPlatform == -1)
    {
      if (!_LogCategory_Initialize())
        goto LABEL_6;
      isVideoActive = self->_state.isVideoActive;
    }
    v6 = isVideoActive;
    v7 = v4;
    LogPrintF();
  }
LABEL_6:
  if ((_DWORD)v4)
    APSEnsureCanInitiatePlayback();
  -[AirPlayReceiverPlatform _updateMediaSessionActivationStateBasedOnMediaAudioActiveState:andVideoActiveState:](self, "_updateMediaSessionActivationStateBasedOnMediaAudioActiveState:andVideoActiveState:", self->_state.isMediaAudioActive, v4, v6, v7);
  self->_state.isVideoActive = v4;
}

- (void)setIsScreenActive:(unsigned __int8)a3
{
  if (self->_state.isScreenActive != a3)
  {
    if (gLogCategory_AirPlayReceiverPlatform <= 50
      && (gLogCategory_AirPlayReceiverPlatform != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_state.isScreenActive = a3;
    if (!APSMultiPrimariesEnabled())
      -[AirPlayReceiverPlatform updateMRNowPlayingAppStateForSinglePrimary](self, "updateMRNowPlayingAppStateForSinglePrimary");
  }
}

- (void)setShouldHandleMRCommands:(unsigned __int8)a3
{
  int v3;
  const char *v5;
  AirPlayReceiverPlatform *v6;
  const char *v7;

  v3 = a3;
  if (self->_state.isHandlingMRCommands != a3 && !self->_useMediaRemotePerPlayerAPI)
  {
    if (gLogCategory_AirPlayReceiverPlatform <= 50
      && (gLogCategory_AirPlayReceiverPlatform != -1 || _LogCategory_Initialize()))
    {
      v5 = "in to";
      if (!v3)
        v5 = "out of";
      v7 = v5;
      LogPrintF();
    }
    if (v3)
      v6 = self;
    else
      v6 = 0;
    -[AirPlayReceiverMediaRemoteHelper setDelegate:](self->_mediaRemoteHelper, "setDelegate:", v6, v7);
  }
  self->_state.isHandlingMRCommands = v3;
}

- (void)updateMRNowPlayingAppStateForSinglePrimary
{
  int v3;
  const char *v4;
  _BOOL8 v5;
  uint64_t v6;
  int v7;
  const char *v8;
  const char *v9;
  void *value;

  if (!APSMultiPrimariesEnabled())
  {
    if (self->_state.receiverSessionCount)
    {
      if (IsAppleTV() && self->_state.isScreenActive)
      {
        value = 0;
        APReceiverSessionManagerCopyAirPlaySessionWithAttribute((uint64_t)self->_server->var33, 2, 0, (const void **)&value);
        if (value)
        {
          v3 = APSIsMemberOfHTGroup();
          v4 = (const char *)value;
          if (!v3 || *((_DWORD *)value + 124) == 2)
          {
            v5 = CFSetContainsValue(self->_state.mediaAudioSessions, value) != 0;
            v6 = 1;
            goto LABEL_17;
          }
          if (gLogCategory_AirPlayReceiverPlatform <= 50)
          {
            if (gLogCategory_AirPlayReceiverPlatform == -1)
            {
              if (!_LogCategory_Initialize())
                goto LABEL_16;
              v4 = (const char *)value;
            }
            v9 = v4;
            LogPrintF();
          }
LABEL_16:
          v6 = 0;
          v5 = 0;
LABEL_17:
          if (value)
            CFRelease(value);
          goto LABEL_19;
        }
        v5 = 1;
        v6 = 1;
      }
      else
      {
        v6 = 1;
        v5 = 1;
      }
    }
    else
    {
      v6 = 0;
      v5 = 0;
    }
LABEL_19:
    if (self->_state.nowPlaying.singlePrimary.isAirPlayReceiverMRNowPlayingApp != (_DWORD)v6)
    {
      v7 = gLogCategory_AirPlayReceiverPlatform;
      if (!(self->_useMediaRemotePerPlayerAPI | v6))
      {
        if (gLogCategory_AirPlayReceiverPlatform <= 50
          && (gLogCategory_AirPlayReceiverPlatform != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        -[AirPlayReceiverMediaRemoteHelper setMRPlaybackState:](self->_mediaRemoteHelper, "setMRPlaybackState:", 3, v9);
        v7 = gLogCategory_AirPlayReceiverPlatform;
      }
      if (v7 <= 50 && (v7 != -1 || _LogCategory_Initialize()))
      {
        v8 = "yes";
        if (!(_DWORD)v6)
          v8 = "no";
        v9 = v8;
        LogPrintF();
      }
      -[AirPlayReceiverMediaRemoteHelper setIsNowPlaying:](self->_mediaRemoteHelper, "setIsNowPlaying:", v6, v9);
      self->_state.nowPlaying.singlePrimary.isAirPlayReceiverMRNowPlayingApp = v6;
      if ((_DWORD)v6 && !self->_useMediaRemotePerPlayerAPI)
      {
        if (self->_server->var43)
          -[AirPlayReceiverMediaRemoteHelper broadcastPauseCommand](self->_mediaRemoteHelper, "broadcastPauseCommand");
        -[AirPlayReceiverMediaRemoteHelper associateNowPlayingSessionWithAudioSession:](self->_mediaRemoteHelper, "associateNowPlayingSessionWithAudioSession:", -[AVAudioSession opaqueSessionID](-[APAVAudioSessionManager session](+[APAVAudioSessionManager mediaSessionManager](APAVAudioSessionManager, "mediaSessionManager"), "session"), "opaqueSessionID"));
      }
    }
    if (!self->_useMediaRemotePerPlayerAPI)
      -[AirPlayReceiverPlatform setShouldHandleMRCommands:](self, "setShouldHandleMRCommands:", v5);
    return;
  }
  APSLogErrorAt();
  if (gLogCategory_AirPlayReceiverPlatform <= 90
    && (gLogCategory_AirPlayReceiverPlatform != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_handleAVAudioSessionInterruption:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;
  int v9;
  const __CFString *v10;
  int v11;
  int v12;
  const __CFString *v13;
  int v14;
  BOOL v15;
  CFDictionaryRef v16;
  void *values;
  void *keys[2];

  keys[1] = *(void **)MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend(a3, "userInfo");
  v6 = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BDB15F0]), "unsignedIntegerValue");
  v7 = (void *)objc_msgSend(a3, "userInfo");
  v8 = objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDB15E0]), "unsignedIntegerValue");
  if (v6 == 1)
  {
    v9 = 0;
    v10 = CFSTR("audioInterruptionBegan");
  }
  else if (v6)
  {
    v10 = 0;
    v9 = 1;
  }
  else
  {
    v9 = 0;
    v10 = CFSTR("audioInterruptionEnded");
  }
  if ((objc_msgSend((id)objc_msgSend(a3, "object"), "isEqual:", -[APAVAudioSessionManager session](+[APAVAudioSessionManager mediaSessionManager](APAVAudioSessionManager, "mediaSessionManager"), "session")) & 1) != 0)
  {
    v12 = 0;
    v13 = CFSTR("Media");
  }
  else
  {
    v14 = objc_msgSend((id)objc_msgSend(a3, "object"), "isEqual:", -[APAVAudioSessionManager session](+[APAVAudioSessionManager ambientSessionManager](APAVAudioSessionManager, "ambientSessionManager"), "session"));
    v12 = v14 ^ 1;
    if (v14)
      v13 = CFSTR("Ambient");
    else
      v13 = 0;
  }
  if (v6)
    v15 = 1;
  else
    v15 = (v8 & 1) == 0;
  if (v15)
  {
    v16 = 0;
  }
  else
  {
    values = (void *)*MEMORY[0x24BDBD270];
    keys[0] = CFSTR("canResume");
    v16 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const void **)keys, (const void **)&values, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  }
  if (gLogCategory_AirPlayReceiverPlatform <= 50
    && (gLogCategory_AirPlayReceiverPlatform != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (v9 || v12)
  {
    APSLogErrorAt();
    if (!v16)
      return;
  }
  else
  {
    AirPlayReceiverServerControl((uint64_t)self->_server, v11, v10, v13, v16, 0);
    if (!v16)
      return;
  }
  CFRelease(v16);
}

- (void)_handleAVAudioSessionServicesReset:(id)a3
{
  int v4;
  void *v5;
  uint64_t v6;

  v5 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", a3);
  if (gLogCategory_AirPlayReceiverPlatform <= 60
    && (gLogCategory_AirPlayReceiverPlatform != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  AirPlayReceiverServerControl((uint64_t)self->_server, v4, CFSTR("partnerProcessDeath"), CFSTR("MediaServices"), 0, 0);
  -[APAVAudioSessionManager resetSession](+[APAVAudioSessionManager mediaSessionManager](APAVAudioSessionManager, "mediaSessionManager"), "resetSession");
  -[APAVAudioSessionManager setUpSessionWithIsMixable:](+[APAVAudioSessionManager mediaSessionManager](APAVAudioSessionManager, "mediaSessionManager"), "setUpSessionWithIsMixable:", self->_server->var40 != 0);
  v6 = *MEMORY[0x24BDB15D8];
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x24BDB15D8], -[APAVAudioSessionManager session](+[APAVAudioSessionManager ambientSessionManager](APAVAudioSessionManager, "ambientSessionManager"), "session"));
  -[APAVAudioSessionManager resetSession](+[APAVAudioSessionManager ambientSessionManager](APAVAudioSessionManager, "ambientSessionManager"), "resetSession");
  -[APAVAudioSessionManager setUpSessionWithIsMixable:](+[APAVAudioSessionManager ambientSessionManager](APAVAudioSessionManager, "ambientSessionManager"), "setUpSessionWithIsMixable:", 1);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__handleAVAudioSessionInterruption_, v6, -[APAVAudioSessionManager session](+[APAVAudioSessionManager ambientSessionManager](APAVAudioSessionManager, "ambientSessionManager"), "session"));
}

- (void)_handleAVAudioSessionServicesLost:(id)a3
{
  if (gLogCategory_AirPlayReceiverPlatform <= 60
    && (gLogCategory_AirPlayReceiverPlatform != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  AirPlayReceiverServerControl((uint64_t)self->_server, (int)a2, CFSTR("partnerProcessDeath"), CFSTR("MediaServices"), 0, 0);
}

- (void)_updateMediaSessionActivationStateBasedOnMediaAudioActiveState:(unsigned __int8)a3 andVideoActiveState:(unsigned __int8)a4
{
  _BOOL8 v5;
  int v6;
  const char *v7;
  _BOOL8 v8;
  _BOOL8 v9;
  const char *v10;
  uint64_t v11;

  if (self->_state.isMediaAudioActive)
    v5 = 1;
  else
    v5 = self->_state.isVideoActive != 0;
  v6 = a4 | a3;
  if (v5 != ((a4 | a3) != 0))
  {
    v11 = 0;
    if (gLogCategory_AirPlayReceiverPlatform <= 50
      && (gLogCategory_AirPlayReceiverPlatform != -1 || _LogCategory_Initialize()))
    {
      if (self->_server->var40)
        v7 = "yes";
      else
        v7 = "no";
      v9 = v6 != 0;
      v10 = v7;
      v8 = v5;
      LogPrintF();
    }
    if (!self->_server->var40)
    {
      if (-[APAVAudioSessionManager setActive:error:](+[APAVAudioSessionManager mediaSessionManager](APAVAudioSessionManager, "mediaSessionManager", v8, v9, v10), "setActive:error:", v6 != 0, &v11))
      {
        if (gLogCategory_AirPlayReceiverPlatform > 50
          || gLogCategory_AirPlayReceiverPlatform == -1 && !_LogCategory_Initialize())
        {
          return;
        }
      }
      else if (gLogCategory_AirPlayReceiverPlatform > 60
             || gLogCategory_AirPlayReceiverPlatform == -1 && !_LogCategory_Initialize())
      {
        return;
      }
      LogPrintF();
    }
  }
}

uint64_t __61__AirPlayReceiverPlatform__avSystemControllerConnectionDied___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchInitialStates");
}

uint64_t __58__AirPlayReceiverPlatform__avSystemControllerMuteChanged___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 88) = *(_BYTE *)(result + 40);
  return result;
}

float __60__AirPlayReceiverPlatform__avSystemControllerVolumeChanged___block_invoke(uint64_t a1)
{
  float result;

  result = *(float *)(a1 + 40);
  *(float *)(*(_QWORD *)(a1 + 32) + 84) = result;
  return result;
}

void __62__AirPlayReceiverPlatform__handleNowPlayingAppStartedPlaying___block_invoke(uint64_t a1, int a2)
{
  _BYTE *v3;

  v3 = *(_BYTE **)(a1 + 32);
  if (!v3[49] && !v3[50])
  {
    if (gLogCategory_AirPlayReceiverPlatform <= 60
      && (gLogCategory_AirPlayReceiverPlatform != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    AirPlayReceiverServerControl(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), a2, CFSTR("otherProcessStartedPlaying"), 0, 0, 0);
    v3 = *(_BYTE **)(a1 + 32);
  }

}

void __75__AirPlayReceiverPlatform_handleMRCommand_translatedAPCommand_withOptions___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  int v3;
  const void *v4;
  CFTypeRef cf;

  cf = 0;
  APReceiverSessionManagerCopyAirPlaySessionWithAttribute(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 216), 0, 0, &cf);
  v2 = cf;
  if (cf)
  {
    if (gLogCategory_AirPlayReceiverPlatform <= 50)
    {
      if (gLogCategory_AirPlayReceiverPlatform != -1 || (v3 = _LogCategory_Initialize(), v2 = cf, v3))
      {
        LogPrintF();
        v2 = cf;
      }
    }
    AirPlayReceiverSessionSendMediaRemoteCommand(v2, *(unsigned int *)(a1 + 48), *(_DWORD *)(a1 + 52), *(const void **)(a1 + 40));
  }
  CFRelease(*(CFTypeRef *)(*(_QWORD *)(a1 + 32) + 8));
  v4 = *(const void **)(a1 + 40);
  if (v4)
    CFRelease(v4);
  if (cf)
    CFRelease(cf);
}

@end
