@implementation AppDistributorWrapper

+ (void)handleEmergencyResetWithCompletionHandler:(id)a3
{
  uint64_t v5;
  char *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255902EB8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = _Block_copy(a3);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v7;
  *(_QWORD *)(v8 + 24) = a1;
  v9 = sub_227914984();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v6, 1, 1, v9);
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = &unk_255902EC8;
  v10[5] = v8;
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_255902ED8;
  v11[5] = v10;
  sub_22791259C((uint64_t)v6, (uint64_t)&unk_255902EE8, (uint64_t)v11);
  swift_release();
}

- (_TtC19DigitalSeparationUI21AppDistributorWrapper)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AppDistributorWrapper();
  return -[AppDistributorWrapper init](&v3, sel_init);
}

@end
