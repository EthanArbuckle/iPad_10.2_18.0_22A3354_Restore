@implementation EmojiForegroundLayersViewController

- (_TtC11EmojiPoster35EmojiForegroundLayersViewController)initWithCoder:(id)a3
{
  return (_TtC11EmojiPoster35EmojiForegroundLayersViewController *)EmojiForegroundLayersViewController.init(coder:)(a3);
}

- (void)viewDidLoad
{
  id v2;
  id v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for EmojiForegroundLayersViewController();
  v2 = v5.receiver;
  -[EmojiForegroundLayersViewController viewDidLoad](&v5, sel_viewDidLoad);
  v3 = objc_msgSend(v2, sel_view, v5.receiver, v5.super_class);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, sel_setClipsToBounds_, 0);

  }
  else
  {
    __break(1u);
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC11EmojiPoster35EmojiForegroundLayersViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC11EmojiPoster35EmojiForegroundLayersViewController *result;

  v4 = a4;
  result = (_TtC11EmojiPoster35EmojiForegroundLayersViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _BYTE v3[128];

  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster35EmojiForegroundLayersViewController_implementationVC));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster35EmojiForegroundLayersViewController_dimmingView));
  sub_1DD2C37E8((uint64_t)self + OBJC_IVAR____TtC11EmojiPoster35EmojiForegroundLayersViewController_configuration, (uint64_t)v3);
  sub_1DD2C3968((uint64_t)v3, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_1DD2C39CC);
}

@end
