@implementation _MRTelevisionControllerBlockCallback

- (_MRTelevisionControllerBlockCallback)initWithCallbackBlock:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  _MRTelevisionControllerBlockCallback *v9;
  uint64_t v10;
  id callbackBlock;
  void *v13;
  void *v14;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_MRTelevisionControllerBlockCallback;
  v9 = -[_MRTelevisionControllerBlockCallback init](&v15, sel_init);
  if (v9)
  {
    if (v7)
    {
      if (v8)
      {
LABEL_4:
        v10 = objc_msgSend(v7, "copy");
        callbackBlock = v9->_callbackBlock;
        v9->_callbackBlock = (id)v10;

        objc_storeStrong((id *)&v9->_queue, a4);
        goto LABEL_5;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("MRTelevisionController.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("callback"));

      if (v8)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("MRTelevisionController.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));

    goto LABEL_4;
  }
LABEL_5:

  return v9;
}

- (id)callbackBlock
{
  return self->_callbackBlock;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_callbackBlock, 0);
}

@end
