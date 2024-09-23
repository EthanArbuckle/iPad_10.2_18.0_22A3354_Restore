@implementation BSBrandManagerObjcShim

- (BSBrandManagerObjcShim)initWithCachingEnabled:(BOOL)a3 cacheURL:(id)a4 brandDataSourceWrapper:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  BSBrandManagerObjcShim *v14;
  uint64_t v16;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    sub_21CAF80C4();
    v11 = sub_21CAF80E8();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 0, 1, v11);
  }
  else
  {
    v12 = sub_21CAF80E8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v10, 1, 1, v12);
  }
  v13 = a5;
  v14 = (BSBrandManagerObjcShim *)sub_21CAE9E38(a3, (uint64_t)v10, v13);

  return v14;
}

- (void)brandWithURI:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BSBrandManagerObjcShim *v11;

  v5 = _Block_copy(a4);
  v6 = sub_21CAF81D8();
  v8 = v7;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v5;
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = sub_21CAEA0A4;
  *(_QWORD *)(v10 + 24) = v9;
  v11 = self;
  swift_retain();
  sub_21CAE20DC(v6, v8, (uint64_t)sub_21CAEA114, v10);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

- (void)clearUnusedCachedLogos:(id)a3
{
  void *v4;
  uint64_t v5;
  BSBrandManagerObjcShim *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  swift_retain();
  sub_21CAE6B48((uint64_t)sub_21CAEA09C, v5);

  swift_release();
  swift_release();
}

- (void)fetchAssetWithURL:(id)a3 assetType:(int64_t)a4 completion:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  BSBrandManagerObjcShim *v14;
  uint64_t v15;

  v7 = _Block_copy(a5);
  v8 = sub_21CAF80E8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21CAF80C4();
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v7;
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = sub_21CAEA070;
  *(_QWORD *)(v13 + 24) = v12;
  v14 = self;
  swift_retain();
  swift_retain();
  sub_21CAE5F50((uint64_t)v11, a4, (uint64_t)sub_21CAEA118, v13);

  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (BSBrandManagerObjcShim)init
{
  BSBrandManagerObjcShim *result;

  result = (BSBrandManagerObjcShim *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
