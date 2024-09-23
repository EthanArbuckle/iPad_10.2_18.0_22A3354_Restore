@implementation UIKitHoverGestureRecognizer

- (_TtC7SwiftUI27UIKitHoverGestureRecognizer)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  swift_weakInit();
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[UIKitHoverGestureRecognizer initWithTarget:action:](&v5, sel_initWithTarget_action_, 0, 0);
}

- (void).cxx_destruct
{
  swift_weakDestroy();
}

- (_TtC7SwiftUI27UIKitHoverGestureRecognizer)initWithCoder:(id)a3
{
  id v5;
  _TtC7SwiftUI27UIKitHoverGestureRecognizer *result;

  swift_weakInit();
  v5 = a3;

  result = (_TtC7SwiftUI27UIKitHoverGestureRecognizer *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)reset
{
  _TtC7SwiftUI27UIKitHoverGestureRecognizer *v3;

  if (swift_weakLoadStrong())
  {
    lazy protocol witness table accessor for type UIKitHoverGestureRecognizer and conformance UIKitHoverGestureRecognizer();
    v3 = self;
    dispatch thunk of EventBindingBridge.reset(eventSource:resetForwardedEventDispatchers:)();

    swift_release();
  }
}

- (void)_hoverCancelled:(id)a3 withEvent:(id)a4
{
  @objc UIKitHoverGestureRecognizer._hoverCancelled(_:with:)(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, id))UIKitHoverGestureRecognizer._hoverCancelled(_:with:));
}

- (void)_hoverExited:(id)a3 withEvent:(id)a4
{
  @objc UIKitHoverGestureRecognizer._hoverCancelled(_:with:)(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, id))UIKitHoverGestureRecognizer._hoverExited(_:with:));
}

- (_TtC7SwiftUI27UIKitHoverGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _TtC7SwiftUI27UIKitHoverGestureRecognizer *result;

  if (a3)
  {
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  result = (_TtC7SwiftUI27UIKitHoverGestureRecognizer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
