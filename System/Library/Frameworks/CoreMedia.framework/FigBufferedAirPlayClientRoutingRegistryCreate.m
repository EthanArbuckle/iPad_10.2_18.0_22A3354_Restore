@implementation FigBufferedAirPlayClientRoutingRegistryCreate

void __FigBufferedAirPlayClientRoutingRegistryCreate_block_invoke()
{
  void *v0;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v2;
  uint64_t v3;
  unsigned int v4;
  char *v5;
  char *v6;
  os_log_type_t type;
  int v8[2];
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  char *v13;
  char v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v0 = dlopen("/System/Library/PrivateFrameworks/MediaExperience.framework/MediaExperience", 4);
  mediaexperience = (uint64_t)v0;
  if (v0)
  {
    skFigRoutingContextProperty_ContextUUID = (uint64_t)dlsym(v0, "kFigRoutingContextProperty_ContextUUID");
    if (!skFigRoutingContextProperty_ContextUUID)
    {
LABEL_14:
      FigSignalErrorAt(4294966630, 0, 0, 0, 0, 0, 0);
      return;
    }
    if (FigServer_IsAirplayd())
    {
      sFigRoutingContextRemoteCopySystemAudioContext = dlsym((void *)mediaexperience, "FigRoutingContextRemoteCopySystemAudioContext");
      if (!sFigRoutingContextRemoteCopySystemAudioContext)
        goto LABEL_14;
      sFigRoutingContextRemoteCopySystemMusicContext = dlsym((void *)mediaexperience, "FigRoutingContextRemoteCopySystemMusicContext");
      if (!sFigRoutingContextRemoteCopySystemMusicContext)
        goto LABEL_14;
    }
    else
    {
      sFigRoutingContextCopySystemAudioContext = (uint64_t)dlsym((void *)mediaexperience, "FigRoutingContextCopySystemAudioContext");
      if (!sFigRoutingContextCopySystemAudioContext)
        goto LABEL_14;
      sFigRoutingContextCopySystemMusicContext = (uint64_t)dlsym((void *)mediaexperience, "FigRoutingContextCopySystemMusicContext");
      if (!sFigRoutingContextCopySystemMusicContext)
        goto LABEL_14;
    }
  }
  else
  {
    v8[0] = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type((uint64_t *)qword_1EE141EA0, 0, v8, &type);
    v2 = v8[0];
    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
      v4 = v2;
    else
      v4 = v2 & 0xFFFFFFFE;
    if (v4)
    {
      v5 = dlerror();
      v8[1] = 136315650;
      v9 = "LoadMediaExperienceFramework";
      v10 = 2082;
      v11 = "/System/Library/PrivateFrameworks/MediaExperience.framework/MediaExperience";
      v12 = 2082;
      v13 = v5;
      v6 = (char *)_os_log_send_and_compose_impl();
      LOBYTE(v2) = v8[0];
    }
    else
    {
      v6 = 0;
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose((uint64_t *)qword_1EE141EA0, 0, 1, v6, v6 != &v14, v2, 0, v3);
  }
}

@end
