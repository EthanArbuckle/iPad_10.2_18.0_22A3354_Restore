@implementation ActivityFeedSharedView

- (_TtC12GameCenterUI22ActivityFeedSharedView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI22ActivityFeedSharedView *)sub_1AB55E39C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI22ActivityFeedSharedView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB55E720();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  _TtC12GameCenterUI22ActivityFeedSharedView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  width = a3.width;
  v4 = self;
  v5 = sub_1AB55EC14(width);
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  _TtC12GameCenterUI22ActivityFeedSharedView *v2;

  v2 = self;
  sub_1AB55ED10();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC12GameCenterUI22ActivityFeedSharedView *v6;

  v5 = a3;
  v6 = self;
  sub_1AB55F0C0(a3);

}

- (NSString)accessibilityLabel
{
  _TtC12GameCenterUI22ActivityFeedSharedView *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_1AB55F3D8();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1AB7DAF60();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)setAccessibilityLabel:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC12GameCenterUI22ActivityFeedSharedView *v7;

  if (a3)
  {
    v4 = sub_1AB7DAF90();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  sub_1AB4F0660(v4, v6);

}

- (_TtC12GameCenterUI16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC12GameCenterUI16DynamicTypeLabel *)sub_1AB55F4D0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI22ActivityFeedSharedView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI22ActivityFeedSharedView_playerGroupView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI22ActivityFeedSharedView_playerGroupSubartworkView));
  swift_release();
  OUTLINED_FUNCTION_1_73();
}

@end
