@implementation FollowingSettingsButtonView

- (_TtC7NewsUI227FollowingSettingsButtonView)initWithFrame:(CGRect)a3
{
  return (_TtC7NewsUI227FollowingSettingsButtonView *)sub_1D67E1D74(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7NewsUI227FollowingSettingsButtonView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D67E218C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI227FollowingSettingsButtonView_onTap));
  swift_release();
  swift_release();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (NSString)accessibilityLabel
{
  _TtC7NewsUI227FollowingSettingsButtonView *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;

  v2 = self;
  v3 = -[FollowingSettingsButtonView titleLabel](v2, sel_titleLabel);
  if (v3 && (v4 = v3, v5 = objc_msgSend(v3, sel_text), v4, v5))
  {
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

@end
