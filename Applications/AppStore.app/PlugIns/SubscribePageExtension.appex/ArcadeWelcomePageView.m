@implementation ArcadeWelcomePageView

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension21ArcadeWelcomePageView_arcadeWelcomeContentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension21ArcadeWelcomePageView_familyButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension21ArcadeWelcomePageView_continueButton));
  sub_100010E34((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension21ArcadeWelcomePageView_delegate);
}

@end
