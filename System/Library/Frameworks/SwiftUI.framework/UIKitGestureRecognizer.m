@implementation UIKitGestureRecognizer

- (_TtC7SwiftUI22UIKitGestureRecognizer)init
{
  return (_TtC7SwiftUI22UIKitGestureRecognizer *)UIKitGestureRecognizer.init()();
}

- (void).cxx_destruct
{
  swift_weakDestroy();
}

- (_TtC7SwiftUI22UIKitGestureRecognizer)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized UIKitGestureRecognizer.init(coder:)();
}

- (void)reset
{
  _TtC7SwiftUI22UIKitGestureRecognizer *v2;

  v2 = self;
  UIKitGestureRecognizer.reset()();

}

- (BOOL)shouldReceiveEvent:(id)a3
{
  id v4;
  _TtC7SwiftUI22UIKitGestureRecognizer *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = UIKitGestureRecognizer.shouldReceive(_:)((UIEvent)v4);

  return self & 1;
}

- (void)_updateForActiveEvents
{
  _TtC7SwiftUI22UIKitGestureRecognizer *v2;

  v2 = self;
  UIKitGestureRecognizer._updateForActiveEvents()();

}

- (_TtC7SwiftUI22UIKitGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _TtC7SwiftUI22UIKitGestureRecognizer *result;

  if (a3)
  {
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  result = (_TtC7SwiftUI22UIKitGestureRecognizer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)_transformChangedWithEvent:(id)a3
{
  id v4;
  _TtC7SwiftUI22UIKitGestureRecognizer *v5;

  v4 = a3;
  v5 = self;
  UIKitGestureRecognizer._transformChanged(with:)(v4);

}

- (void)_scrollingChangedWithEvent:(id)a3
{
  id v4;
  _TtC7SwiftUI22UIKitGestureRecognizer *v5;

  v4 = a3;
  v5 = self;
  UIKitGestureRecognizer._scrollingChanged(with:)((unint64_t)v4);

}

@end
