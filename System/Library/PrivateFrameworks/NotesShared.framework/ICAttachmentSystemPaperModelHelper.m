@implementation ICAttachmentSystemPaperModelHelper

+ (int64_t)minimumSupportedNotesVersionForPaperAtURL:(id)a3 greaterOrEqualToVersion:(int64_t)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  int64_t v9;
  uint64_t v11;

  v5 = sub_1BDBFC948();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BDBFC90C();
  v9 = _s11NotesShared34ICAttachmentSystemPaperModelHelperC016minimumSupporteda10VersionForE02at04baseJ0So07ICNotesJ0V10Foundation3URLV_AHtFZ_0((uint64_t)v8, a4);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v9;
}

+ (BOOL)canDisplayPaperAtURL:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char v7;
  uint64_t v9;

  v3 = sub_1BDBFC948();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BDBFC90C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED23AE20);
  v7 = sub_1BDBFD41C();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v7 & 1;
}

- (_TtC11NotesShared34ICAttachmentSystemPaperModelHelper)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ICAttachmentSystemPaperModelHelper();
  return -[ICAttachmentSystemPaperModelHelper init](&v3, sel_init);
}

@end
