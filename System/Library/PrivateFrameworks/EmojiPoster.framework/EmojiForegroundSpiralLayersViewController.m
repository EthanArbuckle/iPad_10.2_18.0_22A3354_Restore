@implementation EmojiForegroundSpiralLayersViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC11EmojiPoster41EmojiForegroundSpiralLayersViewController)initWithCoder:(id)a3
{
  return (_TtC11EmojiPoster41EmojiForegroundSpiralLayersViewController *)EmojiForegroundSpiralLayersViewController.init(coder:)(a3);
}

- (void)viewDidLoad
{
  _TtC11EmojiPoster41EmojiForegroundSpiralLayersViewController *v2;

  v2 = self;
  sub_1DD2D1870();

}

- (void)viewIsAppearing:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for EmojiForegroundSpiralLayersViewController();
  v4 = v5.receiver;
  -[EmojiForegroundSpiralLayersViewController viewIsAppearing:](&v5, sel_viewIsAppearing_, v3);
  sub_1DD2D1E80();

}

- (void)viewDidLayoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for EmojiForegroundSpiralLayersViewController();
  v2 = v3.receiver;
  -[EmojiForegroundSpiralLayersViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  sub_1DD2D23E4();

}

- (_TtC11EmojiPoster41EmojiForegroundSpiralLayersViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC11EmojiPoster41EmojiForegroundSpiralLayersViewController *result;

  v4 = a4;
  result = (_TtC11EmojiPoster41EmojiForegroundSpiralLayersViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  _BYTE v5[128];

  v3 = (char *)self + OBJC_IVAR____TtC11EmojiPoster41EmojiForegroundSpiralLayersViewController_logger;
  v4 = sub_1DD2F9CE8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  sub_1DD2C37E8((uint64_t)self + OBJC_IVAR____TtC11EmojiPoster41EmojiForegroundSpiralLayersViewController_configuration, (uint64_t)v5);
  sub_1DD2C3968((uint64_t)v5, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_1DD2C39CC);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
