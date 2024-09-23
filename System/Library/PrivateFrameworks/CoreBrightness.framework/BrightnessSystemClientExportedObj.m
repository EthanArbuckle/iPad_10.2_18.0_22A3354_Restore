@implementation BrightnessSystemClientExportedObj

- (void)setTarget:(id)a3
{
  self->_target = (BrightnessSystemClientInternal *)a3;
}

void __65__BrightnessSystemClientExportedObj_notifyChangedProperty_value___block_invoke(uint64_t a1)
{
  id obj;

  obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 16))();
  objc_sync_exit(obj);

}

- (void)registerNotificationBlock:(id)a3
{
  -[BrightnessSystemClientExportedObj unregisterNotificationBlock](self, "unregisterNotificationBlock");
  objc_sync_enter(self);
  if (a3)
    self->clientBlock = _Block_copy(a3);
  objc_sync_exit(self);
}

- (void)unregisterNotificationBlock
{
  objc_sync_enter(self);
  if (self->clientBlock)
  {
    _Block_release(self->clientBlock);
    self->clientBlock = 0;
  }
  objc_sync_exit(self);
}

- (void)notifyChangedProperty:(id)a3 value:(id)a4
{
  id v4;
  id v5;
  NSObject *queue;
  NSObject *inited;
  uint64_t block;
  int v9;
  int v10;
  void (*v11)(uint64_t);
  void *v12;
  BrightnessSystemClientExportedObj *v13;
  id v14;
  id v15;
  os_log_type_t type;
  os_log_t oslog;
  id v18;
  id v19;
  SEL v20;
  BrightnessSystemClientExportedObj *v21;
  uint8_t v22[56];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v21 = self;
  v20 = a2;
  v19 = a3;
  v18 = a4;
  oslog = 0;
  if (_COREBRIGHTNESS_LOG_DEFAULT)
    inited = _COREBRIGHTNESS_LOG_DEFAULT;
  else
    inited = init_default_corebrightness_log();
  oslog = inited;
  type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(inited, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_4_8_64_8_64_8_0_8_0((uint64_t)v22, (uint64_t)v19, (uint64_t)v18, (uint64_t)v21->queue, (uint64_t)v21->clientBlock);
    _os_log_debug_impl(&dword_1B5291000, oslog, type, "key=%@ property=%@ queue=%p clientBlock=%p", v22, 0x2Au);
  }
  if (!v21->queue)
    v21->queue = (OS_dispatch_queue *)dispatch_queue_create(0, 0);
  if (v21->clientBlock)
  {
    if (v21->queue)
    {
      v4 = v19;
      v5 = v18;
      queue = v21->queue;
      block = MEMORY[0x1E0C809B0];
      v9 = -1073741824;
      v10 = 0;
      v11 = __65__BrightnessSystemClientExportedObj_notifyChangedProperty_value___block_invoke;
      v12 = &unk_1E68EA150;
      v13 = v21;
      v14 = v19;
      v15 = v18;
      dispatch_async(queue, &block);
    }
  }
}

- (void)dealloc
{
  objc_super v3;
  SEL v4;
  BrightnessSystemClientExportedObj *v5;

  v5 = self;
  v4 = a2;
  objc_sync_enter(self);
  if (v5->clientBlock)
    _Block_release(v5->clientBlock);
  if (v5->queue)
    dispatch_release((dispatch_object_t)v5->queue);
  objc_sync_exit(self);
  v3.receiver = v5;
  v3.super_class = (Class)BrightnessSystemClientExportedObj;
  -[BrightnessSystemClientExportedObj dealloc](&v3, sel_dealloc);
}

- (BrightnessSystemClientInternal)target
{
  return self->_target;
}

@end
