@implementation OffsetGridScene

- (_TtC11EmojiPoster15OffsetGridScene)initWithCoder:(id)a3
{
  return (_TtC11EmojiPoster15OffsetGridScene *)sub_1DD2F5E34(a3);
}

- (_TtC11EmojiPoster15OffsetGridScene)initWithSize:(CGSize)a3
{
  return (_TtC11EmojiPoster15OffsetGridScene *)sub_1DD2F6070(a3.width, a3.height);
}

- (void)didMoveToView:(id)a3
{
  id v4;
  _TtC11EmojiPoster15OffsetGridScene *v5;
  objc_super v6;

  v4 = a3;
  v5 = self;
  sub_1DD2F6304();
  v6.receiver = v5;
  v6.super_class = (Class)type metadata accessor for OffsetGridScene();
  -[SKScene didMoveToView:](&v6, sel_didMoveToView_, v4);

}

- (_TtC11EmojiPoster15OffsetGridScene)init
{
  _TtC11EmojiPoster15OffsetGridScene *result;

  result = (_TtC11EmojiPoster15OffsetGridScene *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

@end
