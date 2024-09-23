@implementation TapbackPickerCancelButtonView

- (UIHoverGestureRecognizer)hoverRecognizer
{
  return (UIHoverGestureRecognizer *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                             + OBJC_IVAR____TtC7ChatKit29TapbackPickerCancelButtonView_hoverRecognizer));
}

- (void)setHoverRecognizer:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC7ChatKit29TapbackPickerCancelButtonView_hoverRecognizer);
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC7ChatKit29TapbackPickerCancelButtonView_hoverRecognizer) = (Class)a3;
  v3 = a3;

}

- (void).cxx_destruct
{
  sub_18E522F74((uint64_t)self + OBJC_IVAR____TtC7ChatKit29TapbackPickerCancelButtonView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit29TapbackPickerCancelButtonView_hoverRecognizer));
}

@end
