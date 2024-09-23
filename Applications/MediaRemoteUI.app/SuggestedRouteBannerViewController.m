@implementation SuggestedRouteBannerViewController

- (void)loadView
{
  _TtC13MediaRemoteUI34SuggestedRouteBannerViewController *v2;
  char *v3;

  v2 = self;
  v3 = sub_100012870();
  -[SuggestedRouteBannerViewController setView:](v2, "setView:", v3);

}

- (void)viewDidLoad
{
  _TtC13MediaRemoteUI34SuggestedRouteBannerViewController *v2;

  v2 = self;
  sub_1000129E0();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC13MediaRemoteUI34SuggestedRouteBannerViewController *v4;

  v4 = self;
  sub_100012D50(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SuggestedRouteBannerViewController(0);
  v4 = v5.receiver;
  -[BannerBaseViewController viewDidAppear:](&v5, "viewDidAppear:", v3);
  v4[OBJC_IVAR____TtC13MediaRemoteUI34SuggestedRouteBannerViewController_isOnScreen] = 1;

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v4;
  uint64_t v5;
  char *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for SuggestedRouteBannerViewController(0);
  v4 = v7.receiver;
  -[BannerBaseViewController viewDidDisappear:](&v7, "viewDidDisappear:", v3);
  v5 = *(_QWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI34SuggestedRouteBannerViewController_userInterfaceStyleTraitChangeRegistration];
  if (v5)
  {
    swift_unknownObjectRetain(*(_QWORD *)&v4[OBJC_IVAR____TtC13MediaRemoteUI34SuggestedRouteBannerViewController_userInterfaceStyleTraitChangeRegistration]);
    v6 = sub_100012870();
    UIView.unregisterForTraitChanges(_:)(v5);
    swift_unknownObjectRelease(v5);

  }
  v4[OBJC_IVAR____TtC13MediaRemoteUI34SuggestedRouteBannerViewController_isOnScreen] = 0;

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BNPresentableContext)presentableContext
{
  return (BNPresentableContext *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC13MediaRemoteUI34SuggestedRouteBannerViewController_presentableContext, a2);
}

- (void)setPresentableContext:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC13MediaRemoteUI34SuggestedRouteBannerViewController_presentableContext, a3);
}

- (BOOL)providesHostedContent
{
  return 1;
}

- (UIEdgeInsets)bannerContentOutsets
{
  _TtC13MediaRemoteUI34SuggestedRouteBannerViewController *v2;
  char *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  UIEdgeInsets result;

  v2 = self;
  v3 = sub_100012870();
  v4 = *(id *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_pillView];

  objc_msgSend(v4, "shadowOutsets");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (_TtC13MediaRemoteUI34SuggestedRouteBannerViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1000133F4();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC13MediaRemoteUI34SuggestedRouteBannerViewController_cancellables));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC13MediaRemoteUI34SuggestedRouteBannerViewController_userInterfaceStyleTraitChangeRegistration));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI34SuggestedRouteBannerViewController____lazy_storage___bannerView));
  sub_1000082F0((uint64_t)self + OBJC_IVAR____TtC13MediaRemoteUI34SuggestedRouteBannerViewController_presentableContext);
}

@end
