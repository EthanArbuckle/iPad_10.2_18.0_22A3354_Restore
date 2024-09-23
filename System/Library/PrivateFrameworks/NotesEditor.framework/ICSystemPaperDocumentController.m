@implementation ICSystemPaperDocumentController

+ (ICSystemPaperDocumentController)sharedInstance
{
  if (qword_1EDBFA018 != -1)
    swift_once();
  return (ICSystemPaperDocumentController *)(id)qword_1EDBF9F18;
}

- (ICSystemPaperDocumentController)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICSystemPaperDocumentController_presenters) = (Class)MEMORY[0x1E0DEE9D8];
  sub_1DD9D09E8();
  sub_1DD9D09B8();
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[ICSystemPaperDocumentController init](&v5, sel_init);
}

- (void)addPresenter:(id)a3
{
  ICNoteEditorViewController *v4;
  ICSystemPaperDocumentController *v5;

  v4 = (ICNoteEditorViewController *)a3;
  v5 = self;
  ICSystemPaperDocumentController.add(_:)(v4);

}

- (void)removePresenter:(id)a3
{
  ICNoteEditorViewController *v4;
  ICSystemPaperDocumentController *v5;

  v4 = (ICNoteEditorViewController *)a3;
  v5 = self;
  ICSystemPaperDocumentController.remove(_:)(v4);

}

- (id)presenterForPaperIdentifier:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  ICSystemPaperDocumentController *v7;
  Swift::String v8;
  ICNoteEditorViewController_optional *v9;
  void *v10;
  void *v11;

  v4 = sub_1DD9D2170();
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  ICSystemPaperDocumentController.presenter(for:)(v9, v8);
  v11 = v10;

  swift_bridgeObjectRelease();
  return v11;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
