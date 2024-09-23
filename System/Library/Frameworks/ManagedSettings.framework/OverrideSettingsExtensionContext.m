@implementation OverrideSettingsExtensionContext

+ (id)_extensionAuxiliaryHostProtocol
{
  return sub_1B7668648((uint64_t)a1, (uint64_t)a2, &qword_1EF177418, (id *)&qword_1EF1799B0);
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  return sub_1B7668648((uint64_t)a1, (uint64_t)a2, &qword_1EF177420, (id *)&qword_1EF1799B8);
}

+ (id)_allowedItemPayloadClasses
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_1B765DF7C(0, &qword_1EF178218);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF1775E8);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1B76DDBB0;
  v3 = sub_1B765DF7C(0, &qword_1EF1799D0);
  *(_QWORD *)(v2 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF1799D8);
  *(_QWORD *)(v2 + 32) = v3;
  v4 = sub_1B765DF7C(0, &qword_1EF178018);
  *(_QWORD *)(v2 + 88) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF1799E0);
  *(_QWORD *)(v2 + 64) = v4;
  return (id)MEMORY[0x1BCCA8E28](v2);
}

- (void)askToOverrideUnremovabilityOfApplicationWithBundleIdentifier:(id)a3 teamIdentifier:(id)a4 replyHandler:(id)a5
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _TtC15ManagedSettings32OverrideSettingsExtensionContext *v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, uint64_t, uint64_t, void (*)(unsigned __int8 *), uint64_t);
  void *v19;

  v6 = _Block_copy(a5);
  v7 = sub_1B76DBAD4();
  v9 = v8;
  v10 = sub_1B76DBAD4();
  v12 = v11;
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v6;
  v14 = self;
  _Block_copy(v6);
  v15 = sub_1B76D6CF4();
  if (v15)
  {
    v16 = v15;
    v17 = swift_allocObject();
    *(_QWORD *)(v17 + 16) = sub_1B76695E0;
    *(_QWORD *)(v17 + 24) = v13;
    v18 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, void (*)(unsigned __int8 *), uint64_t))((*MEMORY[0x1E0DEEDD8] & *v16) + 0x58);
    swift_retain();
    v18(v7, v9, v10, v12, sub_1B76D75D0, v17);
    swift_release();
  }
  else
  {
    sub_1B76D7568();
    v16 = (_QWORD *)swift_allocError();
    v19 = (void *)sub_1B76DB798();
    (*((void (**)(void *, _QWORD, void *))v6 + 2))(v6, 0, v19);

  }
  swift_release();
  _Block_release(v6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (_TtC15ManagedSettings32OverrideSettingsExtensionContext)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC15ManagedSettings32OverrideSettingsExtensionContext____lazy_storage___overrideSettingsHandler) = (Class)1;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for OverrideSettingsExtensionContext();
  return -[OverrideSettingsExtensionContext init](&v3, sel_init);
}

- (_TtC15ManagedSettings32OverrideSettingsExtensionContext)initWithInputItems:(id)a3
{
  uint64_t v3;

  if (a3)
    v3 = sub_1B76DBB70();
  else
    v3 = 0;
  return (_TtC15ManagedSettings32OverrideSettingsExtensionContext *)sub_1B76D6F78(v3);
}

- (_TtC15ManagedSettings32OverrideSettingsExtensionContext)initWithInputItems:(id)a3 contextUUID:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF1774C0);
  MEMORY[0x1E0C80A78](v6, v7);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
    a3 = (id)sub_1B76DBB70();
  if (a4)
  {
    sub_1B76DB87C();
    v10 = sub_1B76DB888();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 0, 1, v10);
  }
  else
  {
    v11 = sub_1B76DB888();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v9, 1, 1, v11);
  }
  return (_TtC15ManagedSettings32OverrideSettingsExtensionContext *)sub_1B76D7054((uint64_t)a3, (uint64_t)v9);
}

- (_TtC15ManagedSettings32OverrideSettingsExtensionContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v16;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF1774C0);
  MEMORY[0x1E0C80A78](v8, v9);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
    a3 = (id)sub_1B76DBB70();
  if (a5)
  {
    sub_1B76DB87C();
    v12 = sub_1B76DB888();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    v13 = sub_1B76DB888();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v11, 1, 1, v13);
  }
  v14 = a4;
  return (_TtC15ManagedSettings32OverrideSettingsExtensionContext *)sub_1B76D728C((uint64_t)a3, a4, (uint64_t)v11);
}

- (void).cxx_destruct
{
  sub_1B7668F50(*(id *)((char *)&self->super.super.isa
                      + OBJC_IVAR____TtC15ManagedSettings32OverrideSettingsExtensionContext____lazy_storage___overrideSettingsHandler));
}

@end
