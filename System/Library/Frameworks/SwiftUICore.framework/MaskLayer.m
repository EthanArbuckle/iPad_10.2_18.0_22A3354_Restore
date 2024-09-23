@implementation MaskLayer

- (_TtC7SwiftUI9MaskLayer)init
{
  objc_class *ObjectType;
  _OWORD *v4;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7SwiftUI9MaskLayer_clips) = (Class)MEMORY[0x24BEE4AF8];
  v4 = (_OWORD *)((char *)self + OBJC_IVAR____TtC7SwiftUI9MaskLayer_clipTransform);
  *v4 = 0u;
  v4[1] = 0u;
  v4[2] = 0u;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return -[MaskLayer init](&v6, sel_init);
}

- (_TtC7SwiftUI9MaskLayer)initWithLayer:(id)a3
{
  objc_class *ObjectType;
  _OWORD *v5;
  uint64_t v6;
  _TtC7SwiftUI9MaskLayer *v7;
  objc_super v9;
  _QWORD v10[4];

  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectRetain();
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7SwiftUI9MaskLayer_clips) = (Class)MEMORY[0x24BEE4AF8];
  v5 = (_OWORD *)((char *)self + OBJC_IVAR____TtC7SwiftUI9MaskLayer_clipTransform);
  *v5 = 0u;
  v5[1] = 0u;
  v5[2] = 0u;
  __swift_project_boxed_opaque_existential_1(v10, v10[3]);
  v6 = _bridgeAnythingToObjectiveC<A>(_:)();
  v9.receiver = self;
  v9.super_class = ObjectType;
  v7 = -[MaskLayer initWithLayer:](&v9, sel_initWithLayer_, v6);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  return v7;
}

- (_TtC7SwiftUI9MaskLayer)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  _OWORD *v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7SwiftUI9MaskLayer_clips) = (Class)MEMORY[0x24BEE4AF8];
  v6 = (_OWORD *)((char *)self + OBJC_IVAR____TtC7SwiftUI9MaskLayer_clipTransform);
  *v6 = 0u;
  v6[1] = 0u;
  v6[2] = 0u;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return -[MaskLayer initWithCoder:](&v8, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
