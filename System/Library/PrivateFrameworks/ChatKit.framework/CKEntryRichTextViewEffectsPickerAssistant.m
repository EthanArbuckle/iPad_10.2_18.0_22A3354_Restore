@implementation CKEntryRichTextViewEffectsPickerAssistant

- (CKEntryRichTextViewEffectsPickerAssistant)initWithTextView:(id)a3
{
  objc_super v5;

  swift_unknownObjectWeakInit();
  *((_BYTE *)&self->super.isa
  + OBJC_IVAR___CKEntryRichTextViewEffectsPickerAssistant_shouldSkipNextAdjustingOfTypingAttributes) = 0;
  swift_unknownObjectWeakAssign();
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for EntryRichTextViewEffectsPickerAssistant();
  return -[CKEntryRichTextViewEffectsPickerAssistant init](&v5, sel_init);
}

- (BOOL)shouldSkipNextAdjustingOfTypingAttributes
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___CKEntryRichTextViewEffectsPickerAssistant_shouldSkipNextAdjustingOfTypingAttributes;
  swift_beginAccess();
  return *v2;
}

- (void)setShouldSkipNextAdjustingOfTypingAttributes:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___CKEntryRichTextViewEffectsPickerAssistant_shouldSkipNextAdjustingOfTypingAttributes;
  swift_beginAccess();
  *v4 = a3;
}

- (void)selectSentenceAtCaretIfPossible
{
  CKEntryRichTextViewEffectsPickerAssistant *v2;

  v2 = self;
  sub_18E5D0FA0();

}

- (void)selectWordAtCaretIfPossible
{
  CKEntryRichTextViewEffectsPickerAssistant *v2;

  v2 = self;
  sub_18E5D15D0();

}

- (void)adjustTypingAttributesIfNeededForReplacement:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  CKEntryRichTextViewEffectsPickerAssistant *v10;

  length = a4.length;
  location = a4.location;
  v7 = sub_18E768984();
  v9 = v8;
  v10 = self;
  sub_18E5D171C(v7, v9, location, length, 1);

  swift_bridgeObjectRelease();
}

- (void)removeTypingAttributesAdjustments
{
  CKEntryRichTextViewEffectsPickerAssistant *v2;

  v2 = self;
  sub_18E5D2904();

}

- (CKEntryRichTextViewEffectsPickerAssistant)init
{
  CKEntryRichTextViewEffectsPickerAssistant *result;

  result = (CKEntryRichTextViewEffectsPickerAssistant *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
}

@end
