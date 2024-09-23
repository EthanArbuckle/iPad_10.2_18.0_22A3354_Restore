@implementation FigHapticQueueEnqueueSamples

uint64_t __FigHapticQueueEnqueueSamples_block_invoke(uint64_t a1, CMSampleBufferRef sbuf)
{
  unsigned int v4;
  CFAllocatorRef v5;
  int v6;
  int active;
  int v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  Float64 Seconds;
  Float64 v18;
  int v19;
  uint64_t v20;
  CMTime v22;
  os_log_type_t type;
  unsigned int v24;
  _QWORD block[7];
  CMTime v26;
  CMTime v27;
  CFTypeRef cf;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  int v32;
  CMTime rhs;
  CMSampleBufferRef v34;
  __int16 v35;
  Float64 v36;
  __int16 v37;
  Float64 v38;
  __int16 v39;
  int v40;
  CMTime time;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v29 = 0;
  v30 = &v29;
  v31 = 0x2000000000;
  v32 = 0;
  v27.epoch = 0;
  cf = 0;
  if (*(int *)(*(_QWORD *)(a1 + 32) + 88) < 10)
    v4 = 1;
  else
    v4 = 2;
  v27.value = 0;
  *(_QWORD *)&v27.timescale = 0;
  CMSampleBufferGetOutputPresentationTimeStamp(&v27, sbuf);
  memset(&v26, 0, sizeof(v26));
  CMSampleBufferGetOutputDuration(&v26, sbuf);
  v5 = CFGetAllocator(*(CFTypeRef *)(a1 + 32));
  v6 = FigHapticPlayerCreate((uint64_t)v5, sbuf, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), (uint64_t *)&cf);
  *((_DWORD *)v30 + 6) = v6;
  if (v6)
    goto LABEL_12;
  if (!cf)
    goto LABEL_20;
  FigHapticPlayerSetIsMuted((uint64_t)cf, *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) != 0);
  active = FigHapticPlayerSetActiveChannelIndexNow((uint64_t)cf, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
  *((_DWORD *)v30 + 6) = active;
  if (active)
    goto LABEL_12;
  v8 = FigHapticPlayerSetVolumeNow((uint64_t)cf, *(float *)(*(_QWORD *)(a1 + 32) + 56));
  *((_DWORD *)v30 + 6) = v8;
  if (v8)
    goto LABEL_12;
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(NSObject **)(v9 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 0x40000000;
  block[2] = __FigHapticQueueEnqueueSamples_block_invoke_2;
  block[3] = &unk_1E2F8FB10;
  block[4] = &v29;
  block[5] = v9;
  block[6] = cf;
  dispatch_sync(v10, block);
  v11 = *((_DWORD *)v30 + 6);
  if (!v11 && v4 <= dword_1EE2A2DF8)
  {
    v24 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    v11 = *((_DWORD *)v30 + 6);
  }
  if (v11)
  {
LABEL_12:
    v24 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v14 = v24;
    if (os_log_type_enabled(v13, type))
      v15 = v14;
    else
      v15 = v14 & 0xFFFFFFFE;
    if (v15)
    {
      v16 = *(_QWORD *)(a1 + 32);
      time = v27;
      Seconds = CMTimeGetSeconds(&time);
      time = v27;
      rhs = v26;
      CMTimeAdd(&v22, &time, &rhs);
      v18 = CMTimeGetSeconds(&v22);
      v19 = *((_DWORD *)v30 + 6);
      LODWORD(rhs.value) = 136316418;
      *(CMTimeValue *)((char *)&rhs.value + 4) = (CMTimeValue)"FigHapticQueueEnqueueSamples_block_invoke";
      LOWORD(rhs.flags) = 2112;
      *(_QWORD *)((char *)&rhs.flags + 2) = v16;
      HIWORD(rhs.epoch) = 2048;
      v34 = sbuf;
      v35 = 2048;
      v36 = Seconds;
      v37 = 2048;
      v38 = v18;
      v39 = 1024;
      v40 = v19;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (cf)
    CFRelease(cf);
LABEL_20:
  v20 = *((unsigned int *)v30 + 6);
  _Block_object_dispose(&v29, 8);
  return v20;
}

uint64_t __FigHapticQueueEnqueueSamples_block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = fhq_scheduleHapticPlayer(*(_QWORD *)(a1 + 40), *(const void **)(a1 + 48), 0);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
