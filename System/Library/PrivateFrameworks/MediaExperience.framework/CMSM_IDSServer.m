@implementation CMSM_IDSServer

- (CMSM_IDSServer)init
{
  CMSM_IDSServer *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CMSM_IDSServer;
  v2 = -[CMSM_IDSServer init](&v6, sel_init);
  v2->pIdsService = (IDSService *)objc_msgSend(objc_alloc((Class)CMSM_GetIDSServiceClass()), "initWithService:", CFSTR("com.apple.private.alloy.cmsession"));
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = dispatch_queue_create("com.apple.cmsession.ids.server.dispatch", v3);
  v2->idsDispatchQueue = (OS_dispatch_queue *)v4;
  -[IDSService addDelegate:queue:](v2->pIdsService, "addDelegate:queue:", v2, v4);
  return v2;
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  const void *v10;
  void *v11;
  NSObject *v12;
  void *Value;
  NSObject *MessagingQueue;
  int IsSharedAudioRouteConnectedToLocal;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  __CFString *v23;
  int v24;
  NSObject *v25;
  _BOOL8 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t);
  void *v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a5, "objectForKey:", kMXSession_IDSMessage_TypeKey, a4);
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (FigCFEqual())
  {
    v10 = (const void *)objc_msgSend(a7, "outgoingResponseIdentifier");
    v11 = (void *)CMSM_IDSConnection_CopyMXCoreSession();
    if (cmsm_IDSServer_ProcessRemoteInterruptionStartMessage_onceToken != -1)
      dispatch_once(&cmsm_IDSServer_ProcessRemoteInterruptionStartMessage_onceToken, &__block_literal_global_115);
    if (!a5)
    {
      v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v16 = (void *)objc_msgSend(a5, "objectForKey:", kMXSession_IDSMessage_SessionWillPlayInfoKey, v27, v29);
    if (!v16)
    {
      v17 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v18 = (void *)objc_msgSend(v16, "objectForKey:", CFSTR("AudioCategory"), v28, v30);
    if (!v18)
      v18 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", CFSTR("MediaPlayback"));
    v19 = (void *)objc_msgSend(v16, "objectForKey:", CFSTR("AudioMode"));
    if (!v19)
      v19 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", CFSTR("Default"));
    v20 = (void *)objc_msgSend(v16, "objectForKey:");
    if (!v20)
      v20 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
    v21 = (void *)objc_msgSend(v16, "objectForKey:", kMXSession_IDSMessage_HandoverInterruption);
    if (!v21)
      v21 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    v22 = objc_msgSend(v16, "objectForKey:", CFSTR("ClientName"));
    if (v22)
      v23 = (__CFString *)v22;
    else
      v23 = CFSTR("Unknown");
    if (!objc_msgSend(v18, "isEqualToString:", cmsm_IDSServer_ProcessRemoteInterruptionStartMessage_oldAudioCategory)|| !objc_msgSend(v19, "isEqualToString:", cmsm_IDSServer_ProcessRemoteInterruptionStartMessage_oldAudioMode)|| !objc_msgSend(v20, "isEqualToNumber:", cmsm_IDSServer_ProcessRemoteInterruptionStartMessage_oldClientPriority)|| !objc_msgSend(v21, "isEqualToNumber:", cmsm_IDSServer_ProcessRemoteInterruptionStartMessage_oldHandoverInterruption)|| (-[__CFString isEqualToString:](v23, "isEqualToString:", cmsm_IDSServer_ProcessRemoteInterruptionStartMessage_oldClientName) & 1) == 0)
    {
      CMSessionSetProperty(v11, (uint64_t)CFSTR("DoesntActuallyPlayAudio"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0));
      CMSessionSetProperty(v11, (uint64_t)CFSTR("ClientName"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("IDSMXCoreSession (%@)"), v23));
      CMSessionSetProperty(v11, (uint64_t)CFSTR("IAmIDSMXCoreSession"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1));
      CMSessionSetProperty(v11, (uint64_t)CFSTR("AudioCategory"), (uint64_t)v18);
      CMSessionSetProperty(v11, (uint64_t)CFSTR("AudioMode"), (uint64_t)v19);
      CMSessionSetProperty(v11, (uint64_t)CFSTR("ClientPriority"), (uint64_t)v20);
      CMSessionSetProperty(v11, (uint64_t)CFSTR("AudioHardwareControlFlags"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 0));
      CMSessionSetProperty(v11, (uint64_t)CFSTR("HandsOverInterruptionsToInterruptor"), (uint64_t)v21);
      CMSessionSetProperty(v11, (uint64_t)CFSTR("DoesntActuallyPlayAudio"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1));

      cmsm_IDSServer_ProcessRemoteInterruptionStartMessage_oldAudioCategory = v18;
      cmsm_IDSServer_ProcessRemoteInterruptionStartMessage_oldAudioMode = v19;

      cmsm_IDSServer_ProcessRemoteInterruptionStartMessage_oldClientPriority = v20;
      cmsm_IDSServer_ProcessRemoteInterruptionStartMessage_oldHandoverInterruption = v21;

      cmsm_IDSServer_ProcessRemoteInterruptionStartMessage_oldClientName = v23;
    }
    v24 = CMSessionBeginInterruption(v11);
    CMSM_IDSClient_NotifyRemote_InterruptionDone(v24, v10);
    v25 = MXGetNotificationSenderQueue();
    v31 = MEMORY[0x1E0C809B0];
    v32 = 3221225472;
    v33 = __cmsm_IDSServer_ProcessRemoteInterruptionStartMessage_block_invoke_124;
    v34 = &__block_descriptor_40_e5_v8__0l;
    v35 = v11;
    MXDispatchAsync((uint64_t)"cmsm_IDSServer_ProcessRemoteInterruptionStartMessage", (uint64_t)"CMSessionManager_IDSServer.m", 306, 0, 0, v25, (uint64_t)&v31);
  }
  else if (FigCFEqual())
  {
    Value = (void *)CFDictionaryGetValue((CFDictionaryRef)a5, (const void *)kMXSession_IDSMessage_IdentifierKey);
    MessagingQueue = CMSM_IDSConnection_GetMessagingQueue();
    v31 = MEMORY[0x1E0C809B0];
    v32 = 3221225472;
    v33 = __cmsm_IDSServer_ProcessRemoteInterruptionDoneMessage_block_invoke;
    v34 = &__block_descriptor_40_e5_v8__0l;
    v35 = Value;
    MXDispatchSync((uint64_t)"cmsm_IDSServer_ProcessRemoteInterruptionDoneMessage", (uint64_t)"CMSessionManager_IDSServer.m", 323, 0, 0, MessagingQueue, (uint64_t)&v31);
  }
  else if (FigCFEqual())
  {
    IsSharedAudioRouteConnectedToLocal = CMSM_IDSConnection_IsSharedAudioRouteConnectedToLocal();
    CMSM_IDSClient_ReplyToRemote_BTDeviceConnectionStatus(IsSharedAudioRouteConnectedToLocal);
  }
  else if (FigCFEqual())
  {
    v26 = CFDictionaryGetValue((CFDictionaryRef)a5, (const void *)kMXSession_IDSMessage_BTDeviceIsConnectedKey) == (const void *)*MEMORY[0x1E0C9AE50];
    CMSM_IDSConnection_UpdateSharedAudioRouteIsConnectedToRemote(v26);
  }
  else if (FigCFEqual())
  {
    cmsm_IDSServer_ProcessBTDeviceConnectionStatusChangedMessage((const __CFDictionary *)a5);
  }
  else if (FigCFEqual())
  {
    cmsm_IDSServer_ProcessRemotePlayingInfoQueryMessage();
  }
  else if (FigCFEqual())
  {
    cmsm_IDSServer_ProcessRemotePlayingInfoReplyMessage((const __CFDictionary *)a5);
  }
  else if (FigCFEqual())
  {
    cmsm_IDSServer_ProcessLocalIsPlayingStartMessage((const __CFDictionary *)a5);
  }
  else if (FigCFEqual())
  {
    cmsm_IDSServer_ProcessLocalIsPlayingDoneMessage((const __CFDictionary *)a5);
  }
  else if (FigCFEqual())
  {
    cmsm_IDSServer_ProcessLocalIsDoingEndInterruption((const __CFDictionary *)a5);
  }
  else if (FigCFEqual())
  {
    CMSM_IDSConnection_ResetRemotePlayingInfo();
    CMSM_IDSConnection_DeactivateIDSMXCoreSession(CFSTR("non-resumable.remoteDeviceIsBeingInitialized"));
  }
  else if (FigCFEqual())
  {
    cmsm_IDSServer_ProcessUpdateSharedAudioRouteMacAddress((const __CFDictionary *)a5);
  }
}

@end
