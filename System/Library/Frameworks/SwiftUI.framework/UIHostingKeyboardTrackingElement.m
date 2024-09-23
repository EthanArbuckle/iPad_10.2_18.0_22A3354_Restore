@implementation UIHostingKeyboardTrackingElement

- (void)keyboardIsChangingSize:(CGSize)a3
{
  double height;
  double width;
  char *v6;
  uint64_t v7;
  uint64_t ObjectType;
  void (*v9)(uint64_t, uint64_t, double, double);
  _TtC7SwiftUI32UIHostingKeyboardTrackingElement *v10;

  height = a3.height;
  width = a3.width;
  v6 = (char *)self + OBJC_IVAR____TtC7SwiftUI32UIHostingKeyboardTrackingElement_element;
  if (MEMORY[0x18D760234]((char *)self + OBJC_IVAR____TtC7SwiftUI32UIHostingKeyboardTrackingElement_element, a2))
  {
    v7 = *((_QWORD *)v6 + 1);
    ObjectType = swift_getObjectType();
    v9 = *(void (**)(uint64_t, uint64_t, double, double))(v7 + 8);
    v10 = self;
    v9(ObjectType, v7, width, height);

    swift_unknownObjectRelease();
  }
}

- (void)keyboardIsChangingOffset:(UIOffset)a3
{
  double vertical;
  double horizontal;
  char *v5;
  uint64_t v6;
  uint64_t ObjectType;

  vertical = a3.vertical;
  horizontal = a3.horizontal;
  v5 = (char *)self + OBJC_IVAR____TtC7SwiftUI32UIHostingKeyboardTrackingElement_element;
  if (MEMORY[0x18D760234]((char *)self + OBJC_IVAR____TtC7SwiftUI32UIHostingKeyboardTrackingElement_element, a2))
  {
    v6 = *((_QWORD *)v5 + 1);
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, double, double))(v6 + 16))(ObjectType, v6, horizontal, vertical);
    swift_unknownObjectRelease();
  }
}

- (_TtC7SwiftUI32UIHostingKeyboardTrackingElement)init
{
  _TtC7SwiftUI32UIHostingKeyboardTrackingElement *result;

  result = (_TtC7SwiftUI32UIHostingKeyboardTrackingElement *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  outlined destroy of weak FallbackResponderProvider?((uint64_t)self + OBJC_IVAR____TtC7SwiftUI32UIHostingKeyboardTrackingElement_element);
}

@end
