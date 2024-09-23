@implementation MX

void __MX_SystemStatus_PublishRecordingClientsInfo_block_invoke(uint64_t a1)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v3;
  dispatch_time_t v4;
  NSObject *v5;
  unsigned int v6;
  unsigned int v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[5];
  _QWORD v12[4];
  __int128 v13;
  os_log_type_t v14;
  os_log_type_t type[4];
  int v16;
  const char *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  dispatch_semaphore_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (dword_1EE2B3F38)
  {
    v16 = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v18 = 0;
  v19 = &v18;
  v20 = 0x3052000000;
  v21 = __Block_byref_object_copy__5;
  v22 = __Block_byref_object_dispose__5;
  v23 = 0;
  v23 = dispatch_semaphore_create(0);
  if (!v19[5])
  {
    *(_DWORD *)type = 0;
    v14 = OS_LOG_TYPE_DEFAULT;
    v3 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v11[4] = &v18;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __MX_SystemStatus_PublishRecordingClientsInfo_block_invoke_16;
  v12[3] = &unk_1E309CD58;
  v13 = *(_OWORD *)(a1 + 32);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __MX_SystemStatus_PublishRecordingClientsInfo_block_invoke_2;
  v11[3] = &unk_1E3099018;
  objc_msgSend((id)stMediaStatusDomainPublisher, "updateVolatileDataWithBlock:completion:", v12, v11, v9, v10);
  v4 = dispatch_time(0, 3000000000);
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v19[5], v4))
  {
    *(_DWORD *)type = 0;
    v14 = OS_LOG_TYPE_DEFAULT;
    v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v6 = *(_DWORD *)type;
    if (os_log_type_enabled(v5, v14))
      v7 = v6;
    else
      v7 = v6 & 0xFFFFFFFE;
    if (v7)
    {
      v16 = 136315138;
      v17 = "MX_SystemStatus_PublishRecordingClientsInfo_block_invoke_3";
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  MEMORY[0x1940352BC](sSystemStatusMutex);
  v8 = v19[5];
  if (v8)
  {
    dispatch_release(v8);
    v19[5] = 0;
  }
  MEMORY[0x1940352C8](sSystemStatusMutex);

  _Block_object_dispose(&v18, 8);
}

void __MX_RunningBoardServices_StartMonitoringForPID_block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setPredicates:", objc_msgSend(*(id *)(a1 + 32), "allObjects"));

}

void __MX_FrontBoardServices_Initialize_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  const __CFArray *v5;
  const __CFArray *v6;
  CFIndex v7;
  const void *v8;
  unsigned __int8 v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  void *ValueAtIndex;
  void *v13;

  v4 = (void *)MEMORY[0x194035B20]();
  v5 = (const __CFArray *)objc_msgSend(a3, "elements");
  if (v5)
  {
    v6 = v5;
    if (CFArrayGetCount(v5) < 1)
    {
      v11 = 0;
      v10 = 0;
      v9 = 0;
      v8 = 0;
    }
    else
    {
      v7 = 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      do
      {
        ValueAtIndex = (void *)CFArrayGetValueAtIndex(v6, v7);
        if (ValueAtIndex)
        {
          v13 = ValueAtIndex;
          switch(objc_msgSend(ValueAtIndex, "layoutRole"))
          {
            case 1:
              v8 = (const void *)objc_msgSend(v13, "bundleIdentifier");
              break;
            case 3:
              v10 = 1;
              break;
            case 4:
              v9 = 1;
              break;
            case 7:
              if (objc_msgSend(v13, "level") == 2)
                v11 = 1;
              break;
            default:
              break;
          }
        }
        ++v7;
      }
      while (v7 < CFArrayGetCount(v6));
    }
    cmsmDisplayLayoutChanged(v11, v10, v9, v8);
  }
  objc_autoreleasePoolPop(v4);
}

void __MX_SystemStatus_PublishRecordingClientsInfo_block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  MEMORY[0x1940352BC](sSystemStatusMutex);
  v2 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v2)
    dispatch_semaphore_signal(v2);
  JUMPOUT(0x1940352C8);
}

void __MX_RunningBoardServices_StopMonitoringForPID_block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setPredicates:", objc_msgSend(*(id *)(a1 + 32), "allObjects"));

}

