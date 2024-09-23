@implementation _HFItemUpdateFutureWrapper

- (void)setOutcome:(id)a3
{
  objc_storeStrong((id *)&self->_outcome, a3);
}

- (NAFuture)future
{
  return self->_future;
}

- (HFItem)item
{
  return self->_item;
}

- (BOOL)isInternal
{
  return self->_isInternal;
}

- (HFItemUpdateOutcome)outcome
{
  return self->_outcome;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outcome, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_future, 0);
}

+ (id)wrapperWithFuture:(id)a3 item:(id)a4 isInternal:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id location;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  v9 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v9, "setFuture:", v7);
  objc_msgSend(v9, "setItem:", v8);
  objc_msgSend(v9, "setIsInternal:", v5);
  objc_initWeak(&location, v9);
  objc_msgSend(v9, "future");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64___HFItemUpdateFutureWrapper_wrapperWithFuture_item_isInternal___block_invoke;
  v13[3] = &unk_1EA7346D8;
  objc_copyWeak(&v14, &location);
  v11 = (id)objc_msgSend(v10, "addSuccessBlock:", v13);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v9;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (void)setIsInternal:(BOOL)a3
{
  self->_isInternal = a3;
}

- (void)setFuture:(id)a3
{
  objc_storeStrong((id *)&self->_future, a3);
}

+ (id)futuresFromWrappers:(id)a3
{
  return (id)objc_msgSend(a3, "na_map:", &__block_literal_global_110);
}

@end
