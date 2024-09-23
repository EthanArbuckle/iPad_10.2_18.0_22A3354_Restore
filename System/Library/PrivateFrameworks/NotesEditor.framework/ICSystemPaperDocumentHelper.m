@implementation ICSystemPaperDocumentHelper

- (ICAttachment)attachment
{
  return (ICAttachment *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                 + OBJC_IVAR___ICSystemPaperDocumentHelper_attachment));
}

- (UITextView)textView
{
  return (UITextView *)(id)MEMORY[0x1DF0DF9A8]((char *)self + OBJC_IVAR___ICSystemPaperDocumentHelper_textView, a2);
}

- (void)setTextView:(id)a3
{
  swift_unknownObjectWeakAssign();
}

+ (id)drawingForPaperAttachment:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03F9C58);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a3;
  static ICSystemPaperDocumentHelper.drawing(for:)(v7, (uint64_t)v6);

  v8 = sub_1DD9D20A4();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8) != 1)
  {
    v10 = (void *)sub_1DD9D208C();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v8);
  }
  return v10;
}

- (ICSystemPaperDocumentHelper)initWithPaperAttachment:(id)a3 textView:(id)a4
{
  objc_class *ObjectType;
  id v7;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICSystemPaperDocumentHelper_attachment) = (Class)a3;
  swift_unknownObjectWeakAssign();
  v9.receiver = self;
  v9.super_class = ObjectType;
  v7 = a3;
  return -[ICSystemPaperDocumentHelper init](&v9, sel_init);
}

- (void)addWithItemProviders:(id)a3 itemsAnchor:(int64_t)a4
{
  uint64_t v6;
  ICSystemPaperDocumentHelper *v7;

  sub_1DD7C0C74(0, &qword_1F03F6A10);
  v6 = sub_1DD9D22A8();
  v7 = self;
  ICSystemPaperDocumentHelper.add(itemProviders:itemsAnchor:)((Swift::OpaquePointer)v6, (UIViewContentMode)a4);

  swift_bridgeObjectRelease();
}

- (ICSystemPaperDocumentHelper)init
{
  ICSystemPaperDocumentHelper *result;

  result = (ICSystemPaperDocumentHelper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_unknownObjectWeakDestroy();
}

@end
