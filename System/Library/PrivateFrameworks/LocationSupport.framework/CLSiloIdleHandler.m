@implementation CLSiloIdleHandler

- (CLSiloIdleHandler)initWithIdleHandler:(id)a3 onResume:(id)a4
{
  id v6;
  id v7;
  CLSiloIdleHandler *v8;
  CLSiloIdleHandler *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CLSiloIdleHandler;
  v8 = -[CLSiloIdleHandler init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[CLSiloIdleHandler setOnIdle:](v8, "setOnIdle:", v6);
    -[CLSiloIdleHandler setOnResume:](v9, "setOnResume:", v7);
  }

  return v9;
}

- (void)invalidate
{
  -[CLSiloIdleHandler setOnIdle:](self, "setOnIdle:", 0);
  -[CLSiloIdleHandler setOnResume:](self, "setOnResume:", 0);
}

- (id)onIdle
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setOnIdle:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (id)onResume
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setOnResume:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_onResume, 0);
  objc_storeStrong(&self->_onIdle, 0);
}

@end
