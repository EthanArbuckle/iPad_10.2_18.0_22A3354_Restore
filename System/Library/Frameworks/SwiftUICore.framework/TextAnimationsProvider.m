@implementation TextAnimationsProvider

+ (id)animationRenderer
{
  return objc_msgSend(objc_allocWithZone((Class)type metadata accessor for TextEffectsRenderer()), sel_init);
}

+ (id)animationWithName:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = specialized static TextAnimationsProvider.textEffect(named:)(v3, v4);
  swift_bridgeObjectRelease();
  return v5;
}

+ (id)animationWithName:(id)a3 localeIdentifier:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = specialized static TextAnimationsProvider.textEffect(named:)(v4, v5);
  swift_bridgeObjectRelease();
  return v6;
}

+ (id)animationNamesForDomain:(id)a3
{
  if (a3)
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  swift_bridgeObjectRelease();
  return Array._bridgeToObjectiveC()().super.isa;
}

+ (CGRect)drawStaticString:(id)a3 withAttributes:(id)a4 options:(unint64_t)a5 inRect:(CGRect)a6 withPadding:(double)a7 forceClipping:(BOOL)a8 cgContext:(CGContext *)a9 stringDrawingContext:(id)a10
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v18;
  id v19;
  CGContext *v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  _BYTE v34[32];
  CGRect result;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  swift_unknownObjectRetain();
  v18 = a10;
  v19 = a4;
  v20 = a9;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  if (v19)
  {
    v21 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  }
  else
  {
    v21 = 0;
  }
  specialized static TextAnimationsProvider.drawStatic(string:attributes:options:rect:padding:forceClipping:cgContext:stringDrawingContext:)((uint64_t)v34, v21, v20, v18, x, y, width, height, a7);
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
  v30 = v23;
  v31 = v25;
  v32 = v27;
  v33 = v29;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (_TtC7SwiftUI22TextAnimationsProvider)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[TextAnimationsProvider init](&v3, sel_init);
}

@end
