@implementation UIHostingViewDebugLayer

- (NSString)name
{
  _TtC7SwiftUI23UIHostingViewDebugLayer *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = UIHostingViewDebugLayer.name.getter();
  v5 = v4;

  if (v5)
  {
    v6 = (void *)MEMORY[0x18D75CC88](v3, v5);
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  return (NSString *)v6;
}

- (_TtC7SwiftUI23UIHostingViewDebugLayer)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[UIHostingViewDebugLayer init](&v3, sel_init);
}

- (void)setName:(id)a3
{
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC7SwiftUI23UIHostingViewDebugLayer *v9;
  _TtC7SwiftUI23UIHostingViewDebugLayer *v10;
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
  -[UIHostingViewDebugLayer setName:](&v11, sel_setName_, a3);

}

- (_TtC7SwiftUI23UIHostingViewDebugLayer)initWithLayer:(id)a3
{
  objc_class *ObjectType;
  uint64_t v5;
  _TtC7SwiftUI23UIHostingViewDebugLayer *v6;
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
  v6 = -[UIHostingViewDebugLayer initWithLayer:](&v8, sel_initWithLayer_, v5);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  return v6;
}

- (_TtC7SwiftUI23UIHostingViewDebugLayer)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return -[UIHostingViewDebugLayer initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
