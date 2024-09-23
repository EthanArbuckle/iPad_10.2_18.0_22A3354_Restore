@implementation PlayerProfileInfoBarView

- (_TtC12GameCenterUI24PlayerProfileInfoBarView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI24PlayerProfileInfoBarView *)sub_1AB5DE010(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI24PlayerProfileInfoBarView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB5DE1D8();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  _TtC12GameCenterUI24PlayerProfileInfoBarView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  width = a3.width;
  v4 = self;
  v5 = sub_1AB5DE674(width);
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double width;
  _TtC12GameCenterUI24PlayerProfileInfoBarView *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  JUMeasurements result;

  width = a3.width;
  swift_getObjectType();
  swift_unknownObjectRetain();
  v7 = self;
  v8 = sub_1AB5DFEA0(width, (uint64_t)a4, v7);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  swift_unknownObjectRelease();

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.var3 = v18;
  result.var2 = v17;
  result.var1 = v16;
  result.var0 = v15;
  return result;
}

- (void)layoutSubviews
{
  _TtC12GameCenterUI24PlayerProfileInfoBarView *v2;

  v2 = self;
  sub_1AB5DEBA8();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC12GameCenterUI24PlayerProfileInfoBarView *v6;

  v5 = a3;
  v6 = self;
  sub_1AB5DF4C4(a3);

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC12GameCenterUI24PlayerProfileInfoBarView *v5;

  v4 = a3;
  v5 = self;
  sub_1AB5DF654(v4);

}

- (NSArray)accessibilityInfoItemPairs
{
  _TtC12GameCenterUI24PlayerProfileInfoBarView *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  v3 = sub_1AB5DFB68();

  if (v3)
  {
    v4 = (void *)sub_1AB7DB0E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSArray *)v4;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI24PlayerProfileInfoBarView_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI24PlayerProfileInfoBarView_gradient));
}

@end
