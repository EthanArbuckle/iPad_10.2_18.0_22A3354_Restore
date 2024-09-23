@implementation CSUtils

+ (unint64_t)fetchHypotheticalRouteType
{
  return +[CSUtils fetchHypotheticalRouteTypeFromAudioSessionId:](CSUtils, "fetchHypotheticalRouteTypeFromAudioSessionId:", 0);
}

+ (BOOL)supportHangUp
{
  return _os_feature_enabled_impl();
}

+ (unint64_t)fetchHypotheticalRouteTypeFromAudioSessionId:(unsigned int)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  int v17;
  const char *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "getAudioSessionFromAudioSessionId:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fetchHypotheticalRouteFromAudioSession:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
  {
    v17 = 136315650;
    v18 = "+[CSUtils(AudioDevice) fetchHypotheticalRouteTypeFromAudioSessionId:]";
    v19 = 2114;
    v20 = v6;
    v21 = 2048;
    v22 = a3;
    _os_log_impl(&dword_1B502E000, v7, OS_LOG_TYPE_INFO, "%s hypothetical route = %{public}@ from audioSessionId %lu", (uint8_t *)&v17, 0x20u);
  }
  if (v6
    && (v8 = (_QWORD *)MEMORY[0x1E0D480C0],
        objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D480C0]),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", *v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0C89818]) & 1) != 0)
    {
      v11 = 1;
    }
    else
    {
      objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D48178]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "BOOLValue");

      if (v13)
      {
        objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D48150]);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "BOOLValue");

        if (v15)
          v11 = 2;
        else
          v11 = 0;
      }
      else
      {
        v11 = 0;
      }
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (BOOL)supportRelayCall
{
  if (CSIsIPad_onceToken != -1)
    dispatch_once(&CSIsIPad_onceToken, &__block_literal_global_14);
  return CSIsIPad_isIPad;
}

+ (BOOL)supportHandsFree
{
  if (supportHandsFree_onceToken != -1)
    dispatch_once(&supportHandsFree_onceToken, &__block_literal_global_101);
  return supportHandsFree_result;
}

+ (BOOL)checkEntitlementForToken:(id *)a3 withEntitlement:(id)a4
{
  __CFString *v6;
  const __CFAllocator *v7;
  __int128 v8;
  __SecTask *v9;
  __int128 v10;
  void *v11;
  NSObject *v12;
  CFTypeRef v13;
  __CFError *v14;
  void *v15;
  CFTypeID v16;
  BOOL v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  CFIndex Code;
  NSObject *v22;
  CFErrorRef error;
  audit_token_t token;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a4;
  if (v6)
  {
    v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v8 = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)token.val = *(_OWORD *)a3->var0;
    *(_OWORD *)&token.val[4] = v8;
    v9 = SecTaskCreateWithAuditToken(v7, &token);
    error = 0;
    v10 = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)token.val = *(_OWORD *)a3->var0;
    *(_OWORD *)&token.val[4] = v10;
    objc_msgSend(a1, "auditTokenToString:", &token);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      token.val[0] = 136315650;
      *(_QWORD *)&token.val[1] = "+[CSUtils(Security) checkEntitlementForToken:withEntitlement:]";
      LOWORD(token.val[3]) = 2112;
      *(_QWORD *)((char *)&token.val[3] + 2) = v11;
      HIWORD(token.val[5]) = 2112;
      *(_QWORD *)&token.val[6] = v6;
      _os_log_impl(&dword_1B502E000, v12, OS_LOG_TYPE_DEFAULT, "%s Attempting to check %@ for entitlement: %@", (uint8_t *)&token, 0x20u);
    }
    if (!v9)
    {
      v19 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        token.val[0] = 136315394;
        *(_QWORD *)&token.val[1] = "+[CSUtils(Security) checkEntitlementForToken:withEntitlement:]";
        LOWORD(token.val[3]) = 2112;
        *(_QWORD *)((char *)&token.val[3] + 2) = v11;
        _os_log_error_impl(&dword_1B502E000, v19, OS_LOG_TYPE_ERROR, "%s Error creating audit token for: %@", (uint8_t *)&token, 0x16u);
      }
      v17 = 0;
      goto LABEL_20;
    }
    v13 = SecTaskCopyValueForEntitlement(v9, v6, &error);
    v14 = error;
    if (error
      && (v15 = (void *)CSLogContextFacilityCoreSpeech,
          os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR)))
    {
      v20 = v15;
      Code = CFErrorGetCode(v14);
      token.val[0] = 136315650;
      *(_QWORD *)&token.val[1] = "+[CSUtils(Security) checkEntitlementForToken:withEntitlement:]";
      LOWORD(token.val[3]) = 2112;
      *(_QWORD *)((char *)&token.val[3] + 2) = v11;
      HIWORD(token.val[5]) = 2048;
      *(_QWORD *)&token.val[6] = Code;
      _os_log_error_impl(&dword_1B502E000, v20, OS_LOG_TYPE_ERROR, "%s Warning SecTaskCopyValueForEntitlement failed for token %@ with error (%ld)", (uint8_t *)&token, 0x20u);

      if (v13)
        goto LABEL_8;
    }
    else if (v13)
    {
LABEL_8:
      v16 = CFGetTypeID(v13);
      v17 = v16 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)v13) != 0;
      CFRelease(v13);
LABEL_19:
      CFRelease(v9);
      if (!v14)
      {
LABEL_22:

        goto LABEL_23;
      }
LABEL_20:
      v22 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        token.val[0] = 136315138;
        *(_QWORD *)&token.val[1] = "+[CSUtils(Security) checkEntitlementForToken:withEntitlement:]";
        _os_log_impl(&dword_1B502E000, v22, OS_LOG_TYPE_DEFAULT, "%s Error Issue retrieving entitlement", (uint8_t *)&token, 0xCu);
      }
      goto LABEL_22;
    }
    v17 = 0;
    goto LABEL_19;
  }
  v18 = CSLogContextFacilityCoreSpeech;
  v17 = 0;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    token.val[0] = 136315138;
    *(_QWORD *)&token.val[1] = "+[CSUtils(Security) checkEntitlementForToken:withEntitlement:]";
    _os_log_impl(&dword_1B502E000, v18, OS_LOG_TYPE_DEFAULT, "%s Entitlement was nil. We will assume process is not entitled.", (uint8_t *)&token, 0xCu);
    v17 = 0;
  }
LABEL_23:

  return v17;
}

+ (id)auditTokenToString:(id *)a3
{
  id v4;
  void *v5;
  uint64_t i;

  v4 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%i"), a3->var0[0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", v5);
  for (i = 1; i != 8; ++i)
  {
    objc_msgSend(v4, "appendString:", CFSTR("|"));

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%i"), a3->var0[i]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:", v5);
  }

  return v4;
}

+ (BOOL)supportBluetoothDeviceVoiceTrigger
{
  _BOOL4 v2;

  if (+[CSUtils supportHearstVoiceTrigger](CSUtils, "supportHearstVoiceTrigger")
    || (v2 = +[CSUtils supportJarvisVoiceTrigger](CSUtils, "supportJarvisVoiceTrigger")))
  {
    LOBYTE(v2) = !+[CSUtils isDarwinOS](CSUtils, "isDarwinOS");
  }
  return v2;
}

+ (BOOL)isDarwinOS
{
  return os_variant_is_darwinos();
}

+ (BOOL)supportHearstVoiceTrigger
{
  if (CSIsHorseman_onceToken != -1)
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
  if (CSIsHorseman_isHorseman)
    return 0;
  else
    return !+[CSUtils isDarwinOS](CSUtils, "isDarwinOS");
}

+ (BOOL)isLocalVoiceTriggerAvailable
{
  if (isLocalVoiceTriggerAvailable_onceToken != -1)
    dispatch_once(&isLocalVoiceTriggerAvailable_onceToken, &__block_literal_global_44);
  return isLocalVoiceTriggerAvailable_defaultValue;
}

+ (int64_t)processIdentifier
{
  if (processIdentifier_onceToken != -1)
    dispatch_once(&processIdentifier_onceToken, &__block_literal_global_119);
  return processIdentifier_pid;
}

+ (BOOL)isIOSDeviceSupportingBargeIn
{
  if (isIOSDeviceSupportingBargeIn_onceToken != -1)
    dispatch_once(&isIOSDeviceSupportingBargeIn_onceToken, &__block_literal_global_56);
  return isIOSDeviceSupportingBargeIn_supportBargeIn;
}

+ ($115C4C562B26FF47E01F9F4EA65B5887)getTokenFromDictionary:(SEL)a3 withTokenKey:(id)a4
{
  const __CFDictionary *v7;
  id v8;
  void *v9;
  const __CFData *Value;
  NSObject *v11;
  $115C4C562B26FF47E01F9F4EA65B5887 *result;
  int v13;
  const char *v14;
  __int16 v15;
  const __CFDictionary *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;
  CFRange v20;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = (const __CFDictionary *)a4;
  v8 = a5;
  v9 = v8;
  *(_OWORD *)retstr->var0 = 0u;
  *(_OWORD *)&retstr->var0[4] = 0u;
  if (v7 && v8)
  {
    Value = (const __CFData *)CFDictionaryGetValue(v7, v8);
    v20.location = 0;
    v20.length = 32;
    CFDataGetBytes(Value, v20, (UInt8 *)retstr);
  }
  else
  {
    v11 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136315650;
      v14 = "+[CSUtils(Security) getTokenFromDictionary:withTokenKey:]";
      v15 = 2112;
      v16 = v7;
      v17 = 2112;
      v18 = v9;
      _os_log_impl(&dword_1B502E000, v11, OS_LOG_TYPE_DEFAULT, "%s Token dict: %@ and tokenString: %@ both must be non nil", (uint8_t *)&v13, 0x20u);
    }
  }

  return result;
}

+ (BOOL)supportContinuousVoiceTrigger
{
  return 1;
}

+ (BOOL)supportKeywordDetector
{
  return 0;
}

+ (BOOL)supportPremiumAssets
{
  if (CSHasAOP_onceToken != -1)
    dispatch_once(&CSHasAOP_onceToken, &__block_literal_global_24);
  if (CSHasAOP_hasAOP)
    return !+[CSUtils isDarwinOS](CSUtils, "isDarwinOS");
  if (CSIsHorseman_onceToken != -1)
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
  if (CSIsHorseman_isHorseman)
    return !+[CSUtils isDarwinOS](CSUtils, "isDarwinOS");
  else
    return 0;
}

+ (BOOL)supportOpportunisticZLL
{
  if (objc_msgSend(a1, "isLocalVoiceTriggerAvailable"))
  {
    if (CSIsHorseman_onceToken != -1)
      dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
    if (CSIsHorseman_isHorseman)
      return 1;
  }
  objc_msgSend(a1, "isLocalVoiceTriggerAvailable");
  return 0;
}

+ (BOOL)supportSelfTriggerSuppression:(unint64_t)a3 refChannelIdx:(unint64_t)a4
{
  BOOL v6;
  BOOL result;
  _BOOL4 v8;

  if (+[CSUtils supportSelfTriggerSuppressionWatch](CSUtils, "supportSelfTriggerSuppressionWatch"))
  {
    v6 = +[CSUtils isLocalVoiceTriggerAvailable](CSUtils, "isLocalVoiceTriggerAvailable");
    result = 0;
    if (a3 < 2 || !v6)
      return result;
    return a3 > a4;
  }
  if (CSIsHorseman_onceToken != -1)
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
  if (CSIsHorseman_isHorseman)
    return a3 > a4;
  v8 = +[CSUtils isLocalVoiceTriggerAvailable](CSUtils, "isLocalVoiceTriggerAvailable");
  result = 0;
  if (a3 >= 2 && v8)
    return a3 > a4;
  return result;
}

+ (BOOL)supportSelfTriggerSuppressionWatch
{
  return 0;
}

+ (BOOL)supportCSTwoShotDecision
{
  if (CSIsHorseman_onceToken != -1)
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
  if (CSIsHorseman_isHorseman)
    return objc_msgSend(a1, "isLocalVoiceTriggerAvailable");
  else
    return !+[CSUtils isDarwinOS](CSUtils, "isDarwinOS");
}

+ (BOOL)supportHybridEndpointer
{
  if (CSIsHorseman_onceToken != -1)
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
  return 1;
}

+ (BOOL)supportEndpointerWhileHostAsleep
{
  return 0;
}

+ (BOOL)supportSmartVolume
{
  if (CSIsHorseman_onceToken != -1)
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
  return CSIsHorseman_isHorseman;
}

+ (BOOL)supportSAT
{
  if (CSIsHorseman_onceToken != -1)
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
  return CSIsHorseman_isHorseman == 0;
}

