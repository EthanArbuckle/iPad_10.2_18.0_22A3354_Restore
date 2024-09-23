@implementation ObjCFinalizedTimestamp

- (ObjCReplica)replica
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t (*v10)(_QWORD);
  objc_class *v11;
  char *v12;
  ObjCFinalizedTimestamp *v13;
  ObjCFinalizedTimestamp *v14;
  objc_super v16;

  v3 = sub_1BE1B1F58();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for FinalizedTimestamp(0);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BDD9C318((uint64_t)self + OBJC_IVAR___ObjCFinalizedTimestamp_timestamp, (uint64_t)v9, v10);
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v9, v3);
  v11 = (objc_class *)type metadata accessor for ObjCReplica(0);
  v12 = (char *)objc_allocWithZone(v11);
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(&v12[OBJC_IVAR___ObjCReplica_uuid], v6, v3);
  *(_QWORD *)&v12[OBJC_IVAR___ObjCReplica_index] = 0;
  v16.receiver = v12;
  v16.super_class = v11;
  v13 = self;
  v14 = -[ObjCFinalizedTimestamp init](&v16, sel_init);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return (ObjCReplica *)v14;
}

- (int64_t)counter
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___ObjCFinalizedTimestamp_timestamp;
  return *(_QWORD *)&v2[*(int *)(type metadata accessor for FinalizedTimestamp(0) + 20)];
}

- (ObjCFinalizedTimestamp)initWithReplica:(id)a3 counter:(int64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  objc_class *v12;
  uint64_t v14;
  objc_super v15;

  v7 = type metadata accessor for FinalizedTimestamp(0);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (char *)a3 + OBJC_IVAR___ObjCReplica_uuid;
  swift_beginAccess();
  v11 = sub_1BE1B1F58();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
  *(_QWORD *)&v9[*(int *)(v7 + 20)] = a4;
  sub_1BDDA2E8C((uint64_t)v9, (uint64_t)self + OBJC_IVAR___ObjCFinalizedTimestamp_timestamp, type metadata accessor for FinalizedTimestamp);
  v12 = (objc_class *)type metadata accessor for ObjCFinalizedTimestamp(0);
  v15.receiver = self;
  v15.super_class = v12;
  return -[ObjCFinalizedTimestamp init](&v15, sel_init);
}

- (BOOL)isGreaterThanTimestamp:(id)a3
{
  id v4;
  ObjCFinalizedTimestamp *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1BE0EDFEC((uint64_t)v4);

  return self & 1;
}

- (BOOL)isEqual:(id)a3
{
  ObjCFinalizedTimestamp *v4;
  ObjCFinalizedTimestamp *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1BE1B2F3C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_1BE0EE148((uint64_t)v8);

  sub_1BDD86E30((uint64_t)v8, qword_1EF52B750);
  return v6 & 1;
}

- (int64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  ObjCFinalizedTimestamp *v6;
  int64_t v7;
  uint64_t v9;

  v3 = type metadata accessor for FinalizedTimestamp(0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BDD9C318((uint64_t)self + OBJC_IVAR___ObjCFinalizedTimestamp_timestamp, (uint64_t)v5, type metadata accessor for FinalizedTimestamp);
  sub_1BE1B36F8();
  v6 = self;
  sub_1BE1B1F28();
  sub_1BE1B3704();
  v7 = sub_1BE1B371C();
  sub_1BDD9C3E0((uint64_t)v5, type metadata accessor for FinalizedTimestamp);

  return v7;
}

- (NSString)description
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  ObjCFinalizedTimestamp *v6;
  void *v7;
  uint64_t v9;

  v3 = type metadata accessor for FinalizedTimestamp(0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BDD9C318((uint64_t)self + OBJC_IVAR___ObjCFinalizedTimestamp_timestamp, (uint64_t)v5, type metadata accessor for FinalizedTimestamp);
  v6 = self;
  FinalizedTimestamp.description.getter();
  sub_1BDD9C3E0((uint64_t)v5, type metadata accessor for FinalizedTimestamp);

  v7 = (void *)sub_1BE1B27A4();
  swift_bridgeObjectRelease();
  return (NSString *)v7;
}

- (ObjCFinalizedTimestamp)init
{
  ObjCFinalizedTimestamp *result;

  result = (ObjCFinalizedTimestamp *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1BDD9C3E0((uint64_t)self + OBJC_IVAR___ObjCFinalizedTimestamp_timestamp, type metadata accessor for FinalizedTimestamp);
}

@end
