@implementation ClarityAVPlayerViewController

- (void)playerDidFinishPlaying
{
  void (*v2)(uint64_t);
  _TtC7ChatKitP33_DAFF86AC1D8D225BD7289D5FA0BF23D229ClarityAVPlayerViewController *v3;
  uint64_t v4;

  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC7ChatKitP33_DAFF86AC1D8D225BD7289D5FA0BF23D229ClarityAVPlayerViewController_finishedPlayingHandler);
  v3 = self;
  v4 = swift_retain();
  v2(v4);

  swift_release();
}

- (_TtC7ChatKitP33_DAFF86AC1D8D225BD7289D5FA0BF23D229ClarityAVPlayerViewController)initWithCoder:(id)a3
{
  _TtC7ChatKitP33_DAFF86AC1D8D225BD7289D5FA0BF23D229ClarityAVPlayerViewController *result;

  result = (_TtC7ChatKitP33_DAFF86AC1D8D225BD7289D5FA0BF23D229ClarityAVPlayerViewController *)sub_18E769320();
  __break(1u);
  return result;
}

- (_TtC7ChatKitP33_DAFF86AC1D8D225BD7289D5FA0BF23D229ClarityAVPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC7ChatKitP33_DAFF86AC1D8D225BD7289D5FA0BF23D229ClarityAVPlayerViewController *result;

  v4 = a4;
  result = (_TtC7ChatKitP33_DAFF86AC1D8D225BD7289D5FA0BF23D229ClarityAVPlayerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC7ChatKitP33_DAFF86AC1D8D225BD7289D5FA0BF23D229ClarityAVPlayerViewController)initWithPlayerLayerView:(id)a3
{
  id v3;
  _TtC7ChatKitP33_DAFF86AC1D8D225BD7289D5FA0BF23D229ClarityAVPlayerViewController *result;

  v3 = a3;
  result = (_TtC7ChatKitP33_DAFF86AC1D8D225BD7289D5FA0BF23D229ClarityAVPlayerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
