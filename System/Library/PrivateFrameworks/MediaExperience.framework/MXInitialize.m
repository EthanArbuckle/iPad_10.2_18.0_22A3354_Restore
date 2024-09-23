@implementation MXInitialize

void __MXInitialize_block_invoke()
{
  void *v0;
  void *v1;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v3;
  uint64_t (*v4)(void *, uint64_t);
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x194035B20]();
  cmsmInitializeCMSessionManager();
  if (!MX_FeatureFlags_IsAudiomxdEnabled() || !CMSMDeviceState_IsAudiomxd())
    goto LABEL_20;
  FigCommonMediaProcessInitialization();
  FigSystemControllerStartServer();
  FigRouteDiscovererStartServer();
  FigRoutingContextStartServer();
  FigVolumeControllerStartServer();
  FigEndpointUIAgentStartServer();
  FigRoutingSessionManagerStartServer();
  FigSTSServerStart();
  v1 = dlopen("/System/Library/PrivateFrameworks/AirPlaySender.framework/AirPlaySender", 4);
  airplaysender = (uint64_t)v1;
  if (v1)
  {
    sAirPlayStartServicesInMXProcess = dlsym(v1, "AirPlayStartServicesInMXProcess");
    if (!sAirPlayStartServicesInMXProcess)
      FigSignalErrorAt();
  }
  else
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v3 = dlopen("/System/Library/Frameworks/MediaToolbox.framework/MediaToolbox", 4);
  mediatoolbox = (uint64_t)v3;
  if (v3)
  {
    v4 = (uint64_t (*)(void *, uint64_t))dlsym(v3, "FVDUtilsStartXPCServers");
    sFVDUtilsStartXPCServers = (uint64_t)v4;
    if (v4)
      goto LABEL_12;
    FigSignalErrorAt();
  }
  else
  {
    v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v4 = (uint64_t (*)(void *, uint64_t))sFVDUtilsStartXPCServers;
  if (!sFVDUtilsStartXPCServers)
  {
    v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    v7 = fig_log_call_emit_and_clean_up_after_send_and_compose();
    goto LABEL_13;
  }
LABEL_12:
  v7 = v4(v4, v5);
LABEL_13:
  if (sAirPlayStartServicesInMXProcess)
  {
    v8 = ((uint64_t (*)(uint64_t))sAirPlayStartServicesInMXProcess)(v7);
  }
  else
  {
    v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    v8 = fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (MX_FeatureFlags_IsAirPlayDaemonEnabled(v8, v9))
  {
    FigEndpointStartServerEx();
    FigStarkModeControllerStartServer();
  }
  else
  {
    FigEndpointStartServerEx();
  }
LABEL_20:
  +[MXInitialization notifyMXIsFullyInitialized](MXInitialization, "notifyMXIsFullyInitialized", v12, v13);
  objc_autoreleasePoolPop(v0);
}

@end
