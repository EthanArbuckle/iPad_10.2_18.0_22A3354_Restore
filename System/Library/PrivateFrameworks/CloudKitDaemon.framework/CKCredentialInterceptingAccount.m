@implementation CKCredentialInterceptingAccount

- (BOOL)aa_updateTokensWithProvisioningResponse:(id)a3
{
  id v3;
  id v5;
  _TtC14CloudKitDaemonP33_510E43923520F9C83D223A8087C06B6B31CKCredentialInterceptingAccount *v6;

  v3 = a3;
  v5 = a3;
  v6 = self;
  LOBYTE(v3) = sub_1BE9F5808(v3);

  return v3 & 1;
}

- (_TtC14CloudKitDaemonP33_510E43923520F9C83D223A8087C06B6B31CKCredentialInterceptingAccount)initWithAccountType:(id)a3
{
  id v4;

  v4 = a3;
  return (_TtC14CloudKitDaemonP33_510E43923520F9C83D223A8087C06B6B31CKCredentialInterceptingAccount *)sub_1BE9F5A80(a3, (SEL *)&selRef_initWithAccountType_);
}

- (_TtC14CloudKitDaemonP33_510E43923520F9C83D223A8087C06B6B31CKCredentialInterceptingAccount)initWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  return (_TtC14CloudKitDaemonP33_510E43923520F9C83D223A8087C06B6B31CKCredentialInterceptingAccount *)sub_1BE9F5A80(a3, (SEL *)&selRef_initWithCoder_);
}

- (_TtC14CloudKitDaemonP33_510E43923520F9C83D223A8087C06B6B31CKCredentialInterceptingAccount)initWithManagedAccount:(id)a3
{
  id v4;

  v4 = a3;
  return (_TtC14CloudKitDaemonP33_510E43923520F9C83D223A8087C06B6B31CKCredentialInterceptingAccount *)sub_1BE9F5A80(a3, (SEL *)&selRef_initWithManagedAccount_);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
}

@end
