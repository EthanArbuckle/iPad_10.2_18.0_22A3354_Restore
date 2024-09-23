@implementation EnhancedLoggingConsentViewController

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v5;
  _TtC11Diagnostics36EnhancedLoggingConsentViewController *v6;
  DARootViewController *v7;
  DARootViewController *v8;
  NSString v9;
  SEL v10;
  id v11;
  int v12;
  id v13;
  id v14;
  id v15;
  id v16;

  if (a4 == 1)
  {
    v5 = a3;
    v6 = self;
    sub_10003FFA0(0, 0, (uint64_t)&_swiftEmptyArrayStorage, 0xD00000000000001CLL, (void *)0x8000000100114120);
    v8 = v7;

    v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v8, v10, v11, v12, v13, v14, v15, v16);
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (_TtC11Diagnostics36EnhancedLoggingConsentViewController)init
{
  return (_TtC11Diagnostics36EnhancedLoggingConsentViewController *)sub_10005AD88();
}

- (_TtC11Diagnostics36EnhancedLoggingConsentViewController)initWithCoder:(id)a3
{
  return (_TtC11Diagnostics36EnhancedLoggingConsentViewController *)sub_10005AEFC(a3);
}

- (void).cxx_destruct
{
  SEL v3;
  id v4;
  int v5;
  id v6;
  id v7;
  id v8;
  id v9;
  SEL v10;
  id v11;
  int v12;
  id v13;
  id v14;
  id v15;
  id v16;
  SEL v17;
  id v18;
  int v19;
  id v20;
  id v21;
  id v22;
  id v23;

  sub_100036FA0((uint64_t)self + OBJC_IVAR____TtC11Diagnostics36EnhancedLoggingConsentViewController_delegate, &qword_10016BCA0);
  swift_bridgeObjectRelease(*(DARootViewController **)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC11Diagnostics36EnhancedLoggingConsentViewController_bundleQueue), v3, v4, v5, v6, v7, v8, v9);
  swift_bridgeObjectRelease(*(DARootViewController **)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC11Diagnostics36EnhancedLoggingConsentViewController_typeQueue), v10, v11, v12, v13, v14, v15, v16);
  swift_bridgeObjectRelease(*(DARootViewController **)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC11Diagnostics36EnhancedLoggingConsentViewController_consentHandles), v17, v18, v19, v20, v21, v22, v23);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics36EnhancedLoggingConsentViewController_diagnosticsTable));
}

@end
