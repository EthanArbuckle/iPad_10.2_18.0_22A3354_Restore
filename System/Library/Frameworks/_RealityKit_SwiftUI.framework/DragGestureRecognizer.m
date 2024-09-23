@implementation DragGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  @objc DragGestureRecognizer.touchesBegan(_:with:)(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, id))DragGestureRecognizer.touchesBegan(_:with:));
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  @objc DragGestureRecognizer.touchesBegan(_:with:)(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, id))DragGestureRecognizer.touchesEnded(_:with:));
}

- (void)onPanInternal:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t ObjectType;
  _TtC19_RealityKit_SwiftUI21DragGestureRecognizer *v13;

  v4 = a3;
  v13 = self;
  v5 = -[DragGestureRecognizer view](v13, sel_view);
  objc_msgSend(v4, sel_locationInView_, v5);
  v7 = v6;
  v9 = v8;

  v10 = (char *)v13 + OBJC_IVAR____TtC19_RealityKit_SwiftUI21DragGestureRecognizer_draggable;
  if (MEMORY[0x23B7D34DC]((char *)v13 + OBJC_IVAR____TtC19_RealityKit_SwiftUI21DragGestureRecognizer_draggable))
  {
    v11 = *((_QWORD *)v10 + 1);
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, _QWORD, uint64_t, uint64_t))(v11 + 24))(v7, v9, 0, ObjectType, v11);

    swift_unknownObjectRelease();
  }
  else
  {

  }
}

- (_TtC19_RealityKit_SwiftUI21DragGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _TtC19_RealityKit_SwiftUI21DragGestureRecognizer *result;

  if (a3)
  {
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  result = (_TtC19_RealityKit_SwiftUI21DragGestureRecognizer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  outlined destroy of weak RangefinderDelegate?((uint64_t)self + OBJC_IVAR____TtC19_RealityKit_SwiftUI21DragGestureRecognizer_draggable);
}

@end
