@implementation PasscodeAlertContentViewController

- (_TtC10CoreAuthUI34PasscodeAlertContentViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10002BBF8();
}

- (void)loadView
{
  _TtC10CoreAuthUI34PasscodeAlertContentViewController *v2;

  v2 = self;
  sub_100029EE8();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC10CoreAuthUI34PasscodeAlertContentViewController *v4;

  v4 = self;
  sub_10002A3F4(a3);

}

- (void)verifyPasscode:(id)a3 reply:(id)a4
{
  uint64_t ObjectType;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  _TtC10CoreAuthUI34PasscodeAlertContentViewController *v18;

  ObjectType = swift_getObjectType(self);
  v8 = _Block_copy(a4);
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;
  v12 = swift_allocObject(&unk_10007AB38, 24, 7);
  *(_QWORD *)(v12 + 16) = v8;
  v13 = *(uint64_t *)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_externalizedContext);
  v14 = *(_QWORD *)&self->passcodeController[OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_externalizedContext];
  v15 = *(Class *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_userId);
  v16 = *(uint64_t *)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_policy);
  v17 = *(uint64_t *)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_options);
  v18 = self;
  sub_10002C138(v9, v11, v13, v14, v15, v16, v17, (void (*)(_QWORD))sub_10002BFB8, v12, ObjectType, (uint64_t)&off_10007AAA8);

  swift_bridgeObjectRelease(v11);
  swift_release(v12);
}

- (_TtC10CoreAuthUI34PasscodeAlertContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC10CoreAuthUI34PasscodeAlertContentViewController *result;

  v4 = a4;
  result = (_TtC10CoreAuthUI34PasscodeAlertContentViewController *)_swift_stdlib_reportUnimplementedInitializer("CoreAuthUI.PasscodeAlertContentViewController", 45, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_log;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_passcodeController));
  sub_100028234(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_externalizedContext), *(_QWORD *)&self->passcodeController[OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_externalizedContext]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_userId));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_options));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_backoffCounter));
  sub_10002BE18((uint64_t)self + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_delegate);
}

@end
