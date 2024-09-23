@implementation DoorUIAccessibilityElement

- (id)accessibilityExpandedTextValue
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_22758E1B4();
  swift_bridgeObjectRelease();
  return v2;
}

- (_TtC16MagnifierSupport26DoorUIAccessibilityElement)initWithAccessibilityContainer:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  _TtC16MagnifierSupport26DoorUIAccessibilityElement *v6;
  objc_super v8;
  _QWORD v9[4];

  swift_unknownObjectRetain();
  sub_22758EAB4();
  swift_unknownObjectRelease();
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC16MagnifierSupport26DoorUIAccessibilityElement_textValue);
  *v4 = 0;
  v4[1] = 0xE000000000000000;
  __swift_project_boxed_opaque_existential_1(v9, v9[3]);
  v5 = sub_22758EE44();
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for DoorUIAccessibilityElement();
  v6 = -[DoorUIAccessibilityElement initWithAccessibilityContainer:](&v8, sel_initWithAccessibilityContainer_, v5);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v9);
  return v6;
}

- (_TtC16MagnifierSupport26DoorUIAccessibilityElement)init
{
  _QWORD *v2;
  objc_super v4;

  v2 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC16MagnifierSupport26DoorUIAccessibilityElement_textValue);
  *v2 = 0;
  v2[1] = 0xE000000000000000;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DoorUIAccessibilityElement();
  return -[DoorUIAccessibilityElement init](&v4, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
