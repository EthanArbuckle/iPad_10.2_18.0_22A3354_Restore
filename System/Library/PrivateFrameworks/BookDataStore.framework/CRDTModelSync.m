@implementation CRDTModelSync

- (_TtC13BookDataStore13CRDTModelSync)init
{
  objc_class *ObjectType;
  _QWORD *v4;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC13BookDataStore13CRDTModelSync_type);
  *v4 = 0;
  v4[1] = 0xE000000000000000;
  *(_OWORD *)((char *)&self->super.super.isa + OBJC_IVAR____TtC13BookDataStore13CRDTModelSync_protoData) = xmmword_227E6F050;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return -[BCMutableCloudData init](&v6, sel_init);
}

- (_TtC13BookDataStore13CRDTModelSync)initWithCloudData:(id)a3
{
  swift_unknownObjectRetain();
  return (_TtC13BookDataStore13CRDTModelSync *)sub_227DDCCF4((uint64_t)a3);
}

- (_TtC13BookDataStore13CRDTModelSync)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC13BookDataStore13CRDTModelSync *result;

  v4 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC13BookDataStore13CRDTModelSync_type);
  *v4 = 0;
  v4[1] = 0xE000000000000000;
  *(_OWORD *)((char *)&self->super.super.isa + OBJC_IVAR____TtC13BookDataStore13CRDTModelSync_protoData) = xmmword_227E6F050;
  v5 = a3;

  result = (_TtC13BookDataStore13CRDTModelSync *)sub_227E60560();
  __break(1u);
  return result;
}

- (_TtC13BookDataStore13CRDTModelSync)initWithRecord:(id)a3
{
  id v3;
  _TtC13BookDataStore13CRDTModelSync *result;

  v3 = a3;
  result = (_TtC13BookDataStore13CRDTModelSync *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_227DD7918(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC13BookDataStore13CRDTModelSync_protoData), *(_QWORD *)(&self->super._deletedFlag + OBJC_IVAR____TtC13BookDataStore13CRDTModelSync_protoData));
}

- (NSString)debugDescription
{
  _TtC13BookDataStore13CRDTModelSync *v2;
  void *v3;

  v2 = self;
  sub_227DDD0C8();

  v3 = (void *)sub_227E5FF78();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (id)recordType
{
  uint64_t v2;
  unint64_t v3;
  _TtC13BookDataStore13CRDTModelSync *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;

  v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC13BookDataStore13CRDTModelSync_type);
  v3 = *(_QWORD *)(&self->super._deletedFlag + OBJC_IVAR____TtC13BookDataStore13CRDTModelSync_type);
  v4 = self;
  swift_bridgeObjectRetain();
  sub_227E60068();
  v5 = sub_227E5FFCC();
  v7 = v6;
  swift_bridgeObjectRelease();
  sub_227DD92EC(15, v5, v7, v2, v3);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v8 = (void *)sub_227E5FF78();
  swift_bridgeObjectRelease();
  return v8;
}

- (id)identifier
{
  uint64_t v2;
  void *v3;

  sub_227DDD2F0();
  if (v2)
  {
    v3 = (void *)sub_227E5FF78();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)zoneName
{
  _TtC13BookDataStore13CRDTModelSync *v2;
  void *v3;

  v2 = self;
  swift_bridgeObjectRetain();
  v3 = (void *)sub_227E5FF78();

  swift_bridgeObjectRelease();
  return v3;
}

@end
