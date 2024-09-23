@implementation ICSystemPaperDocument

- (CRContext)coherenceContext
{
  void *v2;
  _TtC11NotesShared21ICSystemPaperDocument *v3;
  id v4;
  void *v5;
  void *v7;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11NotesShared21ICSystemPaperDocument_attachment);
  v3 = self;
  v4 = objc_msgSend(v2, sel_managedObjectContext);
  if (v4)
  {
    v5 = v4;
    MEMORY[0x1E0C80A78](v4);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED23AE30);
    sub_1BDBFDFF8();

    return (CRContext *)v7;
  }
  else
  {

    return (CRContext *)0;
  }
}

- (_TtC11NotesShared21ICSystemPaperDocument)initWithPaperAttachment:(id)a3
{
  objc_class *ObjectType;
  id v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11NotesShared21ICSystemPaperDocument_attachment) = (Class)a3;
  v8.receiver = self;
  v8.super_class = ObjectType;
  v6 = a3;
  return -[ICSystemPaperDocument init](&v8, sel_init);
}

- (id)archiveBundleForSyncAndReturnError:(id *)a3
{
  _TtC11NotesShared21ICSystemPaperDocument *v3;
  id v4;

  v3 = self;
  v4 = ICSystemPaperDocument.archiveBundleForSync()();

  return v4;
}

- (BOOL)writeNewVersionFromSyncArchive:(id)a3 error:(id *)a4
{
  id v5;
  _TtC11NotesShared21ICSystemPaperDocument *v6;

  v5 = a3;
  v6 = self;
  ICSystemPaperDocument.writeNewVersionFromSyncArchive(_:)(v5);

  return 1;
}

- (BOOL)copyAndArchivePaperBundleTo:(id)a3 error:(id *)a4
{
  return sub_1BDB60D9C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(char *))ICSystemPaperDocument.copyAndArchivePaperBundle(to:));
}

- (BOOL)restorePaperBundleFrom:(id)a3 error:(id *)a4
{
  return sub_1BDB60D9C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(char *))ICSystemPaperDocument.restorePaperBundle(from:));
}

+ (id)databaseDirectoryAt:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  void (*v10)(char *, uint64_t);
  void *v11;
  uint64_t v13;

  v3 = sub_1BDBFC948();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x1E0C80A78](v3);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v13 - v8;
  sub_1BDBFC90C();
  sub_1BDBFC8DC();
  v10 = *(void (**)(char *, uint64_t))(v4 + 8);
  v10(v7, v3);
  v11 = (void *)sub_1BDBFC8D0();
  v10(v9, v3);
  return v11;
}

+ (id)assetsDirectoryAt:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  void (*v13)(char *, uint64_t);
  void *v14;
  uint64_t v16;

  v3 = sub_1BDBFC948();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x1E0C80A78](v3);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x1E0C80A78](v5);
  v10 = (char *)&v16 - v9;
  MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v16 - v11;
  sub_1BDBFC90C();
  sub_1BDBFC8DC();
  sub_1BDBFC8E8();
  v13 = *(void (**)(char *, uint64_t))(v4 + 8);
  v13(v7, v3);
  v13(v10, v3);
  v14 = (void *)sub_1BDBFC8D0();
  v13(v12, v3);
  return v14;
}

- (void)updateGraphDestinationsUsingInlineAttachmentIdentifierMap:(id)a3 completion:(id)a4
{
  void (*v5)(void);
  uint64_t v6;
  uint64_t v7;
  _TtC11NotesShared21ICSystemPaperDocument *v8;

  v5 = (void (*)(void))_Block_copy(a4);
  v6 = sub_1BDBFD5C0();
  if (v5)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v5;
    v5 = (void (*)(void))sub_1BDB65EA4;
  }
  else
  {
    v7 = 0;
  }
  v8 = self;
  ICSystemPaperDocument.updateGraphDestinations(usingInlineAttachmentIdentifierMap:completion:)(v6, v5, v7);
  sub_1BDAE1FE0((uint64_t)v5);

  swift_bridgeObjectRelease();
}

+ (void)closeContextForNote:(id)a3
{
  id v3;

  v3 = a3;
  _s11NotesShared21ICSystemPaperDocumentC12closeContext3forySo6ICNoteC_tFZ_0(v3);

}

- (void)removeStrokesFromStyleInventory
{
  _TtC11NotesShared21ICSystemPaperDocument *v2;

  v2 = self;
  ICSystemPaperDocument.removeStrokesFromStyleInventory()();

}

- (id)toFallbackPDFData
{
  _TtC11NotesShared21ICSystemPaperDocument *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;

  v2 = self;
  v3 = ICSystemPaperDocument.toFallbackPDFData()();
  v5 = v4;

  if (v5 >> 60 == 15)
  {
    v6 = 0;
  }
  else
  {
    v6 = (void *)sub_1BDBFC978();
    sub_1BDB40600(v3, v5);
  }
  return v6;
}

- (_TtC11NotesShared21ICSystemPaperDocument)init
{
  _TtC11NotesShared21ICSystemPaperDocument *result;

  result = (_TtC11NotesShared21ICSystemPaperDocument *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
