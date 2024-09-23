@implementation EmojiForegroundGridLayersViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC11EmojiPoster39EmojiForegroundGridLayersViewController)initWithCoder:(id)a3
{
  return (_TtC11EmojiPoster39EmojiForegroundGridLayersViewController *)EmojiForegroundGridLayersViewController.init(coder:)(a3);
}

- (void)viewDidLoad
{
  _TtC11EmojiPoster39EmojiForegroundGridLayersViewController *v2;

  v2 = self;
  sub_1DD2C40A8();

}

- (void)viewDidLayoutSubviews
{
  _TtC11EmojiPoster39EmojiForegroundGridLayersViewController *v2;

  v2 = self;
  sub_1DD2C4304();

}

- (void)didMoveToParentViewController:(id)a3
{
  id v4;
  _TtC11EmojiPoster39EmojiForegroundGridLayersViewController *v5;
  objc_super v6;

  v4 = a3;
  v5 = self;
  sub_1DD2C443C();
  v6.receiver = v5;
  v6.super_class = (Class)type metadata accessor for EmojiForegroundGridLayersViewController();
  -[EmojiForegroundGridLayersViewController didMoveToParentViewController:](&v6, sel_didMoveToParentViewController_, v4);

}

- (_TtC11EmojiPoster39EmojiForegroundGridLayersViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC11EmojiPoster39EmojiForegroundGridLayersViewController *result;

  v4 = a4;
  result = (_TtC11EmojiPoster39EmojiForegroundGridLayersViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  _BYTE v5[128];

  v3 = (char *)self + OBJC_IVAR____TtC11EmojiPoster39EmojiForegroundGridLayersViewController_logger;
  v4 = sub_1DD2F9CE8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  sub_1DD2C37E8((uint64_t)self + OBJC_IVAR____TtC11EmojiPoster39EmojiForegroundGridLayersViewController_configuration, (uint64_t)v5);
  sub_1DD2C3968((uint64_t)v5, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_1DD2C39CC);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
