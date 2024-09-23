@implementation ImageLayer

- (_TtC7SwiftUI10ImageLayer)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[ImageLayer init](&v3, sel_init);
}

- (_TtC7SwiftUI10ImageLayer)initWithLayer:(id)a3
{
  objc_class *ObjectType;
  uint64_t v5;
  _TtC7SwiftUI10ImageLayer *v6;
  objc_super v8;
  _QWORD v9[4];

  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectRetain();
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  __swift_project_boxed_opaque_existential_1(v9, v9[3]);
  v5 = _bridgeAnythingToObjectiveC<A>(_:)();
  v8.receiver = self;
  v8.super_class = ObjectType;
  v6 = -[ImageLayer initWithLayer:](&v8, sel_initWithLayer_, v5);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  return v6;
}

- (_TtC7SwiftUI10ImageLayer)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return -[ImageLayer initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
