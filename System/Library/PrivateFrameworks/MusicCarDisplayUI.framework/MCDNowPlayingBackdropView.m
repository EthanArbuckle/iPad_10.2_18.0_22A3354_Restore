@implementation MCDNowPlayingBackdropView

- (MCDNowPlayingBackdropView)initWithFrame:(CGRect)a3
{
  return (MCDNowPlayingBackdropView *)NowPlayingBackdropView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (MCDNowPlayingBackdropView)initWithCoder:(id)a3
{
  id v4;
  MCDNowPlayingBackdropView *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MCDNowPlayingBackdropView_metalView) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MCDNowPlayingBackdropView_renderer) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MCDNowPlayingBackdropView_overlayView) = 0;
  v4 = a3;

  result = (MCDNowPlayingBackdropView *)sub_22FBC553C();
  __break(1u);
  return result;
}

- (void)updateWithImage:(id)a3 animated:(BOOL)a4
{
  void *v4;
  id v6;
  MCDNowPlayingBackdropView *v7;
  id v8;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MCDNowPlayingBackdropView_renderer);
  if (v4)
  {
    v6 = a3;
    v7 = self;
    v8 = v4;
    sub_22FBC5518();

  }
}

- (void).cxx_destruct
{

}

@end
