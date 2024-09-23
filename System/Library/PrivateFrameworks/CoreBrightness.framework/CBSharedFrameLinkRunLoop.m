@implementation CBSharedFrameLinkRunLoop

+ (id)addDisplayLinkToRunLoop:(id)a3 forMode:(id)a4
{
  id v5;

  pthread_mutex_lock(&_sharedFrameLinkRunLoopMutex);
  if (_sharedFrameLinkRunLoop)
  {
    v5 = (id)_sharedFrameLinkRunLoop;
    objc_msgSend(a3, "addToRunLoop:forMode:", objc_msgSend(v5, "getRunLoop"), a4);
  }
  else
  {
    _sharedFrameLinkRunLoop = -[CBSharedFrameLinkRunLoop initWithDisplayLink:forMode:]([CBSharedFrameLinkRunLoop alloc], "initWithDisplayLink:forMode:", a3, a4);
    v5 = (id)_sharedFrameLinkRunLoop;
  }
  pthread_mutex_unlock(&_sharedFrameLinkRunLoopMutex);
  return v5;
}

- (CBSharedFrameLinkRunLoop)initWithDisplayLink:(id)a3 forMode:(id)a4
{
  id v5;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(uint64_t);
  void *v10;
  CBSharedFrameLinkRunLoop *v11;
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  int v17;
  int v18;
  char v19;
  id v20;
  objc_super v21;
  id v22;
  id v23;
  SEL v24;
  CBSharedFrameLinkRunLoop *v25;
  CBSharedFrameLinkRunLoop *v26;

  v25 = self;
  v24 = a2;
  v23 = a3;
  v22 = a4;
  v21.receiver = self;
  v21.super_class = (Class)CBSharedFrameLinkRunLoop;
  v25 = -[CBSharedFrameLinkRunLoop init](&v21, sel_init);
  v20 = objc_alloc_init(MEMORY[0x1E0CB3530]);
  if (v20)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x20000000;
    v18 = 32;
    v19 = 0;
    v5 = objc_alloc(MEMORY[0x1E0CB3978]);
    v6 = MEMORY[0x1E0C809B0];
    v7 = -1073741824;
    v8 = 0;
    v9 = __56__CBSharedFrameLinkRunLoop_initWithDisplayLink_forMode___block_invoke;
    v10 = &unk_1E68E9E88;
    v11 = v25;
    v12 = v23;
    v13 = v20;
    v14 = &v15;
    v25->_thread = (NSThread *)objc_msgSend(v5, "initWithBlock:", &v6);
    if (v25->_thread)
    {
      -[NSThread setQualityOfService:](v25->_thread, "setQualityOfService:", 33);
      -[NSThread start](v25->_thread, "start");
      -[NSThread setName:](v25->_thread, "setName:", CFSTR("com.apple.CoreBrightness.CBFrameLink"));
      objc_msgSend(v20, "lock");
      while ((v16[3] & 1) == 0)
        objc_msgSend(v20, "wait");
      objc_msgSend(v20, "unlock");

      v26 = v25;
    }
    else
    {

      v25 = 0;
      v26 = 0;
    }
    _Block_object_dispose(&v15, 8);
  }
  else
  {

    v25 = 0;
    return 0;
  }
  return v26;
}

void __56__CBSharedFrameLinkRunLoop_initWithDisplayLink_forMode___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  objc_msgSend(*(id *)(a1 + 40), "addToRunLoop:forMode:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *MEMORY[0x1E0C99860]);
  objc_msgSend(*(id *)(a1 + 48), "lock");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  objc_msgSend(*(id *)(a1 + 48), "signal");
  objc_msgSend(*(id *)(a1 + 48), "unlock");
  CFRunLoopRun();
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBSharedFrameLinkRunLoop *v4;

  v4 = self;
  v3 = a2;
  pthread_mutex_lock(&_sharedFrameLinkRunLoopMutex);
  if (v4->_thread)
  {

    v4->_thread = 0;
    _sharedFrameLinkRunLoop = 0;
  }
  v2.receiver = v4;
  v2.super_class = (Class)CBSharedFrameLinkRunLoop;
  -[CBSharedFrameLinkRunLoop dealloc](&v2, sel_dealloc);
  pthread_mutex_unlock(&_sharedFrameLinkRunLoopMutex);
}

- (id)getRunLoop
{
  return self->_runLoop;
}

@end
