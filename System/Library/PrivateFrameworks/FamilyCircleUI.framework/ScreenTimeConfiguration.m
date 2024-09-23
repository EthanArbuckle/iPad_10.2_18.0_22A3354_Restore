@implementation ScreenTimeConfiguration

- (_TtC14FamilyCircleUI23ScreenTimeConfiguration)init
{
  uint64_t v3;
  id v4;
  _TtC14FamilyCircleUI23ScreenTimeConfiguration *v5;
  objc_super v7;

  v3 = OBJC_IVAR____TtC14FamilyCircleUI23ScreenTimeConfiguration_stManagementState;
  v4 = objc_allocWithZone(MEMORY[0x24BE845E8]);
  v5 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)objc_msgSend(v4, sel_init);

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for ScreenTimeConfiguration();
  return -[ScreenTimeConfiguration init](&v7, sel_init);
}

- (void)isContentPrivacyEnabledForDSID:(NSNumber *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSNumber *v15;
  _TtC14FamilyCircleUI23ScreenTimeConfiguration *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253D2DF60);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_20E07D85C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2549FB600;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2549F6A10;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_20E032A2C((uint64_t)v9, (uint64_t)&unk_2549F7C60, (uint64_t)v14);
  swift_release();
}

- (BOOL)isRestrictedForFeature:(id)a3
{
  void *v4;
  _TtC14FamilyCircleUI23ScreenTimeConfiguration *v5;
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;

  sub_20E07D5D4();
  v4 = (void *)objc_opt_self();
  v5 = self;
  v6 = objc_msgSend(v4, sel_sharedConnection);
  if (v6)
  {
    v7 = v6;
    v8 = (void *)sub_20E07D5A4();
    v9 = objc_msgSend(v7, sel_BOOLRestrictionForFeature_, v8);

    swift_bridgeObjectRelease();
    LOBYTE(v6) = v9 == 2;
  }
  else
  {
    __break(1u);
  }
  return (char)v6;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14FamilyCircleUI23ScreenTimeConfiguration_stManagementState));
}

@end
