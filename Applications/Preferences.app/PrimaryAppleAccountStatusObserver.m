@implementation PrimaryAppleAccountStatusObserver

- (void)dealloc
{
  _TtC11SettingsApp33PrimaryAppleAccountStatusObserver *v2;

  v2 = self;
  sub_1000A6024();
}

- (void).cxx_destruct
{
  sub_100096F68(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC11SettingsApp33PrimaryAppleAccountStatusObserver_accountStatus), *(_QWORD *)&self->accountStatus[OBJC_IVAR____TtC11SettingsApp33PrimaryAppleAccountStatusObserver_accountStatus], *(_QWORD *)&self->accountStatus[OBJC_IVAR____TtC11SettingsApp33PrimaryAppleAccountStatusObserver_accountStatus + 8], *(_QWORD *)&self->accountStatus[OBJC_IVAR____TtC11SettingsApp33PrimaryAppleAccountStatusObserver_accountStatus + 16], *(_QWORD *)&self->accountStatus[OBJC_IVAR____TtC11SettingsApp33PrimaryAppleAccountStatusObserver_accountStatus + 24], *(void **)&self->accountStatus[OBJC_IVAR____TtC11SettingsApp33PrimaryAppleAccountStatusObserver_accountStatus + 32]);
  sub_100005474((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC11SettingsApp33PrimaryAppleAccountStatusObserver_invalidator));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11SettingsApp33PrimaryAppleAccountStatusObserver_accountStore));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC11SettingsApp33PrimaryAppleAccountStatusObserver_updateAccountStatusSubject));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC11SettingsApp33PrimaryAppleAccountStatusObserver_cancellables));
}

- (_TtC11SettingsApp33PrimaryAppleAccountStatusObserver)init
{
  _TtC11SettingsApp33PrimaryAppleAccountStatusObserver *result;

  result = (_TtC11SettingsApp33PrimaryAppleAccountStatusObserver *)_swift_stdlib_reportUnimplementedInitializer("SettingsApp.PrimaryAppleAccountStatusObserver", 45, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void)accountWasAdded:(id)a3
{
  id v4;
  _TtC11SettingsApp33PrimaryAppleAccountStatusObserver *v5;

  v4 = a3;
  v5 = self;
  sub_1000A75C8(0xD000000000000013, 0x80000001001254D0);

}

- (void)accountWasRemoved:(id)a3
{
  id v4;
  _TtC11SettingsApp33PrimaryAppleAccountStatusObserver *v5;

  v4 = a3;
  v5 = self;
  sub_1000A75C8(0xD000000000000015, 0x80000001001254B0);

}

- (void)accountWasModified:(id)a3
{
  id v4;
  _TtC11SettingsApp33PrimaryAppleAccountStatusObserver *v5;

  v4 = a3;
  v5 = self;
  sub_1000A75C8(0xD000000000000016, 0x8000000100125490);

}

@end
