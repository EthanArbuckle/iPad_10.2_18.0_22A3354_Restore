@implementation PDFReplicaViewController

- (_TtC12NewsArticles24PDFReplicaViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B9FED878();
}

- (_TtC12NewsArticles24PDFReplicaViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC12NewsArticles24PDFReplicaViewController *result;

  v4 = a4;
  result = (_TtC12NewsArticles24PDFReplicaViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1B9E30DEC((uint64_t)self + OBJC_IVAR____TtC12NewsArticles24PDFReplicaViewController_delegate);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles24PDFReplicaViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles24PDFReplicaViewController_pdfView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles24PDFReplicaViewController_focusableView));
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles24PDFReplicaViewController_loadingIndicatorProvider);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles24PDFReplicaViewController_pinchRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles24PDFReplicaViewController_loadingStateMachine));
  swift_release();
}

- (void)viewDidLoad
{
  _TtC12NewsArticles24PDFReplicaViewController *v2;

  v2 = self;
  sub_1B9FEB064();

}

- (void)traitCollectionDidChange:(id)a3
{
  char *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  v4 = (char *)v9.receiver;
  v5 = a3;
  -[PDFReplicaViewController traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v5);
  v6 = objc_msgSend(v4, sel_traitCollection, v9.receiver, v9.super_class);
  v7 = *(void **)&v4[OBJC_IVAR____TtC12NewsArticles24PDFReplicaViewController_loadingStateMachine];
  if (v7)
  {
    v8 = sub_1B9FED68C(objc_msgSend(v7, sel_state));
    sub_1B9FEDA04(v8);

  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC12NewsArticles24PDFReplicaViewController *v4;

  v4 = self;
  sub_1B9FEB370(a3);

}

- (void)viewDidLayoutSubviews
{
  _TtC12NewsArticles24PDFReplicaViewController *v2;

  v2 = self;
  sub_1B9FEB49C();

}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (NSArray)keyCommands
{
  _TtC12NewsArticles24PDFReplicaViewController *v2;
  id v3;
  void *v4;

  v2 = self;
  v3 = sub_1B9FEBE04();

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

- (void)handleKeyCommandWithKeyCommand:(id)a3
{
  id v4;
  _TtC12NewsArticles24PDFReplicaViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1B9FEC014(v4);

}

- (void)handlePinchGesture
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _TtC12NewsArticles24PDFReplicaViewController *v6;

  v3 = MEMORY[0x1BCCD5CF8]((char *)self + OBJC_IVAR____TtC12NewsArticles24PDFReplicaViewController_delegate, a2);
  if (v3)
  {
    v4 = v3;
    v5 = *(Class *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC12NewsArticles24PDFReplicaViewController_pdfView);
    v6 = self;
    objc_msgSend(v5, sel_scaleFactor);
    if (*(_QWORD *)(v4 + OBJC_IVAR____TtC12NewsArticles30PDFReplicaViewerViewController_barVisibilityAnimator))
    {
      swift_unknownObjectRetain();
      sub_1B9F80B20(1, 1);

      swift_unknownObjectRelease();
    }
    else
    {

    }
    swift_unknownObjectRelease();
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v7;
  id v8;
  _TtC12NewsArticles24PDFReplicaViewController *v9;

  sub_1B9E147E4(0, (unint64_t *)&qword_1ED59AEF0);
  v7 = a3;
  v8 = a4;
  v9 = self;
  LOBYTE(a3) = sub_1BA0BF0F8();

  return a3 & 1;
}

- (void)PDFViewWillClickOnLink:(id)a3 withURL:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC12NewsArticles24PDFReplicaViewController *v11;
  uint64_t v12;

  v6 = sub_1BA0B9998();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BA0B995C();
  __swift_project_boxed_opaque_existential_1(*(_QWORD **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC12NewsArticles24PDFReplicaViewController_eventHandler)+ 6, (*(_QWORD **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC12NewsArticles24PDFReplicaViewController_eventHandler))[9]);
  v10 = a3;
  v11 = self;
  sub_1B9F1ED50((uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

@end
