@implementation ICCalculateRecognitionController

- (ICNote)note
{
  return (ICNote *)sub_1AC946C40((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICCalculateRecognitionController_note);
}

- (void)setNote:(id)a3
{
  sub_1AC946CE0();
}

- (UITextView)textView
{
  return (UITextView *)sub_1AC946C40((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICCalculateRecognitionController_textView);
}

- (void)setTextView:(id)a3
{
  sub_1AC946CE0();
}

- (ICAttachmentInsertionController)attachmentInsertionController
{
  return (ICAttachmentInsertionController *)sub_1AC946C40((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICCalculateRecognitionController_attachmentInsertionController);
}

- (void)setAttachmentInsertionController:(id)a3
{
  sub_1AC946CE0();
}

- (ICCalculateRecognitionControllerSuggestionsDelegate)suggestionsDelegate
{
  return (ICCalculateRecognitionControllerSuggestionsDelegate *)sub_1AC946C40((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICCalculateRecognitionController_suggestionsDelegate);
}

- (void)setSuggestionsDelegate:(id)a3
{
  sub_1AC946CE0();
}

- (ICCalculateRecognitionController)initWithNote:(id)a3
{
  return (ICCalculateRecognitionController *)ICCalculateRecognitionController.init(note:)(a3);
}

- (void)didInsertString:(id)a3 atRange:(_NSRange)a4
{
  Swift::Int location;
  uint64_t v6;
  void *v7;
  void *v8;
  ICCalculateRecognitionController *v9;
  Swift::String v10;
  __C::_NSRange v11;

  location = a4.location;
  v6 = sub_1ACA420C0();
  v8 = v7;
  v9 = self;
  v10._countAndFlagsBits = v6;
  v10._object = v8;
  v11.location = location;
  ICCalculateRecognitionController.didInsert(_:at:)(v10, v11);

  swift_bridgeObjectRelease();
}

- (void)didUnmarkString:(id)a3 atRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  char *v7;
  unint64_t v8;
  unint64_t v9;
  ICCalculateRecognitionController *v10;

  length = a4.length;
  location = a4.location;
  v7 = (char *)sub_1ACA420C0();
  v9 = v8;
  v10 = self;
  if (location != sub_1ACA3F360() && (location & 0x8000000000000000) == 0)
    sub_1AC947174(v7, v9, location, length, 1);

  swift_bridgeObjectRelease();
}

- (BOOL)insertsResults
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___ICCalculateRecognitionController_insertsResults;
  swift_beginAccess();
  return *v2;
}

- (void)setInsertsResults:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___ICCalculateRecognitionController_insertsResults;
  swift_beginAccess();
  *v4 = a3;
}

- (void)insertResultAtRange:(_NSRange)a3
{
  Swift::Int length;
  Swift::Int location;
  __C::_NSRange v5;
  ICCalculateRecognitionController *v6;

  length = a3.length;
  location = a3.location;
  v6 = self;
  v5.location = location;
  v5.length = length;
  ICCalculateRecognitionController.insertResult(at:)(v5);

}

- (void)insertLiteralResultAtRange:(_NSRange)a3
{
  Swift::Int length;
  Swift::Int location;
  __C::_NSRange v5;
  ICCalculateRecognitionController *v6;

  length = a3.length;
  location = a3.location;
  v6 = self;
  v5.location = location;
  v5.length = length;
  ICCalculateRecognitionController.insertLiteralResult(at:)(v5);

}

- (int64_t)previewBehavior
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___ICCalculateRecognitionController_previewBehavior);
  swift_beginAccess();
  return *v2;
}

- (void)setPreviewBehavior:(int64_t)a3
{
  int64_t *v5;

  v5 = (int64_t *)((char *)self + OBJC_IVAR___ICCalculateRecognitionController_previewBehavior);
  swift_beginAccess();
  *v5 = a3;
  -[ICCalculateRecognitionController discardPreviewedResult](self, sel_discardPreviewedResult);
}

- (BOOL)isPreviewingResult
{
  return *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICCalculateRecognitionController_previewedExpression) != 0;
}

- (void)previewResultAtRange:(_NSRange)a3
{
  Swift::Int length;
  Swift::Int location;
  __C::_NSRange v5;
  ICCalculateRecognitionController *v6;

  length = a3.length;
  location = a3.location;
  v6 = self;
  v5.location = location;
  v5.length = length;
  ICCalculateRecognitionController.previewResult(at:)(v5);

}

- (void)commitPreviewedResultAtRange:(_NSRange)a3 asLiteral:(BOOL)a4
{
  Swift::Int length;
  Swift::Int location;
  __C::_NSRange v7;
  ICCalculateRecognitionController *v8;

  length = a3.length;
  location = a3.location;
  v8 = self;
  v7.location = location;
  v7.length = length;
  ICCalculateRecognitionController.commitPreviewedResult(at:asLiteral:)(v7, a4);

}

- (void)discardPreviewedResult
{
  ICCalculateRecognitionController *v2;

  v2 = self;
  ICCalculateRecognitionController.discardPreviewedResult()();

}

- (void)addErrorInteraction
{
  ICCalculateRecognitionController *v2;
  id v3;

  v2 = self;
  v3 = sub_1AC949D1C();
  sub_1ACA1B250();

}

- (ICCalculateRecognitionController)init
{
  ICCalculateRecognitionController *result;

  result = (ICCalculateRecognitionController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  sub_1AC8FC3B8((uint64_t)self + OBJC_IVAR___ICCalculateRecognitionController_suggestionsDelegate);
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___ICCalculateRecognitionController____lazy_storage___errorInteractionController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___ICCalculateRecognitionController_isMathPaperSolvingAllowedObservation));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___ICCalculateRecognitionController_isKeyboardMathSolvingAllowedObservation));
}

@end
