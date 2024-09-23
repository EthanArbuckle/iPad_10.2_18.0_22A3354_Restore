@implementation OnboardingWelcomeViewController

- (_TtC28HealthExposureNotificationUI31OnboardingWelcomeViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_21CD26CBC();
}

- (void)viewDidLoad
{
  sub_21CD2565C(self, (uint64_t)a2, (const char **)&selRef_viewDidLoad, (void (*)(id))sub_21CD23530);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v4 = v7.receiver;
  -[OnboardingWelcomeViewController viewWillAppear:](&v7, sel_viewWillAppear_, v3);
  v5 = objc_msgSend(v4, sel_navigationController, v7.receiver, v7.super_class);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, sel_setNavigationBarHidden_animated_, 1, v3);

  }
  sub_21CD6F094();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = v5.receiver;
  -[OnboardingWelcomeViewController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
  OnboardingWelcomeViewController.updateForScrollOffsetChange()();

}

- (void)viewDidLayoutSubviews
{
  sub_21CD2565C(self, (uint64_t)a2, (const char **)&selRef_viewDidLayoutSubviews, (void (*)(id))OnboardingWelcomeViewController.updateForScrollOffsetChange());
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = v5.receiver;
  -[OnboardingWelcomeViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, v3);
  sub_21CD6F558();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC28HealthExposureNotificationUI31OnboardingWelcomeViewController *v6;
  _TtC28HealthExposureNotificationUI31OnboardingWelcomeViewController *v7;
  UITraitCollection_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  OnboardingWelcomeViewController.traitCollectionDidChange(_:)(v8);

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC28HealthExposureNotificationUI31OnboardingWelcomeViewController *v5;

  v4 = a3;
  v5 = self;
  OnboardingWelcomeViewController.updateForScrollOffsetChange()();

}

- (void)didTapHowExposureNotificationsWork
{
  id v3;
  _TtC28HealthExposureNotificationUI31OnboardingWelcomeViewController *v4;
  id v5;
  id v6;

  type metadata accessor for OnboardingInfoViewController();
  v3 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v4 = self;
  v5 = objc_msgSend(v3, sel_init);
  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD7A0]), sel_initWithRootViewController_, v5);

  -[OnboardingWelcomeViewController presentViewController:animated:completion:](v4, sel_presentViewController_animated_completion_, v6, 1, 0);
}

- (void)didTapFooterLabel
{
  _TtC28HealthExposureNotificationUI31OnboardingWelcomeViewController *v2;

  v2 = self;
  sub_21CD232B4();

}

- (void)didTapPrimaryButton
{
  uint64_t v2;
  _TtC28HealthExposureNotificationUI31OnboardingWelcomeViewController *v3;

  v2 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC28HealthExposureNotificationUI31OnboardingWelcomeViewController_flow);
  v3 = self;
  sub_21CD2665C(v3, v2);

}

- (void)didTapSecondaryButton
{
  uint64_t v2;
  _TtC28HealthExposureNotificationUI31OnboardingWelcomeViewController *v3;

  v2 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC28HealthExposureNotificationUI31OnboardingWelcomeViewController_flow);
  v3 = self;
  sub_21CD26764(v3, v2);

}

- (void)didTapDone
{
  -[OnboardingWelcomeViewController dismissViewControllerAnimated:completion:](self, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

- (_TtC28HealthExposureNotificationUI31OnboardingWelcomeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC28HealthExposureNotificationUI31OnboardingWelcomeViewController *result;

  v4 = a4;
  result = (_TtC28HealthExposureNotificationUI31OnboardingWelcomeViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI31OnboardingWelcomeViewController_notificationPreview));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI31OnboardingWelcomeViewController_primaryButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI31OnboardingWelcomeViewController_secondaryButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI31OnboardingWelcomeViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI31OnboardingWelcomeViewController_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI31OnboardingWelcomeViewController_howItWorksButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI31OnboardingWelcomeViewController_footerLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI31OnboardingWelcomeViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI31OnboardingWelcomeViewController_scrollViewContentSizeObserver));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI31OnboardingWelcomeViewController_buttonTray));
}

@end
