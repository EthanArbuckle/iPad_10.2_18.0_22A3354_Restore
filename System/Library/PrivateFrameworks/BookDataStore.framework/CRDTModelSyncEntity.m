@implementation CRDTModelSyncEntity

- (void)configureFromCloudData:(id)a3 withMergers:(id)a4
{
  uint64_t v4;
  _TtC13BookDataStore19CRDTModelSyncEntity *v7;

  v4 = (uint64_t)a4;
  if (a4)
  {
    sub_227D68330(&qword_2559288E0);
    v4 = sub_227E5FEDC();
  }
  swift_unknownObjectRetain();
  v7 = self;
  sub_227DD9914(a3, v4);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (BOOL)isEqualExceptForDate:(id)a3 ignoringEmptySalt:(BOOL)a4
{
  _TtC13BookDataStore19CRDTModelSyncEntity *v7;
  char v8;

  swift_unknownObjectRetain();
  v7 = self;
  v8 = sub_227DDAF60((uint64_t)a3, a4);
  swift_unknownObjectRelease();

  return v8 & 1;
}

- (void)resolveConflictsFromRecord:(id)a3 withResolvers:(id)a4
{
  uint64_t v4;
  id v7;
  _TtC13BookDataStore19CRDTModelSyncEntity *v8;

  v4 = (uint64_t)a4;
  if (a4)
  {
    sub_227D68330(&qword_2559288E0);
    v4 = sub_227E5FEDC();
  }
  v7 = a3;
  v8 = self;
  sub_227DDB20C(v7, v4);

  swift_bridgeObjectRelease();
}

+ (id)propertyIDKey
{
  return (id)sub_227E5FF78();
}

- (_TtC13BookDataStore19CRDTModelSyncEntity)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CRDTModelSyncEntity();
  return -[CRDTModelSyncEntity initWithEntity:insertIntoManagedObjectContext:](&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a3, a4);
}

- (void).cxx_construct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC13BookDataStore19CRDTModelSyncEntity____lazy_storage___logger;
  v3 = sub_227E5F588();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(v2, 1, 1, v3);
}

- (void).cxx_destruct
{
  sub_227D5809C((uint64_t)self + OBJC_IVAR____TtC13BookDataStore19CRDTModelSyncEntity____lazy_storage___logger, &qword_255928970);
}

- (id)mutableCopy
{
  id v3;
  _TtC13BookDataStore19CRDTModelSyncEntity *v4;
  id result;
  id v6;

  v3 = objc_allocWithZone((Class)type metadata accessor for CRDTModelSync());
  v4 = self;
  result = objc_msgSend(v3, sel_initWithCloudData_, v4);
  if (result)
  {
    v6 = result;

    return v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (NSString)debugDescription
{
  id v2;
  NSString *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CRDTModelSyncEntity();
  v2 = v6.receiver;
  v3 = -[CRDTModelSyncEntity debugDescription](&v6, sel_debugDescription);
  sub_227E5FF84();

  sub_227DDD754(v2);
  swift_bridgeObjectRetain();
  sub_227E6002C();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = (void *)sub_227E5FF78();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (id)recordType
{
  _TtC13BookDataStore19CRDTModelSyncEntity *v2;
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;

  v2 = self;
  v3 = -[CRDTModelSyncEntity type](v2, sel_type);
  v4 = sub_227E5FF84();
  v6 = v5;

  sub_227E60068();
  v7 = sub_227E5FFCC();
  v9 = v8;
  swift_bridgeObjectRelease();
  sub_227DD92EC(15, v7, v9, v4, v6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v10 = (void *)sub_227E5FF78();
  swift_bridgeObjectRelease();
  return v10;
}

- (id)identifier
{
  _TtC13BookDataStore19CRDTModelSyncEntity *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_227DDD88C(v2);
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_227E5FF78();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)zoneName
{
  _TtC13BookDataStore19CRDTModelSyncEntity *v2;
  id v3;
  void *v4;

  v2 = self;
  v3 = -[CRDTModelSyncEntity type](v2, sel_type);
  sub_227E5FF84();

  v4 = (void *)sub_227E5FF78();
  swift_bridgeObjectRelease();
  return v4;
}

@end
