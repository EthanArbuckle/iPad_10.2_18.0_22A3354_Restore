@implementation IMPersistentMenuItem

- (int64_t)type
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___IMPersistentMenuItem_type);
}

- (IMAttributableContent)content
{
  return (IMAttributableContent *)(id)swift_unknownObjectRetain();
}

- (IMPersistentMenuItem)initWithType:(int64_t)a3 content:(id)a4
{
  objc_super v5;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMPersistentMenuItem_type) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMPersistentMenuItem_content) = (Class)a4;
  v5.receiver = self;
  v5.super_class = (Class)IMPersistentMenuItem;
  swift_unknownObjectRetain();
  return -[IMPersistentMenuItem init](&v5, sel_init);
}

- (IMPersistentMenuItem)initWithDictionary:(id)a3
{
  uint64_t v3;

  v3 = sub_19E36F828();
  return (IMPersistentMenuItem *)IMPersistentMenuItem.init(dictionary:)(v3);
}

- (id)dictionaryRepresentation
{
  IMPersistentMenuItem *v2;
  void *v3;

  v2 = self;
  sub_19E347230();

  v3 = (void *)sub_19E36F81C();
  swift_bridgeObjectRelease();
  return v3;
}

+ (id)contentWithType:(int64_t)a3 dictionary:(id)a4
{
  id v5;

  sub_19E36F828();
  v5 = sub_19E3474FC(a3);
  swift_bridgeObjectRelease();
  return v5;
}

- (IMPersistentMenuItem)init
{
  IMPersistentMenuItem *result;

  result = (IMPersistentMenuItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

@end
