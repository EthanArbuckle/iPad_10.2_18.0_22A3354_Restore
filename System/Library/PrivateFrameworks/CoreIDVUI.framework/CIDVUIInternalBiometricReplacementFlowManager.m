@implementation CIDVUIInternalBiometricReplacementFlowManager

- (void)beginBiometricReplacementForTarget:(int64_t)a3 withAuthHandler:(id)a4 andCompletionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _TtC9CoreIDVUI45CIDVUIInternalBiometricReplacementFlowManager *v18;
  uint64_t v19;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D5F760);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a4);
  v13 = _Block_copy(a5);
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = v12;
  if (v13)
  {
    v15 = swift_allocObject();
    *(_QWORD *)(v15 + 16) = v13;
    v13 = sub_213F93744;
  }
  else
  {
    v15 = 0;
  }
  v16 = sub_213FF956C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v11, 1, 1, v16);
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = self;
  v17[5] = sub_213F93628;
  v17[6] = v14;
  v17[7] = a3;
  v17[8] = v13;
  v17[9] = v15;
  v18 = self;
  swift_retain();
  sub_213F4D4E0((uint64_t)v13);
  sub_213F4BE78((uint64_t)v11, (uint64_t)&unk_254D5E450, (uint64_t)v17);
  swift_release();
  sub_213F4BE68((uint64_t)v13);
  swift_release();

}

- (_TtC9CoreIDVUI45CIDVUIInternalBiometricReplacementFlowManager)init
{
  _QWORD *v3;
  objc_class *v4;
  objc_super v6;

  v3 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC9CoreIDVUI45CIDVUIInternalBiometricReplacementFlowManager_completion);
  v4 = (objc_class *)type metadata accessor for CIDVUIInternalBiometricReplacementFlowManager();
  *v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return -[CIDVUIInternalBiometricFlowManager init](&v6, sel_init);
}

- (void).cxx_destruct
{
  sub_213F4BE68(*(uint64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC9CoreIDVUI45CIDVUIInternalBiometricReplacementFlowManager_completion));
}

@end
