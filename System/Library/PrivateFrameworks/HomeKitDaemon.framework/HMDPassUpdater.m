@implementation HMDPassUpdater

+ (HMDPassUpdater)shared
{
  if (qword_25573B3B8 != -1)
    swift_once();
  return (HMDPassUpdater *)(id)swift_retain();
}

- (void)updatePassForHomeUUID:(NSUUID *)a3 isOnboarding:(BOOL)a4 isRollingForHH2:(BOOL)a5 optionsNumber:(NSNumber *)a6 flow:(HMFFlow *)a7 completionHandler:(id)a8
{
  uint64_t v15;
  uint64_t v16;
  char *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  NSUUID *v23;
  NSNumber *v24;
  HMFFlow *v25;
  uint64_t v26;

  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25573FD20);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = _Block_copy(a8);
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = a3;
  *(_BYTE *)(v19 + 24) = a4;
  *(_BYTE *)(v19 + 25) = a5;
  *(_QWORD *)(v19 + 32) = a6;
  *(_QWORD *)(v19 + 40) = a7;
  *(_QWORD *)(v19 + 48) = v18;
  *(_QWORD *)(v19 + 56) = self;
  v20 = sub_222596EF4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v17, 1, 1, v20);
  v21 = (_QWORD *)swift_allocObject();
  v21[2] = 0;
  v21[3] = 0;
  v21[4] = &unk_255741D00;
  v21[5] = v19;
  v22 = (_QWORD *)swift_allocObject();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = &unk_25573D278;
  v22[5] = v21;
  v23 = a3;
  v24 = a6;
  v25 = a7;
  swift_retain();
  sub_2219F6010((uint64_t)v17, (uint64_t)&unk_25573D280, (uint64_t)v22);
  swift_release();
}

- (void)removeOrphanedPassesWithFlow:(HMFFlow *)a3 completionHandler:(id)a4
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
  v13[4] = &unk_255741CD8;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_255741CE0;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_2219F6010((uint64_t)v9, (uint64_t)&unk_255741CE8, (uint64_t)v14);
  swift_release();
}

- (void)setExpressSettingsForPassSerialNumber:(NSString *)a3 enableNFCExpress:(BOOL)a4 enableUWB:(BOOL)a5 authData:(NSData *)a6 flow:(HMFFlow *)a7 completionHandler:(id)a8
{
  uint64_t v15;
  uint64_t v16;
  char *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  NSString *v23;
  NSData *v24;
  HMFFlow *v25;
  uint64_t v26;

  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25573FD20);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = _Block_copy(a8);
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = a3;
  *(_BYTE *)(v19 + 24) = a4;
  *(_BYTE *)(v19 + 25) = a5;
  *(_QWORD *)(v19 + 32) = a6;
  *(_QWORD *)(v19 + 40) = a7;
  *(_QWORD *)(v19 + 48) = v18;
  *(_QWORD *)(v19 + 56) = self;
  v20 = sub_222596EF4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v17, 1, 1, v20);
  v21 = (_QWORD *)swift_allocObject();
  v21[2] = 0;
  v21[3] = 0;
  v21[4] = &unk_255741CA0;
  v21[5] = v19;
  v22 = (_QWORD *)swift_allocObject();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = &unk_25573E9C0;
  v22[5] = v21;
  v23 = a3;
  v24 = a6;
  v25 = a7;
  swift_retain();
  sub_2219F6010((uint64_t)v17, (uint64_t)&unk_25573FFC0, (uint64_t)v22);
  swift_release();
}

- (HMDPassUpdater)init
{
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  swift_defaultActor_initialize();
  sub_222596744();
  swift_retain();
  v3 = sub_222596738();
  v4 = MEMORY[0x24BEE4B00];
  *(_QWORD *)&self->_anon_60[8] = v3;
  *(_QWORD *)self->queue = v4;
  swift_release();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for PassUpdater();
  return -[HMDPassUpdater init](&v6, sel_init);
}

@end
