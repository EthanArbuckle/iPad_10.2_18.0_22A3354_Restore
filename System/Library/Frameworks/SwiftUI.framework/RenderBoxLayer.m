@implementation RenderBoxLayer

- (BOOL)needsSynchronousUpdate
{
  _TtC7SwiftUIP33_0CB954C9DC99A8A907C58D7882F9389E14RenderBoxLayer *v2;
  char v3;

  v2 = self;
  v3 = RenderBoxLayer.needsSynchronousUpdate.getter();

  return v3 & 1;
}

- (void)setNeedsSynchronousUpdate:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v4;

  v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  -[RBLayer setNeedsSynchronousUpdate:](&v4, sel_setNeedsSynchronousUpdate_, v3);
}

- (_TtC7SwiftUIP33_0CB954C9DC99A8A907C58D7882F9389E14RenderBoxLayer)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[RBLayer init](&v3, sel_init);
}

- (_TtC7SwiftUIP33_0CB954C9DC99A8A907C58D7882F9389E14RenderBoxLayer)initWithLayer:(id)a3
{
  objc_class *ObjectType;
  uint64_t v5;
  _TtC7SwiftUIP33_0CB954C9DC99A8A907C58D7882F9389E14RenderBoxLayer *v6;
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
  v6 = -[RBLayer initWithLayer:](&v8, sel_initWithLayer_, v5);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  return v6;
}

- (_TtC7SwiftUIP33_0CB954C9DC99A8A907C58D7882F9389E14RenderBoxLayer)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return -[RBLayer initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
