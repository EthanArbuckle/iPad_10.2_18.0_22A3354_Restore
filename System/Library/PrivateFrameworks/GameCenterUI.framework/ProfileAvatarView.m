@implementation ProfileAvatarView

- (_TtC12GameCenterUI17ProfileAvatarView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI17ProfileAvatarView *)ProfileAvatarView.init(frame:)();
}

- (_TtC12GameCenterUI17ProfileAvatarView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB4EA6B4();
}

- (void)layoutSubviews
{
  _TtC12GameCenterUI17ProfileAvatarView *v2;

  v2 = self;
  sub_1AB4EAD3C();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC12GameCenterUI17ProfileAvatarView *v6;

  v5 = a3;
  v6 = self;
  sub_1AB4EB0FC((uint64_t)a3);

}

- (void)didTap
{
  _TtC12GameCenterUI17ProfileAvatarView *v2;

  v2 = self;
  sub_1AB4EB1A8();

}

- (BOOL)accessibilityIsEditable
{
  char v2;

  sub_1AB4EA910();
  return v2 & 1;
}

- (UIVisualEffectView)accessibilityProfileEditButtonBackground
{
  return (UIVisualEffectView *)sub_1AB4EB3EC();
}

- (UIView)accessibilityRoundedEditButton
{
  return (UIView *)sub_1AB4EB418();
}

- (_TtC12GameCenterUI16DynamicTypeLabel)accessibilityProfileEditLabel
{
  return (_TtC12GameCenterUI16DynamicTypeLabel *)sub_1AB4EB444();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI17ProfileAvatarView_profileEditButtonBackground));
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI17ProfileAvatarView_profileEditLabel);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI17ProfileAvatarView_roundedEditButton);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI17ProfileAvatarView_tapGestureRecognizer);
  sub_1AB46A9C4(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC12GameCenterUI17ProfileAvatarView_tapHandler));
}

@end
