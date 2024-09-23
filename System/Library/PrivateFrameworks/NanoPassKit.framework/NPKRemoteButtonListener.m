@implementation NPKRemoteButtonListener

- (NPKRemoteButtonListener)init
{
  NSObject *v3;
  OS_dispatch_queue *v4;
  OS_dispatch_queue *internalQueue;
  OS_dispatch_queue *v6;
  NPKRemoteButtonListener *v7;
  NPKRemoteButtonListener *v8;
  objc_super v10;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (OS_dispatch_queue *)dispatch_queue_create("NPKRemoteButtonListener", v3);
  internalQueue = self->_internalQueue;
  self->_internalQueue = v4;

  v6 = self->_internalQueue;
  v10.receiver = self;
  v10.super_class = (Class)NPKRemoteButtonListener;
  v7 = -[NPKButtonListener initWithHandlerQueue:](&v10, sel_initWithHandlerQueue_, v6);
  v8 = v7;
  if (v7)
    -[NPKRemoteButtonListener setEnabled:](v7, "setEnabled:", 1);

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[NPKTransientAssertion invalidate](self->_delegationAssertion, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)NPKRemoteButtonListener;
  -[NPKRemoteButtonListener dealloc](&v3, sel_dealloc);
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  const __CFString *v8;
  NPKDoublePressDelegationAssertion *v9;
  NPKDoublePressDelegationAssertion *delegationAssertion;
  NPKDoublePressDelegationAssertion *v11;
  int v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (self->_enabled != a3)
  {
    v3 = a3;
    self->_enabled = a3;
    pk_General_log();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      pk_General_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = CFSTR("disable");
        if (v3)
          v8 = CFSTR("enable");
        v12 = 138412290;
        v13 = v8;
        _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Requested to %@ remote button listener.", (uint8_t *)&v12, 0xCu);
      }

    }
    if (v3)
    {
      v9 = -[NPKDoublePressDelegationAssertion initWithQueue:]([NPKDoublePressDelegationAssertion alloc], "initWithQueue:", self->_internalQueue);
      delegationAssertion = self->_delegationAssertion;
      self->_delegationAssertion = v9;

      -[NPKDoublePressDelegationAssertion setDelegate:](self->_delegationAssertion, "setDelegate:", self);
    }
    else
    {
      -[NPKTransientAssertion invalidate](self->_delegationAssertion, "invalidate");
      -[NPKDoublePressDelegationAssertion setDelegate:](self->_delegationAssertion, "setDelegate:", 0);
      v11 = self->_delegationAssertion;
      self->_delegationAssertion = 0;

    }
  }
}

- (void)doublePressDelegationAssertionDidReceiveDelegatedDoublePressEvent:(id)a3 authIntentSource:(unint64_t)a4
{
  NSObject *v6;
  void (**v7)(_QWORD, _QWORD);
  id v8;

  -[NPKButtonListener handlerQueue](self, "handlerQueue", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[NPKButtonListener _handlerQueue_buttonHandler](self, "_handlerQueue_buttonHandler");
  v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = v7;
    v7[2](v7, a4);
    v7 = (void (**)(_QWORD, _QWORD))v8;
  }

}

- (void)doublePressDelegationAssertion:(id)a3 didReceiveTerminalAuthenticationRequestForPassWithUniqueID:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[NPKRemoteButtonListener delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteButtonListener:didReceiveTerminalAuthenticationRequestForPassWithUniqueID:", self, v5);

}

- (BOOL)enabled
{
  return self->_enabled;
}

- (NPKRemoteButtonListenerDelegate)delegate
{
  return (NPKRemoteButtonListenerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NPKDoublePressDelegationAssertion)delegationAssertion
{
  return self->_delegationAssertion;
}

- (void)setDelegationAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_delegationAssertion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegationAssertion, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end
