@implementation MapsSyncMutableBaseItem

- (_TtC8MapsSync23MapsSyncMutableBaseItem)initWithProxyObject:(id)a3
{
  id v4;
  objc_super v6;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject) = (Class)a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for MapsSyncMutableBaseItem();
  v4 = a3;
  return -[MapsSyncMutableBaseItem init](&v6, sel_init);
}

- (NSManagedObjectContext)context
{
  void *v2;
  _TtC8MapsSync23MapsSyncMutableBaseItem *v3;
  NSManagedObjectContext *result;
  NSManagedObjectContext *v5;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject);
  v3 = self;
  result = (NSManagedObjectContext *)objc_msgSend(v2, sel_managedObjectContext);
  if (result)
  {
    v5 = result;

    return v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (NSManagedObject)proxyObject
{
  return (NSManagedObject *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                    + OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject));
}

- (NSUUID)identifier
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _TtC8MapsSync23MapsSyncMutableBaseItem *v7;
  void *v8;
  uint64_t v10;

  v3 = sub_1A423BFE4();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_1A41CEB70((uint64_t)v6);

  v8 = (void *)sub_1A423BFC0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSUUID *)v8;
}

- (void)setIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _TtC8MapsSync23MapsSyncMutableBaseItem *v7;
  uint64_t v8;

  v4 = sub_1A423BFE4();
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A423BFCC();
  v7 = self;
  sub_1A41CECC4((uint64_t)v6);

}

- (NSDate)createTime
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  _TtC8MapsSync23MapsSyncMutableBaseItem *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v15;
  _QWORD v16[3];
  uint64_t v17;
  uint64_t v18;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB5D0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v16[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject);
  v6 = v15;
  sub_1A40D19C0(0, (unint64_t *)&unk_1ED1AB500);
  v7 = self;
  v8 = v6;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED1AB4F0);
  swift_dynamicCast();
  v9 = v17;
  v10 = v18;
  __swift_project_boxed_opaque_existential_0(v16, v17);
  (*(void (**)(uint64_t, uint64_t))(v10 + 32))(v9, v10);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);

  v11 = sub_1A423BF9C();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v5, 1, v11) != 1)
  {
    v13 = (void *)sub_1A423BF6C();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v5, v11);
  }
  return (NSDate *)v13;
}

- (void)setCreateTime:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _TtC8MapsSync23MapsSyncMutableBaseItem *v10;
  uint64_t v11;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB5D0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_1A423BF84();
    v8 = sub_1A423BF9C();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    v9 = sub_1A423BF9C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = self;
  sub_1A41CF230((uint64_t)v7);

}

- (int64_t)positionIndex
{
  void *v3;
  _TtC8MapsSync23MapsSyncMutableBaseItem *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  _QWORD v10[3];
  uint64_t v11;
  uint64_t v12;

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject);
  sub_1A40D19C0(0, (unint64_t *)&unk_1ED1AB500);
  v4 = self;
  v5 = v3;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED1AB4F0);
  swift_dynamicCast();
  v6 = v11;
  v7 = v12;
  __swift_project_boxed_opaque_existential_0(v10, v11);
  v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 80))(v6, v7);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v10);

  return v8;
}

- (void)setPositionIndex:(int64_t)a3
{
  void *v5;
  _TtC8MapsSync23MapsSyncMutableBaseItem *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE v10[24];
  uint64_t v11;
  uint64_t v12;

  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject);
  sub_1A40D19C0(0, (unint64_t *)&unk_1ED1AB500);
  v6 = self;
  v7 = v5;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED1AB4F0);
  swift_dynamicCast();
  v8 = v11;
  v9 = v12;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v10, v11);
  (*(void (**)(int64_t, uint64_t, uint64_t))(v9 + 88))(a3, v8, v9);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v10);

}

- (_TtC8MapsSync23MapsSyncMutableBaseItem)init
{
  _TtC8MapsSync23MapsSyncMutableBaseItem *result;

  result = (_TtC8MapsSync23MapsSyncMutableBaseItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
