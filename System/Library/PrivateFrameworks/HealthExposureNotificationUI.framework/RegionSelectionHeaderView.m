@implementation RegionSelectionHeaderView

- (UILabel)titleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC28HealthExposureNotificationUI25RegionSelectionHeaderView_titleLabel));
}

- (_TtC28HealthExposureNotificationUI25RegionSelectionHeaderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_21CD2AF90();
}

- (void)layoutSubviews
{
  _TtC28HealthExposureNotificationUI25RegionSelectionHeaderView *v2;

  v2 = self;
  sub_21CD284B0();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  _TtC28HealthExposureNotificationUI25RegionSelectionHeaderView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  width = a3.width;
  v4 = self;
  v5 = sub_21CD28660(width);
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (_TtC28HealthExposureNotificationUI25RegionSelectionHeaderView)initWithFrame:(CGRect)a3
{
  _TtC28HealthExposureNotificationUI25RegionSelectionHeaderView *result;

  result = (_TtC28HealthExposureNotificationUI25RegionSelectionHeaderView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI25RegionSelectionHeaderView_globeImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI25RegionSelectionHeaderView_titleLabel));
}

@end
