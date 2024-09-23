@implementation RBDrawingLayer

- (_TtC7SwiftUIP33_E2A63CF3FB15FAD08FBE4CE6D0C83E5114RBDrawingLayer)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a3;
  specialized RBDrawingLayer.init(coder:)((uint64_t)v3, v4, v5, v6);
}

- (void)drawInDisplayList:(id)a3
{
  id v4;
  _TtC7SwiftUIP33_E2A63CF3FB15FAD08FBE4CE6D0C83E5114RBDrawingLayer *v5;

  v4 = a3;
  v5 = self;
  -[RBDrawingLayer bounds](v5, sel_bounds);
  specialized RBDrawingLayer.draw(in:size:)(v4);

}

- (_TtC7SwiftUIP33_E2A63CF3FB15FAD08FBE4CE6D0C83E5114RBDrawingLayer)init
{
  _TtC7SwiftUIP33_E2A63CF3FB15FAD08FBE4CE6D0C83E5114RBDrawingLayer *result;

  result = (_TtC7SwiftUIP33_E2A63CF3FB15FAD08FBE4CE6D0C83E5114RBDrawingLayer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC7SwiftUIP33_E2A63CF3FB15FAD08FBE4CE6D0C83E5114RBDrawingLayer)initWithLayer:(id)a3
{
  @objc CGDrawingLayer.init(layer:)();
}

- (void).cxx_destruct
{
  swift_release();
}

@end
