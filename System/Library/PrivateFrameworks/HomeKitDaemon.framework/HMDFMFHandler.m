@implementation HMDFMFHandler

+ (HMDFMFHandler)sharedHandler
{
  if (qword_25573B330 != -1)
    swift_once();
  return (HMDFMFHandler *)(id)swift_retain();
}

- (void)startWithCompletionHandler:(id)a3
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
  v11[4] = &unk_25573CD50;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_25573CD58;
  v12[5] = v11;
  swift_retain();
  sub_2219F6010((uint64_t)v7, (uint64_t)&unk_25573CD60, (uint64_t)v12);
  swift_release();
}

- (void)queryFMFStatusWithCompletion:(id)a3
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
  v11[4] = &unk_25573CD40;
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

- (BOOL)isThisDesignatedFMFDevice
{
  uint64_t v2;
  _QWORD *v3;
  os_unfair_lock_s *v4;
  BOOL v6;

  v2 = *(_QWORD *)&self->findMySession[7];
  v3 = (_QWORD *)(v2 + 16);
  v4 = (os_unfair_lock_s *)(v2 + 24);
  swift_retain();
  os_unfair_lock_lock(v4);
  sub_2219324E0(v3, &v6);
  os_unfair_lock_unlock(v4);
  LOBYTE(v3) = v6;
  swift_release();
  return (char)v3;
}

- (HMDFMFHandler)init
{
  uint64_t v3;
  objc_super v5;

  swift_defaultActor_initialize();
  self->_anon_60[8] = 0;
  *(_QWORD *)self->isStarted = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25573B450);
  v3 = swift_allocObject();
  *(_DWORD *)(v3 + 24) = 0;
  *(_QWORD *)(v3 + 16) = 0;
  *(_QWORD *)&self->findMySession[7] = v3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FindMyHandler();
  return -[HMDFMFHandler init](&v5, sel_init);
}

@end
