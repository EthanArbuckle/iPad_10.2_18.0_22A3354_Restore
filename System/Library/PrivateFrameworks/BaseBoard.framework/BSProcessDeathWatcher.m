@implementation BSProcessDeathWatcher

- (void)dealloc
{
  objc_super v3;

  -[BSDispatchSource invalidate](self->_source, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)BSProcessDeathWatcher;
  -[BSProcessDeathWatcher dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  -[BSDispatchSource invalidate](self->_source, "invalidate");
}

- (BSProcessDeathWatcher)initWithPID:(int)a3 queue:(id)a4 deathHandler:(id)a5
{
  id v8;
  id v9;
  BSProcessDeathWatcher *v10;
  uint64_t v11;
  id deathHandler;
  BSDispatchSource *v13;
  uint64_t v14;
  BSDispatchSource *source;
  BSDispatchSource *v16;
  const char *v17;
  _QWORD v19[4];
  id v20;
  id location;

  v8 = a4;
  v9 = a5;
  v10 = -[BSProcessDeathWatcher init](self, "init");
  if (v10)
  {
    v11 = objc_msgSend(v9, "copy");
    deathHandler = v10->_deathHandler;
    v10->_deathHandler = (id)v11;

    v13 = [BSDispatchSource alloc];
    v14 = -[BSDispatchSource initWithType:handle:mask:queue:configureSourceBlock:](v13, MEMORY[0x1E0C80DB0], a3, 0x80000000uLL, v8, 0);
    source = v10->_source;
    v10->_source = (BSDispatchSource *)v14;

    objc_initWeak(&location, v10);
    v16 = v10->_source;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __56__BSProcessDeathWatcher_initWithPID_queue_deathHandler___block_invoke;
    v19[3] = &unk_1E1EBF4D8;
    objc_copyWeak(&v20, &location);
    if (v16)
      objc_setProperty_nonatomic_copy(v16, v17, v19, 32);
    -[BSDispatchSource resume]((uint64_t)v10->_source);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deathHandler, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

void __56__BSProcessDeathWatcher_initWithPID_queue_deathHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v3 = *((_QWORD *)WeakRetained + 2);
    if (v3)
    {
      (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v2);
      v4 = (void *)v5[2];
      v5[2] = 0;

      v2 = v5;
    }
  }
  objc_msgSend(v2, "invalidate");

}

@end
