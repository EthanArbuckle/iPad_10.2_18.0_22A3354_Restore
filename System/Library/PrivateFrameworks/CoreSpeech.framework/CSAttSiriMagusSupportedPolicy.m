@implementation CSAttSiriMagusSupportedPolicy

- (BOOL)getIsAssetMagusSupported
{
  return self->_isAssetMagusSupported;
}

- (BOOL)isMagusSupportedWithInputOrigin:(id)a3 recordRoute:(id)a4 playbackRoute:(id)a5 isInSplitterMode:(BOOL)a6 isInActiveCall:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v12;
  id v13;

  v7 = a7;
  v8 = a6;
  v12 = a5;
  v13 = a4;
  LOBYTE(v7) = -[CSAttSiriMagusSupportedPolicy _isMagusSupportedWithRecordRoute:playbackRoute:isInSplitterMode:isInActiveCall:isSupportedRequestType:audioSessionId:recordDeviceInfo:](self, "_isMagusSupportedWithRecordRoute:playbackRoute:isInSplitterMode:isInActiveCall:isSupportedRequestType:audioSessionId:recordDeviceInfo:", v13, v12, v8, v7, +[CSAttSiriMagusSupportedPolicy _isInputOriginSupportedByContinuousConversation:](CSAttSiriMagusSupportedPolicy, "_isInputOriginSupportedByContinuousConversation:", a3), 0, 0);

  return v7;
}

- (BOOL)isMagusSupportedWithInputOrigin:(id)a3 recordRoute:(id)a4 playbackRoute:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  v9 = a4;
  LOBYTE(a3) = -[CSAttSiriMagusSupportedPolicy _isMagusSupportedWithRecordRoute:playbackRoute:isInSplitterMode:isInActiveCall:isSupportedRequestType:audioSessionId:recordDeviceInfo:](self, "_isMagusSupportedWithRecordRoute:playbackRoute:isInSplitterMode:isInActiveCall:isSupportedRequestType:audioSessionId:recordDeviceInfo:", v9, v8, +[CSAttSiriMagusSupportedPolicy isCurrentlyInSplitterState](CSAttSiriMagusSupportedPolicy, "isCurrentlyInSplitterState"), +[CSAttSiriMagusSupportedPolicy isCurrentlyInActiveCall](CSAttSiriMagusSupportedPolicy, "isCurrentlyInActiveCall"), +[CSAttSiriMagusSupportedPolicy _isInputOriginSupportedByContinuousConversation:](CSAttSiriMagusSupportedPolicy, "_isInputOriginSupportedByContinuousConversation:", a3), 0, 0);

  return (char)a3;
}

- (BOOL)isMagusSupportedWithAudioRecordContext:(id)a3 recordRoute:(id)a4 playbackRoute:(id)a5 audioSessionId:(unsigned int)a6 recordDeviceInfo:(id)a7
{
  uint64_t v7;
  id v12;
  id v13;
  id v14;

  v7 = *(_QWORD *)&a6;
  v12 = a7;
  v13 = a5;
  v14 = a4;
  LOBYTE(v7) = -[CSAttSiriMagusSupportedPolicy _isMagusSupportedWithRecordRoute:playbackRoute:isInSplitterMode:isInActiveCall:isSupportedRequestType:audioSessionId:recordDeviceInfo:](self, "_isMagusSupportedWithRecordRoute:playbackRoute:isInSplitterMode:isInActiveCall:isSupportedRequestType:audioSessionId:recordDeviceInfo:", v14, v13, +[CSAttSiriMagusSupportedPolicy isCurrentlyInSplitterState](CSAttSiriMagusSupportedPolicy, "isCurrentlyInSplitterState"), +[CSAttSiriMagusSupportedPolicy isCurrentlyInActiveCall](CSAttSiriMagusSupportedPolicy, "isCurrentlyInActiveCall"), objc_msgSend(a3, "isAudioRecordTypeSupportedByContinuousConversation"), v7, v12);

  return v7;
}

