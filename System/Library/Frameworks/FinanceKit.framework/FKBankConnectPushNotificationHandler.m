@implementation FKBankConnectPushNotificationHandler

- (FKBankConnectPushNotificationHandler)init
{
  FKBankConnectPushNotificationHandler *v2;
  uint64_t v3;
  _TtC10FinanceKit34BankConnectPushNotificationHandler *wrappedClass;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FKBankConnectPushNotificationHandler;
  v2 = -[FKBankConnectPushNotificationHandler init](&v6, sel_init);
  if (v2)
  {
    +[BankConnectPushNotificationHandler makeHandler](_TtC10FinanceKit34BankConnectPushNotificationHandler, "makeHandler");
    v3 = objc_claimAutoreleasedReturnValue();
    wrappedClass = v2->_wrappedClass;
    v2->_wrappedClass = (_TtC10FinanceKit34BankConnectPushNotificationHandler *)v3;

  }
  return v2;
}

- (void)handlePushNotificationWithPayload:(id)a3
{
  -[BankConnectPushNotificationHandler handlePushNotificationWithPayload:](self->_wrappedClass, "handlePushNotificationWithPayload:", a3);
}

- (_TtC10FinanceKit34BankConnectPushNotificationHandler)wrappedClass
{
  return self->_wrappedClass;
}

- (void)setWrappedClass:(id)a3
{
  objc_storeStrong((id *)&self->_wrappedClass, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedClass, 0);
}

@end
