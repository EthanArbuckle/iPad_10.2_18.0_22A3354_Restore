@implementation AXSSKeyboardCommandInfo

+ (id)infoWithHandler:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithHandler:downHandler:upHandler:handlesBothDownAndUp:", v4, 0, 0, 0);

  return v5;
}

+ (id)infoWithDownHandler:(id)a3 upHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithHandler:downHandler:upHandler:handlesBothDownAndUp:", 0, v7, v6, 1);

  return v8;
}

- (id)_initWithHandler:(id)a3 downHandler:(id)a4 upHandler:(id)a5 handlesBothDownAndUp:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  AXSSKeyboardCommandInfo *v13;
  uint64_t v14;
  id handler;
  uint64_t v16;
  id downHandler;
  uint64_t v18;
  id upHandler;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)AXSSKeyboardCommandInfo;
  v13 = -[AXSSKeyboardCommandInfo init](&v21, sel_init);
  if (v13)
  {
    v14 = MEMORY[0x1B5DF9920](v10);
    handler = v13->_handler;
    v13->_handler = (id)v14;

    v16 = MEMORY[0x1B5DF9920](v11);
    downHandler = v13->_downHandler;
    v13->_downHandler = (id)v16;

    v18 = MEMORY[0x1B5DF9920](v12);
    upHandler = v13->_upHandler;
    v13->_upHandler = (id)v18;

    v13->_handlesBothDownAndUp = a6;
  }

  return v13;
}

- (BOOL)handlesBothDownAndUp
{
  return self->_handlesBothDownAndUp;
}

- (id)handler
{
  return self->_handler;
}

- (id)downHandler
{
  return self->_downHandler;
}

- (id)upHandler
{
  return self->_upHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_upHandler, 0);
  objc_storeStrong(&self->_downHandler, 0);
  objc_storeStrong(&self->_handler, 0);
}

@end
