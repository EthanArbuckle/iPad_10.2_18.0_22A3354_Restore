@implementation WeakNotificationObserver

- (void)dealloc
{
  void *v3;
  _TtC19AppStoreKitInternal24WeakNotificationObserver *v4;
  objc_super v5;

  v3 = (void *)MEMORY[0x1DF085AC0]((char *)self + OBJC_IVAR____TtC19AppStoreKitInternal24WeakNotificationObserver_center, a2);
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
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC19AppStoreKitInternal24WeakNotificationObserver_scheduler);
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
  _TtC19AppStoreKitInternal24WeakNotificationObserver *v16;
  _QWORD v17[2];

  v4 = sub_1D89271CC();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)v17 - v9;
  sub_1D8927190();
  v12 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC19AppStoreKitInternal24WeakNotificationObserver_block);
  v11 = *(_QWORD *)&self->scheduler[OBJC_IVAR____TtC19AppStoreKitInternal24WeakNotificationObserver_block];
  v13 = *(_QWORD *)&self->scheduler[OBJC_IVAR____TtC19AppStoreKitInternal24WeakNotificationObserver_scheduler + 16];
  v17[1] = *(_QWORD *)&self->scheduler[OBJC_IVAR____TtC19AppStoreKitInternal24WeakNotificationObserver_scheduler + 24];
  v17[0] = __swift_project_boxed_opaque_existential_1Tm((Class *)((char *)&self->super.isa+ OBJC_IVAR____TtC19AppStoreKitInternal24WeakNotificationObserver_scheduler), v13);
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v7, v10, v4);
  v14 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v12;
  *(_QWORD *)(v15 + 24) = v11;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v15 + v14, v7, v4);
  v16 = self;
  swift_retain();
  sub_1D8929A04();

  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
}

- (_TtC19AppStoreKitInternal24WeakNotificationObserver)init
{
  _TtC19AppStoreKitInternal24WeakNotificationObserver *result;

  result = (_TtC19AppStoreKitInternal24WeakNotificationObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
