@implementation OnboardingInfoViewController

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[OnboardingInfoViewController viewDidLoad](&v3, sel_viewDidLoad);
  sub_21CD215A4();

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = (char *)v5.receiver;
  -[OnboardingInfoViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, v3);
  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC28HealthExposureNotificationUI28OnboardingInfoViewController_scrollView], sel_setContentOffset_animated_, 0, 0.0, 0.0, v5.receiver, v5.super_class);

}

- (_TtC28HealthExposureNotificationUI28OnboardingInfoViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  objc_class *ObjectType;
  void *v8;
  uint64_t v9;
  id v10;
  _TtC28HealthExposureNotificationUI28OnboardingInfoViewController *v11;
  id v12;
  void *v13;
  _TtC28HealthExposureNotificationUI28OnboardingInfoViewController *v14;
  objc_super v16;

  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    sub_21CD765B0();
    a3 = v8;
  }
  v9 = OBJC_IVAR____TtC28HealthExposureNotificationUI28OnboardingInfoViewController_scrollView;
  v10 = objc_allocWithZone(MEMORY[0x24BEBD918]);
  v11 = self;
  v12 = a4;
  *(Class *)((char *)&self->super.super.super.isa + v9) = (Class)objc_msgSend(v10, sel_init);

  if (a3)
  {
    v13 = (void *)sub_21CD7658C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v13 = 0;
  }
  v16.receiver = v11;
  v16.super_class = ObjectType;
  v14 = -[OnboardingInfoViewController initWithNibName:bundle:](&v16, sel_initWithNibName_bundle_, v13, v12);

  return v14;
}

- (_TtC28HealthExposureNotificationUI28OnboardingInfoViewController)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  uint64_t v6;
  id v7;
  id v8;
  _TtC28HealthExposureNotificationUI28OnboardingInfoViewController *v9;
  _TtC28HealthExposureNotificationUI28OnboardingInfoViewController *v10;
  objc_super v12;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = OBJC_IVAR____TtC28HealthExposureNotificationUI28OnboardingInfoViewController_scrollView;
  v7 = objc_allocWithZone(MEMORY[0x24BEBD918]);
  v8 = a3;
  v9 = self;
  *(Class *)((char *)&self->super.super.super.isa + v6) = (Class)objc_msgSend(v7, sel_init);

  v12.receiver = v9;
  v12.super_class = ObjectType;
  v10 = -[OnboardingInfoViewController initWithCoder:](&v12, sel_initWithCoder_, v8);

  return v10;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI28OnboardingInfoViewController_scrollView));
}

- (void)didTapDone
{
  -[OnboardingInfoViewController dismissViewControllerAnimated:completion:](self, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

@end
