@implementation MFServerMessagesIndexer

- (void).cxx_destruct
{
  swift_getObjectType();
  swift_unknownObjectRelease();
  swift_release();

  sub_1A5139FB0();
  sub_1A5139FB0();
}

- (MFServerMessagesIndexer)initWithAccountsProvider:(id)a3
{
  swift_getObjectType();
  swift_unknownObjectRetain();
  return (MFServerMessagesIndexer *)sub_1A536B3D4((uint64_t)a3);
}

- (void)registerSystemTask
{
  MFServerMessagesIndexer *v3;

  swift_getObjectType();
  v3 = self;
  sub_1A536B95C();

}

- (void)performSearchQuery:(id)a3 completion:(id)a4
{
  id v5;
  MFServerMessagesIndexer *v6;
  void *v8;
  uint64_t v9;

  swift_getObjectType();
  v5 = a3;
  v8 = _Block_copy(a4);
  v6 = self;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  sub_1A536D05C(a3, (void (*)(void))sub_1A5375758, v9);
  swift_release();

}

- (void)getIndexingStatisticsWithCompletion:(id)a3
{
  MFServerMessagesIndexer *v4;
  void *v6;
  uint64_t v7;

  swift_getObjectType();
  v6 = _Block_copy(a3);
  v4 = self;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  sub_1A536EEAC((void (*)(uint64_t, _QWORD))sub_1A5375DF8, v7);
  swift_release();

}

- (void)excludeIndexedUIDsInMailbox:(id)a3 ofAccount:(id)a4 fromUIDs:(id)a5 completion:(id)a6
{
  id v7;
  id v8;
  id v9;
  id v10;
  MFServerMessagesIndexer *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  id v30;
  MFServerMessagesIndexer *v31;
  id v32;

  v31 = self;
  v30 = a3;
  v26 = a4;
  v32 = a5;
  v21 = a6;
  swift_getObjectType();
  v29 = sub_1A5949EF4();
  v27 = *(_QWORD *)(v29 - 8);
  v20 = (*(_QWORD *)(v27 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v30);
  v28 = (char *)&v19 - v20;
  v8 = v7;
  v9 = v26;
  v10 = v32;
  v22 = _Block_copy(v21);
  v11 = self;
  sub_1A5949EA0();
  v23 = sub_1A594B40C();
  v25 = v12;
  v13 = swift_allocObject();
  v14 = v23;
  v15 = v25;
  v16 = v32;
  v17 = v13;
  v18 = (uint64_t)v28;
  v24 = v17;
  *(_QWORD *)(v17 + 16) = v22;
  sub_1A5370460(v18, v14, v15, v16, (void (*)(id))sub_1A5376150, (void (*)(id))v17);
  swift_release();
  swift_bridgeObjectRelease();

  (*(void (**)(char *, uint64_t))(v27 + 8))(v28, v29);
}

- (MFServerMessagesIndexer)init
{
  swift_getObjectType();
  return (MFServerMessagesIndexer *)MFServerMessagesIndexer.init()();
}

@end