uint64_t __MX_FeatureFlags_IsSharePlayEnabled_block_invoke()
{
  uint64_t result;
  char v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  void *(*v9)(uint64_t);
  void *v10;
  uint64_t *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  result = CMSMDeviceState_ItsAHomePod();
  if ((_DWORD)result)
  {
    v1 = 0;
LABEL_10:
    MX_FeatureFlags_IsSharePlayEnabled_sharePlayEnabled = v1;
    return result;
  }
  if (!TelephonyUtilitiesLibraryCore_frameworkLibrary)
  {
    v8 = xmmword_1E309C348;
    v9 = 0;
    result = _sl_dlopen();
    TelephonyUtilitiesLibraryCore_frameworkLibrary = result;
  }
  if (TelephonyUtilitiesLibraryCore_frameworkLibrary)
  {
    v4 = 0;
    v5 = &v4;
    v6 = 0x2020000000;
    v2 = (uint64_t (*)(uint64_t))getTUSharePlayForceDisabledSymbolLoc_ptr;
    v7 = getTUSharePlayForceDisabledSymbolLoc_ptr;
    if (!getTUSharePlayForceDisabledSymbolLoc_ptr)
    {
      *(_QWORD *)&v8 = MEMORY[0x1E0C809B0];
      *((_QWORD *)&v8 + 1) = 3221225472;
      v9 = __getTUSharePlayForceDisabledSymbolLoc_block_invoke;
      v10 = &unk_1E3099018;
      v11 = &v4;
      __getTUSharePlayForceDisabledSymbolLoc_block_invoke((uint64_t)&v8);
      v2 = (uint64_t (*)(uint64_t))v5[3];
    }
    _Block_object_dispose(&v4, 8);
    if (!v2)
    {
      __68__MXBiomeStreams_updateBiomeSilentMode_clientType_untilTime_reason___block_invoke_cold_1();
      __break(1u);
    }
    result = v2(v3);
    v1 = result ^ 1;
    goto LABEL_10;
  }
  return result;
}

