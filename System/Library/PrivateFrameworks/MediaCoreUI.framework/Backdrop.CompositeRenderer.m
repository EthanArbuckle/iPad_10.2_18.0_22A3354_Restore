@implementation Backdrop.CompositeRenderer

- (_TtCO11MediaCoreUI8Backdrop17CompositeRenderer)init
{
  _TtCO11MediaCoreUI8Backdrop17CompositeRenderer *result;

  result = (_TtCO11MediaCoreUI8Backdrop17CompositeRenderer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2413E42A0((uint64_t)self + OBJC_IVAR____TtCO11MediaCoreUI8Backdrop17CompositeRenderer_observer);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCO11MediaCoreUI8Backdrop17CompositeRenderer_placeholderColor));

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCO11MediaCoreUI8Backdrop17CompositeRenderer_crossfadeTimingFunction));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCO11MediaCoreUI8Backdrop17CompositeRenderer_modeTimingFunction));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCO11MediaCoreUI8Backdrop17CompositeRenderer_warpTimingFunction));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
}

- (void)mtkView:(id)a3 drawableSizeWillChange:(CGSize)a4
{
  double height;
  double width;
  id v7;
  id v8;
  double v9;
  double v10;
  _TtCO11MediaCoreUI8Backdrop17CompositeRenderer *v11;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  v11 = self;
  v8 = objc_msgSend(v7, sel_traitCollection);
  objc_msgSend(v8, sel_displayScale);
  v10 = v9;

  sub_2413F44FC(width, height, v10);
}

- (void)drawInMTKView:(id)a3
{
  MTKView *v4;
  _TtCO11MediaCoreUI8Backdrop17CompositeRenderer *v5;

  v4 = (MTKView *)a3;
  v5 = self;
  Backdrop.CompositeRenderer.draw(in:)(v4);

}

@end