+ (BOOL)supportTTS
{
  if (supportTTS_onceToken != -1)
    dispatch_once(&supportTTS_onceToken, &__block_literal_global_50);
  return supportTTS_supportTTS;
}

+ (BOOL)supportRaiseToSpeak
{
  if (supportRaiseToSpeak_onceToken != -1)
    dispatch_once(&supportRaiseToSpeak_onceToken, &__block_literal_global_53);
  return 0;
}

+ (BOOL)supportCompactPlus
{
  if (supportCompactPlus_onceToken != -1)
    dispatch_once(&supportCompactPlus_onceToken, &__block_literal_global_54);
  return 0;
}

+ (BOOL)supportPremiumWatchAssets
{
  return 0;
}

+ (BOOL)supportAdBlocker
{
  if (CSIsHorseman_onceToken != -1)
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
  return CSIsHorseman_isHorseman;
}

+ (BOOL)supportContinuousAudioFingerprint
{
  if (CSIsHorseman_onceToken != -1)
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
  return CSIsHorseman_isHorseman;
}

+ (BOOL)supportPremiumModel
{
  if (CSIsHorseman_onceToken != -1)
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
  if (CSIsHorseman_isHorseman)
    return 1;
  if (CSHasAOP_onceToken != -1)
    dispatch_once(&CSHasAOP_onceToken, &__block_literal_global_24);
  return CSHasAOP_hasAOP != 0;
}

+ (BOOL)supportPhatic
{
  if (CSIsHorseman_onceToken != -1)
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
  return 1;
}

+ (BOOL)shouldDelayTwoShotFeedbackForMyriadDecision
{
  if (CSIsHorseman_onceToken != -1)
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
  return CSIsHorseman_isHorseman;
}

+ (BOOL)supportSessionActivateDelay
{
  if (CSIsHorseman_onceToken != -1)
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
  return 1;
}

+ (BOOL)supportLanguageDetector
{
  if (CSIsHorseman_onceToken != -1)
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
  return CSIsHorseman_isHorseman == 0;
}

+ (BOOL)shouldDownloadVTAssetsOnDaemon
{
  if (CSIsHorseman_onceToken != -1)
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
  return CSIsHorseman_isHorseman;
}

+ (BOOL)supportMyriadLightHouse
{
  return 0;
}

+ (BOOL)supportAcousticProgressiveChecker
{
  if (!+[CSUtils isDarwinOS](CSUtils, "isDarwinOS"))
    return 1;
  if (CSIsHorseman_onceToken != -1)
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
  return CSIsHorseman_isHorseman != 0;
}

+ (BOOL)hasRemoteCoreSpeech
{
  return 0;
}

+ (BOOL)supportJarvisVoiceTrigger
{
  if (CSIsHorseman_onceToken != -1)
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
  if (CSIsHorseman_isHorseman)
    return 0;
  else
    return !+[CSUtils isDarwinOS](CSUtils, "isDarwinOS");
}

+ (BOOL)supportRemoraVoiceTrigger
{
  if (CSIsHorseman_onceToken != -1)
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
  return !+[CSUtils isDarwinOS](CSUtils, "isDarwinOS");
}

+ (BOOL)supportVoiceTriggerChannelSelection
{
  if (CSIsHorseman_onceToken != -1)
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
  if (CSIsHorseman_isHorseman)
    return 1;
  if (CSIsTorpedo_onceToken != -1)
    dispatch_once(&CSIsTorpedo_onceToken, &__block_literal_global_2532);
  return CSIsTorpedo_isTorpedo != 0;
}

+ (BOOL)supportHomeKitAccessory
{
  if (CSIsHorseman_onceToken != -1)
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
  return CSIsHorseman_isHorseman;
}

+ (BOOL)supportRemoteDarwinVoiceTrigger
{
  if (supportRemoteDarwinVoiceTrigger_onceToken != -1)
    dispatch_once(&supportRemoteDarwinVoiceTrigger_onceToken, &__block_literal_global_61);
  return supportRemoteDarwinVoiceTrigger_supportDarwinVT;
}

+ (BOOL)shouldDeinterleaveAudioOnCS
{
  if (CSIsHorseman_onceToken != -1)
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
  return CSIsHorseman_isHorseman
      || +[CSUtils isLocalVoiceTriggerAvailable](CSUtils, "isLocalVoiceTriggerAvailable");
}

+ (BOOL)supportCircularBuffer
{
  if (CSIsHorseman_onceToken != -1)
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
  return CSIsHorseman_isHorseman
      || +[CSUtils supportBluetoothDeviceVoiceTrigger](CSUtils, "supportBluetoothDeviceVoiceTrigger");
}

+ (BOOL)supportBeepCanceller:(unint64_t)a3 recordType:(int64_t)a4
{
  if (a4 == 21)
    return 0;
  if (CSIsHorseman_onceToken != -1)
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
  return a3 == 1 && CSIsHorseman_isHorseman == 0;
}

+ (BOOL)supportZeroFilter:(unint64_t)a3
{
  if (CSIsHorseman_onceToken != -1)
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
  return a3 < 2 && CSIsHorseman_isHorseman == 0;
}

+ (BOOL)supportsDispatchWorkloop
{
  if (CSIsHorseman_onceToken != -1)
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
  return CSIsHorseman_isHorseman;
}

+ (id)rootQueueWithFixedPriority:(int)a3
{
  void *v4;
  sched_param v6;
  pthread_attr_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  memset(&v7, 0, sizeof(v7));
  pthread_attr_init(&v7);
  v6 = 0;
  pthread_attr_getschedparam(&v7, &v6);
  v6.sched_priority = a3;
  pthread_attr_setschedparam(&v7, &v6);
  pthread_attr_setschedpolicy(&v7, 2);
  pthread_attr_setinheritsched(&v7, 2);
  v4 = (void *)dispatch_pthread_root_queue_create();
  pthread_attr_destroy(&v7);
  return v4;
}

+ (id)dispatchWorkloopWithWithQOS:(unsigned int)a3 name:(id)a4 fixedPriority:(int)a5
{
  NSObject *inactive;

  inactive = dispatch_workloop_create_inactive((const char *)objc_msgSend(objc_retainAutorelease(a4), "cStringUsingEncoding:", 4));
  dispatch_workloop_set_autorelease_frequency(inactive, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_workloop_set_scheduler_priority();
  dispatch_set_qos_class_fallback();
  dispatch_activate(inactive);
  return inactive;
}

+ (id)getSerialQueueWithQOS:(unsigned int)a3 name:(id)a4 fixedPriority:(unsigned __int8)a5
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  dispatch_queue_t v11;

  v5 = a5;
  v6 = *(_QWORD *)&a3;
  v7 = a4;
  if (+[CSUtils supportsDispatchWorkloop](CSUtils, "supportsDispatchWorkloop"))
    +[CSUtils dispatchWorkloopWithWithQOS:name:fixedPriority:](CSUtils, "dispatchWorkloopWithWithQOS:name:fixedPriority:", v6, v7, v5);
  else
    +[CSUtils rootQueueWithFixedPriority:](CSUtils, "rootQueueWithFixedPriority:", v5);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-serialq"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_retainAutorelease(v9);
  v11 = dispatch_queue_create_with_target_V2((const char *)objc_msgSend(v10, "UTF8String"), 0, v8);

  return v11;
}

+ (id)getSerialQueue:(id)a3 qualityOfService:(unsigned int)a4
{
  NSObject *v5;
  dispatch_queue_t v6;

  dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)a4, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = dispatch_queue_create((const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"), v5);

  return v6;
}

+ (id)getSerialQueue:(id)a3 withQualityOfService:(unsigned int)a4 andTargetQueue:(id)a5
{
  NSObject *v7;
  id v8;
  NSObject *v9;
  dispatch_queue_t v10;

  dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)a4, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = objc_retainAutorelease(a3);
  v9 = a5;
  v10 = dispatch_queue_create_with_target_V2((const char *)objc_msgSend(v8, "UTF8String"), v7, v9);

  return v10;
}

+ (id)deviceProductType
{
  if (deviceProductType_onceToken != -1)
    dispatch_once(&deviceProductType_onceToken, &__block_literal_global_69);
  return deviceProductType_currDeviceProductType;
}

+ (id)deviceProductVersion
{
  if (deviceProductVersion_onceToken != -1)
    dispatch_once(&deviceProductVersion_onceToken, &__block_literal_global_72);
  return deviceProductVersion_currDeviceProductVersion[0];
}

+ (id)deviceIdentifier
{
  if (deviceIdentifier_onceToken != -1)
    dispatch_once(&deviceIdentifier_onceToken, &__block_literal_global_75);
  return deviceIdentifier_deviceId;
}

+ (double)systemUpTime
{
  double result;
  timeval v4;

  if (systemUpTime_onceToken != -1)
    dispatch_once(&systemUpTime_onceToken, &__block_literal_global_78);
  result = -1.0;
  if (systemUpTime_result != -1 && systemUpTime_bootTime != 0)
  {
    v4.tv_sec = 0;
    *(_QWORD *)&v4.tv_usec = 0;
    gettimeofday(&v4, 0);
    return (double)(v4.tv_usec - dword_1EF0F6310) / 1000000.0 + (double)(v4.tv_sec - systemUpTime_bootTime);
  }
  return result;
}

+ (id)deviceUserAssignedName
{
  return (id)MGCopyAnswer();
}

+ (id)deviceBuildVersion
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  v2 = (__CFString *)MGCopyAnswer();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("???");
  v4 = v2;

  return v4;
}

+ (id)deviceHwRevision
{
  mach_port_t v2;
  const __CFDictionary *v3;
  io_service_t MatchingService;
  io_object_t v5;
  void *CFProperty;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  NSObject *v13;
  __CFString *v14;
  NSObject *v15;
  NSObject *v16;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CBBAA8];
  v3 = IOServiceMatching("IOPlatformExpertDevice");
  MatchingService = IOServiceGetMatchingService(v2, v3);
  if (MatchingService)
  {
    v5 = MatchingService;
    CFProperty = (void *)IORegistryEntryCreateCFProperty(MatchingService, CFSTR("config-number"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
    if (CFProperty)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", CFProperty, 4);
      objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("/"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "componentsSeparatedByCharactersInSet:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if ((unint64_t)objc_msgSend(v9, "count") < 2)
      {
        v12 = CFSTR("???");
      }
      else
      {
        v10 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("%@"), v11);
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      v16 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v19 = "+[CSUtils deviceHwRevision]";
        v20 = 2114;
        v21 = v12;
        _os_log_impl(&dword_1B502E000, v16, OS_LOG_TYPE_INFO, "%s Fetched hardware revision : %{public}@", buf, 0x16u);
      }

    }
    else
    {
      v15 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v19 = "+[CSUtils deviceHwRevision]";
        _os_log_error_impl(&dword_1B502E000, v15, OS_LOG_TYPE_ERROR, "%s Failed to find property \"config-number\", buf, 0xCu);
      }
      v12 = CFSTR("???");
    }
    IOObjectRelease(v5);
    v14 = v12;

  }
  else
  {
    v13 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "+[CSUtils deviceHwRevision]";
      _os_log_error_impl(&dword_1B502E000, v13, OS_LOG_TYPE_ERROR, "%s Failed to find matching service to IOPlatformExpertDevice", buf, 0xCu);
    }
    v14 = CFSTR("???");
  }

  return v14;
}

+ (id)timeStampWithSaltGrain
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  objc_msgSend(v2, "setDateFormat:", CFSTR("yyyyMMdd"));
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", (double)arc4random_uniform(7u) * -86400.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFromDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)isBridgeOS
{
  return 0;
}

+ (BOOL)supportsSpeakerRecognitionAssets
{
  BOOL result;

  if (CSIsHorseman_onceToken != -1)
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
  if (!CSIsHorseman_isHorseman)
    return supportsSpeakerRecognitionAssets_result;
  result = 1;
  supportsSpeakerRecognitionAssets_result = 1;
  return result;
}

+ (BOOL)supportsSiriLiminal
{
  if (CSIsHorseman_onceToken != -1)
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
  return 1;
}

+ (BOOL)supportNonInterruptibleSiri
{
  return +[CSUtils isIOSDeviceSupportingBargeIn](CSUtils, "isIOSDeviceSupportingBargeIn");
}

+ (BOOL)supportsANE
{
  return MGGetBoolAnswer();
}

+ (BOOL)supportsUnderstandingOnDevice
{
  if (+[CSUtils isDarwinOS](CSUtils, "isDarwinOS"))
    return 0;
  if (supportsUnderstandingOnDevice_onceToken != -1)
    dispatch_once(&supportsUnderstandingOnDevice_onceToken, &__block_literal_global_104);
  return supportsUnderstandingOnDevice_result != 0;
}

