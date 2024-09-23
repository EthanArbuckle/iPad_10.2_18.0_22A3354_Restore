@implementation CUTAsyncReducerState

- (void)continueWithResult:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void (**v8)(id, id);

  v5 = a3;
  -[CUTAsyncReducerState continueBlock](self, "continueBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CUTAsyncReducer.m"), 123, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.continueBlock"));

  }
  -[CUTAsyncReducerState continueBlock](self, "continueBlock");
  v8 = (void (**)(id, id))objc_claimAutoreleasedReturnValue();
  v8[2](v8, v5);

}

- (void)cancelWithError:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void (**v8)(id, id);

  v5 = a3;
  -[CUTAsyncReducerState cancelBlock](self, "cancelBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CUTAsyncReducer.m"), 128, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.cancelBlock"));

  }
  -[CUTAsyncReducerState cancelBlock](self, "cancelBlock");
  v8 = (void (**)(id, id))objc_claimAutoreleasedReturnValue();
  v8[2](v8, v5);

}

- (void)stopWithResult:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void (**v8)(id, id);

  v5 = a3;
  -[CUTAsyncReducerState stopBlock](self, "stopBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CUTAsyncReducer.m"), 133, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.stopBlock"));

  }
  -[CUTAsyncReducerState stopBlock](self, "stopBlock");
  v8 = (void (**)(id, id))objc_claimAutoreleasedReturnValue();
  v8[2](v8, v5);

}

- (NSArray)visitedItems
{
  return self->_visitedItems;
}

- (void)setVisitedItems:(id)a3
{
  objc_storeStrong((id *)&self->_visitedItems, a3);
}

- (NSArray)pendingItems
{
  return self->_pendingItems;
}

- (void)setPendingItems:(id)a3
{
  objc_storeStrong((id *)&self->_pendingItems, a3);
}

- (id)currentItem
{
  return self->_currentItem;
}

- (void)setCurrentItem:(id)a3
{
  objc_storeStrong(&self->_currentItem, a3);
}

- (CUTResult)currentResult
{
  return self->_currentResult;
}

- (void)setCurrentResult:(id)a3
{
  objc_storeStrong((id *)&self->_currentResult, a3);
}

- (id)cancelBlock
{
  return self->_cancelBlock;
}

- (void)setCancelBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)continueBlock
{
  return self->_continueBlock;
}

- (void)setContinueBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)stopBlock
{
  return self->_stopBlock;
}

- (void)setStopBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stopBlock, 0);
  objc_storeStrong(&self->_continueBlock, 0);
  objc_storeStrong(&self->_cancelBlock, 0);
  objc_storeStrong((id *)&self->_currentResult, 0);
  objc_storeStrong(&self->_currentItem, 0);
  objc_storeStrong((id *)&self->_pendingItems, 0);
  objc_storeStrong((id *)&self->_visitedItems, 0);
}

@end
