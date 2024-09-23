@implementation FigNeroLayer

- (FigNeroLayer)init
{
  FigNeroLayer *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FigNeroLayer;
  v2 = -[FigNeroLayer init](&v4, sel_init);
  if (v2)
    v2->_neroQueue = (OS_dispatch_queue *)dispatch_queue_create("FigNeroLayer", 0);
  return v2;
}

- (void)dealloc
{
  NSObject *neroQueue;
  objc_super v4;

  -[FigNeroLayer stop](self, "stop");
  neroQueue = self->_neroQueue;
  if (neroQueue)
  {
    dispatch_release(neroQueue);
    self->_neroQueue = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)FigNeroLayer;
  -[FigNeroLayer dealloc](&v4, sel_dealloc);
}

- (FigNeroLayerDelegate)neroDelegate
{
  return self->_neroDelegate;
}

- (void)setNeroDelegate:(id)a3
{
  self->_neroDelegate = (FigNeroLayerDelegate *)a3;
}

- (void)start
{
  NSObject *neroQueue;
  _QWORD block[5];

  neroQueue = self->_neroQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __21__FigNeroLayer_start__block_invoke;
  block[3] = &unk_1E2F88548;
  block[4] = self;
  dispatch_sync(neroQueue, block);
}

uint64_t __21__FigNeroLayer_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_start");
}

- (void)_start
{
  OpaqueFigNeroid **p_neroid;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, __CFString *, FigNeroLayer *);
  OpaqueFigNeroid *v7;
  void (*v8)(OpaqueFigNeroid *);

  p_neroid = &self->_neroid;
  if (!self->_neroid && !FigNeroidCreateRemote(*MEMORY[0x1E0C9AE00], (CFTypeRef *)p_neroid))
  {
    FigBytePumpGetFigBaseObject(*p_neroid);
    v5 = v4;
    v6 = *(void (**)(uint64_t, __CFString *, FigNeroLayer *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v6)
      v6(v5, CFSTR("DisplayLayer"), self);
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterAddListener();
    v7 = *p_neroid;
    v8 = *(void (**)(OpaqueFigNeroid *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
    if (v8)
      v8(v7);
  }
}

- (void)stop
{
  NSObject *neroQueue;
  _QWORD block[5];

  neroQueue = self->_neroQueue;
  if (neroQueue)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __20__FigNeroLayer_stop__block_invoke;
    block[3] = &unk_1E2F88548;
    block[4] = self;
    dispatch_sync(neroQueue, block);
  }
}

void __20__FigNeroLayer_stop__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t);
  const void *v5;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40))
  {
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterRemoveListener();
    FigBytePumpGetFigBaseObject(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
    if (v2)
    {
      v3 = v2;
      v4 = *(void (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 24);
      if (v4)
        v4(v3);
    }
    v5 = *(const void **)(*(_QWORD *)(a1 + 32) + 40);
    if (v5)
    {
      CFRelease(v5);
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 0;
    }
  }
}

- (void)setBounds:(CGRect)a3
{
  NSObject *neroQueue;
  _QWORD block[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FigNeroLayer;
  -[FigNeroLayer setBounds:](&v6, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  neroQueue = self->_neroQueue;
  if (neroQueue)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __26__FigNeroLayer_setBounds___block_invoke;
    block[3] = &unk_1E2F88548;
    block[4] = self;
    dispatch_sync(neroQueue, block);
  }
}

void __26__FigNeroLayer_setBounds___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  CGFloat v3;
  CGFloat v4;
  CFDictionaryRef DictionaryRepresentation;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, __CFString *, CFDictionaryRef);
  CGSize v9;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[5])
  {
    objc_msgSend(v2, "bounds");
    v9.width = v3;
    v9.height = v4;
    DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(v9);
    FigBytePumpGetFigBaseObject(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
    v7 = v6;
    v8 = *(void (**)(uint64_t, __CFString *, CFDictionaryRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v8)
      v8(v7, CFSTR("DisplaySize"), DictionaryRepresentation);
    if (DictionaryRepresentation)
      CFRelease(DictionaryRepresentation);
  }
}

- (void)_dispatchNotification:(id)a3 value:(id)a4
{
  if (objc_msgSend(a3, "isEqualToString:", 0x1E2FFEF38, a4))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[FigNeroLayerDelegate neroLayerDidConnect:](self->_neroDelegate, "neroLayerDidConnect:", self);
  }
  else if ((objc_msgSend(a3, "isEqualToString:", 0x1E2FFEF58) & 1) != 0
         || objc_msgSend(a3, "isEqualToString:", 0x1E3001038))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[FigNeroLayerDelegate neroLayerDidDisconnect:](self->_neroDelegate, "neroLayerDidDisconnect:", self);
  }
  else if (objc_msgSend(a3, "isEqualToString:", 0x1E2FFEF18)
         && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[FigNeroLayerDelegate neroLayerDidReceiveFirstFrame:](self->_neroDelegate, "neroLayerDidReceiveFirstFrame:", self);
  }
}

@end
