@implementation CDPUIDeviceToDeviceEncryptionMessagingViewModel

- (CDPUIDeviceToDeviceEncryptionMessagingViewModel)initWithContext:(id)a3 is2FA:(BOOL)a4 hasLocalSecret:(BOOL)a5
{
  id v9;
  CDPUIDeviceToDeviceEncryptionMessagingViewModel *v10;
  CDPUIDeviceToDeviceEncryptionMessagingViewModel *v11;

  v9 = a3;
  v10 = -[CDPUIDeviceToDeviceEncryptionMessagingViewModel init](self, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_context, a3);
    v11->_is2FA = a4;
    v11->_hasLocalSecret = a5;
  }

  return v11;
}

- (id)title
{
  return &stru_24C857A78;
}

- (id)message
{
  return &stru_24C857A78;
}

- (id)continueTitle
{
  return &stru_24C857A78;
}

- (id)cancelTitle
{
  return &stru_24C857A78;
}

- (BOOL)is2FA
{
  return self->_is2FA;
}

- (BOOL)hasLocalSecret
{
  return self->_hasLocalSecret;
}

- (CDPUIDeviceToDeviceEncryptionFlowContext)context
{
  return (CDPUIDeviceToDeviceEncryptionFlowContext *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

@end
