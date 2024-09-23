@implementation STKGenerativeModelsAvailability

- (STKGenerativeModelsAvailability)availabilityWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  STKGenerativeModelsAvailability *v13;
  uint64_t v15;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2561718D0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_2347179AC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_256176BD0;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_256179330;
  v12[5] = v11;
  v13 = self;
  sub_2346F6DA0((uint64_t)v7, (uint64_t)&unk_256176470, (uint64_t)v12);
  return (STKGenerativeModelsAvailability *)swift_release();
}

- (BOOL)availability
{
  return sub_23463AA88() & 1;
}

- (BOOL)isAvailable
{
  return sub_23463ACE4() & 1;
}

- (STKGenerativeModelsAvailability)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for STKGenerativeModelsAvailability();
  return -[STKGenerativeModelsAvailability init](&v3, sel_init);
}

@end
