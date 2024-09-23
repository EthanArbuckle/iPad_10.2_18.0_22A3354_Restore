@implementation NotesSiriSingleNoteHelper

- (id)noteHTMLEditorView:(id)a3 fileURLForAttachmentWithContentID:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  id v11;
  _TtC11NotesSiriUIP33_3E7C7BF264EBD40B6730A9F9F307847625NotesSiriSingleNoteHelper *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_257286668);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    sub_243141114();
    a4 = v10;
  }
  v11 = a3;
  v12 = self;
  sub_24312D680((uint64_t)a4, (uint64_t)v9);

  swift_bridgeObjectRelease();
  v13 = sub_243140AFC();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v9, 1, v13) != 1)
  {
    v15 = (void *)sub_243140AD8();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v9, v13);
  }
  return v15;
}

- (id)noteHTMLEditorView:(id)a3 attachmentPresentationForContentID:(id)a4
{
  id v6;
  _TtC11NotesSiriUIP33_3E7C7BF264EBD40B6730A9F9F307847625NotesSiriSingleNoteHelper *v7;
  void *v8;
  id v9;

  if (a4)
  {
    sub_243141114();
    v6 = a3;
    v7 = self;
    v8 = (void *)sub_243141108();
    v9 = sub_24312DB10((uint64_t)v8);

    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (_TtC11NotesSiriUIP33_3E7C7BF264EBD40B6730A9F9F307847625NotesSiriSingleNoteHelper)init
{
  uint64_t v3;
  _TtC11NotesSiriUIP33_3E7C7BF264EBD40B6730A9F9F307847625NotesSiriSingleNoteHelper *v4;
  objc_super v6;

  v3 = OBJC_IVAR____TtC11NotesSiriUIP33_3E7C7BF264EBD40B6730A9F9F307847625NotesSiriSingleNoteHelper_attachmentPresentations;
  sub_24312E204(0, &qword_257286698);
  v4 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)MEMORY[0x2494F305C](MEMORY[0x24BEE4AF8]);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for NotesSiriSingleNoteHelper();
  return -[NotesSiriSingleNoteHelper init](&v6, sel_init);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11NotesSiriUIP33_3E7C7BF264EBD40B6730A9F9F307847625NotesSiriSingleNoteHelper_attachmentPresentations));
}

@end
