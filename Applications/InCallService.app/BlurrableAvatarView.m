@implementation BlurrableAvatarView

- (CNContact)contact
{
  return (CNContact *)sub_1001481D4();
}

- (void)setContact:(id)a3
{
  id v4;
  _TtC13InCallService19BlurrableAvatarView *v5;

  v4 = a3;
  v5 = self;
  sub_100148228(v4);

}

- (BOOL)wantsBlur
{
  return sub_1001482B4() & 1;
}

- (void)setWantsBlur:(BOOL)a3
{
  _TtC13InCallService19BlurrableAvatarView *v4;

  v4 = self;
  sub_100148304(a3);

}

- (CNAvatarView)cnAvatarView
{
  return (CNAvatarView *)sub_100148334();
}

- (_TtC13InCallService19BlurrableAvatarView)initWithContact:(id)a3 wantsBlur:(BOOL)a4 isCommunicationSafetyEnabled:(BOOL)a5
{
  return (_TtC13InCallService19BlurrableAvatarView *)sub_100148358(a3, a4, a5);
}

- (_TtC13InCallService19BlurrableAvatarView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1001484C4();
}

- (void)layoutSubviews
{
  _TtC13InCallService19BlurrableAvatarView *v2;

  v2 = self;
  sub_100148550();

}

- (void)didTapWithSender:(id)a3
{
  id v4;
  _TtC13InCallService19BlurrableAvatarView *v5;

  v4 = a3;
  v5 = self;
  sub_100148EA4();

}

- (_TtC13InCallService19BlurrableAvatarView)initWithFrame:(CGRect)a3
{
  sub_100148F18();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13InCallService19BlurrableAvatarView_contact));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13InCallService19BlurrableAvatarView_cnAvatarView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13InCallService19BlurrableAvatarView_blurEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13InCallService19BlurrableAvatarView_blurEffectViewIcon));
}

@end
