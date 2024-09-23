@implementation ModelCatalogWrapper

- (void)downloadForegroundBackgroundSegmentationModelBundleWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC19ModelCatalogWrapper19ModelCatalogWrapper *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE5FFB40);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_1A15A8D48();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EE600FD8;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EE600FE0;
  v12[5] = v11;
  v13 = self;
  sub_1A1338A9C((uint64_t)v7, (uint64_t)&unk_1EE600FE8, (uint64_t)v12);
  swift_release();
}

- (id)foregroundBackgroundSegmentationModelBundleURLAndReturnError:(id *)a3
{
  return sub_1A137E54C();
}

- (_TtC19ModelCatalogWrapper19ModelCatalogWrapper)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ModelCatalogWrapper();
  return -[ModelCatalogWrapper init](&v3, sel_init);
}

@end
