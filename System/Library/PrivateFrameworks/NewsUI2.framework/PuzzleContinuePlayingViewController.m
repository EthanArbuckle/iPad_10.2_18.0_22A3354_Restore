@implementation PuzzleContinuePlayingViewController

- (_TtC7NewsUI235PuzzleContinuePlayingViewController)initWithCoder:(id)a3
{
  char *v5;
  id v6;
  _TtC7NewsUI235PuzzleContinuePlayingViewController *result;

  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC7NewsUI235PuzzleContinuePlayingViewController_isBeingUsedAsPlugin) = 0;
  *(_QWORD *)((char *)&self->super.super._responderFlags
            + OBJC_IVAR____TtC7NewsUI235PuzzleContinuePlayingViewController_pluggableDelegate) = 0;
  swift_unknownObjectWeakInit();
  v5 = (char *)self + OBJC_IVAR____TtC7NewsUI235PuzzleContinuePlayingViewController_lastComputedSize;
  *(_QWORD *)v5 = 0;
  *((_QWORD *)v5 + 1) = 0;
  v5[16] = 1;
  v6 = a3;

  result = (_TtC7NewsUI235PuzzleContinuePlayingViewController *)sub_1D6E28010();
  __break(1u);
  return result;
}

- (_TtC7NewsUI235PuzzleContinuePlayingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC7NewsUI235PuzzleContinuePlayingViewController *result;

  v4 = a4;
  result = (_TtC7NewsUI235PuzzleContinuePlayingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1D5FF43C0((uint64_t)self + OBJC_IVAR____TtC7NewsUI235PuzzleContinuePlayingViewController_pluggableDelegate);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI235PuzzleContinuePlayingViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI235PuzzleContinuePlayingViewController_blueprintViewController));
  swift_release();
}

- (void)viewDidLoad
{
  _TtC7NewsUI235PuzzleContinuePlayingViewController *v2;

  v2 = self;
  sub_1D6127734();

}

- (void)viewWillLayoutSubviews
{
  _TtC7NewsUI235PuzzleContinuePlayingViewController *v2;

  v2 = self;
  sub_1D6127938();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v4 = a3;
  v5 = v7.receiver;
  -[PuzzleContinuePlayingViewController traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, v4);
  v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_1D6128EC4();

}

@end
