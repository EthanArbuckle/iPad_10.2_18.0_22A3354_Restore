@implementation DNDSAuxiliaryStateMonitor

- (DNDSAuxiliaryStateMonitor)init
{
  DNDSAuxiliaryStateMonitor *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DNDSAuxiliaryStateMonitor;
  v2 = -[DNDSAuxiliaryStateMonitor init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.donotdisturb.DNDSAuxiliaryStateMonitor.queue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    *(_WORD *)&v2->_presentationModeEnabled = 0;
    v2->_screenMirrored = 0;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)DNDSAuxiliaryStateMonitor;
  -[DNDSAuxiliaryStateMonitor dealloc](&v2, sel_dealloc);
}

- (BOOL)isPresentationModeEnabled
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__DNDSAuxiliaryStateMonitor_isPresentationModeEnabled__block_invoke;
  v5[3] = &unk_1E86A5948;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __54__DNDSAuxiliaryStateMonitor_isPresentationModeEnabled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 16);
  return result;
}

- (BOOL)isScreenShared
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__DNDSAuxiliaryStateMonitor_isScreenShared__block_invoke;
  v5[3] = &unk_1E86A5948;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __43__DNDSAuxiliaryStateMonitor_isScreenShared__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 17);
  return result;
}

- (void)setScreenShared:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__DNDSAuxiliaryStateMonitor_setScreenShared___block_invoke;
  v4[3] = &unk_1E86A7370;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(queue, v4);
}

uint64_t __45__DNDSAuxiliaryStateMonitor_setScreenShared___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 17) = *(_BYTE *)(result + 40);
  return result;
}

- (BOOL)isScreenMirrored
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__DNDSAuxiliaryStateMonitor_isScreenMirrored__block_invoke;
  v5[3] = &unk_1E86A5948;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __45__DNDSAuxiliaryStateMonitor_isScreenMirrored__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 18);
  return result;
}

- (void)setScreenMirrored:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__DNDSAuxiliaryStateMonitor_setScreenMirrored___block_invoke;
  v4[3] = &unk_1E86A7370;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(queue, v4);
}

uint64_t __47__DNDSAuxiliaryStateMonitor_setScreenMirrored___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 18) = *(_BYTE *)(result + 40);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
