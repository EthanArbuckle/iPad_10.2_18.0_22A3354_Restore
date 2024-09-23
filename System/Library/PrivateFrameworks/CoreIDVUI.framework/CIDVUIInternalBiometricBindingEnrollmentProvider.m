@implementation CIDVUIInternalBiometricBindingEnrollmentProvider

- (void)enrollWithCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _TtC9CoreIDVUI48CIDVUIInternalBiometricBindingEnrollmentProvider *v12;
  uint64_t v13;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D5F760);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = sub_213FF956C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = self;
  v11[5] = sub_213F4CE94;
  v11[6] = v9;
  v12 = self;
  swift_retain();
  sub_213F4BE78((uint64_t)v7, (uint64_t)&unk_254D5C388, (uint64_t)v11);

  swift_release();
  swift_release();
}

- (void)fetchAttestationsWithCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _TtC9CoreIDVUI48CIDVUIInternalBiometricBindingEnrollmentProvider *v12;
  uint64_t v13;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D5F760);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = sub_213FF956C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = self;
  v11[5] = sub_213F4CDE4;
  v11[6] = v9;
  v12 = self;
  swift_retain();
  sub_213F4BE78((uint64_t)v7, (uint64_t)&unk_254D5C380, (uint64_t)v11);

  swift_release();
  swift_release();
}

- (_TtC9CoreIDVUI48CIDVUIInternalBiometricBindingEnrollmentProvider)init
{
  return (_TtC9CoreIDVUI48CIDVUIInternalBiometricBindingEnrollmentProvider *)CIDVUIInternalBiometricBindingEnrollmentProvider.init()();
}

- (void).cxx_destruct
{
  sub_213F4CED4((uint64_t)self + OBJC_IVAR____TtC9CoreIDVUI48CIDVUIInternalBiometricBindingEnrollmentProvider_provider);
}

@end
