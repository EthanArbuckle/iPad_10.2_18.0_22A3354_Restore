@implementation TapbackPickerArrowButtonView

- (void)layoutSubviews
{
  _TtC7ChatKit28TapbackPickerArrowButtonView *v2;

  v2 = self;
  sub_18E6F5C00();

}

- (void).cxx_destruct
{
  sub_18E522F74((uint64_t)self + OBJC_IVAR____TtC7ChatKit28TapbackPickerArrowButtonView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit28TapbackPickerArrowButtonView_gradientBackground));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit28TapbackPickerArrowButtonView_gradientMask));
}

@end
