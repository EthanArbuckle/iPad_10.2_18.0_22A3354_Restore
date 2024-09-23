@implementation OfflineStatusBannerViewController

- (_TtC7NewsUI233OfflineStatusBannerViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D68904C8();
}

- (void)viewDidLoad
{
  _TtC7NewsUI233OfflineStatusBannerViewController *v2;

  v2 = self;
  sub_1D688F958();

}

- (void)viewDidLayoutSubviews
{
  _TtC7NewsUI233OfflineStatusBannerViewController *v2;

  v2 = self;
  sub_1D688FBE8();

}

- (void)triggerForceReloadFeeds
{
  _TtC7NewsUI233OfflineStatusBannerViewController *v2;

  v2 = self;
  sub_1D688FF88();

}

- (void)alertForSetUpOfflineMode
{
  _TtC7NewsUI233OfflineStatusBannerViewController *v2;

  v2 = self;
  sub_1D68901B8();

}

- (_TtC7NewsUI233OfflineStatusBannerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC7NewsUI233OfflineStatusBannerViewController *result;

  v4 = a4;
  result = (_TtC7NewsUI233OfflineStatusBannerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI233OfflineStatusBannerViewController_styler);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI233OfflineStatusBannerViewController_connectionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI233OfflineStatusBannerViewController_secondaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI233OfflineStatusBannerViewController____lazy_storage___forceReloadButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI233OfflineStatusBannerViewController____lazy_storage___setupOfflineModeButton));
}

@end
