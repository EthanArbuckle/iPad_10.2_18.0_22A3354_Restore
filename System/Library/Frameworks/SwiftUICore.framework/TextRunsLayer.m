@implementation TextRunsLayer

- (_TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D413TextRunsLayer)initWithCoder:(id)a3
{
  _TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D413TextRunsLayer *result;

  result = (_TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D413TextRunsLayer *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D413TextRunsLayer)initWithLayer:(id)a3
{
  return (_TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D413TextRunsLayer *)@objc TextLinesLayer.init(layer:)((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t *))TextRunsLayer.init(layer:));
}

- (void)drawInContext:(CGContext *)a3
{
  @objc TextLinesLayer.draw(in:)(self, (uint64_t)a2, a3, (void (*)(uint64_t, id, id, uint64_t))specialized TextRenderLayer.drawContent(_:));
}

- (_TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D413TextRunsLayer)init
{
  _TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D413TextRunsLayer *result;

  result = (_TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D413TextRunsLayer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  outlined destroy of TypesettingConfiguration((uint64_t)self + OBJC_IVAR____TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D413TextRunsLayer_content, type metadata accessor for Text.Effect.RenderSegmentation.StaticRuns);
}

@end
