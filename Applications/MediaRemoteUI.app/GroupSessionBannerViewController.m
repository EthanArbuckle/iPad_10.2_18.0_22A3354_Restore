@implementation GroupSessionBannerViewController

- (_TtC13MediaRemoteUI32GroupSessionBannerViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1000188F8();
}

- (void)loadView
{
  _TtC13MediaRemoteUI32GroupSessionBannerViewController *v2;
  id v3;

  v2 = self;
  v3 = sub_10001824C();
  -[GroupSessionBannerViewController setView:](v2, "setView:", v3);

}

- (UIEdgeInsets)bannerContentOutsets
{
  _TtC13MediaRemoteUI32GroupSessionBannerViewController *v2;
  id v3;
  double v4;
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
  UIEdgeInsets result;

  v2 = self;
  v3 = sub_10001824C();
  objc_msgSend(v3, "shadowOutsets");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
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
  return (BNPresentableContext *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC13MediaRemoteUI32GroupSessionBannerViewController_presentableContext, a2);
}

- (void)setPresentableContext:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC13MediaRemoteUI32GroupSessionBannerViewController_presentableContext, a3);
}

- (BOOL)providesHostedContent
{
  return 1;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI32GroupSessionBannerViewController____lazy_storage___routeIcon));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI32GroupSessionBannerViewController_trailingIcon));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI32GroupSessionBannerViewController____lazy_storage___titleContentItem));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI32GroupSessionBannerViewController____lazy_storage___pillView));
  sub_1000082F0((uint64_t)self + OBJC_IVAR____TtC13MediaRemoteUI32GroupSessionBannerViewController_presentableContext);
}

@end
