@implementation ProfileConnectionObserver

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC11SettingsAppP33_5FB2359AD06CCCE7342948B91F0D3AB525ProfileConnectionObserver *v5;
  id v6;
  void *v7;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v4 = (void *)objc_opt_self(MCProfileConnection);
  v5 = self;
  v6 = objc_msgSend(v4, "sharedConnection");
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, "unregisterObserver:", v5);

    v8.receiver = v5;
    v8.super_class = ObjectType;
    -[ProfileConnectionObserver dealloc](&v8, "dealloc");
  }
  else
  {
    __break(1u);
  }
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self
     + OBJC_IVAR____TtC11SettingsAppP33_5FB2359AD06CCCE7342948B91F0D3AB525ProfileConnectionObserver_continuation;
  v3 = sub_100004FC8((uint64_t *)&unk_10015B9F0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

- (void)profileConnectionDidReceiveRestrictionChangedNotification:(id)a3 userInfo:(id)a4
{
  sub_1000C5098(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t)&unk_10014CF90, (uint64_t)sub_1000C5D94, (uint64_t)&unk_10014CFA8);
}

- (void)profileConnectionDidReceivePasscodeChangedNotification:(id)a3 userInfo:(id)a4
{
  sub_1000C5098(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t)&unk_10014CF40, (uint64_t)sub_1000C5D5C, (uint64_t)&unk_10014CF58);
}

- (void)profileConnectionDidReceivePasscodePolicyChangedNotification:(id)a3 userInfo:(id)a4
{
  sub_1000C5098(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t)&unk_10014CEF0, (uint64_t)sub_1000C5D50, (uint64_t)&unk_10014CF08);
}

- (void)profileConnectionDidReceiveProfileListChangedNotification:(id)a3 userInfo:(id)a4
{
  sub_1000C5098(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t)&unk_10014CEA0, (uint64_t)sub_1000C5D44, (uint64_t)&unk_10014CEB8);
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  sub_1000C5098(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t)&unk_10014CE50, (uint64_t)sub_1000C5D38, (uint64_t)&unk_10014CE68);
}

- (void)profileConnectionDidReceiveDefaultsChangedNotification:(id)a3 userInfo:(id)a4
{
  sub_1000C5098(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t)&unk_10014CE00, (uint64_t)sub_1000C5D2C, (uint64_t)&unk_10014CE18);
}

- (void)profileConnectionDidReceiveAppWhitelistChangedNotification:(id)a3 userInfo:(id)a4
{
  sub_1000C5098(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t)&unk_10014CDB0, (uint64_t)sub_1000C5D20, (uint64_t)&unk_10014CDC8);
}

- (_TtC11SettingsAppP33_5FB2359AD06CCCE7342948B91F0D3AB525ProfileConnectionObserver)init
{
  _TtC11SettingsAppP33_5FB2359AD06CCCE7342948B91F0D3AB525ProfileConnectionObserver *result;

  result = (_TtC11SettingsAppP33_5FB2359AD06CCCE7342948B91F0D3AB525ProfileConnectionObserver *)_swift_stdlib_reportUnimplementedInitializer("SettingsApp.ProfileConnectionObserver", 37, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
