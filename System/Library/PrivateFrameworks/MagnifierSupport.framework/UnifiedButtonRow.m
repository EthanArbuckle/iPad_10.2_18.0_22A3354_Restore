@implementation UnifiedButtonRow

- (void)layoutSubviews
{
  _TtC16MagnifierSupport16UnifiedButtonRow *v2;

  v2 = self;
  sub_22755256C();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport16UnifiedButtonRow_button0));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport16UnifiedButtonRow_button1));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport16UnifiedButtonRow_expansionAnimator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport16UnifiedButtonRow_sliderAnimator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport16UnifiedButtonRow_scrollView));
}

@end
