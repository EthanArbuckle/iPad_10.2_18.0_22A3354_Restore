@implementation HostingScrollView.PlatformGroupContainer

- (_TtCC7SwiftUI17HostingScrollView22PlatformGroupContainer)initWithFrame:(CGRect)a3
{
  return (_TtCC7SwiftUI17HostingScrollView22PlatformGroupContainer *)HostingScrollView.PlatformGroupContainer.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

+ (BOOL)_supportsInvalidatingFocusCache
{
  return 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  id v7;
  _TtCC7SwiftUI17HostingScrollView22PlatformGroupContainer *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  specialized HostingScrollView.PlatformGroupContainer.didUpdateFocus(in:with:)(v6);

}

- (NSArray)preferredFocusEnvironments
{
  _TtCC7SwiftUI17HostingScrollView22PlatformGroupContainer *v2;
  Class isa;

  v2 = self;
  HostingScrollView.PlatformGroupContainer.preferredFocusEnvironments.getter();

  type metadata accessor for _UISceneBSActionHandler(0, (unint64_t *)&lazy cache variable for type metadata for UIFocusEnvironment);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

- (BOOL)_swiftuiReturnsSubviewsInFocusItemsInRect
{
  return 1;
}

- (id)focusItemsInRect:(CGRect)a3
{
  _TtCC7SwiftUI17HostingScrollView22PlatformGroupContainer *v4;
  Class isa;

  type metadata accessor for [UIFocusItem]();
  v4 = self;
  static Update.ensure<A>(_:)();

  type metadata accessor for _UISceneBSActionHandler(0, (unint64_t *)&lazy cache variable for type metadata for UIFocusItem);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (NSArray)_childGestureRecognizerContainers
{
  _TtCC7SwiftUI17HostingScrollView22PlatformGroupContainer *v2;
  Class isa;

  v2 = self;
  HostingScrollView.PlatformGroupContainer._childContainers.getter();

  type metadata accessor for _UIGestureRecognizerContainer();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

- (BOOL)_accessibilityAllowOutOfBoundsHitTestAtPoint:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  char *v8;
  BOOL v9;
  char *v10;
  char *v11;
  objc_super v13;
  CGPoint v14;
  CGRect v15;

  y = a3.y;
  x = a3.x;
  v13.receiver = self;
  v13.super_class = (Class)swift_getObjectType();
  v7 = a4;
  v8 = (char *)v13.receiver;
  if (-[HostingScrollView.PlatformGroupContainer _accessibilityAllowOutOfBoundsHitTestAtPoint:withEvent:](&v13, sel__accessibilityAllowOutOfBoundsHitTestAtPoint_withEvent_, v7, x, y))
  {
    v9 = 1;
  }
  else
  {
    v10 = (char *)MEMORY[0x18D760234](&v8[OBJC_IVAR____TtCC7SwiftUI17HostingScrollView22PlatformGroupContainer_scrollView]);
    if (v10)
    {
      v11 = v10;
      objc_msgSend(v10, sel_accessibilityFrame, v13.receiver, v13.super_class);
      v14.x = x;
      v14.y = y;
      v9 = CGRectContainsPoint(v15, v14);

      v7 = v8;
      v8 = v11;
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (_TtCC7SwiftUI17HostingScrollView22PlatformGroupContainer)initWithCoder:(id)a3
{
  return (_TtCC7SwiftUI17HostingScrollView22PlatformGroupContainer *)HostingScrollView.PlatformGroupContainer.init(coder:)(a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
}

@end