+ (BOOL)supportsHybridUnderstandingOnDevice
{
  if (+[CSUtils isDarwinOS](CSUtils, "isDarwinOS"))
    return 0;
  if (supportsHybridUnderstandingOnDevice_onceToken != -1)
    dispatch_once(&supportsHybridUnderstandingOnDevice_onceToken, &__block_literal_global_105);
  return supportsHybridUnderstandingOnDevice_result != 0;
}

+ (BOOL)supportsDictationOnDevice
{
  if (supportsDictationOnDevice_onceToken != -1)
    dispatch_once(&supportsDictationOnDevice_onceToken, &__block_literal_global_106);
  return supportsDictationOnDevice_result;
}

+ (BOOL)supportsSpeechRecognitionOnDevice
{
  return +[CSUtils supportsUnderstandingOnDevice](CSUtils, "supportsUnderstandingOnDevice")
      || +[CSUtils supportsDictationOnDevice](CSUtils, "supportsDictationOnDevice");
}

+ (BOOL)isAttentiveSiriEnabled
{
  return !+[CSUtils isDarwinOS](CSUtils, "isDarwinOS");
}

+ (BOOL)isMagusDisabledForLanguageCode:(id)a3
{
  uint64_t v3;
  id v4;
  char v5;

  v3 = isMagusDisabledForLanguageCode__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&isMagusDisabledForLanguageCode__onceToken, &__block_literal_global_108);
  v5 = objc_msgSend((id)isMagusDisabledForLanguageCode__magusNotSupportedLocales, "containsObject:", v4);

  if (v4)
    return v5;
  else
    return 1;
}

+ (BOOL)isContinuousConversationSupported
{
  if (+[CSUtils isDarwinOS](CSUtils, "isDarwinOS"))
    return 0;
  if (isContinuousConversationSupported_onceToken != -1)
    dispatch_once(&isContinuousConversationSupported_onceToken, &__block_literal_global_112);
  return isContinuousConversationSupported_result;
}

+ (BOOL)isContinuousConversationEnabled
{
  return +[CSUtils isContinuousConversationSupported](CSUtils, "isContinuousConversationSupported");
}

+ (BOOL)isCarplayWithFlexibleFollowupEnabled
{
  if (+[CSUtils isDarwinOS](CSUtils, "isDarwinOS"))
    return 0;
  if (isCarplayWithFlexibleFollowupEnabled_onceToken != -1)
    dispatch_once(&isCarplayWithFlexibleFollowupEnabled_onceToken, &__block_literal_global_113);
  return isCarplayWithFlexibleFollowupEnabled_result != 0;
}

+ (BOOL)isMultiUserMedocFeatureEnabled
{
  if (+[CSUtils isDarwinOS](CSUtils, "isDarwinOS"))
    return 0;
  if (isMultiUserMedocFeatureEnabled_onceToken != -1)
    dispatch_once(&isMultiUserMedocFeatureEnabled_onceToken, &__block_literal_global_115);
  return isMultiUserMedocFeatureEnabled_result != 0;
}

+ (BOOL)isMedocFeatureEnabled
{
  if (+[CSUtils isDarwinOS](CSUtils, "isDarwinOS"))
    return 0;
  if (isMedocFeatureEnabled_onceToken != -1)
    dispatch_once(&isMedocFeatureEnabled_onceToken, &__block_literal_global_116);
  return isMedocFeatureEnabled_result != 0;
}

+ (BOOL)isFlexibleEndpointingEnabled
{
  if (+[CSUtils isDarwinOS](CSUtils, "isDarwinOS"))
    return 0;
  if (isFlexibleEndpointingEnabled_onceToken != -1)
    dispatch_once(&isFlexibleEndpointingEnabled_onceToken, &__block_literal_global_117);
  return isFlexibleEndpointingEnabled_result != 0;
}

+ (BOOL)deviceRequirePowerAssertionHeld
{
  return +[CSUtils isDarwinOS](CSUtils, "isDarwinOS");
}

+ (BOOL)deviceRequirePreventStandbyAssertion
{
  return +[CSUtils isDarwinOS](CSUtils, "isDarwinOS");
}

+ (BOOL)supportsAudioMessage
{
  return +[CSUtils isMedocFeatureEnabled](CSUtils, "isMedocFeatureEnabled");
}

+ (BOOL)supportsEndpointingOnATV
{
  objc_msgSend(MEMORY[0x1E0CFE8C0], "isTVPushToTalkEnabled");
  return 0;
}

+ (BOOL)supportTrialMitigationAssets
{
  return 1;
}

+ (BOOL)supportRingtoneA2DP
{
  return _os_feature_enabled_impl();
}

+ (BOOL)shouldBlockVoiceTriggerWhenOtherAppRecording
{
  return 0;
}

+ (BOOL)supportMph
{
  _BOOL4 v2;
  BOOL result;

  v2 = +[CSUtils supportMphAssets](CSUtils, "supportMphAssets");
  result = +[CSUtils isDarwinOS](CSUtils, "isDarwinOS");
  if (!result && v2)
    return _os_feature_enabled_impl();
  return result;
}

+ (BOOL)supportMphAssets
{
  if (+[CSUtils isDarwinOS](CSUtils, "isDarwinOS"))
    return 1;
  else
    return AFDeviceSupportsSiriUOD();
}

+ (BOOL)isM9Device
{
  if (isM9Device_onceToken != -1)
    dispatch_once(&isM9Device_onceToken, &__block_literal_global_130);
  return isM9Device_isM9Device;
}

+ (BOOL)supportsMphForLanguageCode:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  BOOL v6;

  v3 = a3;
  if (+[CSUtils isDarwinOS](CSUtils, "isDarwinOS"))
  {
    v4 = v3;
    v5 = 3;
  }
  else
  {
    if (CSIsIPad_onceToken != -1)
      dispatch_once(&CSIsIPad_onceToken, &__block_literal_global_14);
    v4 = v3;
    if (CSIsIPad_isIPad)
      v5 = 2;
    else
      v5 = 1;
  }
  v6 = +[CSUtils supportsMphForLanguageCode:forDeviceType:](CSUtils, "supportsMphForLanguageCode:forDeviceType:", v4, v5);

  return v6;
}

+ (BOOL)supportsMphForLanguageCode:(id)a3 forDeviceType:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  char v12;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = 0;
  if (a4 <= 9)
  {
    if (((1 << a4) & 0x1F7) != 0)
    {
      v7 = &unk_1E68A19F0;
    }
    else
    {
      if (a4 == 3)
      {
        v12 = 1;
        goto LABEL_20;
      }
      v7 = &unk_1E68A1A08;
    }
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v7);
  }
  if (CSIsInternalBuild_onceToken != -1)
    dispatch_once(&CSIsInternalBuild_onceToken, &__block_literal_global_33);
  if (CSIsInternalBuild_isInternal)
  {
    +[CSFPreferences sharedPreferences](CSFPreferences, "sharedPreferences");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "whiteListedMultiPhraseLocales");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 136315394;
      v15 = "+[CSUtils supportsMphForLanguageCode:forDeviceType:]";
      v16 = 2112;
      v17 = v9;
      _os_log_impl(&dword_1B502E000, v10, OS_LOG_TYPE_DEFAULT, "%s whiteListLocales: %@", (uint8_t *)&v14, 0x16u);
    }
    if (v9 && objc_msgSend(v9, "count"))
      objc_msgSend(v6, "addObjectsFromArray:", v9);

  }
  v11 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136315394;
    v15 = "+[CSUtils supportsMphForLanguageCode:forDeviceType:]";
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_1B502E000, v11, OS_LOG_TYPE_DEFAULT, "%s supportsMph language list: %@", (uint8_t *)&v14, 0x16u);
  }
  if (v5 && +[CSUtils supportMph](CSUtils, "supportMph"))
    v12 = objc_msgSend(v6, "containsObject:", v5);
  else
    v12 = 0;
LABEL_20:

  return v12;
}

+ (BOOL)supportsMagusForLanguageCode:(id)a3
{
  uint64_t v3;
  id v4;
  char v5;

  v3 = supportsMagusForLanguageCode__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&supportsMagusForLanguageCode__onceToken, &__block_literal_global_159);
  v5 = objc_msgSend((id)supportsMagusForLanguageCode__magusSupportedLocales, "containsObject:", v4);

  return v5;
}

+ (BOOL)supportAudioTappingSelfTrigger
{
  if (+[CSUtils isExclaveHardware](CSUtils, "isExclaveHardware"))
    return 1;
  if (+[CSUtils isDarwinOS](CSUtils, "isDarwinOS"))
    return 0;
  return _os_feature_enabled_impl();
}

+ (BOOL)supportTelephonyAudioTap
{
  return +[CSUtils isIOSDeviceSupportingBargeIn](CSUtils, "isIOSDeviceSupportingBargeIn");
}

+ (unint64_t)horsemanDeviceType
{
  return 0;
}

+ (id)getResourcePathInSystemDomainMaskByAppending:(id)a3
{
  return CSResourcePathInSystemDomainMaskByAppending(a3, 0);
}

+ (id)getResourcePathInSystemDomainMaskFromRootPathByAppending:(id)a3
{
  return CSResourcePathInSystemDomainMaskByAppending(a3, 1);
}

+ (BOOL)allowExtendedRingBufferSize
{
  return !+[CSUtils isDarwinOS](CSUtils, "isDarwinOS");
}

+ (BOOL)platformSupportsImplicitUttAddition
{
  return !+[CSUtils isDarwinOS](CSUtils, "isDarwinOS");
}

+ (BOOL)isTCUSupported
{
  return 1;
}

+ (BOOL)supportStateFeedback
{
  return _os_feature_enabled_impl();
}

+ (BOOL)supportMedocAnnounce
{
  return _os_feature_enabled_impl();
}

+ (BOOL)supportVoiceID
{
  if (CSIsHorseman_onceToken != -1)
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
  return CSIsHorseman_isHorseman;
}

+ (BOOL)supportEarconRemoval
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isSiriDSPTurnedOn
{
  return _os_feature_enabled_impl();
}

+ (void)withElapsedTimeLogging:(id)a3 execute:(id)a4
{
  id v5;
  void *v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1E0C99D68];
  v7 = (void (**)(_QWORD))a4;
  objc_msgSend(v6, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    objc_msgSend(v9, "timeIntervalSinceDate:", v8);
    v13 = 136315650;
    v14 = "+[CSUtils withElapsedTimeLogging:execute:]";
    v15 = 2114;
    v16 = v5;
    v17 = 2050;
    v18 = v12;
    _os_log_impl(&dword_1B502E000, v11, OS_LOG_TYPE_DEFAULT, "%s %{public}@ elapsed time = %{public}lf", (uint8_t *)&v13, 0x20u);

  }
}

+ (BOOL)isASRViaSpeechAPIEnabled
{
  if (isASRViaSpeechAPIEnabled_onceToken != -1)
    dispatch_once(&isASRViaSpeechAPIEnabled_onceToken, &__block_literal_global_165);
  return isASRViaSpeechAPIEnabled_isAvailable;
}

+ (BOOL)supportsSCDAFramework
{
  if (supportsSCDAFramework_onceToken != -1)
    dispatch_once(&supportsSCDAFramework_onceToken, &__block_literal_global_166);
  return supportsSCDAFramework_scdaFrameworkEnabled;
}

+ (void)mmapWithFile:(id)a3 mappedSizeOut:(id *)a4
{
  id v5;
  uint64_t v6;
  int v7;
  unint64_t v8;
  size_t v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  int v16;
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  size_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = +[CSUtils getFileDescriptor:](CSUtils, "getFileDescriptor:", v5);
  if ((v6 & 0x80000000) != 0)
  {
    v13 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v16 = 136315394;
      v17 = "+[CSUtils mmapWithFile:mappedSizeOut:]";
      v18 = 2112;
      v19 = v5;
      _os_log_error_impl(&dword_1B502E000, v13, OS_LOG_TYPE_ERROR, "%s failed to open file of: %@", (uint8_t *)&v16, 0x16u);
    }
    goto LABEL_15;
  }
  v7 = v6;
  v8 = +[CSUtils getFileSizeWithFd:](CSUtils, "getFileSizeWithFd:", v6);
  if (!v8)
  {
    close(v7);
LABEL_15:
    v11 = 0;
    goto LABEL_16;
  }
  v9 = v8;
  v10 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136315650;
    v17 = "+[CSUtils mmapWithFile:mappedSizeOut:]";
    v18 = 2112;
    v19 = v5;
    v20 = 2048;
    v21 = v9;
    _os_log_impl(&dword_1B502E000, v10, OS_LOG_TYPE_DEFAULT, "%s readed file: %@ with mmaped size: %lu", (uint8_t *)&v16, 0x20u);
  }
  v11 = mmap(0, v9, 1, 1, v7, 0);
  close(v7);
  if (!v11)
  {
    v14 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 136315394;
      v17 = "+[CSUtils mmapWithFile:mappedSizeOut:]";
      v18 = 2112;
      v19 = v5;
      _os_log_impl(&dword_1B502E000, v14, OS_LOG_TYPE_DEFAULT, "%s Cannot mmap the graph: %@", (uint8_t *)&v16, 0x16u);
    }
    goto LABEL_15;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v9);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136315650;
    v17 = "+[CSUtils mmapWithFile:mappedSizeOut:]";
    v18 = 2112;
    v19 = v5;
    v20 = 2048;
    v21 = v9;
    _os_log_impl(&dword_1B502E000, v12, OS_LOG_TYPE_DEFAULT, "%s mmaped file: %@ with mapped size: %lu is successful", (uint8_t *)&v16, 0x20u);
  }
