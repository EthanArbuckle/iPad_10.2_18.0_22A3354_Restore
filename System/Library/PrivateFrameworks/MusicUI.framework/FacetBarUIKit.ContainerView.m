@implementation FacetBarUIKit.ContainerView

- (_TtCV7MusicUI13FacetBarUIKit13ContainerView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_21D455210();
}

- (void)layoutSubviews
{
  _TtCV7MusicUI13FacetBarUIKit13ContainerView *v2;

  v2 = self;
  sub_21D4552D0();

}

- (CGSize)intrinsicContentSize
{
  _TtCV7MusicUI13FacetBarUIKit13ContainerView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = self;
  sub_21D454CA8();
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtCV7MusicUI13FacetBarUIKit13ContainerView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = self;
  sub_21D454CC0();
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (_TtCV7MusicUI13FacetBarUIKit13ContainerView)initWithFrame:(CGRect)a3
{
  sub_21D4554CC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCV7MusicUI13FacetBarUIKit13ContainerView_scopeBar));
  sub_21CDBDA44((uint64_t)self + OBJC_IVAR____TtCV7MusicUI13FacetBarUIKit13ContainerView_contentOffsetObservation, &qword_253F67EB0);
  sub_21CDBD660(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtCV7MusicUI13FacetBarUIKit13ContainerView_onScopeBarBoundsChange));
  swift_release();
}

@end
