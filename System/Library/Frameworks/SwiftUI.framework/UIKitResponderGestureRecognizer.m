@implementation UIKitResponderGestureRecognizer

- (NSString)name
{
  objc_class *ObjectType;
  _TtC7SwiftUI31UIKitResponderGestureRecognizer *v4;
  uint64_t v5;
  uint64_t v6;
  NSString *v7;
  NSString *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;
  uint64_t v13;
  uint64_t v14;

  ObjectType = (objc_class *)swift_getObjectType();
  type metadata accessor for _EnvironmentKeyWritingModifier<Bool>(0, (unint64_t *)&lazy cache variable for type metadata for String?, MEMORY[0x1E0DEA968], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DEB940]);
  v4 = self;
  static Update.ensure<A>(_:)();
  v5 = v14;
  if (v14)
  {
    v6 = v13;

  }
  else
  {
    v12.receiver = v4;
    v12.super_class = ObjectType;
    v7 = -[UIKitResponderGestureRecognizer name](&v12, sel_name);
    if (!v7)
    {

      return (NSString *)0;
    }
    v8 = v7;
    v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v5 = v9;

  }
  v10 = (void *)MEMORY[0x18D75CC88](v6, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v10;
}

- (void)setName:(id)a3
{
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC7SwiftUI31UIKitResponderGestureRecognizer *v9;
  _TtC7SwiftUI31UIKitResponderGestureRecognizer *v10;
  objc_super v11;

  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v8 = v7;
    v9 = self;
    a3 = (id)MEMORY[0x18D75CC88](v6, v8);
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = self;
  }
  v11.receiver = self;
  v11.super_class = ObjectType;
  -[UIKitResponderGestureRecognizer setName:](&v11, sel_setName_, a3);

}

- (_TtC7SwiftUI31UIKitResponderGestureRecognizer)init
{
  objc_class *ObjectType;
  _TtC7SwiftUI31UIKitResponderGestureRecognizer *v4;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  *(_QWORD *)((char *)&self->super.super._gestureFlags
            + OBJC_IVAR____TtC7SwiftUI31UIKitResponderGestureRecognizer_responder) = 0;
  *(_QWORD *)(swift_weakInit() + 8) = 0;
  swift_weakAssign();
  v6.receiver = self;
  v6.super_class = ObjectType;
  v4 = -[UIKitGestureRecognizer init](&v6, sel_init);
  -[UIKitResponderGestureRecognizer setDelegate:](v4, sel_setDelegate_, v4);
  return v4;
}

- (_TtC7SwiftUI31UIKitResponderGestureRecognizer)initWithCoder:(id)a3
{
  id v5;
  _TtC7SwiftUI31UIKitResponderGestureRecognizer *result;

  *(_QWORD *)((char *)&self->super.super._gestureFlags
            + OBJC_IVAR____TtC7SwiftUI31UIKitResponderGestureRecognizer_responder) = 0;
  swift_weakInit();
  v5 = a3;

  result = (_TtC7SwiftUI31UIKitResponderGestureRecognizer *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (BOOL)isKindOfClass:(Class)a3
{
  uint64_t ObjCClassMetadata;
  _TtC7SwiftUI31UIKitResponderGestureRecognizer *v5;

  ObjCClassMetadata = swift_getObjCClassMetadata();
  v5 = self;
  LOBYTE(ObjCClassMetadata) = UIKitResponderGestureRecognizer.isKind(of:)(ObjCClassMetadata);

  return ObjCClassMetadata & 1;
}

- (BOOL)_isGestureType:(int64_t)a3
{
  BOOL result;
  _TtC7SwiftUI31UIKitResponderGestureRecognizer *v5;
  char v6;
  char v7;

  result = 0;
  if (!a3)
  {
    if (swift_weakLoadStrong())
    {
      v5 = self;
      AnyGestureResponder.requiredTapCount.getter();
      v7 = v6;

      swift_release();
      if ((v7 & 1) == 0)
        return 1;
    }
  }
  return result;
}

- (unint64_t)numberOfTapsRequired
{
  _TtC7SwiftUI31UIKitResponderGestureRecognizer *v2;
  Swift::UInt v3;

  v2 = self;
  v3 = UIKitResponderGestureRecognizer.numberOfTapsRequired()();

  return v3;
}

- (unint64_t)numberOfTouchesRequired
{
  return 1;
}

- (int64_t)buttonMaskRequired
{
  return 1;
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  UIGestureRecognizer *v4;
  _TtC7SwiftUI31UIKitResponderGestureRecognizer *v5;

  v4 = (UIGestureRecognizer *)a3;
  v5 = self;
  LOBYTE(self) = UIKitResponderGestureRecognizer.canPrevent(_:)(v4);

  return self & 1;
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  UIGestureRecognizer *v4;
  _TtC7SwiftUI31UIKitResponderGestureRecognizer *v5;

  v4 = (UIGestureRecognizer *)a3;
  v5 = self;
  LOBYTE(self) = UIKitResponderGestureRecognizer.canBePrevented(by:)(v4);

  return self & 1;
}

- (BOOL)shouldRequireFailureOfGestureRecognizer:(id)a3
{
  UIGestureRecognizer *v4;
  _TtC7SwiftUI31UIKitResponderGestureRecognizer *v5;

  v4 = (UIGestureRecognizer *)a3;
  v5 = self;
  LOBYTE(self) = UIKitResponderGestureRecognizer.shouldRequireFailure(of:)(v4);

  return self & 1;
}

- (BOOL)shouldBeRequiredToFailByGestureRecognizer:(id)a3
{
  UIGestureRecognizer *v4;
  _TtC7SwiftUI31UIKitResponderGestureRecognizer *v5;

  v4 = (UIGestureRecognizer *)a3;
  v5 = self;
  LOBYTE(self) = UIKitResponderGestureRecognizer.shouldBeRequiredToFail(by:)(v4);

  return self & 1;
}

- (BOOL)_gestureRecognizer:(id)a3 canBeCancelledByGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  _TtC7SwiftUI31UIKitResponderGestureRecognizer *v8;
  BOOL v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = specialized UIKitResponderGestureRecognizer._gestureRecognizer(_:canBeCancelledBy:)(v7);

  return v9;
}

- (void).cxx_destruct
{
  outlined destroy of weak AnyGestureResponder?((uint64_t)self + OBJC_IVAR____TtC7SwiftUI31UIKitResponderGestureRecognizer_responder);
}

@end
