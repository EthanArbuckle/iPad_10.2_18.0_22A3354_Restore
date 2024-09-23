@implementation FigControlCommandsStartServer

void __FigControlCommandsStartServer_block_invoke()
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v1;
  uint64_t v2;
  unsigned int v3;
  char *v4;
  os_log_type_t type;
  int v6[2];
  const char *v7;
  char v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (dword_1EE141EE8)
  {
    v6[0] = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type((uint64_t *)qword_1EE141EE0, 1, v6, &type);
    v1 = v6[0];
    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
      v3 = v1;
    else
      v3 = v1 & 0xFFFFFFFE;
    if (v3)
    {
      v6[1] = 136315138;
      v7 = "DumpCoreMediaPreferences";
      v4 = (char *)_os_log_send_and_compose_impl();
      LOBYTE(v1) = v6[0];
    }
    else
    {
      v4 = 0;
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose((uint64_t *)qword_1EE141EE0, 1u, 1, v4, v4 != &v8, v1, 0, v2);
  }
  DumpPreferencesToLog(CFSTR("com.apple.coremedia"));
  DumpPreferencesToLog(CFSTR("com.apple.coremedia.bag"));
  DumpPreferencesToLog(CFSTR("com.apple.avfoundation"));
}

@end
