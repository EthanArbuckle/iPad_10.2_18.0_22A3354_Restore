@implementation BIABubbleOptionsViewController

- (_TtC8Business30BIABubbleOptionsViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  char *v12;
  id v13;
  _TtC8Business30BIABubbleOptionsViewController *result;
  uint64_t v15;
  char v16;

  v5 = sub_100007D40(&qword_1000EEFF0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (char *)self + OBJC_IVAR____TtC8Business30BIABubbleOptionsViewController_viewModel;
  v11 = type metadata accessor for BIABubbleViewModel(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC8Business30BIABubbleOptionsViewController_containingView, 0);
  v12 = (char *)self + OBJC_IVAR____TtC8Business30BIABubbleOptionsViewController__shouldBeVisible;
  v16 = 0;
  v13 = a3;
  Published.init(initialValue:)(&v16, &type metadata for Bool);
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v12, v9, v5);

  result = (_TtC8Business30BIABubbleOptionsViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0x6C706D6920746F4ELL, 0xEF6465746E656D65, "Business/BIABubbleOptionsViewController.swift", 45, 2);
  __break(1u);
  return result;
}

- (_TtC8Business30BIABubbleOptionsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8Business30BIABubbleOptionsViewController *result;

  v4 = a4;
  result = (_TtC8Business30BIABubbleOptionsViewController *)_swift_stdlib_reportUnimplementedInitializer("Business.BIABubbleOptionsViewController", 39, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_100010C40((Class *)((char *)&self->super.super.super.isa
                        + OBJC_IVAR____TtC8Business30BIABubbleOptionsViewController_context));
  sub_10007CB4C((uint64_t)self + OBJC_IVAR____TtC8Business30BIABubbleOptionsViewController_viewModel);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8Business30BIABubbleOptionsViewController_containingView);
  v3 = (char *)self + OBJC_IVAR____TtC8Business30BIABubbleOptionsViewController__shouldBeVisible;
  v4 = sub_100007D40(&qword_1000EEFF0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
