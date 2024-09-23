@implementation ContactDetailsViewController

- (void)contactViewController:(id)a3 didDeleteContact:(id)a4
{
  void (*v6)(void);
  id v7;
  id v8;
  _TtC9AirDropUI28ContactDetailsViewController *v9;

  v6 = *(void (**)(void))((char *)&self->super.super.super.super.isa
                        + OBJC_IVAR____TtC9AirDropUI28ContactDetailsViewController_dismissHandler);
  v7 = a3;
  v8 = a4;
  v9 = self;
  v6();

}

- (_TtC9AirDropUI28ContactDetailsViewController)initWithCoder:(id)a3
{
  _TtC9AirDropUI28ContactDetailsViewController *result;

  result = (_TtC9AirDropUI28ContactDetailsViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001000F05A0, "AirDropUI/ContactDetailsViewController.swift", 44, 2, 57, 0);
  __break(1u);
  return result;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC9AirDropUI28ContactDetailsViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  _TtC9AirDropUI28ContactDetailsViewController *result;

  result = (_TtC9AirDropUI28ContactDetailsViewController *)_swift_stdlib_reportUnimplementedInitializer("AirDropUI.ContactDetailsViewController", 38, "init(navigationBarClass:toolbarClass:)", 38, 0);
  __break(1u);
  return result;
}

- (_TtC9AirDropUI28ContactDetailsViewController)initWithRootViewController:(id)a3
{
  id v3;
  _TtC9AirDropUI28ContactDetailsViewController *result;

  v3 = a3;
  result = (_TtC9AirDropUI28ContactDetailsViewController *)_swift_stdlib_reportUnimplementedInitializer("AirDropUI.ContactDetailsViewController", 38, "init(rootViewController:)", 25, 0);
  __break(1u);
  return result;
}

- (_TtC9AirDropUI28ContactDetailsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9AirDropUI28ContactDetailsViewController *result;

  v4 = a4;
  result = (_TtC9AirDropUI28ContactDetailsViewController *)_swift_stdlib_reportUnimplementedInitializer("AirDropUI.ContactDetailsViewController", 38, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *(_QWORD *)&self->contactDetails[OBJC_IVAR____TtC9AirDropUI28ContactDetailsViewController_contactDetails];
  v4 = *(_QWORD *)&self->contactDetails[OBJC_IVAR____TtC9AirDropUI28ContactDetailsViewController_contactDetails + 16];
  v5 = *(_QWORD *)&self->contactDetails[OBJC_IVAR____TtC9AirDropUI28ContactDetailsViewController_contactDetails + 32];
  v6 = *(_QWORD *)&self->contactDetails[OBJC_IVAR____TtC9AirDropUI28ContactDetailsViewController_contactDetails + 56];
  v7 = *(_QWORD *)&self->contactDetails[OBJC_IVAR____TtC9AirDropUI28ContactDetailsViewController_contactDetails + 80];
  swift_bridgeObjectRelease(*(_QWORD *)&self->contactDetails[OBJC_IVAR____TtC9AirDropUI28ContactDetailsViewController_contactDetails
                                                           + 40]);
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(v7);
  swift_release(*(_QWORD *)&self->contactDetails[OBJC_IVAR____TtC9AirDropUI28ContactDetailsViewController_dismissHandler]);
}

@end
