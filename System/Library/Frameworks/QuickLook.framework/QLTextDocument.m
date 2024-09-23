@implementation QLTextDocument

- (BOOL)hasRichContent
{
  return (*((unsigned __int8 *)&self->super._activityContinuationLock
          + OBJC_IVAR____TtC9QuickLook14QLTextDocument_content) != 255) & *((_BYTE *)&self->super._activityContinuationLock
                                                                          + OBJC_IVAR____TtC9QuickLook14QLTextDocument_content);
}

- (NSString)textContent
{
  _TtC9QuickLook14QLTextDocument *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_20D58D2D8();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_20D5A6AD4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (NSAttributedString)attributedTextContent
{
  _TtC9QuickLook14QLTextDocument *v2;
  id v3;

  v2 = self;
  v3 = sub_20D58D41C();

  return (NSAttributedString *)v3;
}

- (void)saveWithTextContent:(id)a3
{
  id v4;
  _TtC9QuickLook14QLTextDocument *v5;

  v4 = a3;
  v5 = self;
  sub_20D58D4E4(v4);

}

- (id)contentsForType:(id)a3 error:(id *)a4
{
  _TtC9QuickLook14QLTextDocument *v5;
  void *v6;
  _QWORD v8[4];

  sub_20D5A6AF8();
  v5 = self;
  sub_20D58D660((uint64_t)v8);
  swift_bridgeObjectRelease();

  __swift_project_boxed_opaque_existential_0(v8, v8[3]);
  v6 = (void *)sub_20D5A6F00();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);
  return v6;
}

- (BOOL)loadFromContents:(id)a3 ofType:(id)a4 error:(id *)a5
{
  _TtC9QuickLook14QLTextDocument *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE v13[32];

  swift_unknownObjectRetain();
  v7 = self;
  v8 = a4;
  sub_20D5A6DC8();
  swift_unknownObjectRelease();
  if (v8)
  {
    v9 = sub_20D5A6AF8();
    v11 = v10;

  }
  else
  {
    v9 = 0;
    v11 = 0;
  }
  sub_20D58DF80((uint64_t)v13, v9, v11);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);

  swift_bridgeObjectRelease();
  return 1;
}

- (_TtC9QuickLook14QLTextDocument)initWithFileURL:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  void *v9;
  objc_class *v10;
  _TtC9QuickLook14QLTextDocument *v11;
  objc_super v13;

  v4 = sub_20D5A6618();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20D5A6600();
  v8 = (char *)self + OBJC_IVAR____TtC9QuickLook14QLTextDocument_content;
  *(_QWORD *)v8 = 0;
  *((_QWORD *)v8 + 1) = 0;
  v8[16] = -1;
  v9 = (void *)sub_20D5A65E8();
  v10 = (objc_class *)type metadata accessor for QLTextDocument();
  v13.receiver = self;
  v13.super_class = v10;
  v11 = -[UIDocument initWithFileURL:](&v13, sel_initWithFileURL_, v9);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v11;
}

- (void).cxx_destruct
{
  sub_20D58D3C4(*(void **)((char *)&self->super.super.isa + OBJC_IVAR____TtC9QuickLook14QLTextDocument_content), *(uint64_t *)((char *)&self->super._currentUserActivity + OBJC_IVAR____TtC9QuickLook14QLTextDocument_content), *((_BYTE *)&self->super._activityContinuationLock + OBJC_IVAR____TtC9QuickLook14QLTextDocument_content));
}

@end
