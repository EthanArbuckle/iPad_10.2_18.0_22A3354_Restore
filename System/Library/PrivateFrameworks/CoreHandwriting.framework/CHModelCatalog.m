@implementation CHModelCatalog

- (CHModelCatalog)init
{
  objc_super v4;

  sub_1BE8C7C80();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for CHModelCatalog();
  return -[CHModelCatalog init](&v4, sel_init);
}

- (id)getModelURL:(int64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  CHModelCatalog *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v13;

  v5 = sub_1BE60B52C(&qword_1EF5671B8);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = self;
  sub_1BE60B950(a3, (void (*)(char *, char *, uint64_t))v8, (uint64_t)v7);

  v9 = sub_1BE8C7B90();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v7, 1, v9) != 1)
  {
    v11 = (void *)sub_1BE8C7B84();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
  }
  return v11;
}

- (id)getModelVersion:(int64_t)a3
{
  CHModelCatalog *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v4 = self;
  sub_1BE60C288(a3, (uint64_t)v4);
  v6 = v5;

  if (v6)
  {
    v7 = (void *)sub_1BE8C7D10();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR___CHModelCatalog_logger;
  v3 = sub_1BE8C7C8C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
