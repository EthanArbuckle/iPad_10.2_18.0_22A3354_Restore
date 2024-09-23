@implementation UILargeContentViewerInteractionBridge

- (void).cxx_destruct
{
  _OWORD v3[15];

  outlined destroy of weak FallbackResponderProvider?((uint64_t)self + OBJC_IVAR____TtC7SwiftUI37UILargeContentViewerInteractionBridge_host);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7SwiftUI37UILargeContentViewerInteractionBridge_interaction));
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7SwiftUI37UILargeContentViewerInteractionBridge_simultaneousGesture));
  swift_unknownObjectRelease();
  outlined init with take of AccessibilityLargeContentViewTree((__int128 *)((char *)self + OBJC_IVAR____TtC7SwiftUI37UILargeContentViewerInteractionBridge_largeContentViewTree), v3);
  outlined release of AccessibilityLargeContentViewTree((uint64_t)v3, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))outlined consume of AccessibilityLargeContentViewTree);
}

- (_TtC7SwiftUI37UILargeContentViewerInteractionBridge)init
{
  return (_TtC7SwiftUI37UILargeContentViewerInteractionBridge *)UILargeContentViewerInteractionBridge.init()();
}

- (void)enabledStatusDidChange
{
  _TtC7SwiftUI37UILargeContentViewerInteractionBridge *v2;

  v2 = self;
  UILargeContentViewerInteractionBridge.enabledStatusDidChange()();

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  UIGestureRecognizer *v6;
  UIGestureRecognizer *v7;
  _TtC7SwiftUI37UILargeContentViewerInteractionBridge *v8;
  Swift::Bool v9;

  v6 = (UIGestureRecognizer *)a3;
  v7 = (UIGestureRecognizer *)a4;
  v8 = self;
  v9 = UILargeContentViewerInteractionBridge.gestureRecognizer(_:shouldRecognizeSimultaneouslyWith:)(v6, v7);

  return v9;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  _TtC7SwiftUI37UILargeContentViewerInteractionBridge *v11;
  id v12;
  char v13;
  BOOL v14;

  v7 = MEMORY[0x18D760234]((char *)self + OBJC_IVAR____TtC7SwiftUI37UILargeContentViewerInteractionBridge_gesture, a2);
  if (!v7)
    return 0;
  v8 = (void *)v7;
  type metadata accessor for NSObject(0, (unint64_t *)&lazy cache variable for type metadata for UIGestureRecognizer);
  v9 = a3;
  v10 = a4;
  v11 = self;
  v12 = v8;
  v13 = static NSObject.== infix(_:_:)();

  if ((v13 & 1) != 0)
  {
    type metadata accessor for UIKitGestureRecognizer();
    v14 = swift_dynamicCastClass() != 0;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)largeContentViewerInteraction:(id)a3 didEndOnItem:(id)a4 atPoint:(CGPoint)a5
{
  id v7;
  _TtC7SwiftUI37UILargeContentViewerInteractionBridge *v8;

  v7 = a3;
  swift_unknownObjectRetain();
  v8 = self;
  specialized UILargeContentViewerInteractionBridge.largeContentViewerInteraction(_:didEndOn:at:)((uint64_t)a4);

  swift_unknownObjectRelease();
}

- (id)largeContentViewerInteraction:(id)a3 itemAtPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  _TtC7SwiftUI37UILargeContentViewerInteractionBridge *v8;
  void *v9;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = self;
  v9 = (void *)specialized UILargeContentViewerInteractionBridge.largeContentViewerInteraction(_:itemAt:)(x, y);

  return v9;
}

@end
