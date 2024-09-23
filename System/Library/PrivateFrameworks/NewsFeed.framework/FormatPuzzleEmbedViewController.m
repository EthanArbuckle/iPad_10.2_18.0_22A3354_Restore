@implementation FormatPuzzleEmbedViewController

- (_TtC8NewsFeed31FormatPuzzleEmbedViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BA9ECEB0();
}

- (_TtC8NewsFeed31FormatPuzzleEmbedViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8NewsFeed31FormatPuzzleEmbedViewController *result;

  v4 = a4;
  result = (_TtC8NewsFeed31FormatPuzzleEmbedViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31FormatPuzzleEmbedViewController_puzzleEmbedViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31FormatPuzzleEmbedViewController_onReuse));
  swift_bridgeObjectRelease();
  swift_weakDestroy();
  sub_1BA49EBE0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8NewsFeed31FormatPuzzleEmbedViewController_onKeyboardWillShow));
  sub_1BA49EBE0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8NewsFeed31FormatPuzzleEmbedViewController_onKeyboardWillHide));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31FormatPuzzleEmbedViewController_currentAccessoryView));
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
}

- (void)viewDidLoad
{
  _TtC8NewsFeed31FormatPuzzleEmbedViewController *v2;

  v2 = self;
  FormatPuzzleEmbedViewController.viewDidLoad()();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC8NewsFeed31FormatPuzzleEmbedViewController *v4;

  v4 = self;
  FormatPuzzleEmbedViewController.viewWillAppear(_:)(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC8NewsFeed31FormatPuzzleEmbedViewController *v4;

  v4 = self;
  FormatPuzzleEmbedViewController.viewWillDisappear(_:)(a3);

}

- (void)viewWillLayoutSubviews
{
  _TtC8NewsFeed31FormatPuzzleEmbedViewController *v2;

  v2 = self;
  FormatPuzzleEmbedViewController.viewWillLayoutSubviews()();

}

- (void)keyboardWillShowWithNotification:(id)a3
{
  sub_1BA9D5FEC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))FormatPuzzleEmbedViewController.keyboardWillShow(notification:));
}

- (void)keyboardWillHideWithNotification:(id)a3
{
  sub_1BA9D5FEC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))FormatPuzzleEmbedViewController.keyboardWillHide(notification:));
}

@end
