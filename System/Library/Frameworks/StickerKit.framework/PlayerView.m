@implementation PlayerView

+ (Class)layerClass
{
  sub_2345B0BE8(0, &qword_25617AC28);
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC10StickerKit10PlayerView)initWithFrame:(CGRect)a3
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
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10StickerKit10PlayerView_player) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10StickerKit10PlayerView_playerItem) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for PlayerView();
  return -[PlayerView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC10StickerKit10PlayerView)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10StickerKit10PlayerView_player) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10StickerKit10PlayerView_playerItem) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PlayerView();
  return -[PlayerView initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{

}

@end
