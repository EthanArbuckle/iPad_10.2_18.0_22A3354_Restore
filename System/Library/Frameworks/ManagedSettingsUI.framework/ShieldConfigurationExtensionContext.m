@implementation ShieldConfigurationExtensionContext

+ (id)_extensionAuxiliaryHostProtocol
{
  return sub_21A9AE6E0((uint64_t)a1, (uint64_t)a2, &qword_2551067F0, (id *)&qword_255106840);
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  return sub_21A9AE6E0((uint64_t)a1, (uint64_t)a2, &qword_2551067F8, (id *)&qword_255106848);
}

- (void)fetchConfigurationDataForApplication:(id)a3 tokenData:(id)a4 localizedDisplayName:(id)a5 replyHandler:(id)a6
{
  sub_21A9AEAA8(self, (int)a2, (int)a3, a4, a5, a6, (void (*)(uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, id, void *))sub_21A9B05CC);
}

- (void)fetchConfigurationDataForApplication:(id)a3 localizedApplicationDisplayName:(id)a4 categoryTokenData:(id)a5 localizedCategoryDisplayName:(id)a6 replyHandler:(id)a7
{
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  _TtC17ManagedSettingsUI35ShieldConfigurationExtensionContext *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v11 = _Block_copy(a7);
  v25 = sub_21A9B1724();
  v13 = v12;
  if (a4)
  {
    v14 = sub_21A9B1724();
    a4 = v15;
  }
  else
  {
    v14 = 0;
  }
  v16 = a5;
  v17 = a6;
  v18 = self;
  v19 = sub_21A9B1640();
  v21 = v20;

  v22 = sub_21A9B1724();
  v24 = v23;

  _Block_copy(v11);
  sub_21A9B0898(v25, v13, v14, (uint64_t)a4, v19, v21, v22, v24, (uint64_t)v18, v11);
  _Block_release(v11);
  _Block_release(v11);
  swift_bridgeObjectRelease();
  sub_21A9B117C(v19, v21);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)fetchConfigurationDataForWebDomain:(id)a3 tokenData:(id)a4 replyHandler:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _TtC17ManagedSettingsUI35ShieldConfigurationExtensionContext *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;

  v7 = _Block_copy(a5);
  v8 = sub_21A9B1724();
  v10 = v9;
  v11 = a4;
  v12 = self;
  v13 = sub_21A9B1640();
  v15 = v14;

  _Block_copy(v7);
  sub_21A9B0C0C(v8, v10, v13, v15, (uint64_t)v12, (void (**)(_QWORD, _QWORD, _QWORD))v7);
  _Block_release(v7);
  _Block_release(v7);
  sub_21A9B117C(v13, v15);

  swift_bridgeObjectRelease();
}

- (void)fetchConfigurationDataForWebDomain:(id)a3 categoryTokenData:(id)a4 localizedDisplayName:(id)a5 replyHandler:(id)a6
{
  sub_21A9AEAA8(self, (int)a2, (int)a3, a4, a5, a6, (void (*)(uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, id, void *))sub_21A9B0E88);
}

- (_TtC17ManagedSettingsUI35ShieldConfigurationExtensionContext)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC17ManagedSettingsUI35ShieldConfigurationExtensionContext____lazy_storage___shieldConfigurationDataSource) = (Class)1;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ShieldConfigurationExtensionContext();
  return -[ShieldConfigurationExtensionContext init](&v3, sel_init);
}

- (_TtC17ManagedSettingsUI35ShieldConfigurationExtensionContext)initWithInputItems:(id)a3
{
  uint64_t v3;

  if (a3)
    v3 = sub_21A9B1754();
  else
    v3 = 0;
  return (_TtC17ManagedSettingsUI35ShieldConfigurationExtensionContext *)sub_21A9AF110(v3);
}

- (_TtC17ManagedSettingsUI35ShieldConfigurationExtensionContext)initWithInputItems:(id)a3 contextUUID:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255106880);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
    a3 = (id)sub_21A9B1754();
  if (a4)
  {
    sub_21A9B1658();
    v9 = sub_21A9B1664();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 0, 1, v9);
  }
  else
  {
    v10 = sub_21A9B1664();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v8, 1, 1, v10);
  }
  return (_TtC17ManagedSettingsUI35ShieldConfigurationExtensionContext *)sub_21A9AF1EC((uint64_t)a3, (uint64_t)v8);
}

- (_TtC17ManagedSettingsUI35ShieldConfigurationExtensionContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v15;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255106880);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
    a3 = (id)sub_21A9B1754();
  if (a5)
  {
    sub_21A9B1658();
    v11 = sub_21A9B1664();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 0, 1, v11);
  }
  else
  {
    v12 = sub_21A9B1664();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v10, 1, 1, v12);
  }
  v13 = a4;
  return (_TtC17ManagedSettingsUI35ShieldConfigurationExtensionContext *)sub_21A9AF434((uint64_t)a3, a4, (uint64_t)v10);
}

- (void).cxx_destruct
{
  sub_21A9AF6FC(*(id *)((char *)&self->super.super.isa
                      + OBJC_IVAR____TtC17ManagedSettingsUI35ShieldConfigurationExtensionContext____lazy_storage___shieldConfigurationDataSource));
}

@end
