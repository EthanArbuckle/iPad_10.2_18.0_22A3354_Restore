@implementation UIKitGestureContainer

- (UIView)_proxyView
{
  _TtC7SwiftUI21UIKitGestureContainer *v2;
  void *v3;

  v2 = self;
  v3 = (void *)UIKitGestureContainer._proxyView.getter();

  return (UIView *)v3;
}

- (void)dealloc
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[UIKitGestureContainer dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  outlined destroy of weak AnyGestureResponder?((uint64_t)self + OBJC_IVAR____TtC7SwiftUI21UIKitGestureContainer_responder);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
}

- (NSString)description
{
  _TtC7SwiftUI21UIKitGestureContainer *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = UIKitGestureContainer.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x18D75CC88](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (UIResponder)nextResponder
{
  _TtC7SwiftUI21UIKitGestureContainer *v2;
  void *v3;

  v2 = self;
  v3 = (void *)UIKitGestureContainer.next.getter();

  return (UIResponder *)v3;
}

- (NSArray)gestureRecognizers
{
  _TtC7SwiftUI21UIKitGestureContainer *v2;
  Class isa;

  v2 = self;
  UIKitGestureContainer.gestureRecognizers.getter();

  type metadata accessor for NSObject(0, (unint64_t *)&lazy cache variable for type metadata for UIGestureRecognizer);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

- (_UIGestureRecognizerContainer)_parentGestureRecognizerContainer
{
  _TtC7SwiftUI21UIKitGestureContainer *v2;
  void *v3;

  v2 = self;
  v3 = (void *)UIKitGestureContainer._parentContainer.getter();

  return (_UIGestureRecognizerContainer *)v3;
}

- (NSArray)_childGestureRecognizerContainers
{
  uint64_t Strong;
  _TtC7SwiftUI21UIKitGestureContainer *v4;
  unint64_t v5;
  Class isa;

  Strong = swift_weakLoadStrong();
  v4 = self;
  if (Strong)
  {
    v5 = ViewResponder.childGestureContainers.getter();
    swift_release();
  }
  else
  {
    v5 = MEMORY[0x1E0DEE9D8];
  }
  specialized _arrayForceCast<A, B>(_:)(v5);

  swift_bridgeObjectRelease();
  type metadata accessor for _UIGestureRecognizerContainer();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

- (_UIGestureRecognizerContainer)_actingParentGestureRecognizerContainer
{
  return (_UIGestureRecognizerContainer *)(id)swift_unknownObjectRetain();
}

- (void)set_actingParentGestureRecognizerContainer:(id)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7SwiftUI21UIKitGestureContainer__actingParentContainer) = (Class)a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (UIWindow)_eventReceivingWindow
{
  _TtC7SwiftUI21UIKitGestureContainer *v2;
  id v3;

  v2 = self;
  v3 = UIKitGestureContainer._eventReceivingWindow.getter();

  return (UIWindow *)v3;
}

- (int64_t)_compareGestureRecognizerContainer:(id)a3
{
  _TtC7SwiftUI21UIKitGestureContainer *v4;
  int64_t v5;

  swift_getObjectType();
  swift_unknownObjectRetain();
  v4 = self;
  v5 = specialized UIKitGestureContainer._compare(_:)();
  swift_unknownObjectRelease();

  return v5;
}

- (_TtC7SwiftUI21UIKitGestureContainer)init
{
  _TtC7SwiftUI21UIKitGestureContainer *result;

  result = (_TtC7SwiftUI21UIKitGestureContainer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
