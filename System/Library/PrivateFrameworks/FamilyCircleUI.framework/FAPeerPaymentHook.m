@implementation FAPeerPaymentHook

- (BOOL)shouldMatchElement:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("family:peerPayment"));

  return v4;
}

- (BOOL)shouldMatchModel:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "clientInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE04C48]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("family:peerPayment"));

  return v5;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  id v8;
  id v9;

  v8 = a6;
  objc_msgSend(a3, "attributes");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[FAPeerPaymentHook _handlePeerPaymentActionWithAttributes:completion:](self, "_handlePeerPaymentActionWithAttributes:completion:", v9, v8);

}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "clientInfo");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[FAPeerPaymentHook _handlePeerPaymentActionWithAttributes:completion:](self, "_handlePeerPaymentActionWithAttributes:completion:", v7, v6);

}

- (void)_handlePeerPaymentActionWithAttributes:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  void *v8;
  id WeakRetained;
  void *v10;
  id v11;
  FAAppleCashPresentationHandler *v12;
  NSObject *v13;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("handleInHook"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "presentationContextForHook:", self);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = v10;
      v12 = -[FAAppleCashPresentationHandler initWithNavigationController:]([FAAppleCashPresentationHandler alloc], "initWithNavigationController:", v11);

      -[FAPeerPaymentHook setAppleCashPresentationHandler:](self, "setAppleCashPresentationHandler:", v12);
      -[FAPeerPaymentHook appleCashPresentationHandler](self, "appleCashPresentationHandler");
      v13 = objc_claimAutoreleasedReturnValue();
      -[NSObject presentPeerPaymentControllerWithAttributes:completion:](v13, "presentPeerPaymentControllerWithAttributes:completion:", v6, &__block_literal_global_0);
    }
    else
    {
      _FALogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[FAPeerPaymentHook _handlePeerPaymentActionWithAttributes:completion:].cold.1((uint64_t)v10, v13);
    }

  }
  else
  {
    v7[2](v7, 1, 0);
  }

}

- (RUIServerHookDelegate)delegate
{
  return (RUIServerHookDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (FAAppleCashPresentationHandler)appleCashPresentationHandler
{
  return self->_appleCashPresentationHandler;
}

- (void)setAppleCashPresentationHandler:(id)a3
{
  objc_storeStrong((id *)&self->_appleCashPresentationHandler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleCashPresentationHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_handlePeerPaymentActionWithAttributes:(uint64_t)a1 completion:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  id v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v4 = 138412290;
  v5 = (id)objc_opt_class();
  v3 = v5;
  _os_log_error_impl(&dword_20DE41000, a2, OS_LOG_TYPE_ERROR, "FAPeerPaymentHook - Expected Navigation controller but got %@", (uint8_t *)&v4, 0xCu);

}

@end
