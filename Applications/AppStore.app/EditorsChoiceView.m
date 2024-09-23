@implementation EditorsChoiceView

- (_TtC8AppStore17EditorsChoiceView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100271AD8();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  char v5;
  int v6;
  char v7;
  unsigned __int8 v8;
  char v9;
  _TtC8AppStore17EditorsChoiceView *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  width = a3.width;
  swift_getObjectType();
  v5 = *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore17EditorsChoiceView_preferredLineCount);
  v6 = *((unsigned __int8 *)&self->super.super.super.isa
       + OBJC_IVAR____TtC8AppStore17EditorsChoiceView_shouldCapWidthByAvailableWidth);
  v7 = *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore17EditorsChoiceView_useAdsLocale);
  v8 = *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore17EditorsChoiceView_useCase);
  v9 = *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore17EditorsChoiceView_size);
  v10 = self;
  sub_100146488(v9, v5, v6, v10, width, v7, v8);
  v12 = v11;
  v14 = v13;

  v15 = v12;
  v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height;
  double width;
  _TtC8AppStore17EditorsChoiceView *v8;
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

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain(a4);
  v8 = self;
  -[EditorsChoiceView sizeThatFits:](v8, "sizeThatFits:", width, height);
  v10 = v9;
  v12 = v11;
  -[EditorsChoiceView lastBaselineFromBottom](v8, "lastBaselineFromBottom");
  v14 = v13;
  swift_unknownObjectRelease(a4);

  v15 = v10;
  v16 = v12;
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
  _TtC8AppStore17EditorsChoiceView *v2;

  v2 = self;
  sub_10027052C();

}

- (void)drawRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC8AppStore17EditorsChoiceView *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_100270A64(x, y, width, height);

}

- (void)tintColorDidChange
{
  _TtC8AppStore17EditorsChoiceView *v2;

  v2 = self;
  sub_100270D78();

}

- (double)lastBaselineMaxY
{
  double result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore17EditorsChoiceView_titleLabel), "lastBaselineMaxY");
  return result;
}

- (double)lastBaselineFromBottom
{
  double result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore17EditorsChoiceView_titleLabel), "lastBaselineFromBottom");
  return result;
}

- (_TtC8AppStore17EditorsChoiceView)initWithFrame:(CGRect)a3
{
  _TtC8AppStore17EditorsChoiceView *result;

  result = (_TtC8AppStore17EditorsChoiceView *)_swift_stdlib_reportUnimplementedInitializer("AppStore.EditorsChoiceView", 26, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore17EditorsChoiceView_rightLaurelView));
}

@end
