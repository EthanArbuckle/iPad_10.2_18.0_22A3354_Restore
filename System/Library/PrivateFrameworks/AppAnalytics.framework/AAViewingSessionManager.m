@implementation AAViewingSessionManager

- (AAViewingSessionManager)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AAViewingSessionManager_sessions) = (Class)MEMORY[0x1E0DEE9D8];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AAViewingSessionManager_activeSession) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[AAViewingSessionManager init](&v5, sel_init);
}

- (void)endActiveViewingSession
{
  AAViewingSessionManager *v2;

  v2 = self;
  ViewingSessionManager.endActiveViewingSession()();

}

- (id)viewingSessionForContentIdentifier:(id)a3 object:(id)a4 onEnd:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  AAViewingSessionManager *v12;
  id v13;

  v7 = _Block_copy(a5);
  v8 = sub_1A5F64130();
  v10 = v9;
  if (v7)
  {
    v11 = swift_allocObject();
    *(_QWORD *)(v11 + 16) = v7;
    v7 = sub_1A5F2E940;
  }
  else
  {
    v11 = 0;
  }
  swift_unknownObjectRetain();
  v12 = self;
  v13 = (id)sub_1A5F62E60(v8, v10, (uint64_t)a4, (uint64_t)v7, v11);
  sub_1A5ED0004((uint64_t)v7);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  return v13;
}

- (void)removeObject:(id)a3 forContentIdentifier:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  AAViewingSessionManager *v9;

  v6 = sub_1A5F64130();
  v8 = v7;
  swift_unknownObjectRetain();
  v9 = self;
  ViewingSessionManager.remove(object:for:)((uint64_t)a3, v6, v8);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)endViewingSessionForContentIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t *v7;
  AAViewingSessionManager *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = sub_1A5F64130();
  v6 = v5;
  v7 = (unint64_t *)((char *)self + OBJC_IVAR___AAViewingSessionManager_sessions);
  swift_beginAccess();
  v8 = self;
  v9 = sub_1A5F63450(v7, v4, v6);
  v10 = v9;
  if (*v7 >> 62)
  {
    swift_bridgeObjectRetain();
    v11 = sub_1A5F64724();
    swift_bridgeObjectRelease();
    if (v11 >= v10)
      goto LABEL_3;
  }
  else
  {
    v11 = *(_QWORD *)((*v7 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v11 >= v9)
    {
LABEL_3:
      sub_1A5F637A8(v10, v11);
      swift_endAccess();

      swift_bridgeObjectRelease();
      return;
    }
  }
  __break(1u);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
}

@end
