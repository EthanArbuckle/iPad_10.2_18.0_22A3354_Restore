@implementation AppStoreContentPlatterView

- (_TtC12GameCenterUI26AppStoreContentPlatterView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB6DC04C();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC12GameCenterUI26AppStoreContentPlatterView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_1AB6DC37C(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)layoutSubviews
{
  _TtC12GameCenterUI26AppStoreContentPlatterView *v2;

  v2 = self;
  sub_1AB6DC664();

}

- (void)addSubview:(id)a3
{
  id v4;
  _TtC12GameCenterUI26AppStoreContentPlatterView *v5;

  v4 = a3;
  v5 = self;
  sub_1AB6DCD04((uint64_t)v4);

}

- (unint64_t)_edgesPropagatingSafeAreaInsetsToSubviews
{
  return 0;
}

- (_TtC12GameCenterUI26AppStoreContentPlatterView)initWithFrame:(CGRect)a3
{
  sub_1AB6DD01C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI26AppStoreContentPlatterView_titleView));
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI26AppStoreContentPlatterView_materialBackgroundView);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI26AppStoreContentPlatterView_contentContainer);
  sub_1AB46A9C4(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC12GameCenterUI26AppStoreContentPlatterView_titleActionBlock));
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI26AppStoreContentPlatterView_loadingIndicator);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI26AppStoreContentPlatterView_errorView));
}

@end
