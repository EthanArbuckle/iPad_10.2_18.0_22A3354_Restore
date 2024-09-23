@implementation MPAsyncBlockOperation

- (void).cxx_destruct
{
  objc_storeStrong(&self->_startHandler, 0);
}

- (void)execute
{
  (*((void (**)(void))self->_startHandler + 2))();
}

- (MPAsyncBlockOperation)initWithStartHandler:(id)a3
{
  id v4;
  MPAsyncBlockOperation *v5;
  uint64_t v6;
  id startHandler;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPAsyncBlockOperation;
  v5 = -[MPAsyncOperation init](&v9, sel_init);
  if (v5)
  {
    v6 = MEMORY[0x19403A810](v4);
    startHandler = v5->_startHandler;
    v5->_startHandler = (id)v6;

  }
  return v5;
}

- (id)startHandler
{
  return self->_startHandler;
}

@end
