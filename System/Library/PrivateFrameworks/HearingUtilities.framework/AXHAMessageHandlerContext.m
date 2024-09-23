@implementation AXHAMessageHandlerContext

- (id)block
{
  return self->_block;
}

- (AXHAMessageHandlerContext)initWithTarget:(id)a3 block:(id)a4
{
  id v7;
  id v8;
  AXHAMessageHandlerContext *v9;
  AXHAMessageHandlerContext *v10;
  uint64_t v11;
  void *block;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AXHAMessageHandlerContext;
  v9 = -[AXHAMessageHandlerContext init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    if (v7 && v8)
    {
      objc_storeStrong(&v9->_target, a3);
      v11 = MEMORY[0x1DF0EB808](v8);
      block = v10->_block;
      v10->_block = (id)v11;
    }
    else
    {
      block = v9;
      v10 = 0;
    }

  }
  return v10;
}

- (id)target
{
  return self->_target;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong(&self->_target, 0);
}

@end
