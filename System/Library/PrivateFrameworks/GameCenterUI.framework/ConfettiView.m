@implementation ConfettiView

- (_TtC12GameCenterUIP33_A52526A428E5AA1B559A28E8D473C2A912ConfettiView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB5C2E64();
}

- (void)layoutSubviews
{
  _TtC12GameCenterUIP33_A52526A428E5AA1B559A28E8D473C2A912ConfettiView *v2;

  v2 = self;
  sub_1AB5C2F70();

}

- (CGSize)intrinsicContentSize
{
  _TtC12GameCenterUIP33_A52526A428E5AA1B559A28E8D473C2A912ConfettiView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v2 = self;
  v3 = sub_1AB5C30EC();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (_TtC12GameCenterUIP33_A52526A428E5AA1B559A28E8D473C2A912ConfettiView)initWithFrame:(CGRect)a3
{
  sub_1AB5C3148();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUIP33_A52526A428E5AA1B559A28E8D473C2A912ConfettiView_avatar));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUIP33_A52526A428E5AA1B559A28E8D473C2A912ConfettiView_background));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUIP33_A52526A428E5AA1B559A28E8D473C2A912ConfettiView_nicknameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUIP33_A52526A428E5AA1B559A28E8D473C2A912ConfettiView____lazy_storage___confettiTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUIP33_A52526A428E5AA1B559A28E8D473C2A912ConfettiView____lazy_storage___avatarAlignToTop));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUIP33_A52526A428E5AA1B559A28E8D473C2A912ConfettiView____lazy_storage___avatarAlignToCenterY));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUIP33_A52526A428E5AA1B559A28E8D473C2A912ConfettiView____lazy_storage___nicknameTopConstraint));
}

@end