LABEL_16:

  return v11;
}

+ (BOOL)readOptimizationMadviseWithVaddr:(void *)a3 mmapedSize:(unint64_t)a4 preLoadChunkSize:(unint64_t)a5
{
  BOOL result;
  unint64_t v6;
  char *v9;
  size_t v10;
  NSObject *v11;
  void *v12;
  _BOOL4 v13;
  NSObject *v14;
  int *v15;
  char *v16;
  int v17;
  const char *v18;
  __int16 v19;
  char *v20;
  uint64_t v21;

  result = 0;
  v21 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v6 = a4;
    if (a4)
    {
      if (a5)
      {
        v9 = 0;
        while (1)
        {
          v10 = v6 >= a5 ? a5 : v6;
          if (madvise(&v9[(_QWORD)a3], v10, 3) < 0)
            break;
          v9 += v10;
          v6 -= v10;
          if (!v6)
          {
            v11 = CSLogContextFacilityCoreSpeech;
            if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
            {
              v17 = 136315394;
              v18 = "+[CSUtils readOptimizationMadviseWithVaddr:mmapedSize:preLoadChunkSize:]";
              v19 = 2048;
              v20 = v9;
              _os_log_impl(&dword_1B502E000, v11, OS_LOG_TYPE_DEFAULT, "%s read optimization processed size: %lu", (uint8_t *)&v17, 0x16u);
            }
            return 1;
          }
        }
        v12 = (void *)CSLogContextFacilityCoreSpeech;
        v13 = os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
        result = 0;
        if (v13)
        {
          v14 = v12;
          v15 = __error();
          v16 = strerror(*v15);
          v17 = 136315394;
          v18 = "+[CSUtils readOptimizationMadviseWithVaddr:mmapedSize:preLoadChunkSize:]";
          v19 = 2080;
          v20 = v16;
          _os_log_impl(&dword_1B502E000, v14, OS_LOG_TYPE_DEFAULT, "%s Failed to madvise() because error: %s", (uint8_t *)&v17, 0x16u);

          return 0;
        }
      }
    }
  }
  return result;
}

+ (int)getFileDescriptor:(id)a3
{
  return open((const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"), 0);
}

+ (BOOL)faultPagesWithVaddr:(void *)a3 mmapedSize:(unint64_t)a4 filePath:(id)a5
{
  id v7;
  void *v8;
  BOOL v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  unint64_t v14;
  NSObject *v15;
  void *v16;
  NSObject *v18;
  int *v19;
  char *v20;
  _QWORD v21[2];
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  _WORD v25[17];

  *(_QWORD *)&v25[13] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = v7;
  v9 = 0;
  if (a3 && a4 && v7)
  {
    v10 = +[CSUtils getFileDescriptor:](CSUtils, "getFileDescriptor:", v7);
    if (v10 < 0)
    {
      v15 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v23 = "+[CSUtils faultPagesWithVaddr:mmapedSize:filePath:]";
        v24 = 2112;
        *(_QWORD *)v25 = v8;
        _os_log_error_impl(&dword_1B502E000, v15, OS_LOG_TYPE_ERROR, "%s failed to open file of: %@", buf, 0x16u);
      }
      v9 = 0;
    }
    else
    {
      v11 = v10;
      v21[0] = 0;
      v21[1] = a4;
      v12 = fcntl(v10, 44, v21);
      v9 = v12 != -1;
      if (v12 == -1)
      {
        v16 = (void *)CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          v18 = v16;
          v19 = __error();
          v20 = strerror(*v19);
          *(_DWORD *)buf = 136315650;
          v23 = "+[CSUtils faultPagesWithVaddr:mmapedSize:filePath:]";
          v24 = 1024;
          *(_DWORD *)v25 = v11;
          v25[2] = 2080;
          *(_QWORD *)&v25[3] = v20;
          _os_log_error_impl(&dword_1B502E000, v18, OS_LOG_TYPE_ERROR, "%s failed to fcntl fd: %d with error: %s", buf, 0x1Cu);

        }
      }
      else
      {
        buf[0] = 0;
        v13 = sysconf(29);
        v14 = 0;
        do
        {
          buf[0] = *((_BYTE *)a3 + v14);
          v14 += v13;
        }
        while (v14 < a4);
      }
      close(v11);
    }
  }

  return v9;
}

+ (BOOL)isExclaveHardware
{
  if (isExclaveHardware_onceToken != -1)
    dispatch_once(&isExclaveHardware_onceToken, &__block_literal_global_168);
  return isExclaveHardware_isExclaveHardware;
}

+ (BOOL)supportsLogger
{
  void *v2;
  char v3;

  +[CSFPreferences sharedPreferences](CSFPreferences, "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAttentiveSiriAudioLoggingEnabled");

  return v3;
}

+ (unint64_t)getFileSizeWithFd:(int)a3
{
  NSObject *v3;
  stat v5;
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  memset(&v5, 0, sizeof(v5));
  if (!fstat(a3, &v5))
    return v5.st_size;
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "+[CSUtils getFileSizeWithFd:]";
    _os_log_error_impl(&dword_1B502E000, v3, OS_LOG_TYPE_ERROR, "%s failed to get file stats", buf, 0xCu);
  }
  return 0;
}

+ (BOOL)isOnDeviceASRAudioLoggingEnabled
{
  return 1;
}

+ (BOOL)isFirstPassSourceTypeRingtoneWithVTEI:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("firstPassTriggerSource"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPassTriggerSource"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("ApplicationProcessorWithRingtone")) & 1) != 0)
      {
        v7 = 1;
      }
      else
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPassTriggerSource"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v8, "isEqualToString:", CFSTR("ApplicationProcessorWithRingtone"));

      }
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)isVoiceTriggerFromExclaveWithVTEI:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("firstPassTriggerSource"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPassTriggerSource"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("ApplicationProcessorExclave")) & 1) != 0)
      {
        v7 = 1;
      }
      else
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPassTriggerSource"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v8, "isEqualToString:", CFSTR("BuiltInAlwaysOnProcessorExclave")) & 1) != 0)
        {
          v7 = 1;
        }
        else
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPassTriggerSource"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v9, "isEqualToString:", CFSTR("ApplicationProcessorExclaveWithRingtone")) & 1) != 0)
          {
            v7 = 1;
          }
          else
          {
            objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firstPassTriggerSource"));
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v7 = objc_msgSend(v10, "isEqualToString:", CFSTR("ApplicationProcessorExclaveWithConnectedCall"));

          }
        }

      }
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)isNNVADFallbackUnexpectedForLanguageCode:(id)a3
{
  return 1;
}

+ (id)FourCCToString:(unsigned int)a3
{
  _BYTE v4[5];

  v4[0] = HIBYTE(a3);
  v4[1] = BYTE2(a3);
  v4[2] = BYTE1(a3);
  v4[3] = a3;
  v4[4] = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __28__CSUtils_isExclaveHardware__block_invoke()
{
  int v0;
  void *v1;
  void *v2;
  int v3;
  char v4;
  NSObject *v5;
  const __CFString *v6;
  const __CFString *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const __CFString *v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v0 = MGGetBoolAnswer();
  v1 = (void *)MGCopyAnswer();
  v2 = v1;
  if (v1)
    objc_msgSend(v1, "isEqualToString:", CFSTR("t8132"));
  v3 = _os_feature_enabled_impl();
  if ((v0 & v3) == 1)
    v4 = _os_feature_enabled_impl();
  else
    v4 = 0;
  isExclaveHardware_isExclaveHardware = v4;
  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("NO");
    v9 = "+[CSUtils isExclaveHardware]_block_invoke";
    if (v0)
      v7 = CFSTR("YES");
    else
      v7 = CFSTR("NO");
    v8 = 136315650;
    v10 = 2114;
    v11 = v7;
    if (v3)
      v6 = CFSTR("YES");
    v12 = 2114;
    v13 = v6;
    _os_log_impl(&dword_1B502E000, v5, OS_LOG_TYPE_DEFAULT, "%s isExclaveCapable: %{public}@, isExclaveFeatureEnabledForPlatform: %{public}@", (uint8_t *)&v8, 0x20u);
  }

}

uint64_t __32__CSUtils_supportsSCDAFramework__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0CFE8C0], "isSCDAFrameworkEnabled");
  supportsSCDAFramework_scdaFrameworkEnabled = result;
  return result;
}

uint64_t __35__CSUtils_isASRViaSpeechAPIEnabled__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0CFE8C0], "isASRViaSpeechAPIEnabled");
  isASRViaSpeechAPIEnabled_isAvailable = result;
  return result;
}

void __40__CSUtils_supportsMagusForLanguageCode___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("en-US"), CFSTR("en-GB"), CFSTR("en-CA"), CFSTR("en-AU"), CFSTR("de-DE"), CFSTR("fr-FR"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)supportsMagusForLanguageCode__magusSupportedLocales;
  supportsMagusForLanguageCode__magusSupportedLocales = v0;

}

void __21__CSUtils_isM9Device__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MGCopyAnswer();
  v1 = v0;
  if (v0)
  {
    v2 = v0;
    LOBYTE(v0) = objc_msgSend(v0, "isEqualToString:", CFSTR("t8006"));
    v1 = v2;
  }
  isM9Device_isM9Device = (char)v0;

}

void __28__CSUtils_processIdentifier__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  processIdentifier_pid = objc_msgSend(v0, "processIdentifier");

}

uint64_t __39__CSUtils_isFlexibleEndpointingEnabled__block_invoke()
{
  uint64_t result;

  result = AFDeviceSupportsSiriUOD();
  if ((_DWORD)result)
    result = _os_feature_enabled_impl();
  isFlexibleEndpointingEnabled_result = result;
  return result;
}

uint64_t __32__CSUtils_isMedocFeatureEnabled__block_invoke()
{
  uint64_t result;

  result = AFDeviceSupportsMedoc();
  isMedocFeatureEnabled_result = result;
  return result;
}

uint64_t __41__CSUtils_isMultiUserMedocFeatureEnabled__block_invoke()
{
  uint64_t result;

  result = AFDeviceSupportsMedoc();
  if ((_DWORD)result)
    result = AFDeviceSupportsSiriMUX();
  isMultiUserMedocFeatureEnabled_result = result;
  return result;
}

uint64_t __47__CSUtils_isCarplayWithFlexibleFollowupEnabled__block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  isCarplayWithFlexibleFollowupEnabled_result = result;
  return result;
}

uint64_t __44__CSUtils_isContinuousConversationSupported__block_invoke()
{
  int v0;
  uint64_t result;

  v0 = MGGetBoolAnswer();
  result = AFDeviceSupportsSiriUOD();
  if ((_DWORD)result)
  {
    result = objc_msgSend(MEMORY[0x1E0CFE8C0], "isContinuousConversationEnabled");
    if ((_DWORD)result)
    {
      result = +[CSUtils supportsANE](CSUtils, "supportsANE");
      if ((result & v0) == 1)
        isContinuousConversationSupported_result = 1;
    }
  }
  return result;
}

void __42__CSUtils_isMagusDisabledForLanguageCode___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("zh-CN"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)isMagusDisabledForLanguageCode__magusNotSupportedLocales;
  isMagusDisabledForLanguageCode__magusNotSupportedLocales = v0;

}

uint64_t __36__CSUtils_supportsDictationOnDevice__block_invoke()
{
  uint64_t result;

  result = AFOfflineDictationCapable();
  if ((_DWORD)result)
    result = objc_msgSend(MEMORY[0x1E0CFE8C0], "isDictationOnSRDEnabled");
  supportsDictationOnDevice_result = result;
  return result;
}

uint64_t __46__CSUtils_supportsHybridUnderstandingOnDevice__block_invoke()
{
  uint64_t result;

  result = AFDeviceSupportsHybridUOD();
  supportsHybridUnderstandingOnDevice_result = result;
  return result;
}

