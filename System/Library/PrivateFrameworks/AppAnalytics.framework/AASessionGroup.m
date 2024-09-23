@implementation AASessionGroup

+ (AASessionGroup)default
{
  if (qword_1ED1CC1A8 != -1)
    swift_once();
  return (AASessionGroup *)(id)qword_1ED1CC1A0;
}

- (NSString)groupName
{
  void *v2;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A5F6410C();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setGroupName:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  v4 = sub_1A5F64130();
  v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___AASessionGroup_groupName);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (AASessionGroup)initWithGroupName:(id)a3
{
  objc_class *ObjectType;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType();
  v5 = sub_1A5F64130();
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___AASessionGroup_groupName);
  *v6 = v5;
  v6[1] = v7;
  v9.receiver = self;
  v9.super_class = ObjectType;
  return -[AASessionGroup init](&v9, sel_init);
}

- (AASessionGroup)init
{
  AASessionGroup *result;

  result = (AASessionGroup *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
