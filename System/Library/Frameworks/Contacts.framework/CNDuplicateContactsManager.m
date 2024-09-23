@implementation CNDuplicateContactsManager

- (NSArray)duplicates
{
  CNDuplicateContactsManager *v2;
  void *v3;

  v2 = self;
  sub_18FA17680();

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE17EAC8);
  v3 = (void *)sub_18FA28438();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (CNDuplicateContactsManager)initWithContactStore:(id)a3
{
  _QWORD *v4;
  id v5;
  objc_super v7;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CNDuplicateContactsManager_contacts) = (Class)MEMORY[0x1E0DEE9D8];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CNDuplicateContactsManager_findResult) = 0;
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR___CNDuplicateContactsManager_mergeResult);
  v4[1] = 0;
  v4[2] = 0;
  *v4 = 0;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___CNDuplicateContactsManager_didPerformMerge) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CNDuplicateContactsManager_contactStore) = (Class)a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for DuplicateContactsManager();
  v5 = a3;
  return -[CNDuplicateContactsManager init](&v7, sel_init);
}

+ (void)duplicatesCountsWithCompletionHandler:(id)a3
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

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE17EE20);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = a1;
  v10 = sub_18FA28564();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EE181290;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EE1812A0;
  v12[5] = v11;
  sub_18FA19780((uint64_t)v7, (uint64_t)&unk_1EE1812B0, (uint64_t)v12);
  swift_release();
}

- (BOOL)applyMergeResultToSaveRequest:(id)a3
{
  id v4;
  CNDuplicateContactsManager *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_18FA188CC(v4);

  return self & 1;
}

+ (BOOL)applyMergeResultToSaveRequest:(id)a3 signatures:(id)a4
{
  uint64_t v5;
  id v6;
  char v7;

  v5 = sub_18FA28444();
  v6 = a3;
  v7 = _s8Contacts09DuplicateA7ManagerC29applyMergeResultToSaveRequest_10signaturesSbSo06CNSaveI0C_SaySSGtFZ_0(v6, v5);

  swift_bridgeObjectRelease();
  return v7 & 1;
}

+ (void)refreshManagedDuplicatesWithCompletionHandler:(id)a3
{
  void *v3;
  uint64_t ObjCClassMetadata;

  v3 = _Block_copy(a3);
  ObjCClassMetadata = swift_getObjCClassMetadata();
  sub_18FA1DFC4(ObjCClassMetadata, (void (**)(_QWORD, _QWORD))v3);
  _Block_release(v3);
}

+ (void)updateRecentImagesDatabaseForSignatures:(id)a3
{
  sub_18FA192F8((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (void (*)(void))_s8Contacts09DuplicateA7ManagerC39updateRecentImagesDatabaseForSignaturesyySaySSGFZ_0);
}

+ (void)updateRecentPostersDatabaseForSignatures:(id)a3
{
  sub_18FA192F8((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (void (*)(void))_s8Contacts09DuplicateA7ManagerC40updateRecentPostersDatabaseForSignaturesyySaySSGFZ_0);
}

- (CNDuplicateContactsManager)init
{
  CNDuplicateContactsManager *result;

  result = (CNDuplicateContactsManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_18FA1773C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___CNDuplicateContactsManager_mergeResult));
}

@end
