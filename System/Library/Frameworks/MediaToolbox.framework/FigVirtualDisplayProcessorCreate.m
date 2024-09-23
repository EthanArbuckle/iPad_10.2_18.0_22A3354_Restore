@implementation FigVirtualDisplayProcessorCreate

void __FigVirtualDisplayProcessorCreate_block_invoke(uint64_t a1)
{
  uint64_t v1;
  int data;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v4;
  int v5;
  _BOOL4 v6;
  BOOL v7;
  int64_t v8;
  dispatch_time_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  dispatch_time_t v13;
  uint64_t v14;
  NSObject *v15;

  v1 = *(_QWORD *)(a1 + 32);
  data = dispatch_source_get_data(*(dispatch_source_t *)(v1 + 464));
  if (data >= 1)
  {
    *(_QWORD *)(v1 + 432) += *(_QWORD *)(v1 + 456) * data;
    if (dword_1EE2A3148 >= 3)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v4 = *(_QWORD *)(v1 + 56);
    v5 = *(_DWORD *)(v4 + 160);
    v6 = v5 > 0;
    if (*(_DWORD *)(v1 + 24) == 2 && (!*(_QWORD *)v4 ? (v7 = v5 <= 0) : (v7 = 1), v7 && v5 < *(_DWORD *)(v1 + 472)))
    {
      v8 = *(_QWORD *)(v1 + 424);
      if (*(_QWORD *)(v1 + 456) == v8)
      {
        v9 = 0;
      }
      else
      {
        *(_QWORD *)(v1 + 456) = v8;
        v9 = dispatch_time(0, v8);
      }
      if (fvdp_shouldDropFrame(v1))
        goto LABEL_18;
      if (dword_1EE2A3148 >= 2)
      {
        v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      ++*(_DWORD *)(v4 + 160);
      if (fvdp_sendFrameToEncoder(v1, v6))
      {
        v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        if (!v9)
          return;
      }
      else
      {
LABEL_18:
        if (!v9)
          return;
      }
      v12 = *(_QWORD *)(v1 + 456);
      v11 = *(NSObject **)(v1 + 464);
      v13 = v9;
      v14 = 1000000;
    }
    else
    {
      v11 = *(NSObject **)(v1 + 464);
      v13 = -1;
      v12 = 0;
      v14 = 0;
    }
    dispatch_source_set_timer(v11, v13, v12, v14);
  }
}

_QWORD *__FigVirtualDisplayProcessorCreate_block_invoke_2(_QWORD *result)
{
  uint64_t v1;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v1 = result[4];
  if (*(_DWORD *)(v1 + 24) == 2)
  {
    if (dword_1EE2A3148)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    result = fvdp_shutdownEncoderAndPools(v1);
    *(_BYTE *)(v1 + 48) = 1;
  }
  return result;
}

void __FigVirtualDisplayProcessorCreate_block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  int v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  BOOL v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD block[17];

  block[16] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v6 = 0;
  v2 = fvdp_copySinkProperty(v1, (uint64_t)CFSTR("networkInfo"), (uint64_t)&v6);
  if (v2 == -12784)
  {
    if (dword_1EE2A3148)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    dispatch_source_set_timer(*(dispatch_source_t *)(v1 + 488), 0xFFFFFFFFFFFFFFFFLL, 0, 0);
  }
  else
  {
    if (v2)
      v4 = 1;
    else
      v4 = v6 == 0;
    if (!v4)
    {
      v5 = *(NSObject **)(v1 + 8);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 0x40000000;
      block[2] = __fvdp_encoderControlTimerFired_block_invoke;
      block[3] = &__block_descriptor_tmp_319;
      block[4] = v1;
      block[5] = v6;
      dispatch_async(v5, block);
    }
  }
}

void __FigVirtualDisplayProcessorCreate_block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  uint64_t UpTimeNanoseconds;
  double v3;
  CFMutableArrayRef Mutable;
  unint64_t v5;
  int v6;
  unsigned int *v7;
  signed int v8;
  unsigned int v9;
  int v10;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  CFNumberRef v12;
  uint64_t CMBaseObject;
  void (*v14)(uint64_t, const __CFString *, CFNumberRef);
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, const __CFString *, CFMutableArrayRef);
  uint64_t v18;
  double valuePtr[18];

  valuePtr[16] = *(double *)MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 744) || *(_BYTE *)(v1 + 745))
  {
    UpTimeNanoseconds = FigGetUpTimeNanoseconds();
    v3 = (double)(UpTimeNanoseconds - *(_QWORD *)(v1 + 688)) / 1000000000.0;
    if (v3 > 0.0)
    {
      v18 = UpTimeNanoseconds;
      if (*(_BYTE *)(v1 + 745))
        Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
      else
        Mutable = 0;
      v5 = 0;
      v6 = 0;
      do
      {
        v7 = (unsigned int *)(v1 + 4 * v5 + 696);
        do
          v8 = __ldxr(v7);
        while (__stxr(v8, v7));
        do
          v9 = __ldxr(v7);
        while (__stxr(v9 - v8, v7));
        v10 = (int)((double)v8 / v3 + 0.5);
        if (v5 <= 6 && *(_BYTE *)(v1 + 745))
          FigCFArrayAppendInt32();
        if (*(_BYTE *)(v1 + 744) && dword_1EE2A3148)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        if (v5 == 7)
          v6 = v10;
        ++v5;
      }
      while (v5 != 9);
      if (*(_BYTE *)(v1 + 745))
      {
        valuePtr[0] = (double)v6 * 8.0;
        v12 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberDoubleType, valuePtr);
        CMBaseObject = FigVirtualDisplaySinkGetCMBaseObject(*(_QWORD *)(v1 + 64));
        v14 = *(void (**)(uint64_t, const __CFString *, CFNumberRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                              + 56);
        v15 = v18;
        if (v14)
          v14(CMBaseObject, CFSTR("bitrate"), v12);
        v16 = FigVirtualDisplaySinkGetCMBaseObject(*(_QWORD *)(v1 + 64));
        v17 = *(void (**)(uint64_t, const __CFString *, CFMutableArrayRef))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                + 8)
                                                                                    + 56);
        if (v17)
          v17(v16, CFSTR("fps"), Mutable);
      }
      else
      {
        v12 = 0;
        v15 = v18;
      }
      *(_QWORD *)(v1 + 688) = v15;
      if (Mutable)
        CFRelease(Mutable);
      if (v12)
        CFRelease(v12);
    }
  }
}

@end
