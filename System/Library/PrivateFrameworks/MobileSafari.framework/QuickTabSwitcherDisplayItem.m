@implementation QuickTabSwitcherDisplayItem

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari27QuickTabSwitcherDisplayItem_quickTabSwitcher));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari27QuickTabSwitcherDisplayItem_transitionContainerView));
}

@end
