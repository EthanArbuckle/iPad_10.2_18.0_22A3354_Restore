@implementation _GCDisposable

- (_GCDisposable)initWithCleanupHandler:(id)a3
{
  id v3;
  _GCDisposable *v4;
  uint64_t v5;
  id handler;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_GCDisposable;
  v3 = a3;
  v4 = -[_GCDisposable init](&v8, sel_init);
  v5 = objc_msgSend(v3, "copy", v8.receiver, v8.super_class);

  handler = v4->_handler;
  v4->_handler = (id)v5;

  return v4;
}

- (void)dealloc
{
  void (**handler)(id, SEL);
  id v4;
  objc_super v5;

  handler = (void (**)(id, SEL))self->_handler;
  if (handler)
  {
    handler[2](handler, a2);
    v4 = self->_handler;
    self->_handler = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)_GCDisposable;
  -[_GCDisposable dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
}

@end
