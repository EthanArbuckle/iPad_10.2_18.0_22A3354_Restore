@implementation CNContactProviderSupportHost

- (id)providerContainerFor:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  _TtC8Contacts28CNContactProviderSupportHost *v7;
  char *v8;

  v4 = sub_18FA2833C();
  v6 = v5;
  v7 = self;
  v8 = sub_18F9EC630(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

- (void)synchronizeUsing:(CNContactProviderSupportSession *)a3 bundleIdentifier:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  CNContactProviderSupportSession *v17;
  NSString *v18;
  _TtC8Contacts28CNContactProviderSupportHost *v19;
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE17EE20);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_18FA28564();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EE180EC0;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EE180EC8;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_18FA19780((uint64_t)v11, (uint64_t)&unk_1EE180ED0, (uint64_t)v16);
  swift_release();
}

- (void)invalidateExtensionFor:(NSString *)a3 bundleIdentifier:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  NSString *v17;
  NSString *v18;
  _TtC8Contacts28CNContactProviderSupportHost *v19;
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE17EE20);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_18FA28564();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EE180EA0;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EE180EA8;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_18FA19780((uint64_t)v11, (uint64_t)&unk_1EE180EB0, (uint64_t)v16);
  swift_release();
}

- (void)resetEnumerationFor:(NSString *)a3 bundleIdentifier:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  NSString *v17;
  NSString *v18;
  _TtC8Contacts28CNContactProviderSupportHost *v19;
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE17EE20);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_18FA28564();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EE180E80;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EE180E88;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_18FA19780((uint64_t)v11, (uint64_t)&unk_1EE180E90, (uint64_t)v16);
  swift_release();
}

- (id)isExtensionEnabledWith:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC8Contacts28CNContactProviderSupportHost *v7;
  void *v8;

  v4 = sub_18FA2833C();
  v6 = v5;
  v7 = self;
  v8 = (void *)sub_18F9F76EC(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

- (void)enableExtensionFor:(NSString *)a3 bundleIdentifier:(NSString *)a4 showPrompt:(BOOL)a5 shouldSynchronize:(BOOL)a6 completionHandler:(id)a7
{
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  NSString *v21;
  NSString *v22;
  _TtC8Contacts28CNContactProviderSupportHost *v23;
  uint64_t v24;

  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE17EE20);
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = _Block_copy(a7);
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = a3;
  *(_QWORD *)(v17 + 24) = a4;
  *(_BYTE *)(v17 + 32) = a5;
  *(_BYTE *)(v17 + 33) = a6;
  *(_QWORD *)(v17 + 40) = v16;
  *(_QWORD *)(v17 + 48) = self;
  v18 = sub_18FA28564();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v15, 1, 1, v18);
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_1EE180E60;
  v19[5] = v17;
  v20 = (_QWORD *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &unk_1EE180E68;
  v20[5] = v19;
  v21 = a3;
  v22 = a4;
  v23 = self;
  sub_18FA19780((uint64_t)v15, (uint64_t)&unk_1EE180E70, (uint64_t)v20);
  swift_release();
}

- (void)disableExtensionFor:(NSString *)a3 bundleIdentifier:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  NSString *v17;
  NSString *v18;
  _TtC8Contacts28CNContactProviderSupportHost *v19;
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE17EE20);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_18FA28564();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EE180E50;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EE1812A0;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_18FA19780((uint64_t)v11, (uint64_t)&unk_1EE1812B0, (uint64_t)v16);
  swift_release();
}

- (id)extensionCount
{
  return (id)sub_18F9F835C((uint64_t)self);
}

- (id)extensionItems
{
  void *v2;

  sub_18F9F8454();
  v2 = (void *)sub_18FA28438();
  swift_bridgeObjectRelease();
  return v2;
}

- (_TtC8Contacts28CNContactProviderSupportHost)init
{
  _QWORD *v2;
  objc_super v4;

  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC8Contacts28CNContactProviderSupportHost____lazy_storage___contactStore) = 0;
  v2 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC8Contacts28CNContactProviderSupportHost_ContactProviderErrorDomain);
  *v2 = 0xD000000000000024;
  v2[1] = 0x800000018FA50350;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for CNContactProviderSupportHost();
  return -[CNContactProviderSupportHost init](&v4, sel_init);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Contacts28CNContactProviderSupportHost____lazy_storage___contactStore));
  swift_bridgeObjectRelease();
}

@end
