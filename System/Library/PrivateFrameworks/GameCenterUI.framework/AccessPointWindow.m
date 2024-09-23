@implementation AccessPointWindow

- (void)dealloc
{
  _TtC12GameCenterUI17AccessPointWindow *v2;

  v2 = self;
  AccessPointWindow.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI17AccessPointWindow_accessPoint));
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI17AccessPointWindow_parent);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI17AccessPointWindow_rootView);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI17AccessPointWindow_layoutView);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI17AccessPointWindow_hostingView);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI17AccessPointWindow_leadingConstraint);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI17AccessPointWindow_trailingConstraint);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI17AccessPointWindow_topConstraint);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI17AccessPointWindow_bottomConstraint));
}

- (_TtC12GameCenterUI17AccessPointWindow)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB4CD570();
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v8;
  _TtC12GameCenterUI17AccessPointWindow *v9;
  void *v10;
  void *v11;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  sub_1AB4CDA30((uint64_t)a4, x, y);
  v11 = v10;

  return v11;
}

- (BOOL)_canAffectStatusBarAppearance
{
  return 0;
}

- (_TtC12GameCenterUI17AccessPointWindow)initWithWindowScene:(id)a3
{
  id v3;

  v3 = a3;
  AccessPointWindow.init(windowScene:)();
}

- (_TtC12GameCenterUI17AccessPointWindow)initWithFrame:(CGRect)a3
{
  AccessPointWindow.init(frame:)();
}

- (_TtC12GameCenterUI17AccessPointWindow)initWithContentRect:(CGRect)a3
{
  AccessPointWindow.init(contentRect:)();
}

@end
