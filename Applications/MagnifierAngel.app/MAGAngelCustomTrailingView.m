@implementation MAGAngelCustomTrailingView

- (_TtC14MagnifierAngel26MAGAngelCustomTrailingView)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC14MagnifierAngel26MAGAngelCustomTrailingView_compressedWidth) = (Class)0x4043000000000000;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC14MagnifierAngel26MAGAngelCustomTrailingView_compressedHeight) = (Class)0x4010000000000000;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MAGAngelCustomTrailingView();
  return -[MAGAngelCustomTrailingView initWithFrame:](&v3, "initWithFrame:", 0.0, 0.0, 38.0, 4.0);
}

- (_TtC14MagnifierAngel26MAGAngelCustomTrailingView)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC14MagnifierAngel26MAGAngelCustomTrailingView_compressedWidth) = (Class)0x4043000000000000;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC14MagnifierAngel26MAGAngelCustomTrailingView_compressedHeight) = (Class)0x4010000000000000;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MAGAngelCustomTrailingView();
  return -[MAGAngelCustomTrailingView initWithCoder:](&v5, "initWithCoder:", a3);
}

- (CGSize)sizeThatFits:(CGSize)a3 forLayoutMode:(int64_t)a4
{
  double v4;
  double v5;
  CGSize result;

  v4 = 19.0;
  v5 = 4.0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (_TtC14MagnifierAngel26MAGAngelCustomTrailingView)initWithFrame:(CGRect)a3
{
  sub_10001EE9C((uint64_t)self, (uint64_t)a2, (uint64_t)"MagnifierAngel.MAGAngelCustomTrailingView", 41);
}

@end
