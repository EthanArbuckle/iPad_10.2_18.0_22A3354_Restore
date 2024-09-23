@implementation MRScreenMirroringObserver

+ (id)observerWithStateChangeCallback:(id)a3
{
  id v3;
  MRScreenMirroringObserver *v4;

  v3 = a3;
  v4 = -[MRScreenMirroringObserver initWithStateChangeCallback:]([MRScreenMirroringObserver alloc], "initWithStateChangeCallback:", v3);

  return v4;
}

+ (id)UIControllingObserver
{
  return objc_alloc_init(MRScreenMirroringUIControllingObserver);
}

- (MRScreenMirroringObserver)initWithStateChangeCallback:(id)a3
{
  id v4;
  MRScreenMirroringObserver *v5;
  MRScreenMirroringObserver *v6;
  uint64_t v7;
  id callback;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  NSObject *v12;
  objc_super v14;
  uint8_t buf[4];
  MRScreenMirroringObserver *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MRScreenMirroringObserver;
  v5 = -[MRScreenMirroringObserver init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_deviceCount = 0;
    v7 = MEMORY[0x194036C44](v4);
    callback = v6->_callback;
    v6->_callback = (id)v7;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.MediaRemote.MRScreenMirroringObserver.queue", v9);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v10;

    -[MRScreenMirroringObserver _init](v6, "_init");
    _MRLogForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v16 = v6;
      _os_log_impl(&dword_193827000, v12, OS_LOG_TYPE_DEFAULT, "[MRScreenMirroringObserver] <%p> Initialized.", buf, 0xCu);
    }

  }
  return v6;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  MRScreenMirroringObserver *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _MRLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v6 = self;
    _os_log_impl(&dword_193827000, v3, OS_LOG_TYPE_DEFAULT, "[MRScreenMirroringObserver] <%p> Deallocating.", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)MRScreenMirroringObserver;
  -[MRScreenMirroringObserver dealloc](&v4, sel_dealloc);
}

- (void)_init
{
  NSObject *v3;
  _QWORD block[5];

  -[MRScreenMirroringObserver queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__MRScreenMirroringObserver__init__block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  dispatch_async(v3, block);

}

void __34__MRScreenMirroringObserver__init__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  +[MRAVOutputContext sharedSystemScreenContext](MRAVOutputContext, "sharedSystemScreenContext");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__contextChangeNotification_, CFSTR("MRAVOutputContextOutputDevicesDidChangeNotification"), v4);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__contextChangeNotification_, CFSTR("MRAVOutputContextOutputDeviceDidChangeNotification"), v4);

  objc_msgSend(*(id *)(a1 + 32), "_notifyIfNeeded");
}

- (void)_contextChangeNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MRScreenMirroringObserver queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__MRScreenMirroringObserver__contextChangeNotification___block_invoke;
  v7[3] = &unk_1E30C5F40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __56__MRScreenMirroringObserver__contextChangeNotification___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _MRLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 134218242;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_193827000, v2, OS_LOG_TYPE_DEFAULT, "[MRScreenMirroringObserver] <%p> Received %@.", (uint8_t *)&v6, 0x16u);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_notifyIfNeeded");
}

- (void)_notifyIfNeeded
{
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void (**v11)(void);
  int v12;
  MRScreenMirroringObserver *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  int64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = -[MRScreenMirroringObserver deviceCount](self, "deviceCount");
  +[MRAVOutputContext sharedSystemScreenContext](MRAVOutputContext, "sharedSystemScreenContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "outputDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRScreenMirroringObserver setDeviceCount:](self, "setDeviceCount:", objc_msgSend(v5, "count"));

  _MRLogForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    +[MRAVOutputContext sharedSystemScreenContext](MRAVOutputContext, "sharedSystemScreenContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 134218752;
    v13 = self;
    v14 = 2048;
    v15 = v7;
    v16 = 2048;
    v17 = v3;
    v18 = 2048;
    v19 = -[MRScreenMirroringObserver deviceCount](self, "deviceCount");
    _os_log_impl(&dword_193827000, v6, OS_LOG_TYPE_DEFAULT, "[MRScreenMirroringObserver] <%p> Re-evaluate for context: %p. Old count: %ld, new: %ld.", (uint8_t *)&v12, 0x2Au);

  }
  if (v3)
  {
    if (v3 >= 1 && !-[MRScreenMirroringObserver deviceCount](self, "deviceCount"))
    {
      -[MRScreenMirroringObserver callback](self, "callback");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        _MRLogForCategory(0);
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v12 = 134217984;
          v13 = self;
          _os_log_impl(&dword_193827000, v9, OS_LOG_TYPE_DEFAULT, "[MRScreenMirroringObserver] <%p> Notify mirroring OFF.", (uint8_t *)&v12, 0xCu);
        }
LABEL_14:

        -[MRScreenMirroringObserver callback](self, "callback");
        v11 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v11[2]();

      }
    }
  }
  else if (-[MRScreenMirroringObserver deviceCount](self, "deviceCount") >= 1)
  {
    -[MRScreenMirroringObserver callback](self, "callback");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      _MRLogForCategory(0);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 134217984;
        v13 = self;
        _os_log_impl(&dword_193827000, v9, OS_LOG_TYPE_DEFAULT, "[MRScreenMirroringObserver] <%p> Notify mirroring ON.", (uint8_t *)&v12, 0xCu);
      }
      goto LABEL_14;
    }
  }
}

- (id)callback
{
  return self->_callback;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (int64_t)deviceCount
{
  return self->_deviceCount;
}

- (void)setDeviceCount:(int64_t)a3
{
  self->_deviceCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_callback, 0);
}

@end
