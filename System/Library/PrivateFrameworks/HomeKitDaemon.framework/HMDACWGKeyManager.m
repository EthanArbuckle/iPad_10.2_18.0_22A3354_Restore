@implementation HMDACWGKeyManager

+ (HMDACWGKeyManager)shared
{
  if (qword_25573B390 != -1)
    swift_once();
  return (HMDACWGKeyManager *)(id)swift_retain();
}

- (void)getOrCreateIssuerKeyPairExternalRepresentationWithFlow:(HMFFlow *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  HMFFlow *v15;
  uint64_t v16;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25573FD20);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_222596EF4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_25573E9F8;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_25573EA00;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_2219F6010((uint64_t)v9, (uint64_t)&unk_25573EA08, (uint64_t)v14);
  swift_release();
}

- (void)getOrCreateIssuerKeyAndSaveToSharedUserReverseShareWithHomeUUID:(NSUUID *)a3 context:(HMCContext *)a4 flow:(HMFFlow *)a5 completionHandler:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  NSUUID *v19;
  HMCContext *v20;
  HMFFlow *v21;
  uint64_t v22;

  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25573FD20);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  v16 = sub_222596EF4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_25573E9D8;
  v17[5] = v15;
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_25573E9E0;
  v18[5] = v17;
  v19 = a3;
  v20 = a4;
  v21 = a5;
  swift_retain();
  sub_2219F6010((uint64_t)v13, (uint64_t)&unk_25573E9E8, (uint64_t)v18);
  swift_release();
}

- (void)getIssuerKeyPairExternalRepresentationFromKeychainWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25573FD20);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_222596EF4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_25573E9B8;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_25573E9C0;
  v12[5] = v11;
  swift_retain();
  sub_2219F6010((uint64_t)v7, (uint64_t)&unk_25573FFC0, (uint64_t)v12);
  swift_release();
}

- (HMDACWGKeyManager)init
{
  HMDACWGKeyManager *result;

  swift_defaultActor_initialize();
  result = (HMDACWGKeyManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
