@implementation FigEndpointManagerRemoteCopyAirPlayManager

void __FigEndpointManagerRemoteCopyAirPlayManager_block_invoke()
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v1;
  uint64_t v2;
  unsigned int v3;
  char *v4;
  os_log_type_t type;
  int v6[2];
  const char *v7;
  __int16 v8;
  int v9;
  char v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  FigEndpointManagerRemoteCopyAirPlayManager_sCreationResult = FigEndpointManagerRemoteCreateWithType(CFSTR("AirPlay"), (CFTypeRef *)&FigEndpointManagerRemoteCopyAirPlayManager_sAirPlayManager);
  v6[0] = 0;
  type = OS_LOG_TYPE_DEFAULT;
  os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(0, 1, v6, &type);
  v1 = v6[0];
  if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
    v3 = v1;
  else
    v3 = v1 & 0xFFFFFFFE;
  if (v3)
  {
    v6[1] = 136315394;
    v7 = "FigEndpointManagerRemoteCopyAirPlayManager_block_invoke";
    v8 = 1024;
    v9 = FigEndpointManagerRemoteCopyAirPlayManager_sCreationResult;
    v4 = (char *)_os_log_send_and_compose_impl();
    LOBYTE(v1) = v6[0];
  }
  else
  {
    v4 = 0;
  }
  fig_log_call_emit_and_clean_up_after_send_and_compose(0, 1u, 1, v4, v4 != &v10, v1, 0, v2);
}

@end
