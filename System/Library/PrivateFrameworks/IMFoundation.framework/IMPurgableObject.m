@implementation IMPurgableObject

- (IMPurgableObject)initWithSetupBlock:(id)a3 cleanupBlock:(id)a4 queue:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  IMPurgableObject *v14;
  uint64_t v15;
  id cleanupBlock;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id setupBlock;
  objc_super v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)IMPurgableObject;
  v14 = -[IMPurgableObject init](&v23, sel_init);
  if (v14)
  {
    v15 = objc_msgSend_copy(v9, v11, v12, v13);
    cleanupBlock = v14->_cleanupBlock;
    v14->_cleanupBlock = (id)v15;

    v20 = objc_msgSend_copy(v8, v17, v18, v19);
    setupBlock = v14->_setupBlock;
    v14->_setupBlock = (id)v20;

    if (v10)
      objc_storeStrong((id *)&v14->_queue, a5);
  }

  return v14;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  objc_super v5;

  objc_msgSend__cleanupInstance(self, a2, v2, v3);
  v5.receiver = self;
  v5.super_class = (Class)IMPurgableObject;
  -[IMPurgableObject dealloc](&v5, sel_dealloc);
}

- (void)_setupInstance
{
  void (**setupBlock)(id, SEL);
  void *v4;
  id instanceObject;

  if (!self->_instanceObject)
  {
    setupBlock = (void (**)(id, SEL))self->_setupBlock;
    if (setupBlock)
    {
      setupBlock[2](setupBlock, a2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      instanceObject = self->_instanceObject;
      self->_instanceObject = v4;

    }
  }
}

- (void)_cleanupInstance
{
  NSObject *queue;
  id instanceObject;
  _QWORD v5[5];
  _QWORD block[5];

  if (self->_instanceObject)
  {
    if (self->_cleanupBlock)
    {
      queue = self->_queue;
      if (queue)
      {
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = sub_1906B04F4;
        block[3] = &unk_1E2C44580;
        block[4] = self;
        dispatch_sync(queue, block);
      }
      else
      {
        v5[0] = MEMORY[0x1E0C809B0];
        v5[1] = 3221225472;
        v5[2] = sub_1906B0508;
        v5[3] = &unk_1E2C44580;
        v5[4] = self;
        dispatch_async(MEMORY[0x1E0C80D38], v5);
      }
    }
    instanceObject = self->_instanceObject;
    self->_instanceObject = 0;

  }
}

- (id)instance
{
  uint64_t v2;
  uint64_t v3;

  objc_msgSend__setupInstance(self, a2, v2, v3);
  return self->_instanceObject;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_cleanupBlock, 0);
  objc_storeStrong(&self->_setupBlock, 0);
  objc_storeStrong(&self->_instanceObject, 0);
}

@end
