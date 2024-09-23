@implementation DEStagingEntry

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  _TtC8Dendrite14DEStagingEntry *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Dendrite14DEStagingEntry_id);
  v5 = a3;
  v6 = self;
  v7 = (void *)sub_23A362BA4();
  objc_msgSend(v5, sel_encodeInt64_forKey_, v4, v7);

  v8 = (void *)sub_23A362A84();
  v9 = (id)sub_23A362BA4();
  objc_msgSend(v5, sel_encodeObject_forKey_, v8, v9);

}

- (_TtC8Dendrite14DEStagingEntry)initWithCoder:(id)a3
{
  return (_TtC8Dendrite14DEStagingEntry *)DEStagingEntry.init(coder:)(a3);
}

- (int64_t)id
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Dendrite14DEStagingEntry_id);
}

- (NSData)payload
{
  uint64_t v2;
  unint64_t v3;
  void *v4;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Dendrite14DEStagingEntry_payload);
  v3 = *(_QWORD *)&self->id[OBJC_IVAR____TtC8Dendrite14DEStagingEntry_payload];
  sub_23A333494(v2, v3);
  v4 = (void *)sub_23A362A84();
  sub_23A33350C(v2, v3);
  return (NSData *)v4;
}

- (_TtC8Dendrite14DEStagingEntry)initWithId:(int64_t)a3 payload:(id)a4
{
  objc_class *ObjectType;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  objc_super v14;

  ObjectType = (objc_class *)swift_getObjectType();
  v8 = a4;
  v9 = sub_23A362A90();
  v11 = v10;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Dendrite14DEStagingEntry_id) = (Class)a3;
  v12 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8Dendrite14DEStagingEntry_payload);
  *v12 = v9;
  v12[1] = v11;
  v14.receiver = self;
  v14.super_class = ObjectType;
  return -[DEStagingEntry init](&v14, sel_init);
}

- (_TtC8Dendrite14DEStagingEntry)init
{
  _TtC8Dendrite14DEStagingEntry *result;

  result = (_TtC8Dendrite14DEStagingEntry *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_23A33350C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Dendrite14DEStagingEntry_payload), *(_QWORD *)&self->id[OBJC_IVAR____TtC8Dendrite14DEStagingEntry_payload]);
}

@end
