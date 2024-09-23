@implementation EmptyViewFactory.MissingLayer

- (void)drawInContext:(CGContext *)a3
{
  CGContext *v4;
  _TtCV7SwiftUI16EmptyViewFactoryP33_7A45621CE16223183E03CAC88E8C5E6012MissingLayer *v5;

  v4 = a3;
  v5 = self;
  EmptyViewFactory.MissingLayer.draw(in:)(v4);

}

- (_TtCV7SwiftUI16EmptyViewFactoryP33_7A45621CE16223183E03CAC88E8C5E6012MissingLayer)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[EmptyViewFactory.MissingLayer init](&v3, sel_init);
}

- (_TtCV7SwiftUI16EmptyViewFactoryP33_7A45621CE16223183E03CAC88E8C5E6012MissingLayer)initWithLayer:(id)a3
{
  objc_class *ObjectType;
  uint64_t v5;
  _TtCV7SwiftUI16EmptyViewFactoryP33_7A45621CE16223183E03CAC88E8C5E6012MissingLayer *v6;
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
  v6 = -[EmptyViewFactory.MissingLayer initWithLayer:](&v8, sel_initWithLayer_, v5);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  return v6;
}

- (_TtCV7SwiftUI16EmptyViewFactoryP33_7A45621CE16223183E03CAC88E8C5E6012MissingLayer)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return -[EmptyViewFactory.MissingLayer initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
