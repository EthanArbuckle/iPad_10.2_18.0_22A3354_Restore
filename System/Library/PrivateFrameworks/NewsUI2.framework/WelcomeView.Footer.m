@implementation WelcomeView.Footer

- (_TtCC7NewsUI211WelcomeView6Footer)initWithEffect:(id)a3
{
  id v4;

  v4 = a3;
  return (_TtCC7NewsUI211WelcomeView6Footer *)sub_1D60A7BE4(a3);
}

- (_TtCC7NewsUI211WelcomeView6Footer)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D60A87B0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC7NewsUI211WelcomeView6Footer_continueButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC7NewsUI211WelcomeView6Footer_activityIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC7NewsUI211WelcomeView6Footer_offlineMessage));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC7NewsUI211WelcomeView6Footer_privacyIcon));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC7NewsUI211WelcomeView6Footer_privacyLink));
}

@end
