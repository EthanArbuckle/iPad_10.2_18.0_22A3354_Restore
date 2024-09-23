@implementation CDPLocalDeviceSecretHandler

- (CDPLocalDeviceSecretHandler)initWithContext:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  CDPLocalDeviceSecretHandler *v9;
  CDPLocalDeviceSecretHandler *v10;

  v7 = a3;
  v8 = a4;
  v9 = -[CDPLocalDeviceSecretHandler init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeStrong((id *)&v10->_handlerProxy, a4);
  }

  return v10;
}

- (void)userDidEnterValidSecret:(id)a3 type:(unint64_t)a4
{
  -[CDPLocalDeviceSecretHandlerProtocol userDidEnterValidSecret:type:](self->_handlerProxy, "userDidEnterValidSecret:type:", a3, a4);
}

- (void)userDidCancelWithError:(id)a3
{
  -[CDPLocalDeviceSecretHandlerProtocol userDidCancelWithError:](self->_handlerProxy, "userDidCancelWithError:", a3);
}

- (CDPContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_handlerProxy, 0);
}

@end
