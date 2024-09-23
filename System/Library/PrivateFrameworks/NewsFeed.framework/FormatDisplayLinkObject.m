@implementation FormatDisplayLinkObject

- (void)setValue:(id)a3 forKey:(id)a4
{
  sub_1BB4D5840(self, (uint64_t)a2, (uint64_t)a3, a4, 0);
}

- (void)setValue:(id)a3 forKeyPath:(id)a4
{
  sub_1BB4D5840(self, (uint64_t)a2, (uint64_t)a3, a4, 1);
}

- (id)valueForKey:(id)a3
{
  return sub_1BB4D59C4(self, (uint64_t)a2, (uint64_t)a3, 0);
}

- (id)valueForKeyPath:(id)a3
{
  return sub_1BB4D59C4(self, (uint64_t)a2, (uint64_t)a3, 1);
}

- (_TtC8NewsFeed23FormatDisplayLinkObject)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8NewsFeed23FormatDisplayLinkObject_storage) = (Class)MEMORY[0x1E0DEE9E0];
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[FormatDisplayLinkObject init](&v5, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
