@implementation ExpandingSpiralScene

- (_TtC11EmojiPoster20ExpandingSpiralScene)initWithCoder:(id)a3
{
  return (_TtC11EmojiPoster20ExpandingSpiralScene *)sub_1DD2D79A4(a3);
}

- (_TtC11EmojiPoster20ExpandingSpiralScene)initWithSize:(CGSize)a3
{
  return (_TtC11EmojiPoster20ExpandingSpiralScene *)sub_1DD2D7BA0(a3.width, a3.height);
}

- (void)didMoveToView:(id)a3
{
  id v4;
  _TtC11EmojiPoster20ExpandingSpiralScene *v5;
  objc_super v6;

  v4 = a3;
  v5 = self;
  sub_1DD2D7DF4();
  v6.receiver = v5;
  v6.super_class = (Class)type metadata accessor for ExpandingSpiralScene();
  -[SKScene didMoveToView:](&v6, sel_didMoveToView_, v4);

}

- (_TtC11EmojiPoster20ExpandingSpiralScene)init
{
  _TtC11EmojiPoster20ExpandingSpiralScene *result;

  result = (_TtC11EmojiPoster20ExpandingSpiralScene *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
}

@end