- (BOOL)_isRouteValidForEchoCancellationWithAppleSiliconMac:(id)a3
{
  return 1;
}

- (BOOL)_isMagusSupportedWithRecordRoute:(id)a3 playbackRoute:(id)a4 isInSplitterMode:(BOOL)a5 isInActiveCall:(BOOL)a6 isSupportedRequestType:(BOOL)a7 audioSessionId:(unsigned int)a8 recordDeviceInfo:(id)a9
{
  uint64_t v9;
  _BOOL4 v10;
  __CFString *v12;
  __CFString *v13;
  id v14;
  int v15;
  os_log_t *v16;
  int v17;
  NSObject *v18;
  const __CFString *v19;
  os_log_t *v20;
  void *v21;
  int v22;
  NSObject *v23;
  int v24;
  int v25;
  int v26;
  char v27;
  os_log_t *v28;
  NSObject *v29;
  _BOOL4 isAssetMagusSupported;
  __CFString *v31;
  __CFString *v32;
  int v33;
  int v34;
  void *v35;
  int v36;
  int v37;
  void *v38;
  void *v39;
  int v40;
  NSObject *v41;
  const __CFString *v42;
  const __CFString *v43;
  const __CFString *v44;
  const __CFString *v45;
  const __CFString *v46;
  const __CFString *v47;
  const __CFString *v48;
  const __CFString *v49;
  NSObject *v50;
  const char *v51;
  NSObject *v52;
  _BOOL4 v54;
  int v55;
  id v56;
  _BOOL4 v57;
  _BOOL4 v59;
  uint8_t buf[4];
  const char *v61;
  __int16 v62;
  const __CFString *v63;
  __int16 v64;
  const __CFString *v65;
  __int16 v66;
  _BYTE v67[10];
  const __CFString *v68;
  __int16 v69;
  const __CFString *v70;
  __int16 v71;
  const __CFString *v72;
  __int16 v73;
  const __CFString *v74;
  __int16 v75;
  const __CFString *v76;
  uint64_t v77;

  v9 = *(_QWORD *)&a8;
  v59 = a7;
  v57 = a6;
  v10 = a5;
  v77 = *MEMORY[0x1E0C80C00];
  v12 = (__CFString *)a3;
  v13 = (__CFString *)a4;
  v14 = a9;
  v15 = objc_msgSend(MEMORY[0x1E0D19260], "isExclaveHardware");
  v16 = (os_log_t *)MEMORY[0x1E0D18F60];
  if (v15 && (objc_msgSend(MEMORY[0x1E0D19260], "isSiriDSPTurnedOn") & 1) == 0)
  {
    v23 = *v16;
    LOBYTE(v24) = 0;
    if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v61 = "-[CSAttSiriMagusSupportedPolicy _isMagusSupportedWithRecordRoute:playbackRoute:isInSplitterMode:isInActiveCa"
            "ll:isSupportedRequestType:audioSessionId:recordDeviceInfo:]";
      _os_log_impl(&dword_1C2614000, v23, OS_LOG_TYPE_DEFAULT, "%s Disable FF since this is Exclave hardware without Siri DSP", buf, 0xCu);
      LOBYTE(v24) = 0;
    }
    goto LABEL_91;
  }
  if (!objc_msgSend(MEMORY[0x1E0D19260], "isJarvisAudioRouteWithRecordRoute:", v12))
  {
    v20 = v16;
    objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "programmableAudioInjectionEnabled");

    if (v22)
    {
      v17 = 1;
      if ((objc_msgSend(MEMORY[0x1E0D19260], "isBuiltInRouteWithRecordRoute:playbackRoute:", v12, v13) & 1) != 0)
      {
LABEL_22:
        v16 = v20;
        goto LABEL_23;
      }
    }
    else
    {
      v25 = CSIsAppleSiliconMac();
      v26 = objc_msgSend(MEMORY[0x1E0D19260], "isBuiltInRecordRoute:", v12);
      v27 = v26;
      if (v25)
      {
        v17 = -[CSAttSiriMagusSupportedPolicy _isRouteValidForEchoCancellationWithAppleSiliconMac:](self, "_isRouteValidForEchoCancellationWithAppleSiliconMac:", v14);
        if ((v27 & 1) != 0)
          goto LABEL_22;
      }
      else if (v26)
      {
        v17 = 1;
        if (objc_msgSend(MEMORY[0x1E0D19260], "fetchHypotheticalRouteTypeFromAudioSessionId:", v9) == 1)
          goto LABEL_22;
      }
      else
      {
        v17 = 1;
      }
    }
    if (!objc_msgSend(MEMORY[0x1E0D19260], "isOutOfBandAudioRouteWithRecordRoute:", v12))
      v17 = 0;
    goto LABEL_22;
  }
  v17 = objc_msgSend(MEMORY[0x1E0D19260], "isCarplayWithFlexibleFollowupEnabled");
  v18 = *v16;
  if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
  {
    v19 = CFSTR("NO");
    if (v17)
      v19 = CFSTR("YES");
    *(_DWORD *)buf = 136315394;
    v61 = "-[CSAttSiriMagusSupportedPolicy _isMagusSupportedWithRecordRoute:playbackRoute:isInSplitterMode:isInActiveCall"
          ":isSupportedRequestType:audioSessionId:recordDeviceInfo:]";
    v62 = 2114;
    v63 = v19;
    _os_log_impl(&dword_1C2614000, v18, OS_LOG_TYPE_DEFAULT, "%s Jarvis route supports FF? %{public}@", buf, 0x16u);
  }
