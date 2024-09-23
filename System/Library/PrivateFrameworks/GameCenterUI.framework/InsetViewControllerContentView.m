@implementation InsetViewControllerContentView

- (_TtC12GameCenterUI30InsetViewControllerContentView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI30InsetViewControllerContentView *)sub_1AB47A330(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI30InsetViewControllerContentView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB47A3E4();
}

- (unint64_t)edgesInsettingLayoutMarginsFromSafeArea
{
  _TtC12GameCenterUI30InsetViewControllerContentView *v2;
  unint64_t v3;

  v2 = self;
  v3 = sub_1AB47A4B0();

  return v3;
}

- (void)setEdgesInsettingLayoutMarginsFromSafeArea:(unint64_t)a3
{
  _TtC12GameCenterUI30InsetViewControllerContentView *v4;

  v4 = self;
  sub_1AB47A558(a3);

}

- (unint64_t)_edgesPropagatingSafeAreaInsetsToSubviews
{
  _TtC12GameCenterUI30InsetViewControllerContentView *v2;
  unint64_t v3;

  v2 = self;
  v3 = sub_1AB47A598();

  return v3;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
}

@end
