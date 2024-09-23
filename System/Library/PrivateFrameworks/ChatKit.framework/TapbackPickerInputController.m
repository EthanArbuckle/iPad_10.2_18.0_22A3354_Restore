@implementation TapbackPickerInputController

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)supportsImagePaste
{
  char *v3;
  uint64_t v4;
  uint64_t (*v5)(void);
  _TtC7ChatKit28TapbackPickerInputController *v6;
  char v7;

  v3 = (char *)self + OBJC_IVAR____TtC7ChatKit28TapbackPickerInputController_inputControllerDelegate;
  if (MEMORY[0x193FF501C]((char *)self + OBJC_IVAR____TtC7ChatKit28TapbackPickerInputController_inputControllerDelegate, a2))
  {
    v4 = *((_QWORD *)v3 + 1);
    swift_getObjectType();
    v5 = *(uint64_t (**)(void))(v4 + 32);
    v6 = self;
    v7 = v5();

    swift_unknownObjectRelease();
  }
  else
  {
    v7 = 0;
  }
  return v7 & 1;
}

- (NSString)textInputContextIdentifier
{
  char *v3;
  void *v4;
  uint64_t v5;
  void (*v6)(void);
  _TtC7ChatKit28TapbackPickerInputController *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = (char *)self + OBJC_IVAR____TtC7ChatKit28TapbackPickerInputController_inputControllerDelegate;
  v4 = (void *)MEMORY[0x193FF501C]((char *)self + OBJC_IVAR____TtC7ChatKit28TapbackPickerInputController_inputControllerDelegate, a2);
  if (v4)
  {
    v5 = *((_QWORD *)v3 + 1);
    swift_getObjectType();
    v6 = *(void (**)(void))(v5 + 40);
    v7 = self;
    v6();
    v9 = v8;

    swift_unknownObjectRelease();
    if (v9)
    {
      v4 = (void *)sub_18E768954();
      swift_bridgeObjectRelease();
    }
    else
    {
      v4 = 0;
    }
  }
  return (NSString *)v4;
}

- (_TtC7ChatKit28TapbackPickerInputController)initWithCoder:(id)a3
{
  id v5;
  _TtC7ChatKit28TapbackPickerInputController *result;

  *(_QWORD *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC7ChatKit28TapbackPickerInputController_inputControllerDelegate) = 0;
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  v5 = a3;

  result = (_TtC7ChatKit28TapbackPickerInputController *)sub_18E769320();
  __break(1u);
  return result;
}

- (_TtC7ChatKit28TapbackPickerInputController)init
{
  return (_TtC7ChatKit28TapbackPickerInputController *)sub_18E72EB08();
}

- (void)dealloc
{
  void *v3;
  _TtC7ChatKit28TapbackPickerInputController *v4;
  id v5;
  void *v6;
  objc_super v7;

  v3 = (void *)objc_opt_self();
  v4 = self;
  v5 = objc_msgSend(v3, sel_sharedInstance);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, sel_setPayloadDelegate_, MEMORY[0x193FF501C]((char *)v4 + OBJC_IVAR____TtC7ChatKit28TapbackPickerInputController_previousPayloadDelegate));
    swift_unknownObjectRelease();

    v7.receiver = v4;
    v7.super_class = (Class)type metadata accessor for TapbackPickerInputController();
    -[TapbackPickerInputController dealloc](&v7, sel_dealloc);
  }
  else
  {
    __break(1u);
  }
}

- (void).cxx_destruct
{
  sub_18E522F74((uint64_t)self + OBJC_IVAR____TtC7ChatKit28TapbackPickerInputController_inputControllerDelegate);
  sub_18E522F74((uint64_t)self + OBJC_IVAR____TtC7ChatKit28TapbackPickerInputController_previousPayloadDelegate);
}

- (void)handlePayload:(id)a3 withPayloadId:(id)a4
{
  id v4;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _TtC7ChatKit28TapbackPickerInputController *v9;

  v4 = a4;
  if (!a3)
  {
    v6 = 0;
    if (a4)
      goto LABEL_3;
LABEL_5:
    v7 = 0;
    goto LABEL_6;
  }
  v6 = sub_18E76887C();
  if (!v4)
    goto LABEL_5;
LABEL_3:
  v7 = sub_18E768984();
  v4 = v8;
LABEL_6:
  v9 = self;
  sub_18E72EE34(v6, v7, (uint64_t)v4);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (BOOL)supportsAdaptiveImageGlyph
{
  return 0;
}

- (void)insertAdaptiveImageGlyph:(id)a3 replacementRange:(id)a4
{
  id v6;
  id v7;
  _TtC7ChatKit28TapbackPickerInputController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_18E72FC54((uint64_t)v6);

}

- (_TtC7ChatKit28TapbackPickerInputController)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  id v4;
  _TtC7ChatKit28TapbackPickerInputController *result;

  v4 = a4;
  result = (_TtC7ChatKit28TapbackPickerInputController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
