@implementation FormatLayoutViewToken

- (_TtC8NewsFeed21FormatLayoutViewToken)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8NewsFeed21FormatLayoutViewToken_children) = (Class)MEMORY[0x1E0DEE9D8];
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[FormatLayoutViewToken init](&v5, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
