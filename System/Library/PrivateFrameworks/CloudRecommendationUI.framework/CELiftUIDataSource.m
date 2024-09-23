@implementation CELiftUIDataSource

- (_TtC21CloudRecommendationUI18CELiftUIDataSource)initWithAccount:(id)a3
{
  objc_class *ObjectType;
  id v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  *(_OWORD *)((char *)&self->super.isa
            + OBJC_IVAR____TtC21CloudRecommendationUI18CELiftUIDataSource____lazy_storage___backupDeviceUUID) = xmmword_23818BA30;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC21CloudRecommendationUI18CELiftUIDataSource_account) = (Class)a3;
  v8.receiver = self;
  v8.super_class = ObjectType;
  v6 = a3;
  return -[CELiftUIDataSource init](&v8, sel_init);
}

- (_TtC21CloudRecommendationUI18CELiftUIDataSource)init
{
  _TtC21CloudRecommendationUI18CELiftUIDataSource *result;

  result = (_TtC21CloudRecommendationUI18CELiftUIDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  sub_238181084(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC21CloudRecommendationUI18CELiftUIDataSource____lazy_storage___backupDeviceUUID), *(_QWORD *)&self->account[OBJC_IVAR____TtC21CloudRecommendationUI18CELiftUIDataSource____lazy_storage___backupDeviceUUID]);
}

@end
