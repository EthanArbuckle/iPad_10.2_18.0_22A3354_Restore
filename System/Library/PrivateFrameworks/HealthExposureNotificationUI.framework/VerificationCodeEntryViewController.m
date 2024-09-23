@implementation VerificationCodeEntryViewController

- (_TtC28HealthExposureNotificationUI35VerificationCodeEntryViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_21CD499FC();
}

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC28HealthExposureNotificationUI35VerificationCodeEntryViewController *v5;
  id v6;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (void *)objc_opt_self();
  v5 = self;
  v6 = objc_msgSend(v4, sel_defaultCenter);
  objc_msgSend(v6, sel_removeObserver_, v5);

  v7.receiver = v5;
  v7.super_class = ObjectType;
  -[VerificationCodeEntryViewController dealloc](&v7, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI35VerificationCodeEntryViewController_healthAgencyModel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI35VerificationCodeEntryViewController_statusView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI35VerificationCodeEntryViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI35VerificationCodeEntryViewController_entryView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI35VerificationCodeEntryViewController_contentLayoutGuideBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI35VerificationCodeEntryViewController_itemStackTopConstraint));
}

- (void)viewDidLoad
{
  _TtC28HealthExposureNotificationUI35VerificationCodeEntryViewController *v2;

  v2 = self;
  VerificationCodeEntryViewController.viewDidLoad()();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v4 = (char *)v6.receiver;
  -[VerificationCodeEntryViewController viewWillAppear:](&v6, sel_viewWillAppear_, v3);
  v5 = *(void **)&v4[OBJC_IVAR____TtC28HealthExposureNotificationUI35VerificationCodeEntryViewController_entryView];
  if (v5)
    objc_msgSend(v5, sel_becomeFirstResponder, v6.receiver, v6.super_class);

}

- (void)viewSafeAreaInsetsDidChange
{
  _TtC28HealthExposureNotificationUI35VerificationCodeEntryViewController *v2;

  v2 = self;
  VerificationCodeEntryViewController.viewSafeAreaInsetsDidChange()();

}

- (void)keyboardWillChangeFrame:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC28HealthExposureNotificationUI35VerificationCodeEntryViewController *v8;
  uint64_t v9;

  v4 = sub_21CD76208();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21CD761F0();
  v8 = self;
  sub_21CD462FC();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)didTapHelpButton
{
  _TtC28HealthExposureNotificationUI35VerificationCodeEntryViewController *v2;

  v2 = self;
  sub_21CD465F0();

}

- (void)didTapCancel
{
  _TtC28HealthExposureNotificationUI35VerificationCodeEntryViewController *v2;

  v2 = self;
  sub_21CD0F290(v2);

}

- (_TtC28HealthExposureNotificationUI35VerificationCodeEntryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC28HealthExposureNotificationUI35VerificationCodeEntryViewController *result;

  v4 = a4;
  result = (_TtC28HealthExposureNotificationUI35VerificationCodeEntryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
