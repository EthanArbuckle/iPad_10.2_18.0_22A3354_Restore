@implementation TabOverview.PeekingOverlayView

- (_TtCC12MobileSafari11TabOverview18PeekingOverlayView)initWithFrame:(CGRect)a3
{
  return (_TtCC12MobileSafari11TabOverview18PeekingOverlayView *)sub_18B9A115C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC12MobileSafari11TabOverview18PeekingOverlayView)initWithCoder:(id)a3
{
  return (_TtCC12MobileSafari11TabOverview18PeekingOverlayView *)sub_18B9A12B4(a3);
}

- (void)layoutSubviews
{
  _TtCC12MobileSafari11TabOverview18PeekingOverlayView *v2;

  v2 = self;
  sub_18B9A15BC();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari11TabOverview18PeekingOverlayView_image));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari11TabOverview18PeekingOverlayView_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari11TabOverview18PeekingOverlayView_imageView));
}

@end
