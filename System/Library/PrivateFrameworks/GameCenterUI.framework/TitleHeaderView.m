@implementation TitleHeaderView

- (_TtC12GameCenterUI15TitleHeaderView)initWithFrame:(CGRect)a3
{
  _TtC12GameCenterUI15TitleHeaderView *result;

  sub_1AB725A48();
  return result;
}

- (_TtC12GameCenterUI15TitleHeaderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB725E80();
}

- (BOOL)_disableRasterizeInAnimations
{
  return 1;
}

- (UIView)accessoryView
{
  id v2;

  sub_1AB7261C0();
  return (UIView *)v2;
}

- (void)setAccessoryView:(id)a3
{
  id v5;
  _TtC12GameCenterUI15TitleHeaderView *v6;

  v5 = a3;
  v6 = self;
  sub_1AB72622C(a3);

}

- (_TtC12GameCenterUI11ArtworkView)iconArtworkView
{
  id v2;

  sub_1AB7263DC();
  return (_TtC12GameCenterUI11ArtworkView *)v2;
}

- (void)setIconArtworkView:(id)a3
{
  id v5;
  _TtC12GameCenterUI15TitleHeaderView *v6;

  v5 = a3;
  v6 = self;
  sub_1AB726448(a3);

}

- (void)didTapWithAccessoryView:(id)a3
{
  id v4;
  _TtC12GameCenterUI15TitleHeaderView *v5;

  v4 = a3;
  v5 = self;
  sub_1AB726770(v4);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC12GameCenterUI15TitleHeaderView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  sub_1AB726850(width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)layoutSubviews
{
  _TtC12GameCenterUI15TitleHeaderView *v2;

  v2 = self;
  sub_1AB726BD8();

}

- (void)prepareForReuse
{
  _TtC12GameCenterUI15TitleHeaderView *v2;

  v2 = self;
  sub_1AB7279A0();

}

- (NSString)accessibilityLabel
{
  _TtC12GameCenterUI15TitleHeaderView *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_1AB727AC0();
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
  _TtC12GameCenterUI15TitleHeaderView *v7;

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
  sub_1AB727D1C(v4, v6);

}

- (_TtC12GameCenterUI16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC12GameCenterUI16DynamicTypeLabel *)sub_1AB727DA8();
}

- (UIView)accessibilityAccessoryView
{
  id v2;

  sub_1AB7261C0();
  return (UIView *)v2;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI15TitleHeaderView_titleLabel));
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI15TitleHeaderView_detailLabel);
  sub_1AB48DA6C((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI15TitleHeaderView_style, type metadata accessor for TitleHeaderView.Style);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI15TitleHeaderView_accessoryView);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI15TitleHeaderView_iconArtworkView);
  sub_1AB48E78C((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI15TitleHeaderView_accessory, &qword_1EEBFFAD0);
  sub_1AB46A9C4(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC12GameCenterUI15TitleHeaderView_accessoryAction));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI15TitleHeaderView_separatorLineView));
}

@end
