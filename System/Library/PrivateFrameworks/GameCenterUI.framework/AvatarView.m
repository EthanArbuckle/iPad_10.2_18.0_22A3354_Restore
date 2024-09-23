@implementation AvatarView

- (_TtC12GameCenterUI10AvatarView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI10AvatarView *)AvatarView.init(frame:)();
}

- (_TtC12GameCenterUI10AvatarView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB669AC0();
}

- (UIColor)backgroundColor
{
  _TtC12GameCenterUI10AvatarView *v2;
  id v3;

  v2 = self;
  v3 = sub_1AB669CD0();

  return (UIColor *)v3;
}

- (void)setBackgroundColor:(id)a3
{
  id v5;
  _TtC12GameCenterUI10AvatarView *v6;

  v5 = a3;
  v6 = self;
  sub_1AB669D44(a3);

}

- (CGRect)jet_focusedFrame
{
  _TtC12GameCenterUI10AvatarView *v2;
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
  sub_1AB669DD8();
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

- (void)layoutSubviews
{
  _TtC12GameCenterUI10AvatarView *v2;

  v2 = self;
  sub_1AB669DF0();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC12GameCenterUI10AvatarView *v6;

  v5 = a3;
  v6 = self;
  sub_1AB66A064((uint64_t)a3);

}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI10AvatarView_messagesBadgeView));
}

@end
