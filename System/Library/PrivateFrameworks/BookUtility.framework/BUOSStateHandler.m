@implementation BUOSStateHandler

- (BUOSStateHandler)initWithTitle:(id)a3 queue:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  id v10;
  BUOSStateHandler *v11;
  id v13;
  id v14;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BUOSStateHandler;
  v11 = -[BUOSStateHandler init](&v15, sel_init);
  if (v11)
  {
    v13 = v8;
    v14 = v10;
    v11->_osStateHandle = os_state_add_handler();

  }
  return v11;
}

- (BUOSStateHandler)initWithTitle:(id)a3 block:(id)a4
{
  return (BUOSStateHandler *)MEMORY[0x24BEDD108](self, sel_initWithTitle_queue_block_, a3);
}

- (void)dealloc
{
  objc_super v3;

  if (self->_osStateHandle)
    os_state_remove_handler();
  v3.receiver = self;
  v3.super_class = (Class)BUOSStateHandler;
  -[BUOSStateHandler dealloc](&v3, sel_dealloc);
}

- (unint64_t)osStateHandle
{
  return self->_osStateHandle;
}

- (void)setOsStateHandle:(unint64_t)a3
{
  self->_osStateHandle = a3;
}

@end
