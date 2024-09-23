@implementation MAGAngelLeadingView

- (_TtC14MagnifierAngel19MAGAngelLeadingView)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  _TtC14MagnifierAngel19MAGAngelLeadingView *v10;
  objc_super v12;

  v5 = (char *)self + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelLeadingView_compressedElementSize;
  *(double *)v5 = MAGAngelContentState.hash(into:)(19.0, 19.0);
  *((_QWORD *)v5 + 1) = v6;
  v7 = (char *)self + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelLeadingView_customElementSize;
  *(double *)v7 = MAGAngelContentState.hash(into:)(37.7, 37.7);
  *((_QWORD *)v7 + 1) = v8;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for MAGAngelLeadingView();
  v9 = a3;
  v10 = -[MAGAngelLeadingView initWithCoder:](&v12, "initWithCoder:", v9);

  return v10;
}

- (CGSize)sizeThatFits:(CGSize)a3 forLayoutMode:(int64_t)a4
{
  uint64_t *v4;
  double *v5;
  double v6;
  double v7;
  CGSize result;

  v4 = &OBJC_IVAR____TtC14MagnifierAngel19MAGAngelLeadingView_customElementSize;
  if (a4 != 4)
    v4 = &OBJC_IVAR____TtC14MagnifierAngel19MAGAngelLeadingView_compressedElementSize;
  v5 = (double *)((char *)self + *v4);
  v6 = *v5;
  v7 = v5[1];
  result.height = v7;
  result.width = v6;
  return result;
}

- (_TtC14MagnifierAngel19MAGAngelLeadingView)initWithFrame:(CGRect)a3
{
  sub_10001EE9C((uint64_t)self, (uint64_t)a2, (uint64_t)"MagnifierAngel.MAGAngelLeadingView", 34);
}

@end