uint64_t __MX_FeatureFlags_IsAdditiveRoutingEnabled_block_invoke()
{
  uint64_t result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsAdditiveRoutingEnabled_additiveRoutingEnabled = result;
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __MX_FeatureFlags_IsCorianderEnabled_block_invoke()
{
  uint64_t result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsCorianderEnabled_corianderEnabled = result;
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __MX_FeatureFlags_IsRelativeVoiceOverVolumeEnabled_block_invoke()
{
  uint64_t result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsRelativeVoiceOverVolumeEnabled_relativeVoiceOverVolumeEnabled = result;
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __MX_FeatureFlags_IsAlertsRelativeVoiceOverVolumeEnabled_block_invoke()
{
  uint64_t result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (MX_FeatureFlags_IsRelativeVoiceOverVolumeEnabled_onceToken != -1)
    dispatch_once(&MX_FeatureFlags_IsRelativeVoiceOverVolumeEnabled_onceToken, &__block_literal_global_9);
  if (MX_FeatureFlags_IsRelativeVoiceOverVolumeEnabled_relativeVoiceOverVolumeEnabled)
    result = _os_feature_enabled_impl();
  else
    result = 0;
  MX_FeatureFlags_IsAlertsRelativeVoiceOverVolumeEnabled_alertsRelativeVoiceOverVolumeEnabled = result;
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __MX_FeatureFlags_IsCallManagementMuteControlEnabled_block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsCallManagementMuteControlEnabled_sCallManagementMuteControlEnabled = result;
  return result;
}

uint64_t __MX_FeatureFlags_IsAVODDiscoveryEnhancementEnabled_block_invoke()
{
  uint64_t result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsAVODDiscoveryEnhancementEnabled_sIsDiscoveryEnhancementEnabled = result;
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __MX_FeatureFlags_IsCounterfeitDetectionEnabled_block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsCounterfeitDetectionEnabled_gapaEnabled = result;
  return result;
}

uint64_t __MX_FeatureFlags_IsConversationDetectSupported_block_invoke()
{
  uint64_t result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsConversationDetectSupported_conversationDetectSupported = result;
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __MX_FeatureFlags_IsSmartRoutingOnActivationEnabled_block_invoke()
{
  uint64_t result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsSmartRoutingOnActivationEnabled_sSmartRoutingOnActivationEnabled = result;
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __MX_FeatureFlags_IsInterruptOnRouteDisconnectEnabled_block_invoke()
{
  uint64_t result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsInterruptOnRouteDisconnectEnabled_sInterruptOnRouteDisconnect = result;
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __MX_FeatureFlags_IsInterruptLongFormVideoOnSpeechDetectEnabled_block_invoke()
{
  uint64_t result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsInterruptLongFormVideoOnSpeechDetectEnabled_sInterruptLongFormVideoOnSpeechDetect = result;
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __MX_FeatureFlags_IsAssertionActivityReportingEnabled_block_invoke()
{
  uint64_t result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsAssertionActivityReportingEnabled_sAssertionActivityReportingEnabled = result;
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __MX_FeatureFlags_IsAudioFormatArbitrationEnabled_block_invoke()
{
  uint64_t result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsAudioFormatArbitrationEnabled_sAudioFormatArbitrationEnabled = result;
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __MX_FeatureFlags_IsOffloadACQEnabled_block_invoke()
{
  uint64_t result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsOffloadACQEnabled_sIsOffloadACQEnabled = result;
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __MX_FeatureFlags_IsMXSilentModeEnabled_block_invoke()
{
  uint64_t result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsMXSilentModeEnabled_sIsUseMXSilentModeEnabled = result;
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __MX_FeatureFlags_IsAdaptiveVolumeControlEnabled_block_invoke()
{
  uint64_t result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsAdaptiveVolumeControlEnabled_sAdaptiveVolumeControlEnabled = result;
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __MX_FeatureFlags_IsSpeechDetectEnabled_block_invoke()
{
  uint64_t result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsSpeechDetectEnabled_sSpeechDetectEnabled = result;
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __MX_FeatureFlags_IsKeyboardCHAudioEnabled_block_invoke()
{
  uint64_t result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsKeyboardCHAudioEnabled_sIsKeyboardCHAudioEnabled = result;
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __MX_FeatureFlags_IsQuiesceableWiredConnectionEnabled_block_invoke()
{
  uint64_t result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  result = CMSMDeviceState_ItsAniPad();
  if ((_DWORD)result)
  {
    result = MGGetBoolAnswer();
    if ((_DWORD)result)
      result = _os_feature_enabled_impl();
  }
  MX_FeatureFlags_IsQuiesceableWiredConnectionEnabled_sIsQuiesceableWiredConnectionEnabled = result;
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __MX_FeatureFlags_IsPublishHostAttributionToSystemStatusEnabled_block_invoke()
{
  uint64_t result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsPublishHostAttributionToSystemStatusEnabled_sPublishHostAttributionToSystemStatusEnabled = result;
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __MX_FeatureFlags_IsSystemInputPickerEnabled_block_invoke()
{
  uint64_t result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsSystemInputPickerEnabled_sIsSystemInputPickerEnabled = result;
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __MX_FeatureFlags_IsBufferedBadgingAndCapabilitiesEnabled_block_invoke()
{
  uint64_t result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsBufferedBadgingAndCapabilitiesEnabled_isBufferedBadgingAndCapabilitiesEnabled = result;
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __MX_FeatureFlags_IsAsyncDuckingEnabled_block_invoke()
{
  uint64_t result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsAsyncDuckingEnabled_isAsyncDuckingEnabled = result;
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

void __MX_FeatureFlags_IsOffloadActivationOffACQEnabled_block_invoke()
{
  BOOL v0;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (_os_feature_enabled_impl())
  {
    if (MX_FeatureFlags_IsAsyncDuckingEnabled_onceToken != -1)
      dispatch_once(&MX_FeatureFlags_IsAsyncDuckingEnabled_onceToken, &__block_literal_global_75);
    v0 = MX_FeatureFlags_IsAsyncDuckingEnabled_isAsyncDuckingEnabled != 0;
  }
  else
  {
    v0 = 0;
  }
  MX_FeatureFlags_IsOffloadActivationOffACQEnabled_isOffloadActivationOffACQEnabled = v0;
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

uint64_t __MX_FeatureFlags_IsSystemRemoteDisplayContextEnabled_block_invoke()
{
  uint64_t result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsSystemRemoteDisplayContextEnabled_isSystemRemoteDisplayContextEnabled = result;
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __MX_FeatureFlags_IsOnenessEnabled_block_invoke()
{
  uint64_t result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsOnenessEnabled_sIsOnenessEnabled = result;
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

void __MX_FeatureFlags_IsSystemSoundsMutingBehaviorInOnenessEnabled_block_invoke()
{
  BOOL v0;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (_os_feature_enabled_impl())
  {
    if (MX_FeatureFlags_IsOnenessEnabled_onceToken != -1)
      dispatch_once(&MX_FeatureFlags_IsOnenessEnabled_onceToken, &__block_literal_global_84_0);
    v0 = MX_FeatureFlags_IsOnenessEnabled_sIsOnenessEnabled != 0;
  }
  else
  {
    v0 = 0;
  }
  MX_FeatureFlags_IsSystemSoundsMutingBehaviorInOnenessEnabled_sIsSystemSoundsMutingBehaviorInOnenessEnabled = v0;
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

void __MX_FeatureFlags_IsInterruptingPlayingSessionsInOnenessEnabled_block_invoke()
{
  BOOL v0;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (_os_feature_enabled_impl())
  {
    if (MX_FeatureFlags_IsOnenessEnabled_onceToken != -1)
      dispatch_once(&MX_FeatureFlags_IsOnenessEnabled_onceToken, &__block_literal_global_84_0);
    v0 = MX_FeatureFlags_IsOnenessEnabled_sIsOnenessEnabled != 0;
  }
  else
  {
    v0 = 0;
  }
  MX_FeatureFlags_IsInterruptingPlayingSessionsInOnenessEnabled_sIsInterruptingPlayingSessionsInOnenessEnabled = v0;
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

uint64_t __MX_FeatureFlags_IsHangsBufferedSizeHintEnabled_block_invoke()
{
  uint64_t result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsHangsBufferedSizeHintEnabled_sHangsBufferedSizeHintEnabled = result;
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __MX_FeatureFlags_IsHangsAudioSessionClientCachingEnabled_block_invoke()
{
  uint64_t result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsHangsAudioSessionClientCachingEnabled_sHangsAudioSessionClientCachingEnabled = result;
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __MX_FeatureFlags_IsCarPlayRingtoneFadeInEnabled_block_invoke()
{
  uint64_t result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsCarPlayRingtoneFadeInEnabled_sIsCarPlayRingtoneFadeInEnabled = result;
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __MX_FeatureFlags_IsSmartRoutingInEarQueryEnabled_block_invoke()
{
  uint64_t result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsSmartRoutingInEarQueryEnabled_sIsSmartRoutingInEarQueryEnabled = result;
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __MX_FeatureFlags_IsStartupSequenceChangeEnabled_block_invoke()
{
  uint64_t result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsStartupSequenceChangeEnabled_isStartupSequenceChangeEnabled = result;
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __MX_FeatureFlags_IsNowPlayingAppStackEnabled_block_invoke()
{
  uint64_t result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsNowPlayingAppStackEnabled_sIsNowPlayingAppStackEnabled = result;
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __MX_FeatureFlags_IsSessionBasedMutingEnabled_block_invoke()
{
  uint64_t result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  result = _os_feature_enabled_impl();
  if ((_DWORD)result)
    result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsSessionBasedMutingEnabled_isSessionBasedMutingEnabled = result;
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __MX_FeatureFlags_IsReduceRouteDiscoveryQueueHoppingEnabled_block_invoke()
{
  uint64_t result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsReduceRouteDiscoveryQueueHoppingEnabled_reduceRouteDiscoveryQueueHopping = result;
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __MX_FeatureFlags_IsProtectedAppsEnabled_block_invoke()
{
  uint64_t result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  result = _os_feature_enabled_impl();
  MX_FeatureFlags_IsProtectedAppsEnabled_isProtectedAppsEnabled = result;
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

id __26__MX_TelephonyClient_init__block_invoke(uint64_t a1)
{
  id result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  BOOL v4;
  _QWORD v5[21];

  v5[20] = *MEMORY[0x1E0C80C00];
  v5[0] = 0;
  result = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "getUserDefaultVoiceSubscriptionContext:", v5);
  if (v5[0]
    || result
    && ((result = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "copyMobileSubscriberCountryCode:error:", result, v5), v5[0])|| result&& ((result = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "copyMobileSubscriberIsoCountryCode:error:", result, v5), v5[0])|| (result ? (v4 = dword_1EE2B3F38 == 0) : (v4 = 1), !v4))))
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return (id)fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __46__MX_TelephonyClient_copyIsoCountryCodeForMCC__block_invoke(uint64_t a1)
{
  uint64_t result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v4;
  _QWORD v5[21];

  v5[20] = *MEMORY[0x1E0C80C00];
  v5[0] = 0;
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "getUserDefaultVoiceSubscriptionContext:", v5);
  if (v5[0])
    goto LABEL_7;
  if (!result)
    return result;
  result = (uint64_t)(id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "copyMobileSubscriberCountryCode:error:", result, v5);
  if (v5[0])
    goto LABEL_7;
  if (!result)
    return result;
  result = (uint64_t)(id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "copyMobileSubscriberIsoCountryCode:error:", result, v5);
  if (v5[0])
  {
LABEL_7:
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  else
  {
    v4 = (void *)result;
    if (result)
    {
      result = objc_msgSend((id)result, "length");
      if (result)
      {
        result = objc_msgSend(v4, "isEqualToString:", &stru_1E30A1A48);
        if ((result & 1) == 0)
        {
          result = objc_msgSend(v4, "uppercaseString");
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
        }
      }
    }
  }
  return result;
}

id __40__MX_TelephonyClient_getIsInHomeCountry__block_invoke(uint64_t a1)
{
  id result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  _QWORD v4[21];

  v4[20] = *MEMORY[0x1E0C80C00];
  v4[0] = 0;
  result = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "getUserDefaultVoiceSubscriptionContext:", v4);
  if (v4[0])
    goto LABEL_4;
  if (!result)
    return result;
  result = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "copyIsInHomeCountry:error:", result, v4);
  if (v4[0])
  {
LABEL_4:
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return (id)fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  else if (result)
  {
    result = (id)objc_msgSend(result, "BOOLValue");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  }
  return result;
}

void __62__MX_TelephonyClient_copyCountryNameFromOperatorCountryBundle__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  uint64_t v16;
  _QWORD v17[6];

  v17[5] = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "getUserDefaultVoiceSubscriptionContext:", &v10);
  if (v10)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  else
  {
    v4 = v2;
    if (v2)
    {
      v11 = 0;
      v12 = &v11;
      v13 = 0x3052000000;
      v14 = __Block_byref_object_copy__2;
      v15 = __Block_byref_object_dispose__2;
      v5 = (objc_class *)getCTBundleClass_softClass;
      v16 = getCTBundleClass_softClass;
      if (!getCTBundleClass_softClass)
      {
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __getCTBundleClass_block_invoke;
        v17[3] = &unk_1E3099018;
        v17[4] = &v11;
        __getCTBundleClass_block_invoke((uint64_t)v17);
        v5 = (objc_class *)v12[5];
      }
      _Block_object_dispose(&v11, 8);
      v6 = (void *)objc_msgSend([v5 alloc], "initWithBundleType:", 6);
      v7 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "copyCarrierBundleValue:key:bundleType:error:", v4, CFSTR("CountryName"), v6, &v10);
      v8 = v7;
      if (v10)
      {
        v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      else if (objc_msgSend(v7, "length"))
      {
        if ((objc_msgSend(v8, "isEqualToString:", &stru_1E30A1A48) & 1) == 0)
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = v8;
      }

    }
  }
}

void *__MX_CoreServices_Initialize_block_invoke()
{
  void *result;
  void *v1;

  result = dlopen("/System/Library/Frameworks/CoreServices.framework/CoreServices", 4);
  gCoreServicesLib = (uint64_t)result;
  if (result)
  {
    gLSApplicationProxyClass = (uint64_t)objc_getClass("LSApplicationProxy");
    gLSApplicationWorkspaceClass = (uint64_t)objc_getClass("LSApplicationWorkspace");
    gLSBundleRecordClass = (uint64_t)objc_getClass("LSBundleRecord");
    gLSApplicationExtensionRecordClass = (uint64_t)objc_getClass("LSApplicationExtensionRecord");
    gDeviceManagementPolicyCache = (uint64_t)CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    gObserver = objc_alloc_init(MX_DeviceManagementPolicyDidChangeObserver);
    v1 = (void *)objc_msgSend((id)gLSApplicationWorkspaceClass, "defaultWorkspace");
    result = (void *)objc_msgSend(v1, "addObserver:", gObserver);
    gCoreServicesIsInitialized = 1;
  }
  return result;
}

dispatch_queue_t __MX_CoreServices_GetSerialQueue_block_invoke()
{
  NSObject *v0;
  dispatch_queue_t result;

  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  result = dispatch_queue_create("com.apple.mediaexperience.CoreServices", v0);
  MX_CoreServices_GetSerialQueue_sSerialQueue = (uint64_t)result;
  return result;
}

void __78__MX_DeviceManagementPolicyDidChangeObserver_deviceManagementPolicyDidChange___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  NSObject *v11;
  int *v12;
  uint64_t v13;
  _QWORD v15[5];
  os_log_type_t type;
  unsigned int v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  int v22;
  const char *v23;
  __int16 v24;
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (gCoreServicesIsInitialized == 1)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v1 = *(void **)(a1 + 32);
    v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v2)
    {
      v3 = v2;
      v4 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v19 != v4)
            objc_enumerationMutation(v1);
          v6 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v6, "bundleIdentifier", v12, v13);
          cmsmLSUpdateDeviceManagementCache(objc_msgSend(v6, "deviceManagementPolicy"));
          if (objc_msgSend(v6, "deviceManagementPolicy"))
          {
            if (CMSMUtility_IsCarPlaySessionPresent())
            {
              if (dword_1EE2B3F38)
              {
                v17 = 0;
                type = OS_LOG_TYPE_DEFAULT;
                os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                v8 = v17;
                if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
                  v9 = v8;
                else
                  v9 = v8 & 0xFFFFFFFE;
                if (v9)
                {
                  v10 = objc_msgSend(v6, "bundleIdentifier");
                  v22 = 136315394;
                  v23 = "-[MX_DeviceManagementPolicyDidChangeObserver deviceManagementPolicyDidChange:]_block_invoke";
                  v24 = 2114;
                  v25 = v10;
                  LODWORD(v13) = 22;
                  v12 = &v22;
                  _os_log_send_and_compose_impl();
                }
                fig_log_call_emit_and_clean_up_after_send_and_compose();
              }
            }
            else
            {
              v11 = MXGetNotificationSenderQueue();
              v15[0] = MEMORY[0x1E0C809B0];
              v15[1] = 3221225472;
              v15[2] = __78__MX_DeviceManagementPolicyDidChangeObserver_deviceManagementPolicyDidChange___block_invoke_2;
              v15[3] = &unk_1E3099900;
              v15[4] = v6;
              MXDispatchAsync((uint64_t)"-[MX_DeviceManagementPolicyDidChangeObserver deviceManagementPolicyDidChange:]_block_invoke", (uint64_t)"MX_CoreServices.m", 275, 0, 0, v11, (uint64_t)v15);
            }
          }
        }
        v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v3);
    }
  }

}

void __78__MX_DeviceManagementPolicyDidChangeObserver_deviceManagementPolicyDidChange___block_invoke_2(uint64_t a1)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  CMSMNotificationUtility_PostStopCommandToActiveClientWithDisplayID(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier", v3, v4), 0);
}

uint64_t __MX_SystemStatus_PublishRecordingClientsInfo_block_invoke_16(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setMicrophoneAttributions:", objc_msgSend(*(id *)(a1 + 32), "allObjects"));
  return objc_msgSend(a2, "setMutedAudioRecordingAttributions:", *(_QWORD *)(a1 + 40));
}

id __MX_FrontBoardServices_Initialize_block_invoke()
{
  void *v0;
  id result;

  v0 = (void *)objc_msgSend((id)gFBSDisplayLayoutMonitorConfigurationClass, "configurationForDefaultMainDisplayMonitor");
  objc_msgSend(v0, "setTransitionHandler:", &__block_literal_global_5_0);
  result = (id)objc_msgSend((id)gFBSDisplayLayoutMonitorClass, "monitorWithConfiguration:", v0);
  gFrontBoardServicesMonitor = (uint64_t)result;
  return result;
}

uint64_t __42__MX_GEOCountryConfigurationObserver_init__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;
  _QWORD v13[6];

  v13[5] = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__7;
  v11 = __Block_byref_object_dispose__7;
  v2 = (void *)getGEOCountryConfigurationClass_softClass;
  v12 = getGEOCountryConfigurationClass_softClass;
  if (!getGEOCountryConfigurationClass_softClass)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __getGEOCountryConfigurationClass_block_invoke;
    v13[3] = &unk_1E3099018;
    v13[4] = &v7;
    __getGEOCountryConfigurationClass_block_invoke((uint64_t)v13);
    v2 = (void *)v8[5];
  }
  _Block_object_dispose(&v7, 8);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = objc_msgSend(v2, "sharedConfiguration");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "countryCode");
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v5, v6), "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_countryConfigurationDidChange_, getGEOCountryConfigurationCountryCodeDidChangeNotification(), 0);
}

uint64_t __59__MX_GEOCountryConfigurationObserver_getCurrentCountryCode__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "length");
  if (result)
  {
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "isEqualToString:", &stru_1E30A1A48);
    if ((result & 1) == 0)
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  }
  return result;
}

uint64_t __91__MX_GEOCountryConfigurationObserver__updateCountryCodeFromCurrentGeoCountryConfiguration___block_invoke(uint64_t a1)
{
  uint64_t result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "isEqualToString:", *(_QWORD *)(a1 + 40));
  if ((result & 1) == 0)
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = *(_QWORD *)(a1 + 40);
    if (dword_1EE2B3F38)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      return fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  return result;
}

void __27__MX_HIDEventObserver_init__block_invoke(uint64_t a1)
{
  __IOHIDEventSystemClient *v2;
  const __CFArray *v3;
  int SmartCoverState;
  unsigned int v5;
  BOOL v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  _QWORD v8[2];
  _QWORD v9[24];

  v9[23] = *MEMORY[0x1E0C80C00];
  v8[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 65280);
  v9[0] = CFSTR("PrimaryUsagePage");
  v8[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 6);
  v9[1] = CFSTR("PrimaryUsage");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = IOHIDEventSystemClientCreateWithType();
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
    && (IOHIDEventSystemClientSetMatching(),
        IOHIDEventSystemClientRegisterEventCallback(),
        CFRunLoopGetMain(),
        IOHIDEventSystemClientScheduleWithRunLoop(),
        (v2 = *(__IOHIDEventSystemClient **)(*(_QWORD *)(a1 + 32) + 8)) != 0))
  {
    v3 = IOHIDEventSystemClientCopyServices(v2);
    SmartCoverState = mx_ioKit_getSmartCoverState(v3, 1);
    v5 = mx_ioKit_getSmartCoverState(v3, 2) | SmartCoverState;
    v6 = v5 == 3;
    gFlap1StateIsEngaged = v5 > 1;
    gOpenStateIsEngaged = v5 & 1;
    if (dword_1EE2B3F38)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (v3)
      CFRelease(v3);
  }
  else
  {
    v6 = 0;
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = v6;
  CMSMDeviceState_UpdateSmartCoverState(*(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 16));
}

void __35__MX_HIDEventObserver_handleEvent___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  const void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "smartCoverClosed");
  if (IOHIDEventGetType() == 3)
    objc_msgSend(*(id *)(a1 + 32), "handleButtonEvent:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  v3 = objc_msgSend(*(id *)(a1 + 32), "smartCoverClosed");
  if (v2 != v3)
    CMSMDeviceState_UpdateSmartCoverState(v3);
  v4 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v4)
    CFRelease(v4);
}

void __MX_IOKit_Initialize_block_invoke()
{
  void *v0;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v0 = (void *)MEMORY[0x194035B20]();
  gMXHIDEventObserver = objc_alloc_init(MX_HIDEventObserver);
  if (!gMXHIDEventObserver)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_autoreleasePoolPop(v0);
}

uint64_t __26__MX_NetworkObserver_init__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t result;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v2 = getnw_path_monitor_create_with_typeSymbolLoc_ptr;
  v28 = getnw_path_monitor_create_with_typeSymbolLoc_ptr;
  if (!getnw_path_monitor_create_with_typeSymbolLoc_ptr)
  {
    v3 = (void *)NetworkLibrary();
    v2 = dlsym(v3, "nw_path_monitor_create_with_type");
    v26[3] = (uint64_t)v2;
    getnw_path_monitor_create_with_typeSymbolLoc_ptr = v2;
  }
  _Block_object_dispose(&v25, 8);
  if (!v2)
    goto LABEL_24;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = ((uint64_t (*)(uint64_t))v2)(2);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(v4 + 16);
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __26__MX_NetworkObserver_init__block_invoke_2;
  v24[3] = &unk_1E309E4D8;
  v24[4] = v4;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v6 = getnw_path_monitor_set_update_handlerSymbolLoc_ptr;
  v28 = getnw_path_monitor_set_update_handlerSymbolLoc_ptr;
  if (!getnw_path_monitor_set_update_handlerSymbolLoc_ptr)
  {
    v7 = (void *)NetworkLibrary();
    v6 = dlsym(v7, "nw_path_monitor_set_update_handler");
    v26[3] = (uint64_t)v6;
    getnw_path_monitor_set_update_handlerSymbolLoc_ptr = v6;
  }
  _Block_object_dispose(&v25, 8);
  if (!v6)
  {
LABEL_24:
    __68__MXBiomeStreams_updateBiomeSilentMode_clientType_untilTime_reason___block_invoke_cold_1();
    goto LABEL_27;
  }
  ((void (*)(uint64_t, _QWORD *))v6)(v5, v24);
  v8 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(v8 + 8);
  v9 = *(_QWORD *)(v8 + 16);
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v11 = getnw_path_monitor_set_queueSymbolLoc_ptr;
  v28 = getnw_path_monitor_set_queueSymbolLoc_ptr;
  if (!getnw_path_monitor_set_queueSymbolLoc_ptr)
  {
    v12 = (void *)NetworkLibrary();
    v11 = dlsym(v12, "nw_path_monitor_set_queue");
    v26[3] = (uint64_t)v11;
    getnw_path_monitor_set_queueSymbolLoc_ptr = v11;
  }
  _Block_object_dispose(&v25, 8);
  if (!v11)
    goto LABEL_26;
  ((void (*)(uint64_t, uint64_t))v11)(v9, v10);
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v14 = getnw_path_monitor_startSymbolLoc_ptr;
  v28 = getnw_path_monitor_startSymbolLoc_ptr;
  if (!getnw_path_monitor_startSymbolLoc_ptr)
  {
    v15 = (void *)NetworkLibrary();
    v14 = dlsym(v15, "nw_path_monitor_start");
    v26[3] = (uint64_t)v14;
    getnw_path_monitor_startSymbolLoc_ptr = v14;
  }
  _Block_object_dispose(&v25, 8);
  if (!v14)
    goto LABEL_26;
  ((void (*)(uint64_t))v14)(v13);
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v16 = getnw_path_create_evaluator_for_endpointSymbolLoc_ptr;
  v28 = getnw_path_create_evaluator_for_endpointSymbolLoc_ptr;
  if (!getnw_path_create_evaluator_for_endpointSymbolLoc_ptr)
  {
    v17 = (void *)NetworkLibrary();
    v16 = dlsym(v17, "nw_path_create_evaluator_for_endpoint");
    v26[3] = (uint64_t)v16;
    getnw_path_create_evaluator_for_endpointSymbolLoc_ptr = v16;
  }
  _Block_object_dispose(&v25, 8);
  if (!v16)
    goto LABEL_26;
  result = ((uint64_t (*)(_QWORD, _QWORD))v16)(0, 0);
  v19 = result;
  if (!result)
    goto LABEL_21;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v20 = getnw_path_evaluator_copy_pathSymbolLoc_ptr;
  v28 = getnw_path_evaluator_copy_pathSymbolLoc_ptr;
  if (!getnw_path_evaluator_copy_pathSymbolLoc_ptr)
  {
    v21 = (void *)NetworkLibrary();
    v20 = dlsym(v21, "nw_path_evaluator_copy_path");
    v26[3] = (uint64_t)v20;
    getnw_path_evaluator_copy_pathSymbolLoc_ptr = v20;
  }
  _Block_object_dispose(&v25, 8);
  if (!v20)
  {
LABEL_26:
    __68__MXBiomeStreams_updateBiomeSilentMode_clientType_untilTime_reason___block_invoke_cold_1();
LABEL_27:
    __break(1u);
  }
  v22 = ((uint64_t (*)(uint64_t))v20)(v19);
  objc_msgSend(*(id *)(a1 + 32), "networkPathUpdate:", v22);
  result = soft_nw_release(v22);
LABEL_21:
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t __26__MX_NetworkObserver_init__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "networkPathUpdate:", a2);
}

uint64_t __47__MX_NetworkObserver_isCarrierNetworkReachable__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 32);
  return result;
}

@end
