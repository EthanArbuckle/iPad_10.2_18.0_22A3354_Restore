@implementation AISConfigurationStore

- (AISChildAccountCutOffAgeResponse)cachedChildCutOffResponse
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___AISConfigurationStore_cachedChildCutOffResponse);
  swift_beginAccess();
  return (AISChildAccountCutOffAgeResponse *)*v2;
}

- (void)setCachedChildCutOffResponse:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___AISConfigurationStore_cachedChildCutOffResponse);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (void)fetchMaxAgeForChildAccountWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  AISConfigurationStore *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563E9790);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_2365B0218();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_2563EB550;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2563E8060;
  v12[5] = v11;
  v13 = self;
  sub_23655D7FC((uint64_t)v7, (uint64_t)&unk_2563E97B0, (uint64_t)v12);
  swift_release();
}

- (AISConfigurationStore)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AISConfigurationStore_cachedChildCutOffResponse) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AISConfigurationStore();
  return -[AISConfigurationStore init](&v3, sel_init);
}

- (void).cxx_destruct
{

}

@end
