@implementation CapsuleInteractiveInsertionView

- (_TtC12MobileSafari31CapsuleInteractiveInsertionView)initWithFrame:(CGRect)a3
{
  return (_TtC12MobileSafari31CapsuleInteractiveInsertionView *)sub_18B986ADC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12MobileSafari31CapsuleInteractiveInsertionView)initWithCoder:(id)a3
{
  return (_TtC12MobileSafari31CapsuleInteractiveInsertionView *)sub_18B986BDC(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari31CapsuleInteractiveInsertionView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari31CapsuleInteractiveInsertionView____lazy_storage___imageViewMinimumWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari31CapsuleInteractiveInsertionView____lazy_storage___imageViewWidthConstraint));
}

@end
