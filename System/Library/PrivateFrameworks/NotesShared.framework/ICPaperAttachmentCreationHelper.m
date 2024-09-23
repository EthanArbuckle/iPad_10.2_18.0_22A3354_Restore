@implementation ICPaperAttachmentCreationHelper

+ (void)copyNewPaperBundleToAttachment:(ICAttachment *)a3 fromURL:(NSURL *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  ICAttachment *v17;
  NSURL *v18;
  uint64_t v19;

  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED23A600);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = a1;
  v14 = sub_1BDBFDBC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EF50EFB0;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EF50EFB8;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  sub_1BDBA8D44((uint64_t)v11, (uint64_t)&unk_1EF50EFC0, (uint64_t)v16);
  swift_release();
}

+ (void)createPaperDocumentForAttachment:(ICAttachment *)a3 fromLegacyMediaAtURL:(NSURL *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  ICAttachment *v17;
  NSURL *v18;
  uint64_t v19;

  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED23A600);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = a1;
  v14 = sub_1BDBFDBC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EF50EF90;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EF50EF98;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  sub_1BDBA8D44((uint64_t)v11, (uint64_t)&unk_1EF50EFA0, (uint64_t)v16);
  swift_release();
}

+ (BOOL)createPaperDocumentForAttachment:(id)a3 fromLegacyMediaAtURL:(id)a4 error:(id *)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  uint64_t v12;

  v6 = sub_1BDBFC948();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BDBFC90C();
  swift_getObjCClassMetadata();
  v10 = a3;
  static ICPaperAttachmentCreationHelper.createPaperDocument(for:fromLegacyMediaAt:)(v10, (uint64_t)v9);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return 1;
}

+ (id)createSystemPaperAttachmentWithPKDrawing:(id)a3 inNote:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v14;

  v6 = sub_1BDBFD5A8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = a3;
  v11 = a4;
  sub_1BDBFD59C();

  swift_getObjCClassMetadata();
  v12 = static ICPaperAttachmentCreationHelper.createSystemPaperAttachment(with:in:)((uint64_t)v9, v11);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (ICPaperAttachmentCreationHelper)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICPaperAttachmentCreationHelper;
  return -[ICPaperAttachmentCreationHelper init](&v3, sel_init);
}

@end
