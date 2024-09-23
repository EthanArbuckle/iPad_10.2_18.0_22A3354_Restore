@implementation HUNoResponseResidentsBannerItem

- (id)_subclass_updateWithOptions:(id)a3
{
  HUNoResponseResidentsBannerItem *v4;
  void *v5;
  void *v6;

  if (a3)
    sub_1B93EDD00();
  v4 = self;
  sub_1B8F3E05C();
  v6 = v5;

  swift_bridgeObjectRelease();
  return v6;
}

- (HUNoResponseResidentsBannerItem)initWithHome:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NoResponseResidentsBannerItem();
  return -[HUBannerItem initWithHome:](&v5, sel_initWithHome_, a3);
}

@end
