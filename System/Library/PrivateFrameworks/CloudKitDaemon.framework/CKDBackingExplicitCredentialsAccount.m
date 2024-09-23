@implementation CKDBackingExplicitCredentialsAccount

- (int64_t)accountType
{
  return 2;
}

- (BOOL)authenticationController:(id)a3 shouldContinueWithAuthenticationResults:(id)a4 error:(id)a5 forContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  CKDBackingExplicitCredentialsAccount *v13;
  id v14;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = self;
  v14 = a5;
  CKDBackingExplicitCredentialsAccount.authenticationController(_:shouldContinueWithAuthenticationResults:error:for:)((uint64_t)v14, a4, (uint64_t)a5);

  return 0;
}

+ (id)explicitCredentialsAccountWithEmail:(id)a3 password:(id)a4 recoveryKey:(id)a5 propertyOverrides:(id)a6 overridesByDataclass:(id)a7
{
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;

  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v12 = v11;
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v15 = v14;
  if (a5)
  {
    v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a5 = v17;
  }
  else
  {
    v16 = 0;
  }
  if (a6)
    a6 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  if (a7)
    a7 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  v18 = (void *)static CKDBackingExplicitCredentialsAccount.explicitCredentialsAccount(withEmail:password:recoveryKey:propertyOverrides:overridesByDataclass:)(v10, v12, v13, v15, v16, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v18;
}

- (BOOL)isDataclassEnabled:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  swift_bridgeObjectRelease();
  return 1;
}

- (void)renewAuthTokenWithOptions:(id)a3 completionHandler:(id)a4
{
  void *v5;
  uint64_t v6;
  CKDBackingExplicitCredentialsAccount *v7;

  v5 = _Block_copy(a4);
  v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v5);
  v7 = self;
  sub_1BE9F7CB0(v6, v7, v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)updateAccountPropertiesAndSaveAccount:(id)a3
{
  void *v4;
  uint64_t v5;
  CKDBackingExplicitCredentialsAccount *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = self;
  v6 = self;
  sub_1BE9BE930((uint64_t)&unk_1EF570B80, v5);
}

- (void)_setOverridesOnVettingContext:(id)a3
{
  id v4;
  CKDBackingExplicitCredentialsAccount *v5;

  v4 = a3;
  v5 = self;
  CKDBackingExplicitCredentialsAccount.setOverrides(on:)(v4);

}

- (ACAccount)ckAccount
{
  CKDBackingExplicitCredentialsAccount *v2;
  id v3;

  v2 = self;
  v3 = CKDBackingExplicitCredentialsAccount.ckAccount.getter();

  return (ACAccount *)v3;
}

- (NSString)password
{
  CKDBackingExplicitCredentialsAccount *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = self;
  CKDBackingExplicitCredentialsAccount.password.getter();
  v4 = v3;
  v6 = v5;

  v7 = (void *)MEMORY[0x1C3B822A0](v4, v6);
  swift_bridgeObjectRelease();
  return (NSString *)v7;
}

- (id)cloudKitAuthTokenWithError:(id *)a3
{
  return sub_1BE9FA8B8(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(void))CKDBackingExplicitCredentialsAccount.cloudKitAuthToken());
}

- (id)iCloudAuthTokenWithError:(id *)a3
{
  return sub_1BE9FA8B8(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(void))CKDBackingExplicitCredentialsAccount.iCloudAuthToken());
}

- (CKDBackingExplicitCredentialsAccount)initWithAppleAccount:(id)a3 hsa2RecoveryKey:(id)a4 hsa2AccountPassword:(id)a5
{
  id v9;
  id v10;
  CKDBackingExplicitCredentialsAccount *v11;
  CKDBackingExplicitCredentialsAccount *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CKDBackingExplicitCredentialsAccount;
  v11 = -[CKDBackingAccount initWithAppleAccount:](&v14, sel_initWithAppleAccount_, a3);
  v12 = v11;
  if (v9 && v11)
  {
    objc_storeStrong((id *)&v11->_hsa2RecoveryKey, a4);
    objc_storeStrong((id *)&v12->_hsa2AccountPassword, a5);
  }

  return v12;
}

- (ACAccount)fakeCKAccount
{
  return (ACAccount *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFakeCKAccount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)hsa2DevicePassword
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setHsa2DevicePassword:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)hsa2RecoveryKey
{
  return self->_hsa2RecoveryKey;
}

- (NSString)hsa2AccountPassword
{
  return self->_hsa2AccountPassword;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hsa2AccountPassword, 0);
  objc_storeStrong((id *)&self->_hsa2RecoveryKey, 0);
  objc_storeStrong((id *)&self->_hsa2DevicePassword, 0);
  objc_storeStrong((id *)&self->_fakeCKAccount, 0);
}

@end
