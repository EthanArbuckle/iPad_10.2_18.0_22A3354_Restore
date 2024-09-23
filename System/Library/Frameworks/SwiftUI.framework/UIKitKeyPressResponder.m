@implementation UIKitKeyPressResponder

- (void).cxx_destruct
{
  swift_weakDestroy();
  outlined destroy of weak FallbackResponderProvider?((uint64_t)self + OBJC_IVAR____TtC7SwiftUI22UIKitKeyPressResponder_fallbackResponderProvider);
  swift_bridgeObjectRelease();
}

- (UIResponder)nextResponder
{
  char *v3;
  uint64_t v4;
  uint64_t ObjectType;
  uint64_t (*v6)(uint64_t, uint64_t);
  _TtC7SwiftUI22UIKitKeyPressResponder *v7;
  void *v8;

  v3 = (char *)self + OBJC_IVAR____TtC7SwiftUI22UIKitKeyPressResponder_fallbackResponderProvider;
  if (MEMORY[0x18D760234]((char *)self + OBJC_IVAR____TtC7SwiftUI22UIKitKeyPressResponder_fallbackResponderProvider, a2))
  {
    v4 = *((_QWORD *)v3 + 1);
    ObjectType = swift_getObjectType();
    v6 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8);
    v7 = self;
    v8 = (void *)v6(ObjectType, v4);

    swift_unknownObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  return (UIResponder *)v8;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  @objc UIKitKeyPressResponder.pressesBegan(_:with:)(self, (uint64_t)a2, (uint64_t)a3, a4, UIKitKeyPressResponder.pressesBegan(_:with:));
}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
  @objc UIKitKeyPressResponder.pressesBegan(_:with:)(self, (uint64_t)a2, (uint64_t)a3, a4, UIKitKeyPressResponder.pressesChanged(_:with:));
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  @objc UIKitKeyPressResponder.pressesBegan(_:with:)(self, (uint64_t)a2, (uint64_t)a3, a4, UIKitKeyPressResponder.pressesEnded(_:with:));
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  @objc UIKitKeyPressResponder.pressesBegan(_:with:)(self, (uint64_t)a2, (uint64_t)a3, a4, UIKitKeyPressResponder.pressesCancelled(_:with:));
}

- (_TtC7SwiftUI22UIKitKeyPressResponder)init
{
  _TtC7SwiftUI22UIKitKeyPressResponder *result;

  result = (_TtC7SwiftUI22UIKitKeyPressResponder *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