uint64_t __40__CSUtils_supportsUnderstandingOnDevice__block_invoke()
{
  uint64_t result;

  result = AFDeviceSupportsSiriUOD();
  supportsUnderstandingOnDevice_result = result;
  return result;
}

uint64_t __27__CSUtils_supportHandsFree__block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  if ((_DWORD)result)
    supportHandsFree_result = 1;
  return result;
}

uint64_t __23__CSUtils_systemUpTime__block_invoke()
{
  uint64_t result;
  size_t v1;
  int v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)v2 = 0x1500000001;
  v1 = 16;
  result = sysctl(v2, 2u, &systemUpTime_bootTime, &v1, 0, 0);
  systemUpTime_result = result;
  return result;
}

void __27__CSUtils_deviceIdentifier__block_invoke()
{
  __CFString *v0;
  __CFString *v1;
  __CFString *v2;

  v0 = (__CFString *)MGCopyAnswer();
  v1 = deviceIdentifier_deviceId;
  deviceIdentifier_deviceId = v0;

  if (deviceIdentifier_deviceId)
    v2 = deviceIdentifier_deviceId;
  else
    v2 = CFSTR("???");
  objc_storeStrong((id *)&deviceIdentifier_deviceId, v2);
}

void __31__CSUtils_deviceProductVersion__block_invoke()
{
  __CFString *v0;
  __CFString *v1;
  __CFString *v2;

  v0 = (__CFString *)MGCopyAnswer();
  v1 = deviceProductVersion_currDeviceProductVersion[0];
  deviceProductVersion_currDeviceProductVersion[0] = v0;

  if (deviceProductVersion_currDeviceProductVersion[0])
    v2 = deviceProductVersion_currDeviceProductVersion[0];
  else
    v2 = CFSTR("???");
  objc_storeStrong((id *)deviceProductVersion_currDeviceProductVersion, v2);
}

void __28__CSUtils_deviceProductType__block_invoke()
{
  __CFString *v0;
  __CFString *v1;
  __CFString *v2;

  v0 = (__CFString *)MGCopyAnswer();
  v1 = deviceProductType_currDeviceProductType;
  deviceProductType_currDeviceProductType = v0;

  if (deviceProductType_currDeviceProductType)
    v2 = deviceProductType_currDeviceProductType;
  else
    v2 = CFSTR("???");
  objc_storeStrong((id *)&deviceProductType_currDeviceProductType, v2);
}

uint64_t __42__CSUtils_supportRemoteDarwinVoiceTrigger__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  supportRemoteDarwinVoiceTrigger_supportDarwinVT = result;
  return result;
}

void __39__CSUtils_isIOSDeviceSupportingBargeIn__block_invoke()
{
  int v0;
  NSObject *v1;
  const __CFString *v2;
  int v3;
  const char *v4;
  __int16 v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (CSIsHorseman_onceToken != -1)
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
  if (CSIsHorseman_isHorseman)
    v0 = 0;
  else
    v0 = MGGetBoolAnswer();
  isIOSDeviceSupportingBargeIn_supportBargeIn = v0;
  v1 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v2 = CFSTR("YES");
    if (!v0)
      v2 = CFSTR("NO");
    v3 = 136315394;
    v4 = "+[CSUtils isIOSDeviceSupportingBargeIn]_block_invoke";
    v5 = 2114;
    v6 = v2;
    _os_log_impl(&dword_1B502E000, v1, OS_LOG_TYPE_DEFAULT, "%s Device supporting barge-in ? %{public}@", (uint8_t *)&v3, 0x16u);
  }
}

uint64_t __21__CSUtils_supportTTS__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  supportTTS_supportTTS = result;
  return result;
}

void __39__CSUtils_isLocalVoiceTriggerAvailable__block_invoke()
{
  isLocalVoiceTriggerAvailable_defaultValue = 1;
}

+ (BOOL)isHFPWithRecordRoute:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0C897D8]);
}

+ (BOOL)isHeadphoneDeviceWithRecordRoute:(id)a3 playbackRoute:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  NSObject *v18;
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v28 = "+[CSUtils(AudioDevice) isHeadphoneDeviceWithRecordRoute:playbackRoute:]";
    v29 = 2114;
    v30 = (uint64_t)v5;
    v31 = 2114;
    v32 = v6;
    _os_log_impl(&dword_1B502E000, v7, OS_LOG_TYPE_INFO, "%s Record route = %{public}@, playback route = %{public}@", buf, 0x20u);
  }
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C89858])
    && (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C89848]) & 1) != 0)
  {
    v8 = 1;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C897C8]) & 1) != 0
         || objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C897D8]))
  {
    objc_msgSend(MEMORY[0x1E0C89AF0], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentRoute");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "outputs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v13)
    {
      v14 = v13;
      v20 = v6;
      v21 = v5;
      v15 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v23 != v15)
            objc_enumerationMutation(v12);
          v17 = objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "endpointType", v20, v21);
          v18 = CSLogContextFacilityCoreSpeech;
          if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v28 = "+[CSUtils(AudioDevice) isHeadphoneDeviceWithRecordRoute:playbackRoute:]";
            v29 = 2050;
            v30 = v17;
            _os_log_impl(&dword_1B502E000, v18, OS_LOG_TYPE_DEFAULT, "%s Device endpointType = %{public}lu", buf, 0x16u);
          }
          if (v17 != 1751412846)
          {
            v8 = 0;
            goto LABEL_20;
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v14)
          continue;
        break;
      }
      v8 = 1;
LABEL_20:
      v6 = v20;
      v5 = v21;
    }
    else
    {
      v8 = 1;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)isBluetoothAudioDeviceConnected
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C89AF0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fetchHypotheticalRouteFromAudioSession:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315394;
    v12 = "+[CSUtils(AudioDevice) isBluetoothAudioDeviceConnected]";
    v13 = 2114;
    v14 = v4;
    _os_log_impl(&dword_1B502E000, v5, OS_LOG_TYPE_DEFAULT, "%s hypotheticalRoute = %{public}@", (uint8_t *)&v11, 0x16u);
  }
  if (!v4)
    goto LABEL_9;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BTDetails_IsHFPRoute"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_10;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BTDetails_IsHFPRoute"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if (!v8)
  {
LABEL_9:
    LOBYTE(v6) = 0;
    goto LABEL_10;
  }
  v9 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315138;
    v12 = "+[CSUtils(AudioDevice) isBluetoothAudioDeviceConnected]";
    _os_log_impl(&dword_1B502E000, v9, OS_LOG_TYPE_DEFAULT, "%s Audio route changing to HFP is expected", (uint8_t *)&v11, 0xCu);
  }
  LOBYTE(v6) = 1;
LABEL_10:

  return (char)v6;
}

+ (BOOL)isBluetoothVehicleOutput
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  NSObject *v15;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C89AF0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentRoute");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "outputs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    objc_msgSend(v6, "timeIntervalSinceDate:", v2);
    *(_DWORD *)buf = 136315394;
    v25 = "+[CSUtils(AudioDevice) isBluetoothVehicleOutput]";
    v26 = 2050;
    v27 = v9;
    _os_log_impl(&dword_1B502E000, v8, OS_LOG_TYPE_DEFAULT, "%s fetch output port descriptions elapsed time = %{public}lf", buf, 0x16u);

  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = v5;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v17 = v6;
    v18 = v2;
    v12 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v10);
        v14 = objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "endpointType", v17, v18);
        v15 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v25 = "+[CSUtils(AudioDevice) isBluetoothVehicleOutput]";
          v26 = 2050;
          v27 = v14;
          _os_log_impl(&dword_1B502E000, v15, OS_LOG_TYPE_DEFAULT, "%s Device endpointType = %{public}lu", buf, 0x16u);
        }
        if (v14 == 1986552684)
        {
          LOBYTE(v11) = 1;
          goto LABEL_15;
        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v11)
        continue;
      break;
    }
LABEL_15:
    v6 = v17;
    v2 = v18;
  }

  return v11;
}

+ (BOOL)isBuiltInRouteWithRecordRoute:(id)a3 playbackRoute:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  const __CFString *v9;
  char v10;

  v5 = a3;
  v6 = a4;
  +[CSFPreferences sharedPreferences](CSFPreferences, "sharedPreferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "programmableAudioInjectionEnabled");

  if (v8)
  {
    if (objc_msgSend(v5, "containsString:", CFSTR("BuiltInMic")))
    {
      v9 = CFSTR("BuiltInSpeaker");
LABEL_10:
      v10 = objc_msgSend(v6, "isEqualToString:", v9);
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C897F0])
    || (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C89818]) & 1) == 0)
  {
    if (+[CSUtils isExclaveHardware](CSUtils, "isExclaveHardware")
      && objc_msgSend(v5, "isEqualToString:", CFSTR("HACBuiltIn")))
    {
      v9 = (const __CFString *)*MEMORY[0x1E0C89818];
      goto LABEL_10;
    }
LABEL_11:
    v10 = 0;
    goto LABEL_12;
  }
  v10 = 1;
LABEL_12:

  return v10;
}

+ (BOOL)isBuiltInRecordRoute:(id)a3
{
  id v3;
  void *v4;
  int v5;
  char v6;
  BOOL v7;

  v3 = a3;
  +[CSFPreferences sharedPreferences](CSFPreferences, "sharedPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "programmableAudioInjectionEnabled");

  if (v5)
    v6 = objc_msgSend(v3, "containsString:", CFSTR("BuiltInMic"));
  else
    v6 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C897F0]);
  v7 = v6;

  return v7;
}

+ (id)audioPortSubtypeAsString:(unsigned int)a3
{
  char cStr[5];

  if (!a3)
    return 0;
  cStr[0] = HIBYTE(a3);
  cStr[1] = BYTE2(a3);
  cStr[2] = BYTE1(a3);
  cStr[3] = a3;
  cStr[4] = 0;
  return (id)(id)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], cStr, 0);
}

+ (BOOL)isDoAPAudioRouteWithRecordRoute:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0C89A08]);
}

+ (BOOL)isDisplayPortRouteWithRecordRoute:(id)a3
{
  return 0;
}

+ (BOOL)isJarvisAudioRouteWithRecordRoute:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0C89A38]);
}

+ (BOOL)isOutOfBandAudioRouteWithRecordRoute:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if ((objc_msgSend(a1, "isDoAPAudioRouteWithRecordRoute:", v4) & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend(a1, "isJarvisAudioRouteWithRecordRoute:", v4);

  return v5;
}

+ (id)getAudioSessionFromAudioSessionId:(unsigned int)a3
{
  if (a3)
    objc_msgSend(MEMORY[0x1E0C89AF0], "retrieveSessionWithID:");
  else
    objc_msgSend(MEMORY[0x1E0C89AF0], "sharedInstance");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)fetchHypotheticalRouteFromAudioSession:(id)a3
{
  return (id)objc_msgSend(a3, "pickedRoute");
}

+ (id)fetchHypotheticalBluetoothRouteProductIdFromAudioSessionId:(unsigned int)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  _QWORD *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "getAudioSessionFromAudioSessionId:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fetchHypotheticalRouteFromAudioSession:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
  {
    v15 = 136315650;
    v16 = "+[CSUtils(AudioDevice) fetchHypotheticalBluetoothRouteProductIdFromAudioSessionId:]";
    v17 = 2114;
    v18 = v6;
    v19 = 2048;
    v20 = a3;
    _os_log_impl(&dword_1B502E000, v7, OS_LOG_TYPE_INFO, "%s hypothetical route = %{public}@ from audioSessionId %lu", (uint8_t *)&v15, 0x20u);
  }
  if (v6
    && (objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D48178]),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "BOOLValue"),
        v8,
        v9))
  {
    v10 = (_QWORD *)MEMORY[0x1E0D48140];
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D48140]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11
      && ((objc_msgSend(v6, "objectForKeyedSubscript:", *v10),
           v11 = (void *)objc_claimAutoreleasedReturnValue(),
           v12 = CFSTR("BTHeadphones"),
           (objc_msgSend(v11, "hasPrefix:", CFSTR("BTHeadphones")) & 1) != 0)
       || (v12 = CFSTR("BTHeadset"), objc_msgSend(v11, "hasPrefix:", CFSTR("BTHeadset")))))
    {
      objc_msgSend(v11, "substringFromIndex:", -[__CFString length](v12, "length"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
    v13 = 0;
    v11 = 0;
  }

  return v13;
}

+ (BOOL)isHypotheticalAudioRouteBluetoothFromAudioSessinoId:(unsigned int)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "getAudioSessionFromAudioSessionId:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fetchHypotheticalRouteFromAudioSession:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
  {
    v12 = 136315650;
    v13 = "+[CSUtils(AudioDevice) isHypotheticalAudioRouteBluetoothFromAudioSessinoId:]";
    v14 = 2114;
    v15 = v6;
    v16 = 2048;
    v17 = a3;
    _os_log_impl(&dword_1B502E000, v7, OS_LOG_TYPE_INFO, "%s hypothetical route = %{public}@ from audioSessionId %lu", (uint8_t *)&v12, 0x20u);
  }
  if (v6)
  {
    v8 = (_QWORD *)MEMORY[0x1E0D48160];
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D48160]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", *v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v9) = objc_msgSend(v10, "BOOLValue");

    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return (char)v9;
}

