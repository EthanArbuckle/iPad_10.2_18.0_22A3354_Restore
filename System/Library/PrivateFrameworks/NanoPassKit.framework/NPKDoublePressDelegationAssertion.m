@implementation NPKDoublePressDelegationAssertion

- (NPKDoublePressDelegationAssertion)initWithQueue:(id)a3
{
  NPKDoublePressDelegationAssertion *v3;
  NPKDoublePressDelegationAssertion *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NPKDoublePressDelegationAssertion;
  v3 = -[NPKTransientAssertion initWithQueue:](&v6, sel_initWithQueue_, a3);
  v4 = v3;
  if (v3)
    -[NPKDoublePressDelegationAssertion _resyncState](v3, "_resyncState");
  return v4;
}

- (void)handleDelegatedDoublePressEventWithSource:(unint64_t)a3
{
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  pk_General_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_General_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Double-press delegation assertion: received delegated event", v9, 2u);
    }

  }
  -[NPKDoublePressDelegationAssertion delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doublePressDelegationAssertionDidReceiveDelegatedDoublePressEvent:authIntentSource:", self, a3);

}

- (void)handleTerminalAuthenticationRequestedForPassWithUniqueID:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  v4 = a3;
  pk_General_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_General_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Double-press delegation assertion: received terminal authentication request event", v9, 2u);
    }

  }
  -[NPKDoublePressDelegationAssertion delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doublePressDelegationAssertion:didReceiveTerminalAuthenticationRequestForPassWithUniqueID:", self, v4);

}

- (void)_resyncState
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  pk_General_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_General_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Double-press delegation assertion: resyncing state", v7, 2u);
    }

  }
  -[NPKTransientAssertion _remoteObjectProxy](self, "_remoteObjectProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDoublePressDelegationRequested:", 1);

}

- (NPKDoublePressDelegationAssertionDelegate)delegate
{
  return (NPKDoublePressDelegationAssertionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
