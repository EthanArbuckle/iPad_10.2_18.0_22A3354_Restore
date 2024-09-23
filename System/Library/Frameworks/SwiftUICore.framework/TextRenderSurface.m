@implementation TextRenderSurface

- (CALayer)layer
{
  return (CALayer *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D417TextRenderSurface__layer));
}

- (_TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D417TextRenderSurface)init
{
  _TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D417TextRenderSurface *result;

  result = (_TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D417TextRenderSurface *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D417TextRenderSurface__layer));
  swift_unknownObjectWeakDestroy();
}

- (CGRect)adjustedLayoutFragmentFrame:(CGRect)a3
{
  double height;
  CGFloat width;
  double y;
  CGFloat x;
  double *v8;
  double *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (double *)((char *)self
                + OBJC_IVAR____TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D417TextRenderSurface_yDisplacement);
  swift_beginAccess();
  v9 = (double *)(*(char **)((char *)&self->super.isa
                           + OBJC_IVAR____TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D417TextRenderSurface__layer)
                + OBJC_IVAR____TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D415TextRenderLayer_currentDisplacement);
  v10 = y + *v8 + *v9;
  v11 = height + v9[2];
  v12 = x;
  v13 = width;
  result.size.height = v11;
  result.size.width = v13;
  result.origin.y = v10;
  result.origin.x = v12;
  return result;
}

@end
