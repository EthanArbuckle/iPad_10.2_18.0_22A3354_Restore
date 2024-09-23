@implementation LinkManager

- (void)dealloc
{
  uint64_t (*v2)(void);
  _TtC15GroupActivities11LinkManager *v3;
  objc_super v4;

  v2 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x238);
  v3 = self;

  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for LinkManager(0);
  -[LinkManager dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *, uint64_t);

  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC15GroupActivities11LinkManager__attachmentLedgerTopic;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CurrentSubject<AttachmentLedgerTopic?>);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  v5 = (char *)self + OBJC_IVAR____TtC15GroupActivities11LinkManager__attachments;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CurrentSubject<[LinkManager.Attachment]>);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  v7 = (char *)self + OBJC_IVAR____TtC15GroupActivities11LinkManager_identifier;
  v8 = type metadata accessor for UUID();
  v9 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8);
  v9(v7, v8);
  v9((char *)self + OBJC_IVAR____TtC15GroupActivities11LinkManager_groupUUID, v8);
  outlined destroy of Participant((uint64_t)self + OBJC_IVAR____TtC15GroupActivities11LinkManager_localParticipant, (uint64_t (*)(_QWORD))type metadata accessor for Participant);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15GroupActivities11LinkManager_unreliableMessengerConfig));
  outlined consume of (@escaping @callee_guaranteed (@guaranteed Data, @unowned UInt64) -> ())?(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC15GroupActivities11LinkManager_receivedDataHandler));
  outlined consume of (@escaping @callee_guaranteed (@guaranteed Data, @unowned UInt64) -> ())?(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC15GroupActivities11LinkManager_onFirstConnectedHandler));
  outlined consume of (@escaping @callee_guaranteed (@guaranteed Data, @unowned UInt64) -> ())?(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC15GroupActivities11LinkManager_invalidationHandler));
  outlined consume of (@escaping @callee_guaranteed (@guaranteed Data, @unowned UInt64) -> ())?(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC15GroupActivities11LinkManager_requestEncryptionKeysHandler));
}

- (_TtC15GroupActivities11LinkManager)init
{
  _TtC15GroupActivities11LinkManager *result;

  result = (_TtC15GroupActivities11LinkManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
