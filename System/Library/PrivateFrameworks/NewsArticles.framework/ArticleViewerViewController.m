@implementation ArticleViewerViewController

- (void)dealloc
{
  _TtC12NewsArticles27ArticleViewerViewController *v2;

  v2 = self;
  ArticleViewerViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles27ArticleViewerViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles27ArticleViewerViewController_pageViewController));
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles27ArticleViewerViewController_blueprintProvider);
  swift_release();
  swift_release();
  sub_1B9E47D78(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC12NewsArticles27ArticleViewerViewController_prewarm));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles27ArticleViewerViewController_barCompressionManager));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles27ArticleViewerViewController_barCompressionAnimationFactory);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles27ArticleViewerViewController_articleViewerImpressionManager);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles27ArticleViewerViewController_interstitialAdManager);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles27ArticleViewerViewController_featureManager);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  sub_1B9E47D78(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC12NewsArticles27ArticleViewerViewController_onPagePresented));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles27ArticleViewerViewController_shareMenuItemManager);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles27ArticleViewerViewController_featureAvailability);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles27ArticleViewerViewController_offlineManager));
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

- (_TtC12NewsArticles27ArticleViewerViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s12NewsArticles27ArticleViewerViewControllerC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)smartInvertStatusDidChange
{
  _TtC12NewsArticles27ArticleViewerViewController *v2;
  Class isa;
  UITraitCollection_optional v4;

  v2 = self;
  v4.value.super.isa = (Class)-[ArticleViewerViewController traitCollection](v2, sel_traitCollection);
  isa = v4.value.super.isa;
  ArticleViewerViewController.traitCollectionDidChange(_:)(v4);

}

- (_TtC12NewsArticles27ArticleViewerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC12NewsArticles27ArticleViewerViewController *result;

  v4 = a4;
  result = (_TtC12NewsArticles27ArticleViewerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC12NewsArticles27ArticleViewerViewController *v2;

  v2 = self;
  ArticleViewerViewController.viewDidLoad()();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC12NewsArticles27ArticleViewerViewController *v4;

  v4 = self;
  ArticleViewerViewController.viewWillAppear(_:)(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC12NewsArticles27ArticleViewerViewController *v4;

  v4 = self;
  ArticleViewerViewController.viewDidAppear(_:)(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC12NewsArticles27ArticleViewerViewController *v4;

  v4 = self;
  ArticleViewerViewController.viewWillDisappear(_:)(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC12NewsArticles27ArticleViewerViewController *v4;

  v4 = self;
  ArticleViewerViewController.viewDidDisappear(_:)(a3);

}

- (void)viewWillLayoutSubviews
{
  id v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = v4.receiver;
  -[ArticleViewerViewController viewWillLayoutSubviews](&v4, sel_viewWillLayoutSubviews);
  v3 = objc_msgSend((id)objc_opt_self(), sel_currentTraitCollection, v4.receiver, v4.super_class);
  sub_1B9FDAFA0();

}

- (void)viewDidLayoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[ArticleViewerViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  sub_1BA0BB090();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC12NewsArticles27ArticleViewerViewController *v6;
  _TtC12NewsArticles27ArticleViewerViewController *v7;
  UITraitCollection_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  ArticleViewerViewController.traitCollectionDidChange(_:)(v8);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC12NewsArticles27ArticleViewerViewController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  ArticleViewerViewController.viewWillTransition(to:with:)(a4, width, height);
  swift_unknownObjectRelease();

}

- (int64_t)preferredStatusBarStyle
{
  return 0;
}

- (void)tabBarSplitViewWillChangeDisplayModeToDisplayMode:(int64_t)a3
{
  _TtC12NewsArticles27ArticleViewerViewController *v4;

  v4 = self;
  _s12NewsArticles27ArticleViewerViewControllerC011tabBarSplitE21WillChangeDisplayMode2toySo07UISpliteflM0V_tF_0(a3);

}

- (void)enableNavigation:(BOOL)a3
{
  _BOOL4 v3;
  _TtC12NewsArticles27ArticleViewerViewController *v4;

  v3 = a3;
  v4 = self;
  if (v3)
    sub_1B9FCD884();
  sub_1BA0BB444();

}

@end
