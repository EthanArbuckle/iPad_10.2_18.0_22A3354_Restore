@implementation CMSM

void __CMSM_IDSServer_StartAutomaticOwnershipTransferToPhoneTimer_block_invoke()
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  CMSM_IDSServer_CancelAutomaticOwnershipTransferToPhoneTimer();
  if (FigRoutingManagerUtilities_IsSystemAudioRouteBuiltIn())
  {
    CMSM_IDSConnection_RouteToSharedAudioRouteUponReceivingOwnership();
  }
  else if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

CMSM_IDSClient *__cmsm_IDSClient_GetClient_block_invoke()
{
  CMSM_IDSClient *result;

  result = objc_alloc_init(CMSM_IDSClient);
  cmsm_IDSClient_GetClient_idsClient = (uint64_t)result;
  return result;
}

void __CMSM_IDSClient_SendMessageAsyncAndCopyIdentifier_block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "sendMessage:toDestinations:priority:options:identifier:error:", *(_QWORD *)(a1 + 72), objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(a1 + 40)), 300, 0, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40, *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    CMSM_IDSConnection_SetMessageWaitSemaphore(*(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
}

uint64_t __CMSM_IDSConnection_Initialize_block_invoke()
{
  void *v0;
  uint64_t result;
  int v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  objc_msgSend((id)gIDSConnection, "updateNearbyPairedDevice");
  sIDSConnectedInitializationDone = 1;
  v0 = (void *)objc_msgSend((id)gIDSConnection, "copyNearbyPairedDevice");
  objc_msgSend(v0, "isNearby");

  result = CMSM_IDSConnection_IsNearbyPairedDevicePresentAndConnected();
  v2 = result;
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    result = fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (v2)
  {
    CMSM_IDSClient_NotifyRemote_LocalIsBeingInitialized();
    CMSM_IDSClient_QueryRemote_BTDeviceConnectionStatus();
    return CMSM_IDSClient_QueryRemote_PlayingInfo();
  }
  else
  {
    byte_1EE2B3070 = 1;
  }
  return result;
}

void __CMSM_IDSConnection_CopyMXCoreSession_block_invoke()
{
  BOOL v0;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (CMSessionCreate(&sIDSInfo))
    v0 = 1;
  else
    v0 = sIDSInfo == 0;
  if (v0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (sIDSInfo)
    {
      CFRelease((CFTypeRef)sIDSInfo);
      sIDSInfo = 0;
    }
  }
  else
  {
    _CMSessionSetProperty((_QWORD *)sIDSInfo, CFSTR("ClientName"), (uint64_t)CFSTR("IDSMXCoreSession (Default)"));
    _CMSessionSetProperty((_QWORD *)sIDSInfo, CFSTR("IAmIDSMXCoreSession"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1));
    _CMSessionSetProperty((_QWORD *)sIDSInfo, CFSTR("AudioCategory"), (uint64_t)CFSTR("MediaPlayback"));
    _CMSessionSetProperty((_QWORD *)sIDSInfo, CFSTR("AudioMode"), (uint64_t)CFSTR("Default"));
    _CMSessionSetProperty((_QWORD *)sIDSInfo, CFSTR("AudioHardwareControlFlags"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 0));
    _CMSessionSetProperty((_QWORD *)sIDSInfo, CFSTR("DoesntActuallyPlayAudio"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1));
    _CMSessionSetProperty((_QWORD *)sIDSInfo, CFSTR("HandsOverInterruptionsToInterruptor"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0));
  }
}

void __CMSM_IDSConnection_DeactivateIDSMXCoreSession_block_invoke(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    CFRelease(v1);
}

uint64_t __CMSM_IDSConnection_StartWaitForRemoteToReplyWithInitialPlayingInfoTimer_block_invoke()
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  byte_1EE2B3070 = 1;
  CMSM_IDSConnection_RouteToSharedAudioRouteUponReceivingOwnership();
  MEMORY[0x1940352BC](qword_1EE2B3088);
  if (qword_1EE2B3078)
  {
    dispatch_source_cancel((dispatch_source_t)qword_1EE2B3078);
    if (qword_1EE2B3078)
    {
      dispatch_release((dispatch_object_t)qword_1EE2B3078);
      qword_1EE2B3078 = 0;
    }
  }
  return MEMORY[0x1940352C8](qword_1EE2B3088);
}

