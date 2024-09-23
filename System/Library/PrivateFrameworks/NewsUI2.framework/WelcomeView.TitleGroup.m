@implementation WelcomeView.TitleGroup

- (_TtCC7NewsUI211WelcomeView10TitleGroup)initWithFrame:(CGRect)a3
{
  _TtCC7NewsUI211WelcomeView10TitleGroup *result;

  sub_1D60A789C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtCC7NewsUI211WelcomeView10TitleGroup)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D60A86B8();
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC7NewsUI211WelcomeView10TitleGroup_welcomeTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC7NewsUI211WelcomeView10TitleGroup_welcomeSubTitleLabel));
}

- (NSString)accessibilityLabel
{
  _TtCC7NewsUI211WelcomeView10TitleGroup *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_1D60A8450();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1D6E26948();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

@end
