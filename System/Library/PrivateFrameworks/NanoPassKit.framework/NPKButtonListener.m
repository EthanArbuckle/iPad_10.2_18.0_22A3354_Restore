@implementation NPKButtonListener

- (NPKButtonListener)initWithHandlerQueue:(id)a3
{
  id v5;
  NPKButtonListener *v6;
  NPKButtonListener *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NPKButtonListener;
  v6 = -[NPKButtonListener init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_handlerQueue, a3);

  return v7;
}

- (void)setButtonHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[NPKButtonListener handlerQueue](self, "handlerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __38__NPKButtonListener_setButtonHandler___block_invoke;
  v7[3] = &unk_24CFE7E90;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __38__NPKButtonListener_setButtonHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

}

- (id)_handlerQueue_buttonHandler
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_handlerQueue);
  return (id)MEMORY[0x2199B6780](self->_buttonHandler);
}

- (id)buttonHandler
{
  return self->_buttonHandler;
}

- (OS_dispatch_queue)handlerQueue
{
  return self->_handlerQueue;
}

- (void)setHandlerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_handlerQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlerQueue, 0);
  objc_storeStrong(&self->_buttonHandler, 0);
}

@end
