@implementation ArcadeWelcomePageView

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension21ArcadeWelcomePageView_arcadeWelcomeContentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension21ArcadeWelcomePageView_familyButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension21ArcadeWelcomePageView_continueButton));
  sub_100010D1C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension21ArcadeWelcomePageView_delegate);
}

@end
