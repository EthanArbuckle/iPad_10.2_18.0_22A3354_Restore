@implementation MetalView

- (_TtC11HelloPoster9MetalView)initWithFrame:(CGRect)a3 device:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  _TtC11HelloPoster9MetalView *result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  swift_unknownObjectRetain();
  MetalView.init(frame:device:)(a4, x, y, width, height);
  return result;
}

- (_TtC11HelloPoster9MetalView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_23DF5A05C();
}

- (void)drawRect:(CGRect)a3
{
  _TtC11HelloPoster9MetalView *v3;

  v3 = self;
  sub_23DF5A248();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11HelloPoster9MetalView_preferredProminentColor));
  swift_unknownObjectWeakDestroy();
  sub_23DF5B0E0(*(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC11HelloPoster9MetalView_configuration), *(_QWORD *)((char *)&self->super.super.super._responderFlags + OBJC_IVAR____TtC11HelloPoster9MetalView_configuration));
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
}

@end