LABEL_23:
  v56 = v14;
  v28 = v16;
  v29 = *v16;
  if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
  {
    isAssetMagusSupported = self->_isAssetMagusSupported;
    *(_DWORD *)buf = 136316418;
    v61 = "-[CSAttSiriMagusSupportedPolicy _isMagusSupportedWithRecordRoute:playbackRoute:isInSplitterMode:isInActiveCall"
          ":isSupportedRequestType:audioSessionId:recordDeviceInfo:]";
    v62 = 2112;
    v63 = v12;
    v64 = 2112;
    v65 = v13;
    v66 = 1024;
    *(_DWORD *)v67 = v17;
    *(_WORD *)&v67[4] = 1024;
    *(_DWORD *)&v67[6] = isAssetMagusSupported;
    LOWORD(v68) = 1024;
    *(_DWORD *)((char *)&v68 + 2) = v10;
    _os_log_impl(&dword_1C2614000, v29, OS_LOG_TYPE_DEFAULT, "%s recordRoute : %@, playbackRoute : %@, isSupportedRoute : %d, isAssetMagusSupported : %d, isInSplitterMode : %d", buf, 0x32u);
  }
  v54 = v10;
  v55 = v17;
  v31 = v13;
  v32 = v12;
  v33 = objc_msgSend(MEMORY[0x1E0D19260], "isContinuousConversationSupported");
  v34 = objc_msgSend(MEMORY[0x1E0D19260], "isContinuousConversationEnabled");
  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "isFlexibleFollowupsUserDisabled");

  v37 = AFPreferencesTypeToSiriEnabled();
  v38 = (void *)MEMORY[0x1E0D19260];
  objc_msgSend(MEMORY[0x1E0D19260], "getSiriLanguageWithFallback:", 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v38, "isMagusDisabledForLanguageCode:", v39);

  v24 = 0;
  if (v33)
  {
    if (v34)
    {
      if ((v36 & 1) == 0 && v59 && ((v55 ^ 1) & 1) == 0)
      {
        v24 = 0;
        if (self->_isAssetMagusSupported && !v57 && !v54)
          v24 = (v37 | v40) ^ 1;
      }
    }
  }
  v41 = *v28;
  if (os_log_type_enabled(*v28, OS_LOG_TYPE_DEFAULT))
  {
    v42 = CFSTR("NO");
    if (v24)
      v43 = CFSTR("YES");
    else
      v43 = CFSTR("NO");
    *(_DWORD *)buf = 136317186;
    v61 = "-[CSAttSiriMagusSupportedPolicy _isMagusSupportedWithRecordRoute:playbackRoute:isInSplitterMode:isInActiveCall"
          ":isSupportedRequestType:audioSessionId:recordDeviceInfo:]";
    if (v57)
      v44 = CFSTR("YES");
    else
      v44 = CFSTR("NO");
    v62 = 2112;
    v63 = v43;
    if (v33)
      v45 = CFSTR("YES");
    else
      v45 = CFSTR("NO");
    v64 = 2112;
    v65 = v44;
    if (v34)
      v46 = CFSTR("YES");
    else
      v46 = CFSTR("NO");
    v66 = 2112;
    *(_QWORD *)v67 = v45;
    if (v59)
      v47 = CFSTR("YES");
    else
      v47 = CFSTR("NO");
    *(_WORD *)&v67[8] = 2112;
    if (v36)
      v48 = CFSTR("YES");
    else
      v48 = CFSTR("NO");
    v68 = v46;
    if (v37)
      v49 = CFSTR("YES");
    else
      v49 = CFSTR("NO");
    v69 = 2112;
    if (v40)
      v42 = CFSTR("YES");
    v70 = v47;
    v71 = 2112;
    v72 = v48;
    v73 = 2112;
    v74 = v49;
    v75 = 2112;
    v76 = v42;
    _os_log_impl(&dword_1C2614000, v41, OS_LOG_TYPE_DEFAULT, "%s isSupported=%@: Is request during active call? %@, isDeviceSupported: %@, isFFEnabledOnDevice: %@, isSupportedRequestType: %@, isFFUserDisabled: %@, isTypeToSiriEnabled: %@, isLocaleInDenyList:%@", buf, 0x5Cu);
  }
  if ((v33 & 1) != 0)
  {
    v12 = v32;
    if ((v34 & 1) != 0)
    {
      v13 = v31;
      v14 = v56;
      if (v36)
      {
        v50 = *MEMORY[0x1E0D18F48];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v61 = "-[CSAttSiriMagusSupportedPolicy _isMagusSupportedWithRecordRoute:playbackRoute:isInSplitterMode:isInActi"
                "veCall:isSupportedRequestType:audioSessionId:recordDeviceInfo:]";
          v51 = "%s Magus is not supported since user disabled switch";
LABEL_90:
          _os_log_impl(&dword_1C2614000, v50, OS_LOG_TYPE_DEFAULT, v51, buf, 0xCu);
        }
      }
      else if (v59)
      {
        if ((v55 & 1) != 0)
        {
          if (self->_isAssetMagusSupported)
          {
            if (v57)
            {
              v50 = *MEMORY[0x1E0D18F48];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315138;
                v61 = "-[CSAttSiriMagusSupportedPolicy _isMagusSupportedWithRecordRoute:playbackRoute:isInSplitterMode:is"
                      "InActiveCall:isSupportedRequestType:audioSessionId:recordDeviceInfo:]";
                v51 = "%s Magus is not supported since device is in active call";
                goto LABEL_90;
              }
            }
            else if (v54)
            {
              v50 = *MEMORY[0x1E0D18F48];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315138;
                v61 = "-[CSAttSiriMagusSupportedPolicy _isMagusSupportedWithRecordRoute:playbackRoute:isInSplitterMode:is"
                      "InActiveCall:isSupportedRequestType:audioSessionId:recordDeviceInfo:]";
                v51 = "%s Magus is not supported since device is in splitter mode";
                goto LABEL_90;
              }
            }
            else if (v37)
            {
              v50 = *MEMORY[0x1E0D18F48];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315138;
                v61 = "-[CSAttSiriMagusSupportedPolicy _isMagusSupportedWithRecordRoute:playbackRoute:isInSplitterMode:is"
                      "InActiveCall:isSupportedRequestType:audioSessionId:recordDeviceInfo:]";
                v51 = "%s Magus is not supported since Type-To-Siri is enabled";
                goto LABEL_90;
              }
            }
            else if (v40)
            {
              v50 = *MEMORY[0x1E0D18F48];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315138;
                v61 = "-[CSAttSiriMagusSupportedPolicy _isMagusSupportedWithRecordRoute:playbackRoute:isInSplitterMode:is"
                      "InActiveCall:isSupportedRequestType:audioSessionId:recordDeviceInfo:]";
                v51 = "%s Magus is not supported since locale is ineligible";
                goto LABEL_90;
              }
            }
          }
          else
          {
            v50 = *MEMORY[0x1E0D18F48];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              v61 = "-[CSAttSiriMagusSupportedPolicy _isMagusSupportedWithRecordRoute:playbackRoute:isInSplitterMode:isIn"
                    "ActiveCall:isSupportedRequestType:audioSessionId:recordDeviceInfo:]";
              v51 = "%s Magus is not supported since assets are ineligible";
              goto LABEL_90;
            }
          }
        }
        else
        {
          v50 = *MEMORY[0x1E0D18F48];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v61 = "-[CSAttSiriMagusSupportedPolicy _isMagusSupportedWithRecordRoute:playbackRoute:isInSplitterMode:isInAc"
                  "tiveCall:isSupportedRequestType:audioSessionId:recordDeviceInfo:]";
            v51 = "%s Magus is not supported since audio route is ineligible";
            goto LABEL_90;
          }
        }
      }
      else
      {
        v50 = *MEMORY[0x1E0D18F48];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v61 = "-[CSAttSiriMagusSupportedPolicy _isMagusSupportedWithRecordRoute:playbackRoute:isInSplitterMode:isInActi"
                "veCall:isSupportedRequestType:audioSessionId:recordDeviceInfo:]";
          v51 = "%s Magus is not supported since request type is ineligible";
          goto LABEL_90;
        }
      }
    }
    else
    {
      v50 = *MEMORY[0x1E0D18F48];
      v13 = v31;
      v14 = v56;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v61 = "-[CSAttSiriMagusSupportedPolicy _isMagusSupportedWithRecordRoute:playbackRoute:isInSplitterMode:isInActive"
              "Call:isSupportedRequestType:audioSessionId:recordDeviceInfo:]";
        v51 = "%s Magus is not supported since Flexible Followup is not enabled on device";
        goto LABEL_90;
      }
    }
  }
  else
  {
    v52 = *MEMORY[0x1E0D18F48];
    v12 = v32;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F48], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v61 = "-[CSAttSiriMagusSupportedPolicy _isMagusSupportedWithRecordRoute:playbackRoute:isInSplitterMode:isInActiveCa"
            "ll:isSupportedRequestType:audioSessionId:recordDeviceInfo:]";
      _os_log_impl(&dword_1C2614000, v52, OS_LOG_TYPE_DEFAULT, "%s Magus is not supported since it's not a FF-capable device", buf, 0xCu);
    }
    v13 = v31;
    v14 = v56;
  }
