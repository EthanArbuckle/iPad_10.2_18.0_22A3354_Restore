@implementation MPNotificationObserver

- (void)dealloc
{
  void *v3;
  NSString *name;
  id WeakRetained;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  WeakRetained = objc_loadWeakRetained(&self->_object);
  objc_msgSend(v3, "removeObserver:name:object:", self, name, WeakRetained);

  v6.receiver = self;
  v6.super_class = (Class)MPNotificationObserver;
  -[MPNotificationObserver dealloc](&v6, sel_dealloc);
}

- (MPNotificationObserver)initWithName:(id)a3 object:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  MPNotificationObserver *v11;
  uint64_t v12;
  NSString *name;
  uint64_t v14;
  id handler;
  void *v16;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)MPNotificationObserver;
  v11 = -[MPNotificationObserver init](&v18, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    name = v11->_name;
    v11->_name = (NSString *)v12;

    objc_storeWeak(&v11->_object, v9);
    v14 = objc_msgSend(v10, "copy");
    handler = v11->_handler;
    v11->_handler = (id)v14;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v11, sel__handleNotification_, v8, v9);

  }
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_destroyWeak(&self->_object);
  objc_storeStrong((id *)&self->_name, 0);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p %@ handlerCallCount=%ld>"), objc_opt_class(), self, self->_name, self->_handlerCallCount);
}

- (void)_handleNotification:(id)a3
{
  ++self->_handlerCallCount;
  (*((void (**)(void))self->_handler + 2))();
}

- (NSString)name
{
  return self->_name;
}

- (id)object
{
  return objc_loadWeakRetained(&self->_object);
}

- (id)handler
{
  return self->_handler;
}

@end
