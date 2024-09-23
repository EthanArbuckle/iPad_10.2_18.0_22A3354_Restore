@implementation FigNTPGetTimeOfDay

void __FigNTPGetTimeOfDay_block_invoke(_QWORD *a1)
{
  int v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  os_log_type_t type;
  int v16[2];
  const char *v17;
  __int16 v18;
  uint64_t v19;
  char v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1[6] + 80);
  if (v2)
  {
    if (v2 == 1)
    {
      if (clock_gettime(_CLOCK_MONOTONIC, (timespec *)(*(_QWORD *)(a1[4] + 8) + 24)))
      {
        *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = -15874;
      }
      else
      {
        v9 = a1[6];
        v10 = *(_QWORD *)(v9 + 16);
        *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) += v10;
        v11 = *(_QWORD *)(a1[4] + 8);
        v12 = *(_QWORD *)(v11 + 32);
        v13 = *(unsigned int *)(v9 + 32);
        if (v10 < 0)
          v14 = v12 - v13;
        else
          v14 = v12 + v13;
        *(_QWORD *)(v11 + 32) = v14;
      }
    }
    else
    {
      *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = -15873;
      if (dword_1EE141F28)
      {
        v16[0] = 0;
        type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type((uint64_t *)qword_1EE141F20, 1, v16, &type);
        v4 = v16[0];
        if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
          v6 = v4;
        else
          v6 = v4 & 0xFFFFFFFE;
        if (v6)
        {
          v7 = a1[6];
          v16[1] = 136315394;
          v17 = "FigNTPGetTimeOfDay_block_invoke";
          v18 = 2048;
          v19 = v7;
          v8 = (char *)_os_log_send_and_compose_impl();
          LOBYTE(v4) = v16[0];
        }
        else
        {
          v8 = 0;
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose((uint64_t *)qword_1EE141F20, 1u, 1, v8, v8 != &v20, v4, 0, v5);
      }
    }
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = FigSignalErrorAt(4294951424, 0, 0, 0, 0, 0, 0);
  }
}

@end
