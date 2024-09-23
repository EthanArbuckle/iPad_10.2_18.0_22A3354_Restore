@implementation CTCarrierSpaceClientDelegateProxy

- (void)remoteObjectRespondsToSelector:(SEL)a3 handler:(id)a4
{
  CTCarrierSpaceClientDelegate **p_delegate;
  id v6;
  char v7;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v7 = objc_opt_respondsToSelector();
  (*((void (**)(id, _QWORD))a4 + 2))(v6, v7 & 1);

}

- (void)capabilitiesDidChange:(id)a3
{
  CTCarrierSpaceClientDelegate **p_delegate;
  id v4;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "capabilitiesDidChange:", v4);

}

- (void)userConsentFlowInfoDidChange
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "userConsentFlowInfoDidChange");

}

- (void)usageDidChange
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "usageDidChange");

}

- (void)plansDidChange
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "plansDidChange");

}

- (void)appsDidChange
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "appsDidChange");

}

- (void)dataPlanMetricsDidChange
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "dataPlanMetricsDidChange");

}

- (void)purchasedPlan:(id)a3 didChangeStatus:(int64_t)a4 context:(id)a5
{
  CTCarrierSpaceClientDelegate **p_delegate;
  id v8;
  id v9;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v8 = a5;
  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "purchasedPlan:didChangeStatus:context:", v9, a4, v8);

}

- (CTCarrierSpaceClientDelegate)delegate
{
  return (CTCarrierSpaceClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
