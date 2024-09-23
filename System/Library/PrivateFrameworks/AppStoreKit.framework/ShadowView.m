@implementation ShadowView

- (void)layoutSubviews
{
  _TtC11AppStoreKit10ShadowView *v2;

  v2 = self;
  sub_1D81DB984();

}

- (_TtC11AppStoreKit10ShadowView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v7;
  _OWORD *v8;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11AppStoreKit10ShadowView_cornerRadius) = 0;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC11AppStoreKit10ShadowView_cornerStyle) = 1;
  v7 = (char *)self + OBJC_IVAR____TtC11AppStoreKit10ShadowView_previousBounds;
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  v7[32] = 1;
  v8 = (_OWORD *)((char *)self + OBJC_IVAR____TtC11AppStoreKit10ShadowView_shadow);
  *v8 = 0u;
  v8[1] = 0u;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC11AppStoreKit10ShadowView_shouldAnimateBoundsChange) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for ShadowView();
  return -[ShadowView initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
}

- (_TtC11AppStoreKit10ShadowView)initWithCoder:(id)a3
{
  return (_TtC11AppStoreKit10ShadowView *)ShadowView.init(coder:)(a3);
}

- (void).cxx_destruct
{

}

@end
