@implementation SetConnectionActive

void __playerairplay_SetConnectionActive_block_invoke(uint64_t a1)
{
  playerairplay_checkStartStopAirPlay(*(void **)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void __playerairplay_SetConnectionActive_block_invoke_2(uint64_t a1)
{
  CFTypeRef v2;
  CFTypeRef cf;

  v2 = 0;
  cf = 0;
  playqueue_copyCurrentClientPlayQueueItemAndCurrentMediaControlPlayListItem(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), (unint64_t)&v2, (unint64_t)&cf);
  playerairplay_savePlaybackInfoAndStopAPV(*(const void **)(a1 + 40), (uint64_t)v2, (uint64_t)cf);
  if (cf)
    CFRelease(cf);
  if (v2)
    CFRelease(v2);
}

void __playerairplay_SetConnectionActive_block_invoke_3(uint64_t a1)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v3;
  uint64_t v4;
  CFTypeRef v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t, CFTypeRef);
  CFTypeRef cf[25];

  cf[24] = *(CFTypeRef *)MEMORY[0x1E0C80C00];
  cf[0] = 0;
  if (*(_BYTE *)(a1 + 48))
  {
    if (pap_AirPlayState(*(const void **)(a1 + 32)) == 10)
    {
      playerairplay_checkStartAPV(*(void **)(a1 + 32));
      if (dword_1EE2A2FA0)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
  }
  playerairplay_copyPlayQueueAirPlayItemFromSubPlayer(*(_QWORD *)(a1 + 32), 0, cf);
  if (cf[0])
  {
    v3 = *(unsigned __int8 *)(CMBaseObjectGetDerivedStorage() + 888);
    if (cf[0])
      CFRelease(cf[0]);
  }
  else
  {
    v3 = 0;
  }
  if (*(_QWORD *)(CMBaseObjectGetDerivedStorage() + 296) && (!*(_BYTE *)(a1 + 48) || v3))
  {
    v4 = *(_QWORD *)(a1 + 40);
    if (*(_BYTE *)(v4 + 1))
    {
      v5 = playerairplay_copyPredictedFormatDescriptionForBAO(*(_QWORD *)(a1 + 32));
      v4 = *(_QWORD *)(a1 + 40);
      v6 = *(unsigned __int8 *)(v4 + 1);
    }
    else
    {
      v6 = 0;
      v5 = 0;
    }
    v7 = *(_QWORD *)(v4 + 296);
    v8 = *(void (**)(uint64_t, uint64_t, uint64_t, CFTypeRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
    if (v8)
      v8(v7, v6, 1, v5);
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 304) = *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1);
    if (v5)
      CFRelease(v5);
  }
}

@end
