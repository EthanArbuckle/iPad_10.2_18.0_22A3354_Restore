@implementation PuzzleEmbedViewController

- (_TtC8NewsFeed25PuzzleEmbedViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BB1BD068();
}

- (void)viewDidLoad
{
  _TtC8NewsFeed25PuzzleEmbedViewController *v2;

  v2 = self;
  PuzzleEmbedViewController.viewDidLoad()();

}

- (void)viewDidLayoutSubviews
{
  _TtC8NewsFeed25PuzzleEmbedViewController *v2;

  v2 = self;
  PuzzleEmbedViewController.viewDidLayoutSubviews()();

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  char *v7;
  objc_super v8;

  height = a3.height;
  width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  swift_unknownObjectRetain();
  v7 = (char *)v8.receiver;
  -[PuzzleEmbedViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, width, height);
  objc_msgSend(*(id *)&v7[OBJC_IVAR____TtC8NewsFeed25PuzzleEmbedViewController_presentationManager], sel_setPresentationState_, 2, v8.receiver, v8.super_class);
  swift_unknownObjectRelease();

}

- (UIView)inputAccessoryView
{
  return (UIView *)objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8NewsFeed25PuzzleEmbedViewController_webContentViewController), sel_inputAccessoryView);
}

- (_TtC8NewsFeed25PuzzleEmbedViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8NewsFeed25PuzzleEmbedViewController *result;

  v4 = a4;
  result = (_TtC8NewsFeed25PuzzleEmbedViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed25PuzzleEmbedViewController_webContentViewController));
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed25PuzzleEmbedViewController_activityIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed25PuzzleEmbedViewController_errorView));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed25PuzzleEmbedViewController_onReuse));
  swift_bridgeObjectRelease();
  sub_1BA5C699C((uint64_t)self + OBJC_IVAR____TtC8NewsFeed25PuzzleEmbedViewController_puzzleData, qword_1ED3D53F0, (uint64_t (*)(uint64_t))type metadata accessor for PuzzleData);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed25PuzzleEmbedViewController_puzzleAccessArbiter);
  swift_unknownObjectRelease();
  sub_1BA8FD860((uint64_t)self + OBJC_IVAR____TtC8NewsFeed25PuzzleEmbedViewController_delegate);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed25PuzzleEmbedViewController_feedConfiguration));
  sub_1BA49EBE0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8NewsFeed25PuzzleEmbedViewController_onEmbedInteraction));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed25PuzzleEmbedViewController_textInputTraits));
}

- (void)keyboardWillChangeFrameWithNotification:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  _TtC8NewsFeed25PuzzleEmbedViewController *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v4 = sub_1BB86BEF0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BB86BECC();
  v8 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8NewsFeed25PuzzleEmbedViewController_webContentViewController);
  sub_1BA49A224(0, &qword_1EF2BD180);
  v9 = self;
  v10 = (void *)sub_1BB872D9C();
  v11 = (void *)sub_1BB872D9C();
  objc_msgSend(v8, sel_setShortcutsBarWithLeadingGroups_trailingGroups_, v10, v11);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end
