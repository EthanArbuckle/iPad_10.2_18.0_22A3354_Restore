@implementation ObjCTimestamp

- (ObjCReplica)replica
{
  ObjCTimestamp *v2;
  id v3;

  v2 = self;
  v3 = sub_1BDF006D8();

  return (ObjCReplica *)v3;
}

- (int64_t)counter
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___ObjCTimestamp_timestamp;
  return *(_QWORD *)&v2[*(int *)(type metadata accessor for Timestamp(0) + 20)];
}

- (ObjCTimestamp)initWithReplica:(id)a3 counter:(int64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  objc_class *v13;
  uint64_t v15;
  objc_super v16;

  v7 = type metadata accessor for Timestamp(0);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (char *)a3 + OBJC_IVAR___ObjCReplica_uuid;
  swift_beginAccess();
  v11 = sub_1BE1B1F58();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
  v12 = *(_QWORD *)((char *)a3 + OBJC_IVAR___ObjCReplica_index);
  *(_QWORD *)&v9[*(int *)(type metadata accessor for Replica() + 20)] = v12;
  *(_QWORD *)&v9[*(int *)(v7 + 20)] = a4;
  sub_1BDDA2E8C((uint64_t)v9, (uint64_t)self + OBJC_IVAR___ObjCTimestamp_timestamp, type metadata accessor for Timestamp);
  v13 = (objc_class *)type metadata accessor for ObjCTimestamp(0);
  v16.receiver = self;
  v16.super_class = v13;
  return -[ObjCTimestamp init](&v16, sel_init);
}

- (NSString)description
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  ObjCTimestamp *v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[4];

  v3 = type metadata accessor for Timestamp(0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BDD9C318((uint64_t)self + OBJC_IVAR___ObjCTimestamp_timestamp, (uint64_t)v5, type metadata accessor for Timestamp);
  v6 = self;
  v10[2] = sub_1BE128350();
  v10[3] = v7;
  sub_1BE1B284C();
  v10[1] = *(_QWORD *)&v5[*(int *)(v3 + 20)];
  sub_1BE1B32E4();
  sub_1BE1B284C();
  swift_bridgeObjectRelease();
  sub_1BE1B284C();
  sub_1BDD9C3E0((uint64_t)v5, type metadata accessor for Timestamp);

  v8 = (void *)sub_1BE1B27A4();
  swift_bridgeObjectRelease();
  return (NSString *)v8;
}

- (ObjCTimestamp)init
{
  ObjCTimestamp *result;

  result = (ObjCTimestamp *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1BDD9C3E0((uint64_t)self + OBJC_IVAR___ObjCTimestamp_timestamp, type metadata accessor for Timestamp);
}

@end