+ (unsigned)getDefaultOutputAudioDevice
{
  OSStatus PropertyData;
  OSStatus v3;
  NSObject *v4;
  unsigned int result;
  UInt32 ioDataSize;
  uint64_t inAddress;
  uint64_t inAddress_8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  OSStatus v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  inAddress = *(_QWORD *)"tuOdbolg";
  inAddress_8 = 0;
  ioDataSize = 4;
  PropertyData = AudioObjectGetPropertyData(1u, (const AudioObjectPropertyAddress *)&inAddress, 0, 0, &ioDataSize, (char *)&inAddress_8 + 4);
  if (!PropertyData)
    return HIDWORD(inAddress_8);
  v3 = PropertyData;
  v4 = CSLogCategoryAudio;
  result = os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR);
  if (result)
  {
    *(_DWORD *)buf = 136315394;
    v10 = "+[CSUtils(AudioDevice) getDefaultOutputAudioDevice]";
    v11 = 1024;
    v12 = v3;
    _os_log_error_impl(&dword_1B502E000, v4, OS_LOG_TYPE_ERROR, "%s Error getting default output device ID: %d", buf, 0x12u);
    return 0;
  }
  return result;
}

+ (BOOL)isOutputDevice:(unsigned int)a3 relatedToInputDevice:(unsigned int)a4
{
  OSStatus PropertyDataSize;
  OSStatus v7;
  uint64_t v8;
  BOOL v9;
  unint64_t v11;
  _DWORD *v12;
  _DWORD *v13;
  OSStatus PropertyData;
  OSStatus v15;
  NSObject *v16;
  uint64_t v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  int v24;
  UInt32 outDataSize;
  AudioObjectPropertyAddress inAddress;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  OSStatus v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&inAddress.mSelector = *(_QWORD *)"nikabolg";
  inAddress.mElement = 0;
  outDataSize = 0;
  PropertyDataSize = AudioObjectGetPropertyDataSize(a4, &inAddress, 0, 0, &outDataSize);
  if (PropertyDataSize)
  {
    v7 = PropertyDataSize;
    v8 = CSLogCategoryAudio;
    if (!os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      return 0;
    *(_DWORD *)buf = 136315394;
    v28 = "+[CSUtils(AudioDevice) isOutputDevice:relatedToInputDevice:]";
    v29 = 1024;
    v30 = v7;
    v18 = "%s Error getting related devices data size: %d";
    v19 = v8;
    v20 = 18;
LABEL_20:
    _os_log_error_impl(&dword_1B502E000, v19, OS_LOG_TYPE_ERROR, v18, buf, v20);
    return 0;
  }
  v11 = outDataSize;
  v12 = malloc_type_malloc(outDataSize, 0x15251241uLL);
  if (!v12)
  {
    v17 = CSLogCategoryAudio;
    if (!os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      return 0;
    *(_DWORD *)buf = 136315138;
    v28 = "+[CSUtils(AudioDevice) isOutputDevice:relatedToInputDevice:]";
    v18 = "%s Error allocating memory";
    v19 = v17;
    v20 = 12;
    goto LABEL_20;
  }
  v13 = v12;
  PropertyData = AudioObjectGetPropertyData(a4, &inAddress, 0, 0, &outDataSize, v12);
  if (PropertyData)
  {
    v15 = PropertyData;
    v16 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v28 = "+[CSUtils(AudioDevice) isOutputDevice:relatedToInputDevice:]";
      v29 = 1024;
      v30 = v15;
      _os_log_error_impl(&dword_1B502E000, v16, OS_LOG_TYPE_ERROR, "%s Error getting related devices: %d", buf, 0x12u);
    }
    free(v13);
    return 0;
  }
  if (v11 < 4)
  {
    v9 = 0;
  }
  else
  {
    v21 = v11 >> 2;
    if ((v11 >> 2) <= 1)
      v22 = 1;
    else
      v22 = v21;
    if (*v13 == a3)
    {
      v9 = 1;
    }
    else
    {
      v23 = 0;
      while (v22 - 1 != v23)
      {
        v24 = v13[++v23];
        if (v24 == a3)
          goto LABEL_26;
      }
      v23 = v22;
LABEL_26:
      v9 = v23 < v21;
    }
  }
  free(v13);
  return v9;
}

+ (unsigned)getAudioDeviceForHalUID:(id)a3
{
  id v3;
  void *v4;
  OSStatus Property;
  OSStatus v6;
  uint64_t v7;
  unsigned int v8;
  NSObject *v9;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  OSStatus v15;
  _QWORD outPropertyData[4];
  unsigned int v17;
  UInt32 ioPropertyDataSize;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  OSStatus v25;
  __int16 v26;
  int v27;
  __int16 v28;
  OSStatus *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  v19 = v3;
  if (v3 && objc_msgSend(v3, "length"))
  {
    v17 = 0;
    ioPropertyDataSize = 32;
    outPropertyData[0] = &v19;
    outPropertyData[1] = 8;
    outPropertyData[2] = &v17;
    outPropertyData[3] = 4;
    Property = AudioHardwareGetProperty(0x64756964u, &ioPropertyDataSize, outPropertyData);
    v15 = Property;
    if (Property)
    {
      v6 = Property;
      v7 = CSLogCategoryAudio;
      if (!os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
        goto LABEL_5;
      *(_DWORD *)buf = 136316162;
      v21 = "+[CSUtils(AudioDevice) getAudioDeviceForHalUID:]";
      v22 = 2112;
      v23 = v19;
      v24 = 1024;
      v25 = v6;
      v26 = 1040;
      v27 = 4;
      v28 = 2080;
      v29 = &v15;
      v12 = "%s Error getting device from UID '%@': %d (%.4s).";
      v13 = v7;
      v14 = 44;
    }
    else
    {
      v8 = v17;
      if (v17)
        goto LABEL_10;
      v11 = CSLogCategoryAudio;
      if (!os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
LABEL_5:
        v8 = 0;
LABEL_10:
        v4 = v19;
        goto LABEL_11;
      }
      *(_DWORD *)buf = 136315138;
      v21 = "+[CSUtils(AudioDevice) getAudioDeviceForHalUID:]";
      v12 = "%s Retrieved AudioDeviceID is unknown.";
      v13 = v11;
      v14 = 12;
    }
    _os_log_error_impl(&dword_1B502E000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
    goto LABEL_5;
  }
  v9 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v21 = "+[CSUtils(AudioDevice) getAudioDeviceForHalUID:]";
    _os_log_error_impl(&dword_1B502E000, v9, OS_LOG_TYPE_ERROR, "%s UID is nil or empty. Returning AudioDeviceID as unknown", buf, 0xCu);
  }
  v8 = 0;
LABEL_11:

  return v8;
}

+ (id)readValuesFromJsonFile:(id)a3 keyword:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "fileExistsAtPath:", v6))
  {
LABEL_7:
    v11 = 0;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v6);
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v14 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "+[CSUtils(Json) readValuesFromJsonFile:keyword:]";
      v19 = 2112;
      v20 = v6;
      _os_log_impl(&dword_1B502E000, v14, OS_LOG_TYPE_DEFAULT, "%s Invalid json file is being read: %@", buf, 0x16u);
    }
    goto LABEL_7;
  }
  v10 = (void *)v9;
  v16 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v9, 0, &v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v16;

  if (v12)
  {
LABEL_8:
    v13 = 0;
    goto LABEL_9;
  }
  objc_msgSend(a1, "_readValuesInNestedDictionary:keyword:depth:limitedDepth:", v11, v7, 0, 10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v13;
}

+ (id)_readValuesInNestedDictionary:(id)a3 keyword:(id)a4 depth:(int64_t)a5 limitedDepth:(int64_t)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  id v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = 0;
  if (v9 && a5 < a6)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v22 = v9;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v12 = v9;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v26;
      v16 = a5 + 1;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v26 != v15)
            objc_enumerationMutation(v12);
          v18 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v12, "objectForKeyedSubscript:", v18, v22);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v18, "isEqualToString:", v10))
          {
            if (v19)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(v23, "addObject:", v19);
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(a1, "_readValuesInNestedDictionary:keyword:depth:limitedDepth:", v19, v10, v16, a6);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              if (v20)
                objc_msgSend(v23, "addObjectsFromArray:", v20);

            }
          }

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v14);
    }

    v11 = (void *)objc_msgSend(v23, "copy");
    v9 = v22;
  }

  return v11;
}

+ (BOOL)machXPCConnection:(id)a3 hasEntitlement:(id)a4
{
  _xpc_connection_s *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  BOOL v11;
  NSObject *v12;
  int v14;
  const char *v15;
  __int16 v16;
  _xpc_connection_s *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (_xpc_connection_s *)a3;
  v6 = a4;
  objc_msgSend((id)machXPCEntitlementPrefix, "stringByAppendingString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_retainAutorelease(v7);
  objc_msgSend(v8, "UTF8String");
  v9 = (void *)xpc_connection_copy_entitlement_value();
  v10 = v9;
  if (v9 && xpc_BOOL_get_value(v9))
  {
    v11 = 1;
  }
  else
  {
    v12 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v14 = 136315394;
      v15 = "+[CSUtils(machXPC) machXPCConnection:hasEntitlement:]";
      v16 = 2050;
      v17 = v5;
      _os_log_error_impl(&dword_1B502E000, v12, OS_LOG_TYPE_ERROR, "%s Connection %{public}p rejected due to missing entitlement", (uint8_t *)&v14, 0x16u);
    }
    xpc_connection_cancel(v5);
    v11 = 0;
  }

  return v11;
}

+ (BOOL)isRecordContextVoiceTrigger:(id)a3
{
  id v3;
  _BOOL4 v4;
  int v5;

  v3 = a3;
  v4 = +[CSUtils isRecordContextBuiltInVoiceTrigger:](CSUtils, "isRecordContextBuiltInVoiceTrigger:", v3)
    || +[CSUtils isRecordContextHearstVoiceTrigger:](CSUtils, "isRecordContextHearstVoiceTrigger:", v3)
    || +[CSUtils isRecordContextJarvisVoiceTrigger:](CSUtils, "isRecordContextJarvisVoiceTrigger:", v3);
  if (+[CSUtils isRecordContextDarwinVoiceTrigger:](CSUtils, "isRecordContextDarwinVoiceTrigger:", v3))
    LOBYTE(v5) = 1;
  else
    v5 = +[CSUtils isRecordContextRemoraVoiceTrigger:](CSUtils, "isRecordContextRemoraVoiceTrigger:", v3)
      || v4;

  return v5;
}

+ (BOOL)isRecordContextBuiltInVoiceTrigger:(id)a3
{
  void *v3;
  BOOL v4;

  if (!a3)
    return 0;
  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0C899E8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue") == 1987012963;

  return v4;
}

+ (BOOL)isRecordContextDarwinVoiceTrigger:(id)a3
{
  void *v3;
  BOOL v4;

  if (!a3)
    return 0;
  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0C899E8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue") == 1684108899;

  return v4;
}

+ (BOOL)isRecordContextRemoraVoiceTrigger:(id)a3
{
  void *v3;
  BOOL v4;

  if (!a3)
    return 0;
  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0C899E8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue") == 1919776372;

  return v4;
}

+ (BOOL)isRecordContextHomeButtonPress:(id)a3
{
  void *v3;
  BOOL v4;

  if (!a3)
    return 0;
  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0C899E8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue") == 1752132965;

  return v4;
}

+ (BOOL)isRecordContextAutoPrompt:(id)a3
{
  void *v3;
  BOOL v4;

  if (!a3)
    return 0;
  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0C899E8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue") == 1635087471;

  return v4;
}

+ (BOOL)isRecordContextSpeakerIdTrainingTrigger:(id)a3
{
  void *v3;
  BOOL v4;

  if (!a3)
    return 0;
  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0C899E8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue") == 1936746852;

  return v4;
}

+ (BOOL)isRecordContextHearstVoiceTrigger:(id)a3
{
  void *v3;
  BOOL v4;

  if (!a3)
    return 0;
  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0C899E8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue") == 1751414371;

  return v4;
}

