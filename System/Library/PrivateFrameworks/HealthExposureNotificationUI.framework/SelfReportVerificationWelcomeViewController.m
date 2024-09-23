@implementation SelfReportVerificationWelcomeViewController

- (_TtC28HealthExposureNotificationUI43SelfReportVerificationWelcomeViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_21CD0FA90();
}

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SelfReportVerificationWelcomeViewController();
  v2 = v3.receiver;
  -[SelfReportVerificationWelcomeViewController viewDidLoad](&v3, sel_viewDidLoad);
  sub_21CD0D634();

}

- (void)viewWillAppear:(BOOL)a3
{
  sub_21CD0D1B0(self, 0.0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  sub_21CD0D1B0(self, 1.0);
}

- (void)viewWillLayoutSubviews
{
  _TtC28HealthExposureNotificationUI43SelfReportVerificationWelcomeViewController *v2;
  id v3;
  void *v4;
  id v5;
  id v6;

  v2 = self;
  v3 = -[SelfReportVerificationWelcomeViewController view](v2, sel_view);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, sel_setLayoutMargins_, 0.0, 24.0, 0.0, 24.0);

    v5 = -[SelfReportVerificationWelcomeViewController view](v2, sel_view);
    if (v5)
    {
      v6 = v5;
      objc_msgSend(v5, sel_layoutMarginsDidChange);

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

- (void)viewDidLayoutSubviews
{
  _TtC28HealthExposureNotificationUI43SelfReportVerificationWelcomeViewController *v2;

  v2 = self;
  sub_21CD0D2E8();

}

- (_TtC28HealthExposureNotificationUI43SelfReportVerificationWelcomeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC28HealthExposureNotificationUI43SelfReportVerificationWelcomeViewController *result;

  v4 = a4;
  result = (_TtC28HealthExposureNotificationUI43SelfReportVerificationWelcomeViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI43SelfReportVerificationWelcomeViewController_healthAgencyModel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI43SelfReportVerificationWelcomeViewController____lazy_storage___contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI43SelfReportVerificationWelcomeViewController____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI43SelfReportVerificationWelcomeViewController____lazy_storage___authorityTextView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI43SelfReportVerificationWelcomeViewController____lazy_storage___footerView));
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  _TtC28HealthExposureNotificationUI43SelfReportVerificationWelcomeViewController *v8;

  v4 = a3;
  v8 = self;
  sub_21CD0D4D4();
  v5 = objc_msgSend(v4, sel_panGestureRecognizer);
  objc_msgSend(v5, sel_velocityInView_, v4);
  v7 = v6;

  sub_21CD0E770(fabs(v7) < 300.0);
}

@end
