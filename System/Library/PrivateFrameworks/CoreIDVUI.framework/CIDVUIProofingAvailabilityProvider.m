@implementation CIDVUIProofingAvailabilityProvider

- (_TtC9CoreIDVUI34CIDVUIProofingAvailabilityProvider)init
{
  id v2;
  uint64_t v3;
  objc_class *v4;
  char *v5;
  _TtC9CoreIDVUI34CIDVUIProofingAvailabilityProvider *v6;
  objc_super v8;

  v2 = objc_allocWithZone((Class)sub_213FF7FE8());
  v3 = sub_213FF7FDC();
  v4 = (objc_class *)type metadata accessor for CIDVUIProofingAvailabilityProvider();
  v5 = (char *)objc_allocWithZone(v4);
  *(_QWORD *)&v5[OBJC_IVAR____TtC9CoreIDVUI34CIDVUIProofingAvailabilityProvider_connection] = v3;
  v8.receiver = v5;
  v8.super_class = v4;
  v6 = -[CIDVUIProofingAvailabilityProvider init](&v8, sel_init);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v6;
}

- (void)proofingFlowAvailabilityWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC9CoreIDVUI34CIDVUIProofingAvailabilityProvider *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D5F760);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_213FF956C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_254D5F5A0;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_254D5F5A8;
  v12[5] = v11;
  v13 = self;
  sub_213FD7484((uint64_t)v7, (uint64_t)&unk_254D5F5B0, (uint64_t)v12);
  swift_release();
}

- (void)proofingStatusFor:(NSString *)a3 country:(NSString *)a4 completionHandler:(id)a5
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
  _TtC9CoreIDVUI34CIDVUIProofingAvailabilityProvider *v19;
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D5F760);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_213FF956C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_254D5F590;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_254D5DC40;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_213FD7484((uint64_t)v11, (uint64_t)&unk_254D5DC48, (uint64_t)v16);
  swift_release();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

@end