+ (BOOL)isRecordContextHearstDoubleTap:(id)a3
{
  void *v3;
  BOOL v4;

  if (!a3)
    return 0;
  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0C899E8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue") == 1651795060;

  return v4;
}

+ (BOOL)isRecordContextRaiseToSpeak:(id)a3
{
  void *v3;
  BOOL v4;

  if (!a3)
    return 0;
  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0C899E8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue") == 1918986611;

  return v4;
}

+ (BOOL)isRecordContextJarvisVoiceTrigger:(id)a3
{
  void *v3;
  BOOL v4;

  if (!a3)
    return 0;
  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0C899E8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue") == 1668314723;

  return v4;
}

+ (BOOL)isRecordContextJarvisButtonPress:(id)a3
{
  void *v3;
  BOOL v4;

  if (!a3)
    return 0;
  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0C899E8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue") == 1986357346;

  return v4;
}

+ (BOOL)isValidRecordContext:(id)a3
{
  return 1;
}

+ (id)recordContextString:(id)a3
{
  id v4;
  const __CFString *v5;

  v4 = a3;
  if ((objc_msgSend(a1, "isRecordContextBuiltInVoiceTrigger:", v4) & 1) != 0)
  {
    v5 = CFSTR("voic");
  }
  else if ((objc_msgSend(a1, "isRecordContextJarvisVoiceTrigger:", v4) & 1) != 0)
  {
    v5 = CFSTR("carplay");
  }
  else if ((objc_msgSend(a1, "isRecordContextHearstDoubleTap:", v4) & 1) != 0)
  {
    v5 = CFSTR("hearst");
  }
  else if ((objc_msgSend(a1, "isRecordContextRaiseToSpeak:", v4) & 1) != 0)
  {
    v5 = CFSTR("raisetospeak");
  }
  else if (objc_msgSend(a1, "isRecordContextAutoPrompt:", v4))
  {
    v5 = CFSTR("auto");
  }
  else
  {
    v5 = CFSTR("unknown");
  }

  return (id)v5;
}

+ (id)getSiriLanguageWithFallback:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  id v9;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (+[CSUtils isDarwinOS](CSUtils, "isDarwinOS"))
  {
    +[CSFPreferences sharedPreferences](CSFPreferences, "sharedPreferences");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "languageCodeDarwin");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    AFPreferencesMobileUserSessionLanguage();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  if (!v5)
  {
    v7 = CSLogContextFacilityCoreSpeech;
    v8 = os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR);
    v6 = v3;
    if (v8)
    {
      v11 = 136315394;
      v12 = "+[CSUtils(LanguageCode) getSiriLanguageWithFallback:]";
      v13 = 2112;
      v14 = v3;
      _os_log_error_impl(&dword_1B502E000, v7, OS_LOG_TYPE_ERROR, "%s Siri language is nil, falling back to %@", (uint8_t *)&v11, 0x16u);
      v6 = v3;
    }
  }
  v9 = v6;

  return v9;
}

+ (id)getSiriLanguageWithEndpointId:(id)a3 fallbackLanguage:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = CSLogContextFacilityCoreSpeech;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315394;
      v11 = "+[CSUtils(LanguageCode) getSiriLanguageWithEndpointId:fallbackLanguage:]";
      v12 = 2112;
      v13 = v5;
      _os_log_error_impl(&dword_1B502E000, v7, OS_LOG_TYPE_ERROR, "%s Failed to query language code with endpointId %@, trying legacy query", (uint8_t *)&v10, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
  {
    v10 = 136315138;
    v11 = "+[CSUtils(LanguageCode) getSiriLanguageWithEndpointId:fallbackLanguage:]";
    _os_log_impl(&dword_1B502E000, v7, OS_LOG_TYPE_INFO, "%s endpointUUID not provided, fallback to legacy query", (uint8_t *)&v10, 0xCu);
  }
  +[CSUtils getSiriLanguageWithFallback:](CSUtils, "getSiriLanguageWithFallback:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)hasRemoteBuiltInMic
{
  return 0;
}

+ (BOOL)isRemoteDarwinWithDeviceId:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v13[0] = 0;
    v13[1] = 0;
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v3);
    objc_msgSend(v4, "getUUIDBytes:", v13);
    v5 = (void *)remote_device_copy_device_with_uuid();
    if (v5)
    {
      v6 = remote_device_get_type() == 11;
    }
    else
    {
      v7 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        v9 = 136315394;
        v10 = "+[CSUtils(AudioHardware) isRemoteDarwinWithDeviceId:]";
        v11 = 2114;
        v12 = v3;
        _os_log_error_impl(&dword_1B502E000, v7, OS_LOG_TYPE_ERROR, "%s Invalid device with deviceId %{public}@", (uint8_t *)&v9, 0x16u);
      }
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)_sharedDisposeLoggingQueue
{
  if (_sharedDisposeLoggingQueue_onceToken != -1)
    dispatch_once(&_sharedDisposeLoggingQueue_onceToken, &__block_literal_global_7726);
  return (id)_sharedDisposeLoggingQueue_disposeLogQueue;
}

+ (void)removeLogFilesInDirectory:(id)a3 matchingPattern:(id)a4 beforeDays:(float)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  float v17;

  v8 = a3;
  v9 = a4;
  +[CSUtils _sharedDisposeLoggingQueue](CSUtils, "_sharedDisposeLoggingQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __75__CSUtils_Directory__removeLogFilesInDirectory_matchingPattern_beforeDays___block_invoke;
  v13[3] = &unk_1E687FEE8;
  v17 = a5;
  v15 = v9;
  v16 = a1;
  v14 = v8;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

+ (void)clearLogFilesInDirectory:(id)a3 matchingPattern:(id)a4 exceedNumber:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  unint64_t v17;

  v8 = a3;
  v9 = a4;
  +[CSUtils _sharedDisposeLoggingQueue](CSUtils, "_sharedDisposeLoggingQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __76__CSUtils_Directory__clearLogFilesInDirectory_matchingPattern_exceedNumber___block_invoke;
  v13[3] = &unk_1E687FF38;
  v14 = v8;
  v15 = v9;
  v16 = a1;
  v17 = a5;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

+ (id)loggingFilePathWithDirectory:(id)a3 token:(id)a4 postfix:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (!v8 || !v9)
  {
    v15 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "+[CSUtils(Directory) loggingFilePathWithDirectory:token:postfix:]";
      _os_log_error_impl(&dword_1B502E000, v15, OS_LOG_TYPE_ERROR, "%s Invalid token or postfix", buf, 0xCu);
    }
    goto LABEL_7;
  }
  if (!+[CSUtils _createLoggingDirectoryIfNeeded:](CSUtils, "_createLoggingDirectoryIfNeeded:", v7))
  {
LABEL_7:
    v14 = 0;
    goto LABEL_8;
  }
  v11 = (void *)MEMORY[0x1E0CB3940];
  +[CSUtils _timeStampString](CSUtils, "_timeStampString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@-%@.%@"), v12, v8, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringByAppendingPathComponent:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v14;
}

+ (id)loggingFilePathWithDirectory:(id)a3 requestId:(id)a4 token:(id)a5 postfix:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = v12;
  if (!v11 || !v12)
  {
    v16 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "+[CSUtils(Directory) loggingFilePathWithDirectory:requestId:token:postfix:]";
      _os_log_error_impl(&dword_1B502E000, v16, OS_LOG_TYPE_ERROR, "%s Invalid token or postfix", buf, 0xCu);
    }
    goto LABEL_7;
  }
  if (!+[CSUtils _createLoggingDirectoryIfNeeded:](CSUtils, "_createLoggingDirectoryIfNeeded:", v9))
  {
LABEL_7:
    v15 = 0;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@.%@"), v10, v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingPathComponent:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v15;
}

+ (void)removeDirectory:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3620];
  v4 = a3;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v6 = objc_msgSend(v5, "removeItemAtPath:error:", v4, &v9);

  v7 = v9;
  if ((v6 & 1) == 0)
  {
    v8 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "+[CSUtils(Directory) removeDirectory:]";
      v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_1B502E000, v8, OS_LOG_TYPE_DEFAULT, "%s Error purging directory: %@", buf, 0x16u);
    }
  }

}

+ (BOOL)_createLoggingDirectoryIfNeeded:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  char v7;
  void *v8;
  NSObject *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "fileExistsAtPath:", v3) & 1) != 0)
    {
      v5 = 0;
    }
    else
    {
      v12 = 0;
      v7 = objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v12);
      v5 = v12;
      if ((v7 & 1) == 0)
      {
        v8 = (void *)CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          v10 = v8;
          objc_msgSend(v5, "localizedDescription");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v14 = "+[CSUtils(Directory) _createLoggingDirectoryIfNeeded:]";
          v15 = 2114;
          v16 = v3;
          v17 = 2114;
          v18 = v11;
          _os_log_error_impl(&dword_1B502E000, v10, OS_LOG_TYPE_ERROR, "%s Couldn't create logging directory at path %{public}@ %{public}@", buf, 0x20u);

        }
      }
    }

  }
  else
  {
    v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "+[CSUtils(Directory) _createLoggingDirectoryIfNeeded:]";
      _os_log_error_impl(&dword_1B502E000, v6, OS_LOG_TYPE_ERROR, "%s Invalid log directory", buf, 0xCu);
    }
  }

  return v3 != 0;
}

+ (id)_timeStampString
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  objc_msgSend(v2, "setDateFormat:", CFSTR("yyyyMMdd-HHmmss"));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFromDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)URLsInDirectory:(id)a3 matchingPattern:(id)a4 completion:(id)a5
{
  void (**v8)(id, void *, id *);
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;

  if (a5)
  {
    v13 = 0;
    v8 = (void (**)(id, void *, id *))a5;
    objc_msgSend(a1, "_contentsOfDirectoryAtURL:matchingPattern:includingPropertiesForKeys:error:", a3, a4, 0, &v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v13;
    v12 = v10;
    v8[2](v8, v9, &v12);

    v11 = v12;
  }
}

+ (void)_sortedURLsInDirectory:(id)a3 matchingPattern:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, id *);
  id v11;
  void *v12;
  id *v13;
  void *v14;
  void *v15;
  id *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  id obj;
  uint64_t v23;
  id *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, id *))a5;
  if (v10)
  {
    v11 = (id)*MEMORY[0x1E0C998E8];
    v23 = 0;
    v24 = (id *)&v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__7703;
    v27 = __Block_byref_object_dispose__7704;
    v28 = 0;
    v29[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v24 + 5;
    obj = v24[5];
    objc_msgSend(a1, "_contentsOfDirectoryAtURL:matchingPattern:includingPropertiesForKeys:error:", v8, v9, v12, &obj);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v13, obj);

    if (v14)
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __72__CSUtils_Directory___sortedURLsInDirectory_matchingPattern_completion___block_invoke;
      v19[3] = &unk_1E687FF60;
      v20 = v11;
      v21 = &v23;
      objc_msgSend(v14, "sortedArrayUsingComparator:", v19);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = 0;
    }
    v16 = v24;
    v17 = v24[5];
    if (v17)
    {

      v15 = 0;
      v16 = v24;
      v17 = v24[5];
    }
    v18 = v17;
    v10[2](v10, v15, &v18);
    objc_storeStrong(v16 + 5, v18);

    _Block_object_dispose(&v23, 8);
  }

}

+ (id)_contentsOfDirectoryAtURL:(id)a3 matchingPattern:(id)a4 includingPropertiesForKeys:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  const char *v19;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", a4, 17, a6);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (!v9 || !v11)
  {
    if (v11)
    {
      v18 = CSLogContextFacilityCoreSpeech;
      if (!os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
LABEL_10:
        v17 = 0;
        goto LABEL_13;
      }
      *(_DWORD *)buf = 136315138;
      v24 = "+[CSUtils(Directory) _contentsOfDirectoryAtURL:matchingPattern:includingPropertiesForKeys:error:]";
      v19 = "%s Regular expression is nil!";
    }
    else
    {
      if (!v9)
        goto LABEL_10;
      v18 = CSLogContextFacilityCoreSpeech;
      if (!os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        goto LABEL_10;
      *(_DWORD *)buf = 136315138;
      v24 = "+[CSUtils(Directory) _contentsOfDirectoryAtURL:matchingPattern:includingPropertiesForKeys:error:]";
      v19 = "%s Directory URL is nil!";
    }
    _os_log_error_impl(&dword_1B502E000, v18, OS_LOG_TYPE_ERROR, v19, buf, 0xCu);
    goto LABEL_10;
  }
  v13 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  objc_msgSend(v13, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v9, v10, 0, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)MEMORY[0x1E0CB3880];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __97__CSUtils_Directory___contentsOfDirectoryAtURL_matchingPattern_includingPropertiesForKeys_error___block_invoke;
    v21[3] = &unk_1E687FF88;
    v22 = v12;
    objc_msgSend(v15, "predicateWithBlock:", v21);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "filteredArrayUsingPredicate:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }

LABEL_13:
  return v17;
}