LABEL_91:

  return v24;
}

- (void)start
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  objc_msgSend(MEMORY[0x1E0D191A0], "phoneCallStateMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:", self);

  self->_isAssetMagusSupported = 0;
  +[CSBluetoothWirelessSplitterMonitor sharedInstance](CSBluetoothWirelessSplitterMonitor, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:", self);

  if (objc_msgSend(MEMORY[0x1E0D19260], "isMedocFeatureEnabled"))
  {
    if (objc_msgSend(MEMORY[0x1E0D19260], "isContinuousConversationSupported"))
    {
      +[CSAttSiriMitigationAssetHandler sharedHandlerDisabledOnDeviceCompilation](CSAttSiriMitigationAssetHandler, "sharedHandlerDisabledOnDeviceCompilation");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "registerObserver:", self);
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __38__CSAttSiriMagusSupportedPolicy_start__block_invoke;
      v6[3] = &unk_1E7C28D98;
      v6[4] = self;
      objc_msgSend(v5, "getMitigationAssetWithEndpointId:completion:", 0, v6);

    }
  }
}

- (void)_updateWithAsset:(id)a3
{
  void *v4;
  id v5;
  int v6;
  int v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0D19260];
  v5 = a3;
  v6 = objc_msgSend(v4, "isContinuousConversationSupported");
  v7 = objc_msgSend(v5, "isMagusSupported");

  self->_isAssetMagusSupported = v6 & v7;
  v8 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315650;
    v10 = "-[CSAttSiriMagusSupportedPolicy _updateWithAsset:]";
    v11 = 1024;
    v12 = v6;
    v13 = 1024;
    v14 = v7;
    _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s DeviceSupport %d AssetSupport %d", (uint8_t *)&v9, 0x18u);
  }
}

