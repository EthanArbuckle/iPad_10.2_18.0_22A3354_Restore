@implementation GTReplayerOperation

- (GTReplayerOperation)initWithRequestID:(unint64_t)a3 withBlock:(id)a4
{
  id v6;
  GTReplayerOperation *v7;
  id v8;
  id block;
  _QWORD v11[4];
  id v12[2];
  id location;
  objc_super v14;

  v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)GTReplayerOperation;
  v7 = -[GTReplayerOperation init](&v14, "init");
  if (v7)
  {
    v8 = objc_retainBlock(v6);
    block = v7->_block;
    v7->_block = v8;

    v7->_uuid = a3;
    GTCoreOperationControl_addOperation(a3);
    objc_initWeak(&location, v7);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = __51__GTReplayerOperation_initWithRequestID_withBlock___block_invoke;
    v11[3] = &unk_7263A0;
    objc_copyWeak(v12, &location);
    v12[1] = (id)a3;
    -[GTReplayerOperation setCompletionBlock:](v7, "setCompletionBlock:", v11);
    objc_destroyWeak(v12);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (GTReplayerOperation)initWithBatch:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  GTReplayerOperation *v8;
  id v9;
  id block;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GTReplayerOperation;
  v8 = -[GTReplayerOperation init](&v12, "init");
  if (v8)
  {
    v9 = objc_retainBlock(v7);
    block = v8->_block;
    v8->_block = v9;

    v8->_uuid = (unint64_t)objc_msgSend(v6, "uuid");
  }

  return v8;
}

- (void)main
{
  GTCoreOperationControl_getOperation(self->_uuid);
  (*((void (**)(void))self->_block + 2))();
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

void __51__GTReplayerOperation_initWithRequestID_withBlock___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  GTCoreOperationControl_removeOperation(*(_QWORD *)(a1 + 40));

}

@end
