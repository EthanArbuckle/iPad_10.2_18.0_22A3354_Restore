@implementation ColorSwatchCell

- (BOOL)isSelected
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ColorSwatchCell();
  return -[ColorSwatchCell isSelected](&v3, sel_isSelected);
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ColorSwatchCell();
  v4 = v5.receiver;
  -[ColorSwatchCell setSelected:](&v5, sel_setSelected_, v3);
  objc_msgSend(v4, sel_setNeedsDisplay, v5.receiver, v5.super_class);

}

- (_TtC10StickerKit15ColorSwatchCell)initWithFrame:(CGRect)a3
{
  return (_TtC10StickerKit15ColorSwatchCell *)sub_23463B87C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10StickerKit15ColorSwatchCell)initWithCoder:(id)a3
{
  id v4;
  _TtC10StickerKit15ColorSwatchCell *result;

  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC10StickerKit15ColorSwatchCell_color) = 0;
  v4 = a3;

  result = (_TtC10StickerKit15ColorSwatchCell *)sub_2347180B4();
  __break(1u);
  return result;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _TtC10StickerKit15ColorSwatchCell *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_23463BA60(x, y, width, height);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit15ColorSwatchCell_color));
}

@end
