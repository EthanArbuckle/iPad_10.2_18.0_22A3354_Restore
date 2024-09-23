@implementation _GEOURLManifestListenerCallbackWithQueue

- (void)performHandler:(BOOL)a3
{
  void *v4;
  NSObject *queue;
  id v6;
  void *v7;
  void *v8;

  if (self->_queue)
  {
    v4 = (void *)objc_msgSend(self->_handler, "copy");
    queue = self->_queue;
    v8 = v4;
    v6 = v4;
    v7 = (void *)dispatch_block_create_with_voucher_and_qos_class();
    dispatch_async(queue, v7);

  }
  else
  {
    (*((void (**)(void))self->_handler + 2))();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voucher, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_handler, 0);
}

- (_GEOURLManifestListenerCallbackWithQueue)initWithQueue:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  _GEOURLManifestListenerCallbackWithQueue *v9;
  uint64_t v10;
  id handler;
  uint64_t v12;
  OS_voucher *voucher;
  _GEOURLManifestListenerCallbackWithQueue *v14;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    v16.receiver = self;
    v16.super_class = (Class)_GEOURLManifestListenerCallbackWithQueue;
    v9 = -[_GEOURLManifestListenerCallbackWithQueue init](&v16, sel_init);
    if (v9)
    {
      v10 = objc_msgSend(v8, "copy");
      handler = v9->_handler;
      v9->_handler = (id)v10;

      objc_storeStrong((id *)&v9->_queue, a3);
      v12 = voucher_copy();
      voucher = v9->_voucher;
      v9->_voucher = (OS_voucher *)v12;

      v9->_qos = qos_class_self();
    }
    self = v9;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end
