@implementation AMDVectorDBManager

- (_TtC19AppleMediaDiscovery18AMDVectorDBManager)initWithVectorDBConfig:(id)a3 error:(id *)a4
{
  id v4;
  uint64_t v5;
  _TtC19AppleMediaDiscovery18AMDVectorDBManager *v7;

  v4 = a3;
  v5 = sub_1DC76F3F8();
  v7 = (_TtC19AppleMediaDiscovery18AMDVectorDBManager *)AMDVectorDBManager.init(vectorDBConfig:)(v5);

  return v7;
}

- (void)dealloc
{
  _TtC19AppleMediaDiscovery18AMDVectorDBManager *v2;

  v2 = self;
  AMDVectorDBManager.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_release();
}

- (id)insertVectorsWithVectorDict:(id)a3 error:(id *)a4
{
  id v5;
  _TtC19AppleMediaDiscovery18AMDVectorDBManager *v6;
  void *v8;
  uint64_t v11;

  v5 = a3;
  v6 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F039ABE0);
  v11 = sub_1DC76F3F8();
  sub_1DC760CDC(v11);
  v8 = (void *)sub_1DC76F3EC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v8;
}

- (id)searchVectorDBWithQueryDict:(id)a3 error:(id *)a4
{
  id v5;
  _TtC19AppleMediaDiscovery18AMDVectorDBManager *v6;
  void *v8;
  uint64_t v11;

  v5 = a3;
  v6 = self;
  v11 = sub_1DC76F3F8();
  sub_1DC7619C4(v11);
  v8 = (void *)sub_1DC76F3EC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v8;
}

- (id)deleteVectorsWithIdentifiers:(id)a3 error:(id *)a4
{
  id v4;
  _TtC19AppleMediaDiscovery18AMDVectorDBManager *v5;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a3;
  v5 = self;
  if (a3)
  {
    v8 = sub_1DC76F500();

    v9 = v8;
  }
  else
  {
    v9 = 0;
  }
  sub_1DC762D64(v9);
  v7 = (void *)sub_1DC76F3EC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v7;
}

+ (id)createVectorDBDirectoryWithDbName:(id)a3 error:(id *)a4
{
  id v4;
  uint64_t v5;
  id v7;
  void *v8;
  void *v9;
  id *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  id v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v15 = a1;
  v14 = a3;
  v10 = a4;
  swift_getObjCClassMetadata();
  v11 = sub_1DC76EFB4();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = (*(_QWORD *)(v12 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v16 = (char *)&v7 - v13;
  v4 = (id)MEMORY[0x1E0C80A78](v14);
  v18 = sub_1DC76F44C();
  v17 = v5;
  swift_getObjCClassMetadata();
  sub_1DC763308(v18, v17, v16);
  v19 = 0;
  v8 = (void *)sub_1DC76EF90();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v16, v11);
  v9 = v8;
  v7 = v8;
  swift_bridgeObjectRelease();

  return v7;
}

+ (id)deleteVectorDatabaseWithDeletionPayload:(id)a3 error:(id *)a4
{
  id v4;
  void *v6;
  uint64_t v8;

  swift_getObjCClassMetadata();
  v4 = a3;
  v8 = sub_1DC76F3F8();
  swift_getObjCClassMetadata();
  sub_1DC7644DC(v8);
  v6 = (void *)sub_1DC76F3EC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v6;
}

+ (id)insertVectorsHandlerWithInsertVectorsPayload:(id)a3 error:(id *)a4
{
  id v4;
  void *v6;
  uint64_t v8;

  swift_getObjCClassMetadata();
  v4 = a3;
  v8 = sub_1DC76F3F8();
  swift_getObjCClassMetadata();
  sub_1DC765C98(v8);
  v6 = (void *)sub_1DC76F3EC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v6;
}

+ (id)clearVectorsHandlerWithClearVectorDBPayload:(id)a3 error:(id *)a4
{
  id v4;
  void *v6;
  uint64_t v8;

  swift_getObjCClassMetadata();
  v4 = a3;
  v8 = sub_1DC76F3F8();
  swift_getObjCClassMetadata();
  sub_1DC7668E8(v8);
  v6 = (void *)sub_1DC76F3EC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v6;
}

+ (id)runVectorDBSearchWithSearchPayload:(id)a3 error:(id *)a4
{
  id v4;
  void *v6;
  uint64_t v8;

  swift_getObjCClassMetadata();
  v4 = a3;
  v8 = sub_1DC76F3F8();
  swift_getObjCClassMetadata();
  sub_1DC767064(v8);
  v6 = (void *)sub_1DC76F3EC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v6;
}

+ (id)createVectorDBWithCreateDBPayload:(id)a3 error:(id *)a4
{
  id v4;
  void *v6;
  uint64_t v8;

  swift_getObjCClassMetadata();
  v4 = a3;
  v8 = sub_1DC76F3F8();
  swift_getObjCClassMetadata();
  sub_1DC767890(v8);
  v6 = (void *)sub_1DC76F3EC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v6;
}

- (_TtC19AppleMediaDiscovery18AMDVectorDBManager)init
{
  return (_TtC19AppleMediaDiscovery18AMDVectorDBManager *)AMDVectorDBManager.init()();
}

@end
