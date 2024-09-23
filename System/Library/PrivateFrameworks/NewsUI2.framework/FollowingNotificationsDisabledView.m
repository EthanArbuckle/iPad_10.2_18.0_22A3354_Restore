@implementation FollowingNotificationsDisabledView

- (_TtC7NewsUI234FollowingNotificationsDisabledView)initWithFrame:(CGRect)a3
{
  return (_TtC7NewsUI234FollowingNotificationsDisabledView *)sub_1D69917B8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7NewsUI234FollowingNotificationsDisabledView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D6991BB0();
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3;

  v3 = 320.0;
  result.height = v3;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI234FollowingNotificationsDisabledView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI234FollowingNotificationsDisabledView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI234FollowingNotificationsDisabledView_button));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI234FollowingNotificationsDisabledView_onButtonTap));
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (NSString)accessibilityLabel
{
  void *v2;
  _TtC7NewsUI234FollowingNotificationsDisabledView *v3;
  id v4;
  void *v5;
  void *v6;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7NewsUI234FollowingNotificationsDisabledView_subtitleLabel);
  v3 = self;
  v4 = objc_msgSend(v2, sel_text);
  if (v4)
  {
    v5 = v4;
    sub_1D6E26978();

    v6 = (void *)sub_1D6E26948();
    swift_bridgeObjectRelease();
  }
  else
  {

    v6 = 0;
  }
  return (NSString *)v6;
}

- (NSArray)accessibilityElements
{
  return (NSArray *)0;
}

- (CGPoint)accessibilityActivationPoint
{
  double v2;
  double v3;
  CGPoint result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7NewsUI234FollowingNotificationsDisabledView_button), sel_accessibilityActivationPoint);
  result.y = v3;
  result.x = v2;
  return result;
}

@end