void __CMSM_IDSConnection_StopWaitForRemoteToReplyWithInitialPlayingInfoTimer_block_invoke()
{
  MEMORY[0x1940352BC](qword_1EE2B3088);
  if (qword_1EE2B3078)
  {
    dispatch_source_cancel((dispatch_source_t)qword_1EE2B3078);
    if (qword_1EE2B3078)
    {
      dispatch_release((dispatch_object_t)qword_1EE2B3078);
      qword_1EE2B3078 = 0;
    }
  }
  JUMPOUT(0x1940352C8);
}

void __CMSM_IDSConnection_DelaySharedAudioRoutingUntilRemoteInitialPlayingInfoIsReceived_block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD v3[4];
  __int128 v4;

  v2 = MXGetSerialQueue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __CMSM_IDSConnection_DelaySharedAudioRoutingUntilRemoteInitialPlayingInfoIsReceived_block_invoke_2;
  v3[3] = &__block_descriptor_48_e5_v8__0l;
  v4 = *(_OWORD *)(a1 + 32);
  MXDispatchAsync((uint64_t)"CMSM_IDSConnection_DelaySharedAudioRoutingUntilRemoteInitialPlayingInfoIsReceived_block_invoke", (uint64_t)"CMSessionManager_IDSConnection.m", 845, 0, 0, v2, (uint64_t)v3);
}

void __CMSM_IDSConnection_DelaySharedAudioRoutingUntilRemoteInitialPlayingInfoIsReceived_block_invoke_2(uint64_t a1)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  const __CFArray *A2DPPort;
  AudioObjectID v7;
  const __CFArray *PortListArrayFromPortID;
  __CFArray *Routable;
  const void *UInt32;
  NSObject *v11;
  const void *v12;
  const void *v13;

  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    byte_1EE2B304C = 0;
    if (dword_1EE2B3F38)
    {
      v3 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  else
  {
    byte_1EE2B304C = 0;
  }
  if (!CMSM_IDSConnection_IsSomeClientPlayingOverSharedAudioRouteOnRemote())
  {
    if (dword_1EE2B3F38)
    {
      v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (!byte_1EE2B304B)
      goto LABEL_14;
LABEL_13:
    byte_1EE2B304B = 0;
    cmsm_IDSConnection_UpdateOtherDevicesConnectedInfoInPickableRoutesCache();
LABEL_14:
    vaemTakeOwnershipOnSharedAudioRoute(*(_QWORD *)(a1 + 32));
    goto LABEL_15;
  }
  if (byte_1EE2B3C98)
  {
    if (dword_1EE2B3F38)
    {
      v4 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (!byte_1EE2B304B)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_15:
  A2DPPort = cmsmGetA2DPPort(*(const __CFArray **)(a1 + 32));
  v7 = A2DPPort;
  if (vaeGetBTPortOwnsSharedAudioConnection((uint64_t)A2DPPort)
    && (!vaeDoesBTPortSupportInEarDetection(v7)
     || vaeDoesBTPortSupportInEarDetection(v7) && CMSMVAUtility_ShouldBTPortBeTreatedAsInEar(v7)))
  {
    PortListArrayFromPortID = vaeCreatePortListArrayFromPortID(v7);
    Routable = cmsmCopyPartnerPortsToMakeRoutable(PortListArrayFromPortID);
    UInt32 = (const void *)FigCFNumberCreateUInt32();
    CFArrayAppendValue(Routable, UInt32);
    if (dword_1EE2B3F38)
    {
      v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    vaemMakeArrayOfPortsRoutable(Routable, 1, 0, *(_QWORD *)(a1 + 40), 1);
    if (PortListArrayFromPortID)
      CFRelease(PortListArrayFromPortID);
    if (Routable)
      CFRelease(Routable);
    if (UInt32)
      CFRelease(UInt32);
  }
  v12 = *(const void **)(a1 + 40);
  if (v12)
    CFRelease(v12);
  v13 = *(const void **)(a1 + 32);
  if (v13)
    CFRelease(v13);
}

dispatch_queue_t __CMSM_IDSConnection_GetMessagingQueue_block_invoke()
{
  NSObject *v0;
  dispatch_queue_t result;

  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  result = dispatch_queue_create("com.apple.cmsession.ids.messaging", v0);
  CMSM_IDSConnection_GetMessagingQueue_messagingQueue = (uint64_t)result;
  return result;
}

@end
