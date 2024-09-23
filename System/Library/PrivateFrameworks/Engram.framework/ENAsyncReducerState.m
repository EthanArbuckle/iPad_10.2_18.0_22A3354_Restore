@implementation ENAsyncReducerState

- (void)continueWithResult:(id)a3
{
  id v4;
  void (**v5)(id, id);

  v4 = a3;
  -[ENAsyncReducerState continueBlock](self, "continueBlock");
  v5 = (void (**)(id, id))objc_claimAutoreleasedReturnValue();
  v5[2](v5, v4);

}

- (void)cancelWithError:(id)a3
{
  id v4;
  void (**v5)(id, id);

  v4 = a3;
  -[ENAsyncReducerState cancelBlock](self, "cancelBlock");
  v5 = (void (**)(id, id))objc_claimAutoreleasedReturnValue();
  v5[2](v5, v4);

}

- (void)stopWithResult:(id)a3
{
  id v4;
  void (**v5)(id, id);

  v4 = a3;
  -[ENAsyncReducerState stopBlock](self, "stopBlock");
  v5 = (void (**)(id, id))objc_claimAutoreleasedReturnValue();
  v5[2](v5, v4);

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
