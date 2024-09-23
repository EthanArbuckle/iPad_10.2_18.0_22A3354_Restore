@implementation HRInternalStateProvider

- (HRInternalStateProvider)initWithHealthStore:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  HRInternalStateProvider *v9;

  v4 = objc_allocWithZone(MEMORY[0x1E0CB64D0]);
  v5 = a3;
  v6 = objc_msgSend(v4, sel_initWithHealthStore_, v5);
  v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB6768]), sel_initWithHealthStore_, v5);
  v8 = objc_allocWithZone((Class)type metadata accessor for InternalStateProvider());
  v9 = (HRInternalStateProvider *)sub_1BC49E1F8(v6, v7);

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v9;
}

- (HRInternalStateProvider)initWithProfile:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  HRInternalStateProvider *v7;

  v3 = a3;
  v4 = objc_msgSend(v3, sel_conceptStore);
  v5 = objc_msgSend(v3, sel_healthRecordsStore);
  v6 = objc_allocWithZone((Class)type metadata accessor for InternalStateProvider());
  v7 = (HRInternalStateProvider *)sub_1BC49E1F8(v4, v5);

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v7;
}

- (void)dealloc
{
  HRInternalStateProvider *v2;

  v2 = self;
  InternalStateProvider.__deallocating_deinit();
}

- (void).cxx_destruct
{

  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR___HRInternalStateProvider_healthExperienceStore);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  sub_1BC36D770(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___HRInternalStateProvider_changeHandler));
  swift_release();
}

- (void)fetchJSONWithCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  HRInternalStateProvider *v13;
  uint64_t v14;

  sub_1BC357158(0, (unint64_t *)&qword_1ED6A4DE0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DF0750], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v14 - v6;
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_1BC62C95C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EF432600;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EF432610;
  v12[5] = v11;
  v13 = self;
  sub_1BC4A18D8((uint64_t)v7, (uint64_t)&unk_1EF432620, (uint64_t)v12);
  swift_release();
}

- (HRInternalStateProvider)init
{
  HRInternalStateProvider *result;

  result = (HRInternalStateProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)clinicalIngestionStore:(id)a3 ingestionStateDidUpdateTo:(int64_t)a4
{
  id v6;
  HRInternalStateProvider *v7;

  v6 = a3;
  v7 = self;
  sub_1BC4A25EC(a4);

}

- (void)conceptStore:(id)a3 indexManagerDidChangeState:(unint64_t)a4
{
  id v5;
  HRInternalStateProvider *v6;

  v5 = a3;
  v6 = self;
  _s15HealthRecordsUI21InternalStateProviderC12conceptStore_21indexManagerDidChangeySo09HKConceptH0C_So0m5IndexjE0VtF_0();

}

@end
