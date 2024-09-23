@implementation EmojiPageControlIndicator

+ (Class)layerClass
{
  sub_2345B0BE8(0, &qword_256172D98);
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC10StickerKit25EmojiPageControlIndicator)initWithFrame:(CGRect)a3
{
  return (_TtC10StickerKit25EmojiPageControlIndicator *)sub_2345BDCA4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10StickerKit25EmojiPageControlIndicator)initWithCoder:(id)a3
{
  return (_TtC10StickerKit25EmojiPageControlIndicator *)sub_2345BDEAC(a3);
}

- (void)layoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for EmojiPageControlIndicator();
  v2 = v3.receiver;
  -[EmojiPageControlIndicator layoutSubviews](&v3, sel_layoutSubviews);
  sub_2345BE2BC();

}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  sub_2345BE140(self, (uint64_t)a2, type metadata accessor for EmojiPageControlIndicator, (SEL *)&selRef_bounds);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  sub_2345BE1C8(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, type metadata accessor for EmojiPageControlIndicator, (const char **)&selRef_setBounds_, (void (*)(id))sub_2345BE2BC);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit25EmojiPageControlIndicator_idleColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit25EmojiPageControlIndicator_currentColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit25EmojiPageControlIndicator_waitingColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit25EmojiPageControlIndicator_maskLayer));
}

@end
