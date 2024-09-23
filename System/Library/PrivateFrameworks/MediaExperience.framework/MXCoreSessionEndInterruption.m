@implementation MXCoreSessionEndInterruption

void __MXCoreSessionEndInterruption_WithSecTaskAndStatus_block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v11;
  const void *v12;
  const void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = CMSMUtility_CopyActiveSessionWithPhoneCallBehaviorOrRingtone();
  v3 = -[MXSessionManager copyActiveSessionWithAudioCategory:andAudioMode:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "copyActiveSessionWithAudioCategory:andAudioMode:", 0, CFSTR("VoicePrompt"));
  v4 = CMSMUtility_CopyActiveSiriSession();
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = v3;
  if (v2)
    v7 = v2;
  else
    v7 = v6;
  if (v7)
  {
    objc_msgSend(v7, "setNeedToEndInterruption:", 1);
    objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "setWaitingToResume:", 1);
    v8 = *(void **)(*(_QWORD *)(a1[4] + 8) + 40);
    v9 = v7;
LABEL_15:
    objc_msgSend(v8, "setInterruptingSession:", v9);
    goto LABEL_16;
  }
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "isActive") & 1) != 0)
  {
    if (dword_1EE2B3F38)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "setNeedToEndInterruption:", 1, v14, v15);
    objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "setWaitingToResume:", 1);
    v8 = *(void **)(*(_QWORD *)(a1[4] + 8) + 40);
    v9 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
    goto LABEL_15;
  }
  if (dword_1EE2B3F38)
  {
    v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  CMSUtility_PostInterruptionCommandNotification(*(void **)(*(_QWORD *)(a1[4] + 8) + 40), 1u, *(const __CFString **)(*(_QWORD *)(a1[7] + 8) + 24), *(const void **)(*(_QWORD *)(a1[6] + 8) + 24), 0, 0, 0, (const void *)objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "displayID", v14, v15));
  objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "setActiveRoutesWhenInterrupted:", 0);
LABEL_16:
  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "setWaitingToSendEndInterruptionToSpokenAudioApp:", 0);

  v12 = *(const void **)(*(_QWORD *)(a1[7] + 8) + 24);
  if (v12)
    CFRelease(v12);
  v13 = *(const void **)(*(_QWORD *)(a1[6] + 8) + 24);
  if (v13)
    CFRelease(v13);
}

@end
