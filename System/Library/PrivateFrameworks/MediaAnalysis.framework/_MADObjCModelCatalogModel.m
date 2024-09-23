@implementation _MADObjCModelCatalogModel

- (_MADObjCModelCatalogModel)init
{
  objc_super v4;

  sub_1B6FA0D30();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for _MADObjCModelCatalogModel();
  return -[_MADObjCModelCatalogModel init](&v4, sel_init);
}

- (id)getModelURL:(int64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _MADObjCModelCatalogModel *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED260E58);
  MEMORY[0x1E0C80A78](*(_QWORD **)(*(_QWORD *)(v5 - 8) + 64), v5, v6, v7);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = self;
  sub_1B6F56728(a3, (uint64_t)v9);

  v11 = sub_1B6FA0CA0();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v9, 1, v11) != 1)
  {
    v13 = (void *)sub_1B6FA0C94();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v9, v11);
  }
  return v13;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____MADObjCModelCatalogModel_logger;
  v3 = sub_1B6FA0D3C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
