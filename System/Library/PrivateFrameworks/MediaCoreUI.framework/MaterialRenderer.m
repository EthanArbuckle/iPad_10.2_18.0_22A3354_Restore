@implementation MaterialRenderer

- (void)mtkView:(id)a3 drawableSizeWillChange:(CGSize)a4
{
  id v5;
  _TtC11MediaCoreUI16MaterialRenderer *v6;

  v5 = a3;
  v6 = self;
  sub_2413E402C(v5);

}

- (void)drawInMTKView:(id)a3
{
  id v4;
  _TtC11MediaCoreUI16MaterialRenderer *v5;

  v4 = a3;
  v5 = self;
  sub_2413E21A8(v4);

}

- (_TtC11MediaCoreUI16MaterialRenderer)init
{
  _TtC11MediaCoreUI16MaterialRenderer *result;

  result = (_TtC11MediaCoreUI16MaterialRenderer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2413E42A0((uint64_t)self + OBJC_IVAR____TtC11MediaCoreUI16MaterialRenderer_textureProvider);
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
}

@end
