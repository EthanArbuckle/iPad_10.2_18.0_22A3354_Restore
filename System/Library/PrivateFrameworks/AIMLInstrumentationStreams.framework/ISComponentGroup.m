@implementation ISComponentGroup

- (ISComponentGroup)initWithEventsBridge:(id)a3
{
  objc_super v5;

  sub_21DC4D7B8();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ISComponentGroup_eventsInternal) = (Class)sub_21DC71B70();
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ComponentGroupBridge();
  return -[ISComponentGroup init](&v5, sel_init);
}

- (NSArray)events
{
  void *v2;

  sub_21DC4D7B8();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_21DC71B64();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (ISComponentIdentifier)componentIdentifier
{
  ISComponentGroup *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_21DC616B4();
  v4 = v3;

  return (ISComponentIdentifier *)v4;
}

- (ISComponentGroup)init
{
  ISComponentGroup *result;

  result = (ISComponentGroup *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
