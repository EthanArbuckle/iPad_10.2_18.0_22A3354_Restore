@implementation BadgeView

- (_TtC12GameCenterUIP33_E93A106C72447D8B59D99814DDD0B3D39BadgeView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUIP33_E93A106C72447D8B59D99814DDD0B3D39BadgeView *)sub_1AB72EC70(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUIP33_E93A106C72447D8B59D99814DDD0B3D39BadgeView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB72EE80();
}

- (BOOL)isHidden
{
  _TtC12GameCenterUIP33_E93A106C72447D8B59D99814DDD0B3D39BadgeView *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_1AB72EFB0();

  return v3 & 1;
}

- (void)setHidden:(BOOL)a3
{
  _TtC12GameCenterUIP33_E93A106C72447D8B59D99814DDD0B3D39BadgeView *v4;

  v4 = self;
  sub_1AB72D8C4(a3);

}

- (CGRect)frame
{
  _TtC12GameCenterUIP33_E93A106C72447D8B59D99814DDD0B3D39BadgeView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  v2 = self;
  sub_1AB72F158();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC12GameCenterUIP33_E93A106C72447D8B59D99814DDD0B3D39BadgeView *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_1AB72F1F0(x, y, width, height);

}

- (void)layoutSubviews
{
  _TtC12GameCenterUIP33_E93A106C72447D8B59D99814DDD0B3D39BadgeView *v2;

  v2 = self;
  sub_1AB72F550();

}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12GameCenterUIP33_E93A106C72447D8B59D99814DDD0B3D39BadgeView_badgeSize);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12GameCenterUIP33_E93A106C72447D8B59D99814DDD0B3D39BadgeView_badgeBorderWidth);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUIP33_E93A106C72447D8B59D99814DDD0B3D39BadgeView_badgeTransparentMaskLayer));
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUIP33_E93A106C72447D8B59D99814DDD0B3D39BadgeView_kvoFrameToken));
}

@end
