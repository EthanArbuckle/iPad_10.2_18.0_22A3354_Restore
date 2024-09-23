@implementation WeakNotificationObserver

- (void)dealloc
{
  void *v3;
  _TtC15HealthRecordsUI24WeakNotificationObserver *v4;
  objc_super v5;

  v3 = (void *)MEMORY[0x1BCCF37A4]((char *)self + OBJC_IVAR____TtC15HealthRecordsUI24WeakNotificationObserver_center, a2);
  v4 = self;
  if (v3)
  {
    objc_msgSend(v3, sel_removeObserver_, v4);

  }
  v5.receiver = v4;
  v5.super_class = (Class)type metadata accessor for WeakNotificationObserver();
  -[WeakNotificationObserver dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI24WeakNotificationObserver_scheduler);
  swift_release();
  swift_unknownObjectWeakDestroy();
}

- (void)didReceiveWithNotification:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t (*)(), uint64_t, uint64_t, uint64_t);
  _TtC15HealthRecordsUI24WeakNotificationObserver *v17;
  _QWORD v18[2];

  v4 = sub_1BC62A364();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)v18 - v9;
  sub_1BC62A334();
  v11 = *(_QWORD *)&self->scheduler[OBJC_IVAR____TtC15HealthRecordsUI24WeakNotificationObserver_block];
  v18[0] = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15HealthRecordsUI24WeakNotificationObserver_block);
  v12 = *(_QWORD *)&self->scheduler[OBJC_IVAR____TtC15HealthRecordsUI24WeakNotificationObserver_scheduler + 16];
  v13 = *(_QWORD *)&self->scheduler[OBJC_IVAR____TtC15HealthRecordsUI24WeakNotificationObserver_scheduler + 24];
  v18[1] = __swift_project_boxed_opaque_existential_1Tm((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15HealthRecordsUI24WeakNotificationObserver_scheduler), v12);
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v7, v10, v4);
  v14 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v18[0];
  *(_QWORD *)(v15 + 24) = v11;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v15 + v14, v7, v4);
  v16 = *(void (**)(uint64_t (*)(), uint64_t, uint64_t, uint64_t))(v13 + 8);
  v17 = self;
  swift_retain();
  v16(sub_1BC53C918, v15, v12, v13);

  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
}

- (_TtC15HealthRecordsUI24WeakNotificationObserver)init
{
  _TtC15HealthRecordsUI24WeakNotificationObserver *result;

  result = (_TtC15HealthRecordsUI24WeakNotificationObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
