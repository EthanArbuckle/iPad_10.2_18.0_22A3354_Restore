@implementation IssueViewerViewController

- (UIViewController)childViewControllerForStatusBarHidden
{
  return (UIViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                     + OBJC_IVAR____TtC12NewsArticles25IssueViewerViewController_contentViewController));
}

- (UINavigationItem)navigationItem
{
  void *v3;
  UINavigationItem *v4;
  objc_super v6;

  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12NewsArticles25IssueViewerViewController_contentViewController);
  if (v3)
  {
    v4 = (UINavigationItem *)objc_msgSend(v3, sel_navigationItem);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)swift_getObjectType();
    v4 = -[IssueViewerViewController navigationItem](&v6, sel_navigationItem);
  }
  return v4;
}

- (_TtC12NewsArticles25IssueViewerViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BA05EAF8();
}

- (_TtC12NewsArticles25IssueViewerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC12NewsArticles25IssueViewerViewController *result;

  v4 = a4;
  result = (_TtC12NewsArticles25IssueViewerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles25IssueViewerViewController_contentViewControllerFactory);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles25IssueViewerViewController_styler);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles25IssueViewerViewController_sceneStateManager);
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles25IssueViewerViewController_contentViewController));
  sub_1B9E47D78(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC12NewsArticles25IssueViewerViewController_afterLoad));
}

- (void)viewDidLoad
{
  _TtC12NewsArticles25IssueViewerViewController *v2;

  v2 = self;
  IssueViewerViewController.viewDidLoad()();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  v4 = v8.receiver;
  -[IssueViewerViewController viewWillAppear:](&v8, sel_viewWillAppear_, v3);
  v5 = objc_msgSend(v4, sel_navigationController, v8.receiver, v8.super_class);
  if (v5)
  {
    v6 = v5;
    v7 = objc_msgSend(v5, sel_navigationBar);

    objc_msgSend(v7, sel_setPrefersLargeTitles_, 0);
  }
  sub_1BA0BA1FC();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  uint64_t v5;
  _BYTE v6[40];
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v4 = (char *)v7.receiver;
  -[IssueViewerViewController viewDidAppear:](&v7, sel_viewDidAppear_, v3);
  __swift_project_boxed_opaque_existential_1(&v4[OBJC_IVAR____TtC12NewsArticles25IssueViewerViewController_sceneStateManager], *(_QWORD *)&v4[OBJC_IVAR____TtC12NewsArticles25IssueViewerViewController_sceneStateManager + 24]);
  sub_1B9E14BCC((unint64_t *)&unk_1EF25ACB8, v5, (uint64_t (*)(uint64_t))type metadata accessor for IssueViewerViewController, (uint64_t)&protocol conformance descriptor for IssueViewerViewController);
  sub_1BA0BA43C();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  id v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v4 = v7.receiver;
  -[IssueViewerViewController viewWillDisappear:](&v7, sel_viewWillDisappear_, v3);
  if (objc_msgSend(v4, sel_isMovingFromParentViewController, v7.receiver, v7.super_class))
  {
    v5 = objc_msgSend(v4, sel_navigationController);
    if (v5)
    {
      v6 = v5;
      objc_msgSend(v5, sel_setToolbarHidden_animated_, 1, 1);

      v4 = v6;
    }
  }

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC12NewsArticles25IssueViewerViewController *v4;

  v4 = self;
  IssueViewerViewController.viewDidDisappear(_:)(a3);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC12NewsArticles25IssueViewerViewController *v6;
  _TtC12NewsArticles25IssueViewerViewController *v7;
  UITraitCollection_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  IssueViewerViewController.traitCollectionDidChange(_:)(v8);

}

- (unint64_t)viewingLocation
{
  return 2;
}

@end
