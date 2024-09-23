@implementation UINavigationItem.SegmentedContentView

- (_TtCE18HealthExperienceUICSo16UINavigationItemP33_5F11F40652BD0C60053B51DD9E749E2B20SegmentedContentView)initWithCoder:(id)a3
{
  _TtCE18HealthExperienceUICSo16UINavigationItemP33_5F11F40652BD0C60053B51DD9E749E2B20SegmentedContentView *result;

  result = (_TtCE18HealthExperienceUICSo16UINavigationItemP33_5F11F40652BD0C60053B51DD9E749E2B20SegmentedContentView *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtCE18HealthExperienceUICSo16UINavigationItemP33_5F11F40652BD0C60053B51DD9E749E2B20SegmentedContentView *v2;

  v2 = self;
  sub_1A9817D80();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  _TtCE18HealthExperienceUICSo16UINavigationItemP33_5F11F40652BD0C60053B51DD9E749E2B20SegmentedContentView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  width = a3.width;
  v4 = self;
  -[UINavigationItem.SegmentedContentView directionalLayoutMargins](v4, sel_directionalLayoutMargins);
  objc_msgSend(*(id *)((char *)&v4->super.super.super.isa+ OBJC_IVAR____TtCE18HealthExperienceUICSo16UINavigationItemP33_5F11F40652BD0C60053B51DD9E749E2B20SegmentedContentView_control), sel_sizeThatFits_, width - v5 - v6, 1.79769313e308);
  v8 = v7;
  if (qword_1EEB08AC8 != -1)
    swift_once();
  v9 = *(double *)&qword_1EEB16FE8;

  v10 = v8 + v9;
  v11 = width;
  result.height = v10;
  result.width = v11;
  return result;
}

- (void)layoutMarginsDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[UINavigationItem.SegmentedContentView layoutMarginsDidChange](&v3, sel_layoutMarginsDidChange);
  objc_msgSend(v2, sel_setNeedsLayout, v3.receiver, v3.super_class);

}

- (_TtCE18HealthExperienceUICSo16UINavigationItemP33_5F11F40652BD0C60053B51DD9E749E2B20SegmentedContentView)initWithFrame:(CGRect)a3
{
  _TtCE18HealthExperienceUICSo16UINavigationItemP33_5F11F40652BD0C60053B51DD9E749E2B20SegmentedContentView *result;

  result = (_TtCE18HealthExperienceUICSo16UINavigationItemP33_5F11F40652BD0C60053B51DD9E749E2B20SegmentedContentView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCE18HealthExperienceUICSo16UINavigationItemP33_5F11F40652BD0C60053B51DD9E749E2B20SegmentedContentView_control));
}

@end
