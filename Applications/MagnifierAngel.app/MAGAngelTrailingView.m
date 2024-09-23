@implementation MAGAngelTrailingView

- (_TtC14MagnifierAngel20MAGAngelTrailingView)init
{
  return (_TtC14MagnifierAngel20MAGAngelTrailingView *)sub_10001EB20();
}

- (_TtC14MagnifierAngel20MAGAngelTrailingView)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  _TtC14MagnifierAngel20MAGAngelTrailingView *v8;
  objc_super v10;

  v5 = (char *)self + OBJC_IVAR____TtC14MagnifierAngel20MAGAngelTrailingView_compressedElementSize;
  *(double *)v5 = MAGAngelContentState.hash(into:)(19.0, 19.0);
  *((_QWORD *)v5 + 1) = v6;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for MAGAngelTrailingView();
  v7 = a3;
  v8 = -[MAGAngelTrailingView initWithCoder:](&v10, "initWithCoder:", v7);

  return v8;
}

- (CGSize)sizeThatFits:(CGSize)a3 forLayoutMode:(int64_t)a4
{
  double v4;
  double v5;
  CGSize result;

  v4 = *(double *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC14MagnifierAngel20MAGAngelTrailingView_compressedElementSize);
  v5 = *(double *)&self->compressedElementSize[OBJC_IVAR____TtC14MagnifierAngel20MAGAngelTrailingView_compressedElementSize];
  result.height = v5;
  result.width = v4;
  return result;
}

- (_TtC14MagnifierAngel20MAGAngelTrailingView)initWithFrame:(CGRect)a3
{
  sub_10001EE9C((uint64_t)self, (uint64_t)a2, (uint64_t)"MagnifierAngel.MAGAngelTrailingView", 35);
}

@end
