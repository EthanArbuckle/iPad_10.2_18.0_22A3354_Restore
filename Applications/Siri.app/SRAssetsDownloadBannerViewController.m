@implementation SRAssetsDownloadBannerViewController

- (_TtC4Siri36SRAssetsDownloadBannerViewController)init
{
  _TtC4Siri36SRAssetsDownloadBannerViewController *result;

  sub_10009B4DC();
  return result;
}

- (_TtC4Siri36SRAssetsDownloadBannerViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10009CD0C();
}

- (void)viewDidLoad
{
  _TtC4Siri36SRAssetsDownloadBannerViewController *v2;

  v2 = self;
  sub_10009BAFC();

}

- (void)viewDidLayoutSubviews
{
  void *v2;
  _TtC4Siri36SRAssetsDownloadBannerViewController *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC4Siri36SRAssetsDownloadBannerViewController_pillView);
  v3 = self;
  v14 = v2;
  v4 = -[SRAssetsDownloadBannerViewController view](v3, "view");
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);
  }
  else
  {
    __break(1u);
  }
}

- (void)showBannerFor:(double)a3
{
  _TtC4Siri36SRAssetsDownloadBannerViewController *v4;

  v4 = self;
  sub_10009BCB4(a3);

}

- (void)openSettings:(id)a3
{
  id v4;
  _TtC4Siri36SRAssetsDownloadBannerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10009CEEC();

}

- (void)presentableWillAppearAsBanner:(id)a3
{
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC4Siri36SRAssetsDownloadBannerViewController_isBannerPresent) = 1;
}

- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4
{
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC4Siri36SRAssetsDownloadBannerViewController_isBannerPresent) = 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC4Siri36SRAssetsDownloadBannerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC4Siri36SRAssetsDownloadBannerViewController *result;

  v4 = a4;
  result = (_TtC4Siri36SRAssetsDownloadBannerViewController *)_swift_stdlib_reportUnimplementedInitializer("Siri.SRAssetsDownloadBannerViewController", 41, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->requesterID[OBJC_IVAR____TtC4Siri36SRAssetsDownloadBannerViewController_requesterID]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->requesterID[OBJC_IVAR____TtC4Siri36SRAssetsDownloadBannerViewController_siriSettingsPath]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->requesterID[OBJC_IVAR____TtC4Siri36SRAssetsDownloadBannerViewController_bannerTitle]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->requesterID[OBJC_IVAR____TtC4Siri36SRAssetsDownloadBannerViewController_bannerSubtitle]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->requesterID[OBJC_IVAR____TtC4Siri36SRAssetsDownloadBannerViewController_requestID]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Siri36SRAssetsDownloadBannerViewController_pillView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Siri36SRAssetsDownloadBannerViewController_bannerSource));
}

- (NSString)requestIdentifier
{
  return (NSString *)sub_10009CBD0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC4Siri36SRAssetsDownloadBannerViewController_requestID);
}

- (NSString)requesterIdentifier
{
  return (NSString *)sub_10009CBD0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC4Siri36SRAssetsDownloadBannerViewController_requesterID);
}

- (CGSize)preferredContentSizeWithPresentationSize:(CGSize)a3 containerSize:(CGSize)a4
{
  double v4;
  double v5;
  CGSize result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC4Siri36SRAssetsDownloadBannerViewController_pillView), "systemLayoutSizeFittingSize:", a3.width, a3.height, a4.width, a4.height);
  result.height = v5;
  result.width = v4;
  return result;
}

- (UIEdgeInsets)bannerContentOutsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC4Siri36SRAssetsDownloadBannerViewController_pillView), "shadowOutsets");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

@end
