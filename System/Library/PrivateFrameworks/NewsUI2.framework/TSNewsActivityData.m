@implementation TSNewsActivityData

- (int64_t)activity
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___TSNewsActivityData_activity);
}

- (NSString)identifier
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1D6E26948();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (id)object
{
  return (id)swift_unknownObjectRetain();
}

- (NSArray)traits
{
  void *v2;

  sub_1D5F75020();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1D6E26D68();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (TSNewsActivityData)initWithActivity:(int64_t)a3 identifier:(id)a4
{
  void *v6;
  void *v7;
  TSNewsActivityData *v8;

  sub_1D6E26978();
  v6 = (void *)sub_1D6E26948();
  swift_bridgeObjectRelease();
  sub_1D5F75020();
  v7 = (void *)sub_1D6E26D68();
  v8 = -[TSNewsActivityData initWithActivity:identifier:object:traits:](self, sel_initWithActivity_identifier_object_traits_, a3, v6, 0, v7);

  return v8;
}

- (TSNewsActivityData)initWithActivity:(int64_t)a3 identifier:(id)a4 object:(id)a5
{
  objc_class *ObjectType;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  objc_super v13;

  ObjectType = (objc_class *)swift_getObjectType();
  v9 = sub_1D6E26978();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___TSNewsActivityData_activity) = (Class)a3;
  v10 = (uint64_t *)((char *)self + OBJC_IVAR___TSNewsActivityData_identifier);
  *v10 = v9;
  v10[1] = v11;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___TSNewsActivityData_object) = (Class)a5;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___TSNewsActivityData_traits) = (Class)MEMORY[0x1E0DEE9D8];
  v13.receiver = self;
  v13.super_class = ObjectType;
  swift_unknownObjectRetain();
  return -[TSNewsActivityData init](&v13, sel_init);
}

- (TSNewsActivityData)initWithActivity:(int64_t)a3 identifier:(id)a4 object:(id)a5 traits:(id)a6
{
  objc_class *ObjectType;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_class *v13;
  uint64_t *v14;
  objc_super v16;

  ObjectType = (objc_class *)swift_getObjectType();
  v10 = sub_1D6E26978();
  v12 = v11;
  sub_1D5F75020();
  v13 = (objc_class *)sub_1D6E26D80();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___TSNewsActivityData_activity) = (Class)a3;
  v14 = (uint64_t *)((char *)self + OBJC_IVAR___TSNewsActivityData_identifier);
  *v14 = v10;
  v14[1] = v12;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___TSNewsActivityData_object) = (Class)a5;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___TSNewsActivityData_traits) = v13;
  v16.receiver = self;
  v16.super_class = ObjectType;
  swift_unknownObjectRetain();
  return -[TSNewsActivityData init](&v16, sel_init);
}

+ (int64_t)convertToArticleTraitWithTrait:(int64_t)a3
{
  int64_t result;

  result = a3;
  if ((unint64_t)a3 >= 4)
  {
    result = sub_1D6E28328();
    __break(1u);
  }
  return result;
}

- (TSNewsActivityData)init
{
  TSNewsActivityData *result;

  result = (TSNewsActivityData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
}

- (NSString)description
{
  TSNewsActivityData *v2;
  void *v3;

  v2 = self;
  BridgedNewsActivityData.description.getter();

  v3 = (void *)sub_1D6E26948();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

@end
