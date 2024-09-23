@implementation StickerEffectChooser

- (_TtC10StickerKit20StickerEffectChooser)initWithFrame:(CGRect)a3
{
  return (_TtC10StickerKit20StickerEffectChooser *)sub_234688718(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10StickerKit20StickerEffectChooser)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_23468A4C0();
}

- (void)handleTap:(id)a3
{
  id v4;
  _TtC10StickerKit20StickerEffectChooser *v5;

  v4 = a3;
  v5 = self;
  sub_2346895E4(v4);

}

- (void)layoutSubviews
{
  _TtC10StickerKit20StickerEffectChooser *v2;

  v2 = self;
  sub_234689978();

}

- (CGSize)intrinsicContentSize
{
  _TtC10StickerKit20StickerEffectChooser *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v2 = self;
  v3 = sub_23468A104();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void).cxx_destruct
{
  sub_23468A358((uint64_t)self + OBJC_IVAR____TtC10StickerKit20StickerEffectChooser_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit20StickerEffectChooser_highlightView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit20StickerEffectChooser_previousEffect));

}

@end
