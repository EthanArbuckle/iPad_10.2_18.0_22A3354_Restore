@implementation WalletMessagingProvider

+ (id)makeProvider
{
  return _s13FinanceDaemon23WalletMessagingProviderC04makeE0ACyFZ_0();
}

- (void)processMessagesWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC13FinanceDaemon23WalletMessagingProvider *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F29B0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_1CF5250E8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EFB94DC0;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EFB94DD0;
  v12[5] = v11;
  v13 = self;
  sub_1CF5149A0((uint64_t)v7, (uint64_t)&unk_1EFB94DE0, (uint64_t)v12);
  swift_release();
}

- (_TtC13FinanceDaemon23WalletMessagingProvider)init
{
  _TtC13FinanceDaemon23WalletMessagingProvider *result;

  result = (_TtC13FinanceDaemon23WalletMessagingProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC13FinanceDaemon23WalletMessagingProvider_userDefaults);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC13FinanceDaemon23WalletMessagingProvider_imageProcessingService);
}

- (void)connectApplicationMessageSink:(id)a3
{
  _TtC13FinanceDaemon23WalletMessagingProvider *v5;

  swift_unknownObjectRetain();
  v5 = self;
  WalletMessagingProvider.connect(_:)((uint64_t)a3);
  swift_unknownObjectRelease();

}

- (id)applicationMessageSink:(id)a3 createContentForMessageWithRegistration:(id)a4
{
  id v6;
  _TtC13FinanceDaemon23WalletMessagingProvider *v7;
  void *v8;

  swift_unknownObjectRetain();
  v6 = a4;
  v7 = self;
  v8 = (void *)sub_1CF519DDC();
  swift_unknownObjectRelease();

  return v8;
}

- (void)applicationMessageSink:(id)a3 removedMessageWithRegistration:(id)a4
{
  id v6;
  _TtC13FinanceDaemon23WalletMessagingProvider *v7;

  swift_unknownObjectRetain();
  v6 = a4;
  v7 = self;
  sub_1CF51AE14();
  swift_unknownObjectRelease();

}

- (void)applicationMessageSink:(id)a3 tappedMessageWithRegistration:(id)a4
{
  id v7;
  _TtC13FinanceDaemon23WalletMessagingProvider *v8;

  swift_unknownObjectRetain();
  v7 = a4;
  v8 = self;
  WalletMessagingProvider.applicationMessageSink(_:tappedMessageWith:)(a3, v7);
  swift_unknownObjectRelease();

}

@end
