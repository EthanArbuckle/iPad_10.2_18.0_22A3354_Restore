@implementation ControlContainerView

- (_TtC16MagnifierSupport20ControlContainerView)initWithFrame:(CGRect)a3
{
  return (_TtC16MagnifierSupport20ControlContainerView *)sub_22738F1A4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MagnifierSupport20ControlContainerView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_227390C14();
}

- (void)deviceOrientationDidChange:(id)a3
{
  id v4;
  _TtC16MagnifierSupport20ControlContainerView *v5;

  v4 = a3;
  v5 = self;
  sub_227390CDC();

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport20ControlContainerView_primaryButtonRow));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport20ControlContainerView_featureTrayButtonRow));
}

@end
