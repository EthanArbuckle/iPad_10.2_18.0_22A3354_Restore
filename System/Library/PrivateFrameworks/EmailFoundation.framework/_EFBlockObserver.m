@implementation _EFBlockObserver

- (_EFBlockObserver)initWithResultBlock:(id)a3 completionBlock:(id)a4 failureBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  _EFBlockObserver *v11;
  void *v12;
  id resultBlock;
  void *v14;
  id completionBlock;
  void *v16;
  id failureBlock;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_EFBlockObserver;
  v11 = -[_EFBlockObserver init](&v19, sel_init);
  if (v11)
  {
    v12 = _Block_copy(v8);
    resultBlock = v11->_resultBlock;
    v11->_resultBlock = v12;

    v14 = _Block_copy(v9);
    completionBlock = v11->_completionBlock;
    v11->_completionBlock = v14;

    v16 = _Block_copy(v10);
    failureBlock = v11->_failureBlock;
    v11->_failureBlock = v16;

  }
  return v11;
}

- (void)observerDidComplete
{
  void (**completionBlock)(void);

  completionBlock = (void (**)(void))self->_completionBlock;
  if (completionBlock)
    completionBlock[2]();
}

- (void)observerDidReceiveResult:(id)a3
{
  void (**resultBlock)(id, id);
  id v5;

  v5 = a3;
  resultBlock = (void (**)(id, id))self->_resultBlock;
  if (resultBlock)
    resultBlock[2](resultBlock, v5);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_failureBlock, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_resultBlock, 0);
}

- (void)observerDidFailWithError:(id)a3
{
  void (**failureBlock)(id, id);
  id v5;

  v5 = a3;
  failureBlock = (void (**)(id, id))self->_failureBlock;
  if (failureBlock)
    failureBlock[2](failureBlock, v5);

}

@end
