@implementation TodayDebugSectionBackgroundView

- (_TtC8AppStore31TodayDebugSectionBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore31TodayDebugSectionBackgroundView *)sub_10047FB80(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore31TodayDebugSectionBackgroundView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC8AppStore31TodayDebugSectionBackgroundView *result;

  v5 = OBJC_IVAR____TtC8AppStore31TodayDebugSectionBackgroundView_sectionTypeIndicator;
  v6 = objc_allocWithZone((Class)UIView);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");

  result = (_TtC8AppStore31TodayDebugSectionBackgroundView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/TodayDebugSectionBackgroundView.swift", 46, 2, 37, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  objc_class *v3;
  _TtC8AppStore31TodayDebugSectionBackgroundView *v4;
  void *v5;
  double MinX;
  double MinY;
  double v8;
  objc_super v9;
  CGRect v10;
  CGRect v11;
  CGRect v12;

  v3 = (objc_class *)type metadata accessor for TodayDebugSectionBackgroundView();
  v9.receiver = self;
  v9.super_class = v3;
  v4 = self;
  -[TodayDebugSectionBackgroundView layoutSubviews](&v9, "layoutSubviews");
  v5 = *(Class *)((char *)&v4->super.super.super.super.isa
                + OBJC_IVAR____TtC8AppStore31TodayDebugSectionBackgroundView_sectionTypeIndicator);
  *(_QWORD *)&v10.origin.x = LayoutMarginsAware<>.layoutFrame.getter(v3).n128_u64[0];
  MinX = CGRectGetMinX(v10);
  *(_QWORD *)&v11.origin.x = LayoutMarginsAware<>.layoutFrame.getter(v3).n128_u64[0];
  MinY = CGRectGetMinY(v11);
  if (qword_100828AB8 != -1)
    swift_once(&qword_100828AB8, sub_10047FB70);
  v8 = *(double *)&qword_1008476A0;
  *(_QWORD *)&v12.origin.x = LayoutMarginsAware<>.layoutFrame.getter(v3).n128_u64[0];
  objc_msgSend(v5, "setFrame:", MinX, MinY, v8, CGRectGetHeight(v12), v9.receiver, v9.super_class);

}

- (void)prepareForReuse
{
  char *v2;
  void *v3;
  void *v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TodayDebugSectionBackgroundView();
  v2 = (char *)v6.receiver;
  -[TodayDebugSectionBackgroundView prepareForReuse](&v6, "prepareForReuse");
  v3 = *(void **)&v2[OBJC_IVAR____TtC8AppStore31TodayDebugSectionBackgroundView_sectionTypeIndicator];
  v4 = (void *)objc_opt_self(UIColor);
  v5 = objc_msgSend(v4, "clearColor", v6.receiver, v6.super_class);
  objc_msgSend(v3, "setBackgroundColor:", v5);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31TodayDebugSectionBackgroundView_sectionTypeIndicator));
}

@end
