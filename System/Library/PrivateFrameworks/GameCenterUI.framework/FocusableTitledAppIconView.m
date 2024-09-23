@implementation FocusableTitledAppIconView

- (void)prepareForReuse
{
  _TtC12GameCenterUI26FocusableTitledAppIconView *v2;

  v2 = self;
  sub_1AB72FA1C();

}

- (_TtC12GameCenterUI26FocusableTitledAppIconView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI26FocusableTitledAppIconView *)sub_1AB7B1E10(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI26FocusableTitledAppIconView)initWithCoder:(id)a3
{
  sub_1AB7B1F70();
}

- (void)layoutSubviews
{
  _TtC12GameCenterUI26FocusableTitledAppIconView *v2;

  v2 = self;
  sub_1AB7B1FD4();

}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  _TtC12GameCenterUI26FocusableTitledAppIconView *v6;
  double v7;
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
  JUMeasurements result;

  swift_unknownObjectRetain();
  v6 = self;
  v7 = sub_1AB7B2074(a4);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  swift_unknownObjectRelease();

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.var3 = v17;
  result.var2 = v16;
  result.var1 = v15;
  result.var0 = v14;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI26FocusableTitledAppIconView_embeddedView));
}

@end
