@implementation ObjCReplica

- (NSUUID)uuid
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  void *v8;
  uint64_t v10;

  v3 = sub_1BE1B1F58();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self + OBJC_IVAR___ObjCReplica_uuid;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v7, v3);
  v8 = (void *)sub_1BE1B1F04();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSUUID *)v8;
}

- (void)setUuid:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  void (*v9)(char *, char *, uint64_t);
  ObjCReplica *v10;
  uint64_t v11;

  v4 = sub_1BE1B1F58();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BE1B1F1C();
  v8 = (char *)self + OBJC_IVAR___ObjCReplica_uuid;
  swift_beginAccess();
  v9 = *(void (**)(char *, char *, uint64_t))(v5 + 40);
  v10 = self;
  v9(v8, v7, v4);
  swift_endAccess();

}

- (int64_t)index
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___ObjCReplica_index);
}

- (void)setIndex:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ObjCReplica_index) = (Class)a3;
}

- (ObjCReplica)initWithUuid:(id)a3 index:(int64_t)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  objc_class *v10;
  ObjCReplica *v11;
  objc_super v13;

  v6 = sub_1BE1B1F58();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BE1B1F1C();
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))((char *)self + OBJC_IVAR___ObjCReplica_uuid, v9, v6);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ObjCReplica_index) = (Class)a4;
  v10 = (objc_class *)type metadata accessor for ObjCReplica(0);
  v13.receiver = self;
  v13.super_class = v10;
  v11 = -[ObjCReplica init](&v13, sel_init);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v11;
}

- (ObjCReplica)init
{
  ObjCReplica *result;

  result = (ObjCReplica *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR___ObjCReplica_uuid;
  v3 = sub_1BE1B1F58();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
