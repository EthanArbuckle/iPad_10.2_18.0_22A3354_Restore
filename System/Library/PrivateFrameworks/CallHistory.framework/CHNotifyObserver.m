@implementation CHNotifyObserver

- (CHNotifyObserver)initWithName:(id)a3 queue:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  id v10;
  CHNotifyObserver *v11;
  uint64_t v12;
  id callback;
  uint64_t v14;
  NSString *name;
  const char *v16;
  NSObject *queue;
  _QWORD v19[4];
  id v20;
  id location;
  objc_super v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)CHNotifyObserver;
  v11 = -[CHNotifyObserver init](&v22, sel_init);
  if (v11)
  {
    v12 = MEMORY[0x1B5E33208](v10);
    callback = v11->_callback;
    v11->_callback = (id)v12;

    v14 = objc_msgSend(v8, "copy");
    name = v11->_name;
    v11->_name = (NSString *)v14;

    objc_storeStrong((id *)&v11->_queue, a4);
    v11->_token = 0;
    objc_initWeak(&location, v11);
    v16 = -[NSString UTF8String](v11->_name, "UTF8String");
    queue = v11->_queue;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __48__CHNotifyObserver_initWithName_queue_callback___block_invoke;
    v19[3] = &unk_1E6747340;
    objc_copyWeak(&v20, &location);
    notify_register_dispatch(v16, &v11->_token, queue, v19);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v11;
}

void __48__CHNotifyObserver_initWithName_queue_callback___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void (**v2)(void);
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "callback");
    v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v2[2]();

    WeakRetained = v3;
  }

}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_token);
  self->_token = 0;
  v3.receiver = self;
  v3.super_class = (Class)CHNotifyObserver;
  -[CHNotifyObserver dealloc](&v3, sel_dealloc);
}

- (id)callback
{
  return self->_callback;
}

- (NSString)name
{
  return self->_name;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (int)token
{
  return self->_token;
}

- (void)setToken:(int)a3
{
  self->_token = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong(&self->_callback, 0);
}

@end
