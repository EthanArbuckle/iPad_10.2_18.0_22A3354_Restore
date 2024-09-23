@implementation FKPrivacySettingsController

- (unint64_t)authorizationType
{
  return -[BankConnectPrivacySettingsController authorizationType](self->_wrappedController, "authorizationType");
}

- (FKPrivacySettingsController)initWithBundleIdentifier:(id)a3
{
  id v4;
  FKPrivacySettingsController *v5;
  _TtC10FinanceKit36BankConnectPrivacySettingsController *v6;
  _TtC10FinanceKit36BankConnectPrivacySettingsController *wrappedController;

  v4 = a3;
  v5 = -[FKPrivacySettingsController init](self, "init");
  if (v5)
  {
    v6 = -[BankConnectPrivacySettingsController initWithBundleID:]([_TtC10FinanceKit36BankConnectPrivacySettingsController alloc], "initWithBundleID:", v4);
    wrappedController = v5->_wrappedController;
    v5->_wrappedController = v6;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedController, 0);
}

@end
