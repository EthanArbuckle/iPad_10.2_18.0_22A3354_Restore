@implementation DOCTypeToFocusController

- (_TtC26DocumentManagerExecutables24DOCTypeToFocusController)init
{
  return (_TtC26DocumentManagerExecutables24DOCTypeToFocusController *)DOCTypeToFocusController.init()();
}

- (int64_t)autocorrectionType
{
  return 1;
}

- (UITextInputAssistantItem)inputAssistantItem
{
  return (UITextInputAssistantItem *)objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDA68]), sel_init);
}

- (BOOL)hasText
{
  return 0;
}

- (void)insertText:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  _TtC26DocumentManagerExecutables24DOCTypeToFocusController *v7;
  Swift::String v8;

  v4 = sub_21EB02B88();
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  DOCTypeToFocusController.insertText(_:)(v8);

  swift_bridgeObjectRelease();
}

- (UIView)inputView
{
  uint64_t v2;
  _TtC26DocumentManagerExecutables24DOCTypeToFocusController *v3;
  UIView *v4;

  v2 = qword_255469C58;
  v3 = self;
  if (v2 != -1)
    swift_once();
  v4 = (UIView *)(id)qword_25546C370;

  return v4;
}

- (void)typingTimeout
{
  _QWORD *v3;
  _TtC26DocumentManagerExecutables24DOCTypeToFocusController *v4;
  void *v5;

  v3 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC26DocumentManagerExecutables24DOCTypeToFocusController_typeToFocusInputBuffer);
  swift_beginAccess();
  *v3 = 0;
  v3[1] = 0xE000000000000000;
  v4 = self;
  swift_bridgeObjectRelease();
  v5 = *(Class *)((char *)&v4->super.super.isa
                + OBJC_IVAR____TtC26DocumentManagerExecutables24DOCTypeToFocusController_typeToFocusTimeout);
  *(Class *)((char *)&v4->super.super.isa
           + OBJC_IVAR____TtC26DocumentManagerExecutables24DOCTypeToFocusController_typeToFocusTimeout) = 0;

}

- (void).cxx_destruct
{
  sub_21EA60CEC((uint64_t)self + OBJC_IVAR____TtC26DocumentManagerExecutables24DOCTypeToFocusController_delegate);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC26DocumentManagerExecutables24DOCTypeToFocusController_typeToFocusTimeout));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC26DocumentManagerExecutables24DOCTypeToFocusController_typeToFocusInputView));
}

@end
