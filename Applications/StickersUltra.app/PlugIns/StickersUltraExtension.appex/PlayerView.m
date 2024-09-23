@implementation PlayerView

+ (Class)layerClass
{
  uint64_t v2;

  v2 = sub_10000D5F4(0, &qword_10009B3B8, AVPlayerLayer_ptr);
  return (Class)swift_getObjCClassFromMetadata(v2);
}

- (_TtC22StickersUltraExtension10PlayerView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC22StickersUltraExtension10PlayerView_player) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC22StickersUltraExtension10PlayerView_playerItem) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for PlayerView();
  return -[PlayerView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC22StickersUltraExtension10PlayerView)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC22StickersUltraExtension10PlayerView_player) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC22StickersUltraExtension10PlayerView_playerItem) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PlayerView();
  return -[PlayerView initWithCoder:](&v5, "initWithCoder:", a3);
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension10PlayerView_playerItem));
}

@end
