@implementation PDFReplicaViewerViewController

- (BOOL)prefersStatusBarHidden
{
  _TtC12NewsArticles30PDFReplicaViewerViewController *v2;
  char v3;

  v2 = self;
  v3 = sub_1B9E32920();

  return v3 & 1;
}

- (int64_t)preferredStatusBarUpdateAnimation
{
  return 1;
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  uint64_t v2;

  v2 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC12NewsArticles30PDFReplicaViewerViewController_barVisibilityAnimator);
  if (v2)
    return *(_BYTE *)(*(_QWORD *)(v2 + OBJC_IVAR____TtC12NewsArticles37PDFReplicaBarVisibilityAnimatorForiOS_barHider)
                    + 32) & 1;
  else
    return 0;
}

- (_TtC12NewsArticles30PDFReplicaViewerViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B9E37F78();
}

- (_TtC12NewsArticles30PDFReplicaViewerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC12NewsArticles30PDFReplicaViewerViewController *result;

  v4 = a4;
  result = (_TtC12NewsArticles30PDFReplicaViewerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  void *v3;
  char *v4;
  uint64_t v5;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles30PDFReplicaViewerViewController_styler);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles30PDFReplicaViewerViewController_renderer);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles30PDFReplicaViewerViewController_sessionManager);
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12NewsArticles30PDFReplicaViewerViewController_issue);
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles30PDFReplicaViewerViewController_pageViewController));
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles30PDFReplicaViewerViewController_toolbarCoverFactory);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles30PDFReplicaViewerViewController_tableOfContentsVisibilityProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles30PDFReplicaViewerViewController_paywallFactory);
  v4 = (char *)self + OBJC_IVAR____TtC12NewsArticles30PDFReplicaViewerViewController_paywall;
  v5 = sub_1BA0BA9F4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles30PDFReplicaViewerViewController_titleView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles30PDFReplicaViewerViewController_paywallViewController));
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles30PDFReplicaViewerViewController_featureAvailability);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles30PDFReplicaViewerViewController_newsPlusLabelVisibilityProvider);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles30PDFReplicaViewerViewController_newsPlusLabelItem));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles30PDFReplicaViewerViewController_sharingActivityItemFactory);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles30PDFReplicaViewerViewController_subscriptionController));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles30PDFReplicaViewerViewController_backButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles30PDFReplicaViewerViewController_nextButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles30PDFReplicaViewerViewController_coverButton));
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
}

- (void)viewDidLoad
{
  _TtC12NewsArticles30PDFReplicaViewerViewController *v2;

  v2 = self;
  sub_1B9E32FC4();

}

- (void)viewDidLayoutSubviews
{
  _TtC12NewsArticles30PDFReplicaViewerViewController *v2;

  v2 = self;
  sub_1B9E34AE8();

}

- (void)didMoveToParentViewController:(id)a3
{
  id v4;
  _TtC12NewsArticles30PDFReplicaViewerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1B9E390D4();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC12NewsArticles30PDFReplicaViewerViewController *v4;

  v4 = self;
  sub_1B9E34F0C(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC12NewsArticles30PDFReplicaViewerViewController *v4;

  v4 = self;
  sub_1B9E357D4(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = v5.receiver;
  -[PDFReplicaViewerViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
  sub_1BA0BB048();
  swift_getObjectType();
  sub_1BA0BB4B0();

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC12NewsArticles30PDFReplicaViewerViewController *v4;

  v4 = self;
  sub_1B9E36250(a3);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC12NewsArticles30PDFReplicaViewerViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1B9E3640C((uint64_t)a3);

}

- (NSArray)keyCommands
{
  _TtC12NewsArticles30PDFReplicaViewerViewController *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  v3 = sub_1B9E370CC();

  if (v3)
  {
    sub_1B9E147E4(0, (unint64_t *)&unk_1ED595390);
    v4 = (void *)sub_1BA0BEA2C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSArray *)v4;
}

- (void)previousPageKeyCommand
{
  _TtC12NewsArticles30PDFReplicaViewerViewController *v2;

  v2 = self;
  sub_1BA0BB474();

}

- (void)nextPageKeyCommand
{
  _TtC12NewsArticles30PDFReplicaViewerViewController *v2;

  v2 = self;
  sub_1BA0BB450();

}

- (void)tabBarSplitViewWillChangeDisplayModeToDisplayMode:(int64_t)a3
{
  _TtC12NewsArticles30PDFReplicaViewerViewController *v4;

  v4 = self;
  sub_1B9E37438(a3);

}

@end
