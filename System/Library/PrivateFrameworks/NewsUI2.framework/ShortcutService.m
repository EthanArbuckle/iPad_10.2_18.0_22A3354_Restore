@implementation ShortcutService

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC7NewsUI215ShortcutService *v5;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI215ShortcutService_shortcutList);
  v5 = self;
  objc_msgSend(v4, sel_removeObserver_, v5);
  objc_msgSend(*(id *)((char *)&v5->super.isa + OBJC_IVAR____TtC7NewsUI215ShortcutService_subscriptionController), sel_removeObserver_, v5);
  v6.receiver = v5;
  v6.super_class = ObjectType;
  -[ShortcutService dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
}

- (_TtC7NewsUI215ShortcutService)init
{
  _TtC7NewsUI215ShortcutService *result;

  result = (_TtC7NewsUI215ShortcutService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)subscriptionController:(id)a3 didAddTags:(id)a4 changeTags:(id)a5 moveTags:(id)a6 removeTags:(id)a7 subscriptionType:(unint64_t)a8
{
  uint64_t v13;
  id v14;
  _TtC7NewsUI215ShortcutService *v15;
  _QWORD *v16;

  if (a4)
  {
    sub_1D6E27038();
    if (!a5)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (a5)
LABEL_3:
    sub_1D6E27038();
LABEL_4:
  if (a6)
    sub_1D6E27038();
  if (a7)
  {
    v13 = sub_1D6E27038();
    v14 = a3;
    v15 = self;
    v16 = (_QWORD *)sub_1D623A92C(v13);
    if (v16[2])
      sub_1D623B57C(v16);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
}

- (void)shortcutList:(id)a3 didAddShortcuts:(id)a4 changedShortcuts:(id)a5 removedShortcuts:(id)a6
{
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  _TtC7NewsUI215ShortcutService *v12;

  sub_1D5E6F04C(0, (unint64_t *)&unk_1ED62DCF0);
  v8 = sub_1D6E26D80();
  v9 = sub_1D6E26D80();
  v10 = sub_1D6E26D80();
  v11 = a3;
  v12 = self;
  sub_1D623BB68(v11, v8, v9, v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
