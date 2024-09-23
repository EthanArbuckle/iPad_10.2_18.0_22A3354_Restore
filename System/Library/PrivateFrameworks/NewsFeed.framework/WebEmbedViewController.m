@implementation WebEmbedViewController

- (_TtC8NewsFeed22WebEmbedViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BAABE6AC();
}

- (void)viewDidLoad
{
  _TtC8NewsFeed22WebEmbedViewController *v2;

  v2 = self;
  WebEmbedViewController.viewDidLoad()();

}

- (void)viewDidLayoutSubviews
{
  _TtC8NewsFeed22WebEmbedViewController *v2;

  v2 = self;
  WebEmbedViewController.viewDidLayoutSubviews()();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC8NewsFeed22WebEmbedViewController *v4;

  v4 = self;
  WebEmbedViewController.viewWillAppear(_:)(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC8NewsFeed22WebEmbedViewController *v4;

  v4 = self;
  WebEmbedViewController.viewDidDisappear(_:)(a3);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _BYTE *v7;
  objc_super v8;

  height = a3.height;
  width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  swift_unknownObjectRetain();
  v7 = v8.receiver;
  -[WebEmbedViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, width, height);
  if (v7[OBJC_IVAR____TtC8NewsFeed22WebEmbedViewController_isResizable] == 1)
    objc_msgSend(*(id *)&v7[OBJC_IVAR____TtC8NewsFeed22WebEmbedViewController_presentationManager], sel_prepareForLegacyResize, v8.receiver, v8.super_class);
  swift_unknownObjectRelease();

}

- (NSArray)accessibilityElements
{
  void *v2;
  _TtC8NewsFeed22WebEmbedViewController *v3;
  id v4;
  void *v5;
  void *v6;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8NewsFeed22WebEmbedViewController_webContentViewController);
  v3 = self;
  v4 = objc_msgSend(v2, sel_accessibilityElements);
  if (v4)
  {
    v5 = v4;
    sub_1BB872DB4();

    v6 = (void *)sub_1BB872D9C();
    swift_bridgeObjectRelease();
  }
  else
  {

    v6 = 0;
  }
  return (NSArray *)v6;
}

- (void)handleTapWithRecognizer:(id)a3
{
  id v4;
  _TtC8NewsFeed22WebEmbedViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1BAABEAB0();

}

- (_TtC8NewsFeed22WebEmbedViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8NewsFeed22WebEmbedViewController *result;

  v4 = a4;
  result = (_TtC8NewsFeed22WebEmbedViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  sub_1BA49EBE0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8NewsFeed22WebEmbedViewController_onSizeInvalidation));
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed22WebEmbedViewController_contentFrameView));
  swift_weakDestroy();
  sub_1BA49EBE0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8NewsFeed22WebEmbedViewController_onEmbedInteraction));

  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed22WebEmbedViewController_preferredContentSizeCategoryOnPopulate));
  sub_1BA4A2E80((uint64_t)self + OBJC_IVAR____TtC8NewsFeed22WebEmbedViewController_embedURL, (uint64_t (*)(_QWORD))sub_1BA6EF3B0);
  sub_1BA4A2E80((uint64_t)self + OBJC_IVAR____TtC8NewsFeed22WebEmbedViewController_dataFeedURL, (uint64_t (*)(_QWORD))sub_1BA6EF3B0);
  swift_unknownObjectRelease();
  sub_1BA4A2E80((uint64_t)self + OBJC_IVAR____TtC8NewsFeed22WebEmbedViewController_sourceURL, (uint64_t (*)(_QWORD))sub_1BA6EF3B0);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed22WebEmbedViewController_feedConfiguration));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed22WebEmbedViewController_webContentViewController));
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed22WebEmbedViewController_configurationProvider);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed22WebEmbedViewController_webEmbedDataSourceManager);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed22WebEmbedViewController_liveActivityWebEmbedDatastoreManager);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed22WebEmbedViewController_coordinator);
  sub_1BA4A2E80((uint64_t)self + OBJC_IVAR____TtC8NewsFeed22WebEmbedViewController_dataVisualization, (uint64_t (*)(_QWORD))sub_1BA6CAB4C);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed22WebEmbedViewController_stateMachine));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed22WebEmbedViewController_errorState));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed22WebEmbedViewController_loadedState));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed22WebEmbedViewController_activityIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed22WebEmbedViewController_tapGestureRecognizer));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed22WebEmbedViewController_debugLoadView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed22WebEmbedViewController_debugVisualizationView));
}

@end
