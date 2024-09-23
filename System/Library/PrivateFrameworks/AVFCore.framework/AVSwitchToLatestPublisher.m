@implementation AVSwitchToLatestPublisher

- (void)dealloc
{
  objc_super v3;

  -[AVNotificationSubscription cancel](self->_outputPublisherSubscription, "cancel");
  FigSimpleMutexDestroy();
  v3.receiver = self;
  v3.super_class = (Class)AVSwitchToLatestPublisher;
  -[AVPublisher dealloc](&v3, sel_dealloc);
}

- (id)subscribeRequestingInitialValue:(BOOL)a3 block:(id)a4
{
  AVPublisher *upstream;
  id v7;
  _QWORD v9[6];
  id v10;
  id location;
  _QWORD v12[3];
  BOOL v13;

  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v13 = a3;
  objc_initWeak(&location, self);
  upstream = self->_upstream;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__AVSwitchToLatestPublisher_subscribeRequestingInitialValue_block___block_invoke;
  v9[3] = &unk_1E30323C0;
  objc_copyWeak(&v10, &location);
  v9[4] = a4;
  v9[5] = v12;
  v7 = -[AVPublisher subscribeRequestingInitialValue:block:](upstream, "subscribeRequestingInitialValue:block:", 1, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  _Block_object_dispose(v12, 8);
  return v7;
}

void __67__AVSwitchToLatestPublisher_subscribeRequestingInitialValue_block___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD *Weak;
  _QWORD *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1940343FC]();
  Weak = objc_loadWeak((id *)(a1 + 48));
  if (Weak)
  {
    v4 = Weak;
    MEMORY[0x194033A30](Weak[1]);
    if (*((_DWORD *)v4 + 8) == *(_DWORD *)(a1 + 56))
    {
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      if (*(_BYTE *)(v5 + 24))
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
        v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      }
      *(_BYTE *)(v5 + 24) = 1;
    }
    MEMORY[0x194033A48](v4[1]);
  }
  objc_autoreleasePoolPop(v2);
}

void __67__AVSwitchToLatestPublisher_subscribeRequestingInitialValue_block___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  _QWORD *Weak;
  _QWORD *v6;
  int v7;
  uint64_t v8;
  _QWORD v9[4];
  __int128 v10;
  id v11;
  int v12;

  v4 = (void *)MEMORY[0x1940343FC]();
  Weak = objc_loadWeak((id *)(a1 + 48));
  if (Weak)
  {
    v6 = Weak;
    MEMORY[0x194033A30](Weak[1]);
    v7 = *((_DWORD *)v6 + 8) + 1;
    *((_DWORD *)v6 + 8) = v7;
    objc_msgSend((id)v6[3], "cancel");

    v6[3] = 0;
    if (a2)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __67__AVSwitchToLatestPublisher_subscribeRequestingInitialValue_block___block_invoke_2;
      v9[3] = &unk_1E3032398;
      objc_copyWeak(&v11, (id *)(a1 + 48));
      v12 = v7;
      v10 = *(_OWORD *)(a1 + 32);
      v6[3] = (id)objc_msgSend(a2, "subscribeRequestingInitialValue:block:", 1, v9);
      objc_destroyWeak(&v11);
    }
    else
    {
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      if (*(_BYTE *)(v8 + 24))
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
        v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      }
      *(_BYTE *)(v8 + 24) = 1;
    }
    MEMORY[0x194033A48](v6[1]);
  }
  objc_autoreleasePoolPop(v4);
}

+ (id)switchToLatestPublisherWithUpstream:(id)a3
{
  return -[AVSwitchToLatestPublisher initWithUpstream:]([AVSwitchToLatestPublisher alloc], "initWithUpstream:", a3);
}

- (AVSwitchToLatestPublisher)initWithUpstream:(id)a3
{
  AVSwitchToLatestPublisher *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVSwitchToLatestPublisher;
  v4 = -[AVPublisher init](&v6, sel_init);
  if (v4)
  {
    v4->_callbackMutex = (OpaqueFigReentrantMutex *)FigReentrantMutexCreate();
    v4->_upstream = (AVPublisher *)a3;
    v4->_publisherIndex = 0;
  }
  return v4;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p upstream=%@"), objc_opt_class(), self, self->_upstream);
}

@end
