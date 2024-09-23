@implementation TipViewController

- (_TtC12NewsArticles17TipViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC12NewsArticles17TipViewController *result;

  v4 = a3;
  sub_1BA0B9A34();

  result = (_TtC12NewsArticles17TipViewController *)sub_1BA0BF3B0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v2 = v6.receiver;
  -[AMSUIBaseMessageViewController viewDidLoad](&v6, sel_viewDidLoad);
  sub_1B9E217C0(0, (unint64_t *)&qword_1ED59E290, (uint64_t (*)(uint64_t))sub_1B9E47E70, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1BA0C36C0;
  v4 = sub_1BA0BC7B8();
  v5 = MEMORY[0x1E0DC29B0];
  *(_QWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 40) = v5;
  sub_1BA0BEE58();

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)viewIsAppearing:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = v5.receiver;
  -[TipViewController viewIsAppearing:](&v5, sel_viewIsAppearing_, v3);
  sub_1B9E81304();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC12NewsArticles17TipViewController *v4;

  v4 = self;
  TipViewController.viewDidAppear(_:)(a3);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC12NewsArticles17TipViewController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  TipViewController.viewWillTransition(to:with:)(a4, width, height);
  swift_unknownObjectRelease();

}

- (BOOL)canBecomeFirstResponder
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____TtC12NewsArticles17TipViewController_viewModel;
  return *(_DWORD *)&v2[*(int *)(type metadata accessor for TipViewModel(0) + 24)] & 1;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC12NewsArticles17TipViewController *v8;

  sub_1B9E147E4(0, &qword_1EF252788);
  sub_1B9E82EDC();
  v6 = sub_1BA0BEBF4();
  v7 = a4;
  v8 = self;
  TipViewController.pressesBegan(_:with:)(v6, (uint64_t)a4);

  swift_bridgeObjectRelease();
}

- (_TtC12NewsArticles17TipViewController)initWithRequest:(id)a3
{
  id v3;
  _TtC12NewsArticles17TipViewController *result;

  v3 = a3;
  result = (_TtC12NewsArticles17TipViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC12NewsArticles17TipViewController)initWithRequest:(id)a3 bag:(id)a4 account:(id)a5
{
  id v6;
  id v7;
  _TtC12NewsArticles17TipViewController *result;

  v6 = a3;
  swift_unknownObjectRetain();
  v7 = a5;
  result = (_TtC12NewsArticles17TipViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC12NewsArticles17TipViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC12NewsArticles17TipViewController *result;

  v4 = a4;
  result = (_TtC12NewsArticles17TipViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_1B9E327F4((uint64_t)self + OBJC_IVAR____TtC12NewsArticles17TipViewController_viewModel, type metadata accessor for TipViewModel);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles17TipViewController_eventHandler);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles17TipViewController_styler);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles17TipViewController_requestFactory);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles17TipViewController_tipPresentationConfig);
  v3 = (char *)self + OBJC_IVAR____TtC12NewsArticles17TipViewController_startDate;
  v4 = sub_1BA0B9A40();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (void)messageViewController:(id)a3 didSelectActionWithDialogResult:(id)a4
{
  id v6;
  id v7;
  _TtC12NewsArticles17TipViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  TipViewController.messageViewController(_:didSelectActionWith:)((uint64_t)v6, v7);

}

- (void)messageViewController:(id)a3 didLoadDialogRequest:(id)a4
{
  id v6;
  id v7;
  _TtC12NewsArticles17TipViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  _s12NewsArticles17TipViewControllerC07messagedE0_7didLoadySo012AMSUIMessagedE0_So06UIViewE0CXc_So16AMSDialogRequestCtF_0((uint64_t)v6, v7);

}

- (void)messageViewController:(id)a3 didUpdateSize:(CGSize)a4
{
  id v5;
  _TtC12NewsArticles17TipViewController *v6;

  v5 = a3;
  v6 = self;
  _s12NewsArticles17TipViewControllerC07messagedE0_9didUpdateySo012AMSUIMessagedE0_So06UIViewE0CXc_So6CGSizeVtF_0();

}

- (void)messageViewController:(id)a3 didFailWithError:(id)a4
{
  id v6;
  _TtC12NewsArticles17TipViewController *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  _s12NewsArticles17TipViewControllerC07messagedE0_16didFailWithErrorySo012AMSUIMessagedE0_So06UIViewE0CXc_s0J0_pSgtF_0((uint64_t)v6, a4);

}

- (void)messageViewControllerDidDismiss:(id)a3
{
  id v4;
  _TtC12NewsArticles17TipViewController *v5;

  v4 = a3;
  v5 = self;
  _s12NewsArticles17TipViewControllerC07messagedE10DidDismissyySo012AMSUIMessagedE0_So06UIViewE0CXcF_0();

}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  id v12;
  _TtC12NewsArticles17TipViewController *v13;
  uint64_t v14;

  v5 = type metadata accessor for TipViewImpression(0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(uint64_t *)((char *)&self->super.super.super._overrideTransitioningDelegate
                  + OBJC_IVAR____TtC12NewsArticles17TipViewController_eventHandler);
  v9 = *(uint64_t *)((char *)&self->super.super.super._view
                  + OBJC_IVAR____TtC12NewsArticles17TipViewController_eventHandler);
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC12NewsArticles17TipViewController_eventHandler), v8);
  v10 = (char *)self + OBJC_IVAR____TtC12NewsArticles17TipViewController_startDate;
  swift_beginAccess();
  v11 = sub_1BA0B9A40();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v7, v10, v11);
  v12 = a3;
  v13 = self;
  sub_1BA0B9A34();
  v7[*(int *)(v5 + 24)] = 2;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 32))(v7, v8, v9);
  sub_1B9E327F4((uint64_t)v7, type metadata accessor for TipViewImpression);

}

- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5
{
  sub_1B9E834C4((uint64_t)a4, (uint64_t)a5);
}

@end