- (void)mitigationAssetHandler:(id)a3 endpointId:(id)a4 didChangeCachedAsset:(id)a5
{
  -[CSAttSiriMagusSupportedPolicy _updateWithAsset:](self, "_updateWithAsset:", a5, a4);
}

- (BOOL)isAssetMagusSupported
{
  return self->_isAssetMagusSupported;
}

- (void)setIsAssetMagusSupported:(BOOL)a3
{
  self->_isAssetMagusSupported = a3;
}

uint64_t __38__CSAttSiriMagusSupportedPolicy_start__block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    if (!a3)
      return objc_msgSend(*(id *)(result + 32), "_updateWithAsset:", a2);
  }
  return result;
}

+ (CSAttSiriMagusSupportedPolicy)sharedInstance
{
  if (sharedInstance_onceToken_23252 != -1)
    dispatch_once(&sharedInstance_onceToken_23252, &__block_literal_global_23253);
  return (CSAttSiriMagusSupportedPolicy *)(id)sharedInstance_sharedPolicy_23254;
}

+ (void)initialize
{
  NSObject *v2;
  id v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEBUG))
  {
    v4 = 136315138;
    v5 = "+[CSAttSiriMagusSupportedPolicy initialize]";
    _os_log_debug_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v4, 0xCu);
  }
  v3 = (id)objc_msgSend(MEMORY[0x1E0D19088], "sharedInstance");
}

+ (BOOL)isCurrentlyInSplitterState
{
  void *v2;
  unint64_t v3;

  +[CSBluetoothWirelessSplitterMonitor sharedInstance](CSBluetoothWirelessSplitterMonitor, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "splitterState");

  return v3 > 1;
}

+ (BOOL)isCurrentlyInActiveCall
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0D191A0], "phoneCallStateMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "phoneCallState");

  return (unint64_t)(v3 - 2) < 3;
}

+ (BOOL)_isInputOriginSupportedByContinuousConversation:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D88C78]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D88CA8]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D88C40]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D88CC8]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D88CB0]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D88C80]) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D88C68]);
  }

  return v4;
}

uint64_t __47__CSAttSiriMagusSupportedPolicy_sharedInstance__block_invoke()
{
  CSAttSiriMagusSupportedPolicy *v0;
  void *v1;

  v0 = objc_alloc_init(CSAttSiriMagusSupportedPolicy);
  v1 = (void *)sharedInstance_sharedPolicy_23254;
  sharedInstance_sharedPolicy_23254 = (uint64_t)v0;

  return objc_msgSend((id)sharedInstance_sharedPolicy_23254, "start");
}

@end
