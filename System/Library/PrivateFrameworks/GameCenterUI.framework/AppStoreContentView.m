@implementation AppStoreContentView

- (_TtC12GameCenterUI19AppStoreContentView)init
{
  return (_TtC12GameCenterUI19AppStoreContentView *)sub_1AB4A1308();
}

- (_TtC12GameCenterUI19AppStoreContentView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB4A14A8();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  CGSizeMake(self, a2, (__n128)a3, *(__n128 *)&a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  _TtC12GameCenterUI19AppStoreContentView *v2;

  v2 = self;
  sub_1AB4A181C();

}

- (_TtC12GameCenterUI19AppStoreContentView)initWithFrame:(CGRect)a3
{
  sub_1AB4A2CD8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI19AppStoreContentView_scrollView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
