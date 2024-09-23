@implementation ASCAppOfferStateDelegateProxy

- (ASCAppOfferStateDelegateProxy)initWithTarget:(id)a3
{
  id v4;
  ASCAppOfferStateDelegateProxy *v5;
  ASCAppOfferStateDelegateProxy *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ASCAppOfferStateDelegateProxy;
  v5 = -[ASCAppOfferStateDelegateProxy init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_target, v4);

  return v6;
}

- (void)offer:(id)a3 didChangeState:(id)a4 withMetadata:(id)a5 flags:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD block[4];
  id v19;
  id v20;
  id v21;
  id v22;
  int64_t v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[ASCAppOfferStateDelegateProxy target](self, "target");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__ASCAppOfferStateDelegateProxy_offer_didChangeState_withMetadata_flags___block_invoke;
  block[3] = &unk_1E7560550;
  v19 = v13;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = a6;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  v17 = v13;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __73__ASCAppOfferStateDelegateProxy_offer_didChangeState_withMetadata_flags___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "offer:didChangeState:withMetadata:flags:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)offer:(id)a3 didChangeStatusText:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[ASCAppOfferStateDelegateProxy target](self, "target");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__ASCAppOfferStateDelegateProxy_offer_didChangeStatusText___block_invoke;
  block[3] = &unk_1E7560578;
  v13 = v8;
  v14 = v6;
  v15 = v7;
  v9 = v7;
  v10 = v6;
  v11 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __59__ASCAppOfferStateDelegateProxy_offer_didChangeStatusText___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "offer:didChangeStatusText:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (ASCAppOfferStateDelegate)target
{
  return (ASCAppOfferStateDelegate *)objc_loadWeakRetained((id *)&self->_target);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_target);
}

@end
