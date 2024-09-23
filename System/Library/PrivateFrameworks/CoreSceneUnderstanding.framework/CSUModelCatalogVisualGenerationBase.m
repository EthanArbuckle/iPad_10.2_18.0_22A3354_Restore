@implementation CSUModelCatalogVisualGenerationBase

- (id)fetchAndReturnError:(id *)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  CSUModelCatalogVisualGenerationBase *v8;
  void *v9;
  uint64_t v11;

  v4 = sub_23A09E7E0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = self;
  sub_23A05A234((uint64_t)v7);

  v9 = (void *)sub_23A09E7D4();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v9;
}

- (CSUModelCatalogVisualGenerationBase)init
{
  objc_super v4;

  sub_23A09E894();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for CSUModelCatalogVisualGenerationBase();
  return -[CSUModelCatalogVisualGenerationBase init](&v4, sel_init);
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR___CSUModelCatalogVisualGenerationBase_logger;
  v3 = sub_23A09E8A0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
