@implementation FigEndpointManagerRemoteCopyNeroManager

void *__FigEndpointManagerRemoteCopyNeroManager_block_invoke()
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v1;
  uint64_t v2;
  unsigned int v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t DerivedStorage;
  void *result;
  os_log_type_t type;
  int v9[2];
  const char *v10;
  __int16 v11;
  int v12;
  _QWORD v13[17];

  v13[16] = *MEMORY[0x1E0C80C00];
  FigEndpointManagerRemoteCopyNeroManager_sCreationResult = FigEndpointManagerRemoteCreateWithType(CFSTR("Nero/Stevenote"), (CFTypeRef *)&FigEndpointManagerRemoteCopyNeroManager_sNeroManager);
  v9[0] = 0;
  type = OS_LOG_TYPE_DEFAULT;
  os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(0, 1, v9, &type);
  v1 = v9[0];
  if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
    v3 = v1;
  else
    v3 = v1 & 0xFFFFFFFE;
  if (v3)
  {
    v9[1] = 136315394;
    v10 = "FigEndpointManagerRemoteCopyNeroManager_block_invoke";
    v11 = 1024;
    v12 = FigEndpointManagerRemoteCopyNeroManager_sCreationResult;
    v4 = (_QWORD *)_os_log_send_and_compose_impl();
    LOBYTE(v1) = v9[0];
  }
  else
  {
    v4 = 0;
  }
  fig_log_call_emit_and_clean_up_after_send_and_compose(0, 1u, 1, v4, v4 != v13, v1, 0, v2);
  v5 = FigEndpointManagerRemoteCopyNeroManager_sNeroManager;
  DerivedStorage = CMBaseObjectGetDerivedStorage(FigEndpointManagerRemoteCopyNeroManager_sNeroManager);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 0x40000000;
  v13[2] = __remoteXPCEndpointManager_startListeningForValeriaConnections_block_invoke;
  v13[3] = &__block_descriptor_tmp_21;
  v13[4] = v5;
  result = NeroValeriaListenerCreate((uint64_t)v13);
  *(_QWORD *)(DerivedStorage + 8) = result;
  return result;
}

@end
