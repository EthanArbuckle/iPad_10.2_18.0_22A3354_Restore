@implementation MXBiomeStreams

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_1);
  return (id)sharedInstance_sSharedInstance_0;
}

MXBiomeStreams *__32__MXBiomeStreams_sharedInstance__block_invoke()
{
  MXBiomeStreams *result;

  result = objc_alloc_init(MXBiomeStreams);
  sharedInstance_sSharedInstance_0 = (uint64_t)result;
  return result;
}

- (MXBiomeStreams)init
{
  MXBiomeStreams *v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v4;
  NSObject *v5;
  objc_super v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)MXBiomeStreams;
  v2 = -[MXBiomeStreams init](&v7, sel_init);
  if (v2)
  {
    if (!BiomeStreamsLibraryCore_frameworkLibrary)
    {
      v8 = xmmword_1E3098FE0;
      v9 = 0;
      BiomeStreamsLibraryCore_frameworkLibrary = _sl_dlopen();
    }
    if (!BiomeStreamsLibraryCore_frameworkLibrary)
      goto LABEL_10;
    if (!BiomeLibraryLibraryCore_frameworkLibrary)
    {
      v8 = xmmword_1E3098FF8;
      v9 = 0;
      BiomeLibraryLibraryCore_frameworkLibrary = _sl_dlopen();
    }
    if (BiomeLibraryLibraryCore_frameworkLibrary)
    {
      if (dword_1EE2B3F38)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v2->mAccessQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.mediaexperience.MXBiomeStreams", v5);
    }
    else
    {
LABEL_10:
      v4 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      return 0;
    }
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  dispatch_release((dispatch_object_t)self->mAccessQueue);
  self->mAccessQueue = 0;
  v3.receiver = self;
  v3.super_class = (Class)MXBiomeStreams;
  -[MXBiomeStreams dealloc](&v3, sel_dealloc);
}

- (void)updateBiomeSilentMode:(BOOL)a3 clientType:(unsigned int)a4 untilTime:(id)a5 reason:(id)a6
{
  id v11;
  id v12;
  NSObject *mAccessQueue;
  _QWORD v14[6];
  unsigned int v15;
  BOOL v16;

  v11 = a5;
  v12 = a6;
  mAccessQueue = self->mAccessQueue;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __68__MXBiomeStreams_updateBiomeSilentMode_clientType_untilTime_reason___block_invoke;
  v14[3] = &unk_1E3098FC0;
  v16 = a3;
  v15 = a4;
  v14[4] = a5;
  v14[5] = a6;
  MXDispatchAsync((uint64_t)"-[MXBiomeStreams updateBiomeSilentMode:clientType:untilTime:reason:]", (uint64_t)"MXBiomeStreams.m", 93, 0, 0, mAccessQueue, (uint64_t)v14);
}

void __68__MXBiomeStreams_updateBiomeSilentMode_clientType_untilTime_reason___block_invoke(uint64_t a1)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v11 = 0;
  v12 = &v11;
  v13 = 0x3052000000;
  v14 = __Block_byref_object_copy__0;
  v15 = __Block_byref_object_dispose__0;
  v3 = (objc_class *)getBMDeviceSilentModeClass_softClass;
  v16 = getBMDeviceSilentModeClass_softClass;
  if (!getBMDeviceSilentModeClass_softClass)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __getBMDeviceSilentModeClass_block_invoke;
    v10[3] = &unk_1E3099018;
    v10[4] = &v11;
    __getBMDeviceSilentModeClass_block_invoke((uint64_t)v10);
    v3 = (objc_class *)v12[5];
  }
  _Block_object_dispose(&v11, 8);
  v4 = [v3 alloc];
  v5 = (void *)objc_msgSend(v4, "initWithStarting:clientType:untilTime:reason:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 52)), *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v6 = getBiomeLibrarySymbolLoc_ptr;
  v14 = (void (*)(uint64_t, uint64_t))getBiomeLibrarySymbolLoc_ptr;
  if (!getBiomeLibrarySymbolLoc_ptr)
  {
    v7 = (void *)BiomeLibraryLibrary();
    v6 = dlsym(v7, "BiomeLibrary");
    v12[3] = (uint64_t)v6;
    getBiomeLibrarySymbolLoc_ptr = v6;
  }
  _Block_object_dispose(&v11, 8);
  if (!v6)
  {
    __68__MXBiomeStreams_updateBiomeSilentMode_clientType_untilTime_reason___block_invoke_cold_1();
    __break(1u);
  }
  objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)((uint64_t (*)(uint64_t, uint64_t))v6)(v8, v9), "Device"), "SilentMode"), "source"), "sendEvent:", v5);

}

uint64_t __68__MXBiomeStreams_updateBiomeSilentMode_clientType_untilTime_reason___block_invoke_cold_1()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return __getBMDeviceSilentModeClass_block_invoke_cold_1(v0);
}

@end
