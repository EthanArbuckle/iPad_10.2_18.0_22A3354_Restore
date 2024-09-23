@implementation FDAccountNotificationHandler

- (FDAccountNotificationHandler)init
{
  FDAccountNotificationHandler *v2;
  uint64_t v3;
  _TtC13FinanceDaemon26AccountNotificationHandler *wrappedHandler;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FDAccountNotificationHandler;
  v2 = -[FDAccountNotificationHandler init](&v6, sel_init);
  if (v2)
  {
    +[AccountNotificationHandler makeHandler](_TtC13FinanceDaemon26AccountNotificationHandler, "makeHandler");
    v3 = objc_claimAutoreleasedReturnValue();
    wrappedHandler = v2->_wrappedHandler;
    v2->_wrappedHandler = (_TtC13FinanceDaemon26AccountNotificationHandler *)v3;

  }
  return v2;
}

- (void)primaryAppleAccountWasAdded
{
  -[AccountNotificationHandler primaryAppleAccountWasAdded](self->_wrappedHandler, "primaryAppleAccountWasAdded");
}

- (void)primaryAppleAccountWasDeleted
{
  -[AccountNotificationHandler primaryAppleAccountWasDeleted](self->_wrappedHandler, "primaryAppleAccountWasDeleted");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedHandler, 0);
}

@end
