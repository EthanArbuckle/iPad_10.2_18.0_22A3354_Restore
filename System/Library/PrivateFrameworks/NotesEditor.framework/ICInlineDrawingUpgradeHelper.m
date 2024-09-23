@implementation ICInlineDrawingUpgradeHelper

- (ICNote)note
{
  return (ICNote *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR____TtC11NotesEditor28ICInlineDrawingUpgradeHelper_note));
}

- (NSManagedObjectContext)managedObjectContext
{
  return (NSManagedObjectContext *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                           + OBJC_IVAR____TtC11NotesEditor28ICInlineDrawingUpgradeHelper_managedObjectContext));
}

- (UITextView)textView
{
  return (UITextView *)(id)MEMORY[0x1DF0DF9A8]((char *)self+ OBJC_IVAR____TtC11NotesEditor28ICInlineDrawingUpgradeHelper_textView, a2);
}

- (void)setTextView:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (_TtC11NotesEditor28ICInlineDrawingUpgradeHelper)initWithNote:(id)a3 managedObjectContext:(id)a4 textView:(id)a5
{
  id v7;
  id v8;
  id v9;
  _TtC11NotesEditor28ICInlineDrawingUpgradeHelper *v10;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (_TtC11NotesEditor28ICInlineDrawingUpgradeHelper *)sub_1DD95A914(v7, v8);

  return v10;
}

- (id)upgradeWithAttachment:(id)a3 itemProviders:(id)a4 itemsLocation:(CGPoint)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _TtC11NotesEditor28ICInlineDrawingUpgradeHelper *v15;
  void *v16;
  uint64_t v18;

  v5 = *(_QWORD *)&a5.y;
  v6 = *(_QWORD *)&a5.x;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03F81F8);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DD7C0C74(0, &qword_1F03F6A10);
  v12 = sub_1DD9D22A8();
  v13 = sub_1DD9D1C90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v11, 1, 1, v13);
  v14 = a3;
  v15 = self;
  v16 = (void *)sub_1DD957984(v14, v12, v6, v5, 0, (uint64_t)v11);
  sub_1DD8FF244((uint64_t)v11, &qword_1F03F81F8);

  swift_bridgeObjectRelease();
  return v16;
}

- (id)upgradeWithAttachment:(id)a3 itemProviders:(id)a4 itemsAnchor:(int64_t)a5
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  id v12;
  _TtC11NotesEditor28ICInlineDrawingUpgradeHelper *v13;
  void *v14;
  uint64_t v16;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03F81F8);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DD7C0C74(0, &qword_1F03F6A10);
  v11 = sub_1DD9D22A8();
  type metadata accessor for ICSystemPaperDocumentHelper();
  sub_1DD9AB46C(a5, (uint64_t)v10);
  v12 = a3;
  v13 = self;
  v14 = (void *)sub_1DD957984(v12, v11, 0, 0, 1, (uint64_t)v10);
  sub_1DD8FF244((uint64_t)v10, &qword_1F03F81F8);

  swift_bridgeObjectRelease();
  return v14;
}

- (void)cancelUpgrade
{
  _TtC11NotesEditor28ICInlineDrawingUpgradeHelper *v2;

  v2 = self;
  ICInlineDrawingUpgradeHelper.cancelUpgrade()();

}

- (void)upgradeAllAttachmentsInNote
{
  _TtC11NotesEditor28ICInlineDrawingUpgradeHelper *v2;

  v2 = self;
  ICInlineDrawingUpgradeHelper.upgradeAllAttachmentsInNote()();

}

- (_TtC11NotesEditor28ICInlineDrawingUpgradeHelper)init
{
  _TtC11NotesEditor28ICInlineDrawingUpgradeHelper *result;

  result = (_TtC11NotesEditor28ICInlineDrawingUpgradeHelper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11NotesEditor28ICInlineDrawingUpgradeHelper_managedObjectContext));
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11NotesEditor28ICInlineDrawingUpgradeHelper_upgradeSemaphore));
}

@end
