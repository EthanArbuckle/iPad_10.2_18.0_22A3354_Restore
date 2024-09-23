@implementation CUOSStateHandler

- (CUOSStateHandler)initWithTitle:(id)a3 dispatchQueue:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  id v11;
  CUOSStateHandler *v12;
  void *v13;
  id handler;
  CUOSStateHandler *v15;
  id v17;
  id location;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CUOSStateHandler;
  v12 = -[CUOSStateHandler init](&v19, sel_init);
  if (v12)
  {
    v13 = _Block_copy(v11);
    handler = v12->_handler;
    v12->_handler = v13;

    objc_storeStrong((id *)&v12->_title, a3);
    objc_initWeak(&location, v12);
    objc_copyWeak(&v17, &location);
    v12->_stateHandle = os_state_add_handler();
    v15 = v12;
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v12;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_stateHandle)
  {
    os_state_remove_handler();
    self->_stateHandle = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)CUOSStateHandler;
  -[CUOSStateHandler dealloc](&v3, sel_dealloc);
}

- (void)remove
{
  if (self->_stateHandle)
  {
    os_state_remove_handler();
    self->_stateHandle = 0;
  }
}

- (id)simulate
{
  return (id)(*((uint64_t (**)(void))self->_handler + 2))();
}

- (os_state_data_s)_generateState
{
  void *v3;
  void *v4;
  void *v5;
  size_t v6;
  os_state_data_s *v7;
  os_state_data_s *v8;

  v3 = (void *)MEMORY[0x1E0CB38B0];
  (*((void (**)(void))self->_handler + 2))();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataWithPropertyList:format:options:error:", v4, 100, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_msgSend(v5, "length");
    v7 = (os_state_data_s *)malloc_type_calloc(1uLL, v6 + 200, 0xA9196D56uLL);
    v8 = v7;
    if (v7)
    {
      v7->var0 = 1;
      v7->var1.var1 = v6;
      -[NSString UTF8String](self->_title, "UTF8String");
      __strlcpy_chk();
      memcpy(v8->var4, (const void *)objc_msgSend(objc_retainAutorelease(v5), "bytes"), v6);
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)stateHandle
{
  return self->_stateHandle;
}

- (void)setStateHandle:(unint64_t)a3
{
  self->_stateHandle = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong(&self->_handler, 0);
}

uint64_t __56__CUOSStateHandler_initWithTitle_dispatchQueue_handler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "_generateState");

  return v2;
}

@end