+ (void)purgeFilesWithExtensionInDirectory:(id)a3 extension:(id)a4 withFileToKep:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  int v24;
  id v25;
  NSObject *v26;
  _BOOL4 v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id obj;
  id v34;
  void *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  uint8_t v42[128];
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v34 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v41 = 0;
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v7;
  objc_msgSend(v32, "contentsOfDirectoryAtPath:error:", v7, &v41);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v41;
  if (v10)
  {
    v11 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v44 = "+[CSUtils(Directory) purgeFilesWithExtensionInDirectory:extension:withFileToKep:]";
      v45 = 2112;
      v46 = v10;
      _os_log_impl(&dword_1B502E000, v11, OS_LOG_TYPE_DEFAULT, "%s Error reading contents of directory: %@", buf, 0x16u);
    }
  }
  else
  {
    v30 = 0;
    v31 = v9;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    obj = v9;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v12)
    {
      v13 = v12;
      v14 = 0;
      v15 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v38 != v15)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          objc_msgSend(v35, "stringByAppendingPathComponent:", v17, v30, v31);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18;
          if (!v8
            || (objc_msgSend(v18, "stringByStandardizingPath"),
                v20 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v8, "stringByStandardizingPath"),
                v21 = (void *)objc_claimAutoreleasedReturnValue(),
                v22 = objc_msgSend(v20, "isEqualToString:", v21),
                v21,
                v20,
                (v22 & 1) == 0))
          {
            objc_msgSend(v17, "pathExtension");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "isEqualToString:", v34);

            if (v24)
            {
              v36 = v14;
              objc_msgSend(v32, "removeItemAtPath:error:", v19, &v36);
              v25 = v36;

              v26 = CSLogContextFacilityCoreSpeech;
              v27 = os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
              if (v25)
              {
                if (v27)
                {
                  *(_DWORD *)buf = 136315394;
                  v44 = "+[CSUtils(Directory) purgeFilesWithExtensionInDirectory:extension:withFileToKep:]";
                  v45 = 2112;
                  v46 = v25;
                  _os_log_impl(&dword_1B502E000, v26, OS_LOG_TYPE_DEFAULT, "%s Error purging file: %@", buf, 0x16u);
                }
                v14 = v25;
              }
              else
              {
                if (v27)
                {
                  v28 = v26;
                  objc_msgSend(v35, "stringByAppendingPathComponent:", v19);
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 136315394;
                  v44 = "+[CSUtils(Directory) purgeFilesWithExtensionInDirectory:extension:withFileToKep:]";
                  v45 = 2112;
                  v46 = v29;
                  _os_log_impl(&dword_1B502E000, v28, OS_LOG_TYPE_DEFAULT, "%s file is purged: %@", buf, 0x16u);

                }
                v14 = 0;
              }
            }
          }

        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v13);
    }
    else
    {
      v14 = 0;
    }

    v10 = v30;
    v9 = v31;
  }

}

BOOL __97__CSUtils_Directory___contentsOfDirectoryAtURL_matchingPattern_includingPropertiesForKeys_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 32), "numberOfMatchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length")) != 0;

  return v4;
}

uint64_t __72__CSUtils_Directory___sortedURLsInDirectory_matchingPattern_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  char v8;
  id v9;
  id *v10;
  char v11;
  id v12;
  uint64_t v13;
  id v15;
  id v16;
  id obj;
  id v18;

  v5 = a2;
  v6 = a3;
  obj = 0;
  v18 = 0;
  v7 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v8 = objc_msgSend(v5, "getResourceValue:forKey:error:", &v18, *(_QWORD *)(a1 + 32), &obj);
  v9 = v18;
  objc_storeStrong(v7, obj);
  if ((v8 & 1) == 0)
    NSLog(CFSTR("Unable to get %@ for file at %@: %@"), *(_QWORD *)(a1 + 32), v5, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v15 = 0;
  v16 = 0;
  v10 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v11 = objc_msgSend(v6, "getResourceValue:forKey:error:", &v16, *(_QWORD *)(a1 + 32), &v15);
  v12 = v16;
  objc_storeStrong(v10, v15);
  if ((v11 & 1) == 0)
    NSLog(CFSTR("Unable to get %@ for file at %@: %@"), *(_QWORD *)(a1 + 32), v6, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v13 = objc_msgSend(v12, "compare:", v9);

  return v13;
}

void __76__CSUtils_Directory__clearLogFilesInDirectory_matchingPattern_exceedNumber___block_invoke(uint64_t *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint64_t v8;

  v3 = a1[4];
  v2 = (void *)a1[5];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __76__CSUtils_Directory__clearLogFilesInDirectory_matchingPattern_exceedNumber___block_invoke_2;
  v5[3] = &unk_1E687FF10;
  v4 = (void *)a1[6];
  v8 = a1[7];
  v6 = v2;
  v7 = (id)a1[4];
  objc_msgSend(v4, "_sortedURLsInDirectory:matchingPattern:completion:", v3, v6, v5);

}

void __76__CSUtils_Directory__clearLogFilesInDirectory_matchingPattern_exceedNumber___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  __int128 v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "count");
  v5 = a1[6];
  if (v4 > v5)
  {
    v6 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      v8 = objc_msgSend(v3, "count");
      v9 = (void *)a1[4];
      v10 = a1[5];
      v11 = a1[6];
      *(_DWORD *)buf = 136316162;
      v24 = "+[CSUtils(Directory) clearLogFilesInDirectory:matchingPattern:exceedNumber:]_block_invoke_2";
      v25 = 2050;
      v26 = v8;
      v27 = 2114;
      v28 = v9;
      v29 = 2114;
      v30 = v10;
      v31 = 2050;
      v32 = v11;
      _os_log_impl(&dword_1B502E000, v7, OS_LOG_TYPE_DEFAULT, "%s CS logging files number %{public}lu with pattern %{public}@ under %{public}@ exceeding limit, only keep the latest %{public}lu ones", buf, 0x34u);

      v5 = a1[6];
    }
    if (v5 < objc_msgSend(v3, "count"))
    {
      v13 = 0;
      *(_QWORD *)&v12 = 136315650;
      v21 = v12;
      do
      {
        v14 = v13;
        v15 = objc_alloc_init(MEMORY[0x1E0CB3620]);
        objc_msgSend(v3, "objectAtIndex:", v5);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v13;
        objc_msgSend(v15, "removeItemAtURL:error:", v16, &v22);
        v13 = v22;

        if (v13)
        {
          v17 = (void *)CSLogContextFacilityCoreSpeech;
          if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
          {
            v18 = v17;
            objc_msgSend(v3, "objectAtIndex:", v5);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "localizedDescription");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v21;
            v24 = "+[CSUtils(Directory) clearLogFilesInDirectory:matchingPattern:exceedNumber:]_block_invoke";
            v25 = 2114;
            v26 = (uint64_t)v19;
            v27 = 2114;
            v28 = v20;
            _os_log_error_impl(&dword_1B502E000, v18, OS_LOG_TYPE_ERROR, "%s Could not remove %{public}@: %{public}@", buf, 0x20u);

          }
        }
        ++v5;
      }
      while (v5 < objc_msgSend(v3, "count", v21));

    }
  }

}

void __75__CSUtils_Directory__removeLogFilesInDirectory_matchingPattern_beforeDays___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", *(float *)(a1 + 56) * -3600.0 * 24.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315650;
    v13 = "+[CSUtils(Directory) removeLogFilesInDirectory:matchingPattern:beforeDays:]_block_invoke";
    v14 = 2114;
    v15 = v4;
    v16 = 2114;
    v17 = v2;
    _os_log_impl(&dword_1B502E000, v3, OS_LOG_TYPE_DEFAULT, "%s CS logging files under %{public}@ created before %{public}@ will be removed.", buf, 0x20u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  v8 = a1 + 40;
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(v8 + 8);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75__CSUtils_Directory__removeLogFilesInDirectory_matchingPattern_beforeDays___block_invoke_3;
  v10[3] = &unk_1E687FEC0;
  v11 = v2;
  v9 = v2;
  objc_msgSend(v7, "URLsInDirectory:matchingPattern:completion:", v5, v6, v10);

}

void __75__CSUtils_Directory__removeLogFilesInDirectory_matchingPattern_beforeDays___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  __int128 v20;
  NSObject *log;
  id v23;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
  if (v3)
  {
    v5 = v3;
    v6 = 0;
    v7 = *(_QWORD *)v27;
    v8 = *MEMORY[0x1E0C998E8];
    *(_QWORD *)&v4 = 136315650;
    v20 = v4;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v27 != v7)
          objc_enumerationMutation(v2);
        v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture", v20);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 0;
        v25 = 0;
        objc_msgSend(v10, "getResourceValue:forKey:error:", &v25, v8, &v24);
        v12 = v25;

        v13 = v24;
        if (v13)
        {
          v14 = (void *)CSLogContextFacilityCoreSpeech;
          if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
          {
            v17 = v14;
            objc_msgSend(v13, "localizedDescription");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315394;
            v31 = "+[CSUtils(Directory) removeLogFilesInDirectory:matchingPattern:beforeDays:]_block_invoke";
            v32 = 2114;
            v33 = v18;
            _os_log_error_impl(&dword_1B502E000, v17, OS_LOG_TYPE_ERROR, "%s Couldn't get creation date: %{public}@", buf, 0x16u);

          }
          v6 = v13;
        }
        else if (objc_msgSend(v12, "compare:", *(_QWORD *)(a1 + 32)) == -1)
        {
          v15 = objc_alloc_init(MEMORY[0x1E0CB3620]);
          v23 = 0;
          objc_msgSend(v15, "removeItemAtURL:error:", v10, &v23);
          v6 = v23;

          if (v6)
          {
            v16 = (void *)CSLogContextFacilityCoreSpeech;
            if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
            {
              log = v16;
              objc_msgSend(v6, "localizedDescription");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v20;
              v31 = "+[CSUtils(Directory) removeLogFilesInDirectory:matchingPattern:beforeDays:]_block_invoke";
              v32 = 2114;
              v33 = v10;
              v34 = 2114;
              v35 = v19;
              _os_log_error_impl(&dword_1B502E000, log, OS_LOG_TYPE_ERROR, "%s Could not remove %{public}@: %{public}@", buf, 0x20u);

            }
          }
        }
        else
        {
          v6 = 0;
        }

      }
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
    }
    while (v5);

  }
}

void __48__CSUtils_Directory___sharedDisposeLoggingQueue__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *v3;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, -2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("Dispose Log Queue", v0);
  v2 = (void *)_sharedDisposeLoggingQueue_disposeLogQueue;
  _sharedDisposeLoggingQueue_disposeLogQueue = (uint64_t)v1;

}

+ (unsigned)getNumElementInBitset:(unint64_t)a3
{
  unsigned int v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__CSUtils_Bitset__getNumElementInBitset___block_invoke;
  v5[3] = &unk_1E6880EB0;
  v5[4] = &v6;
  +[CSUtils iterateBitset:block:](CSUtils, "iterateBitset:block:", a3, v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

+ (void)iterateBitset:(unint64_t)a3 block:(id)a4
{
  uint64_t i;

  for (i = 0; i != 64; ++i)
  {
    if (((a3 >> i) & 1) != 0)
      (*((void (**)(id, uint64_t))a4 + 2))(a4, i);
  }
}

uint64_t __41__CSUtils_Bitset__getNumElementInBitset___block_invoke(uint64_t result)
{
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

+ (BOOL)xpcConnection:(id)a3 hasEntitlement:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)entitlementPrefix, "stringByAppendingString:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "valueForEntitlement:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8 != 0;
}

+ (BOOL)xpcConnection:(id)a3 hasEntitlement:(id)a4 withStringValue:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  BOOL v13;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend((id)entitlementPrefix, "stringByAppendingString:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "valueForEntitlement:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315394;
    v16 = "+[CSUtils(NSXPC) xpcConnection:hasEntitlement:withStringValue:]";
    v17 = 2112;
    v18 = v11;
    _os_log_impl(&dword_1B502E000, v12, OS_LOG_TYPE_DEFAULT, "%s entitlement value: %@", (uint8_t *)&v15, 0x16u);
  }
  v13 = 0;
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v11, "isEqualToString:", v7) & 1) != 0)
      v13 = 1;
  }

  return v13;
}

@end
