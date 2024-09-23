@implementation FigProcessStateMonitorCreateExpiringAssertionOnBehalfOfProcessWithPID

void __FigProcessStateMonitorCreateExpiringAssertionOnBehalfOfProcessWithPID_block_invoke(uint64_t a1)
{
  id *context;
  id *v2;
  id *v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v5;
  uint64_t v6;
  unsigned int v7;
  char *v8;
  NSObject *v9;
  os_log_type_t type;
  int v11[2];
  const char *v12;
  __int16 v13;
  id *v14;
  char v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  context = (id *)dispatch_get_context(*(dispatch_object_t *)(a1 + 32));
  v2 = FigCFWeakReferenceHolderCopyReferencedObject(context);
  if (v2)
  {
    v3 = v2;
    if (!*((_BYTE *)v2 + 16))
    {
      if (dword_1EE141E28)
      {
        v11[0] = 0;
        type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type((uint64_t *)qword_1EE141E20, 1, v11, &type);
        v5 = v11[0];
        if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
          v7 = v5;
        else
          v7 = v5 & 0xFFFFFFFE;
        if (v7)
        {
          v11[1] = 136315394;
          v12 = "FigProcessStateMonitorCreateExpiringAssertionOnBehalfOfProcessWithPID_block_invoke";
          v13 = 2112;
          v14 = v3;
          v8 = (char *)_os_log_send_and_compose_impl();
          LOBYTE(v5) = v11[0];
        }
        else
        {
          v8 = 0;
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose((uint64_t *)qword_1EE141E20, 1u, 1, v8, v8 != &v15, v5, 0, v6);
      }
      figProcessStateMonitorMayPurgeClientObjects((uint64_t)v3[4], v3[3]);
      *((_BYTE *)v3 + 16) = 1;
      v9 = v3[5];
      if (v9)
      {
        dispatch_release(v9);
        v3[5] = 0;
      }
    }
    CFRelease(v3);
  }
}

@end
