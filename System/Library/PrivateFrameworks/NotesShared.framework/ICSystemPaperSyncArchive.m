@implementation ICSystemPaperSyncArchive

- (NSURL)databaseArchive
{
  return (NSURL *)(id)sub_1BDBFC8D0();
}

- (NSArray)assetArchives
{
  void *v2;

  sub_1BDBFC948();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1BDBFD9C8();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (ICSystemPaperSyncArchive)initWithDatabaseArchive:(id)a3 assetArchives:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  objc_class *v9;
  objc_class *v10;
  ICSystemPaperSyncArchive *v11;
  objc_super v13;

  v5 = sub_1BDBFC948();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BDBFC90C();
  v9 = (objc_class *)sub_1BDBFD9E0();
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))((char *)self + OBJC_IVAR___ICSystemPaperSyncArchive_databaseArchive, v8, v5);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICSystemPaperSyncArchive_assetArchives) = v9;
  v10 = (objc_class *)type metadata accessor for SystemPaperSyncArchive();
  v13.receiver = self;
  v13.super_class = v10;
  v11 = -[ICSystemPaperSyncArchive init](&v13, sel_init);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v11;
}

- (NSString)description
{
  ICSystemPaperSyncArchive *v2;
  void *v3;

  v2 = self;
  sub_1BDB58828();

  v3 = (void *)sub_1BDBFD6C8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (ICSystemPaperSyncArchive)init
{
  ICSystemPaperSyncArchive *result;

  result = (ICSystemPaperSyncArchive *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR___ICSystemPaperSyncArchive_databaseArchive;
  v3 = sub_1BDBFC948();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
}

@end
