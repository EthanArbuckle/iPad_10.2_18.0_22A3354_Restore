@implementation AVUXMDisplayManager

- (void)dealloc
{
  objc_super v3;

  -[AVUXMDisplayManager setPreferredDisplayCriteria:](self, "setPreferredDisplayCriteria:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AVUXMDisplayManager;
  -[AVUXMDisplayManager dealloc](&v3, sel_dealloc);
}

- (void)reset
{
  -[AVUXMDisplayManager setPreferredDisplayCriteria:](self, "setPreferredDisplayCriteria:", 0);
}

+ (AVUXMDisplayManager)sharedAVKitUXMDisplayManager
{
  if (createDispatchQueueOnce_onceToken != -1)
    dispatch_once(&createDispatchQueueOnce_onceToken, &__block_literal_global_17);
  return 0;
}

- (id)currentUXMDisplayCriteria
{
  return 0;
}

- (AVDisplayCriteria)preferredDisplayCriteria
{
  AVDisplayCriteria *v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  uint64_t v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3052000000;
  v8 = __Block_byref_object_copy__19;
  v9 = __Block_byref_object_dispose__19;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__AVUXMDisplayManager_preferredDisplayCriteria__block_invoke;
  v4[3] = &unk_1E302FD60;
  v4[4] = self;
  v4[5] = &v5;
  av_readwrite_dispatch_queue_read((dispatch_queue_t)sAVUXMDisplayManagerQueue, v4);
  v2 = (AVDisplayCriteria *)(id)v6[5];
  _Block_object_dispose(&v5, 8);
  return v2;
}

id __47__AVUXMDisplayManager_preferredDisplayCriteria__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setPreferredDisplayCriteria:(id)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__AVUXMDisplayManager_setPreferredDisplayCriteria___block_invoke;
  v3[3] = &unk_1E302FCE8;
  v3[4] = self;
  v3[5] = a3;
  av_readwrite_dispatch_queue_write((dispatch_queue_t)sAVUXMDisplayManagerQueue, v3);
}

_QWORD *__51__AVUXMDisplayManager_setPreferredDisplayCriteria___block_invoke(_QWORD *result)
{
  void *v1;
  _QWORD *v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v1 = *(void **)(result[4] + 8);
  if (v1 != (void *)result[5])
  {
    v2 = result;

    result = (id)v2[5];
    *(_QWORD *)(v2[4] + 8) = result;
    if (dword_1EE2B02F0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      return (_QWORD *)fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  return result;
}

- (AVUXMDisplayManager)init
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  objc_exception_throw(v7);
}

- (id)initInternal
{
  objc_super v4;

  FigNote_AllowInternalDefaultLogs();
  fig_note_initialize_category_with_default_work();
  fig_note_initialize_category_with_default_work();
  if (createDispatchQueueOnce_onceToken != -1)
    dispatch_once(&createDispatchQueueOnce_onceToken, &__block_literal_global_17);
  v4.receiver = self;
  v4.super_class = (Class)AVUXMDisplayManager;
  return -[AVUXMDisplayManager init](&v4, sel_init);
}

@end
