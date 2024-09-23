@implementation ICCalculateGraphingController

- (ICNote)note
{
  return (ICNote *)sub_1AC946C40((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICCalculateGraphingController_note);
}

- (void)setNote:(id)a3
{
  sub_1AC946CE0();
}

- (UITextView)textView
{
  return (UITextView *)sub_1AC946C40((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICCalculateGraphingController_textView);
}

- (void)setTextView:(id)a3
{
  sub_1AC946CE0();
}

- (ICAttachmentInsertionController)attachmentInsertionController
{
  return (ICAttachmentInsertionController *)sub_1AC946C40((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICCalculateGraphingController_attachmentInsertionController);
}

- (void)setAttachmentInsertionController:(id)a3
{
  sub_1AC946CE0();
}

- (ICCalculateScrubberController)scrubberController
{
  return (ICCalculateScrubberController *)sub_1AC946C40((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICCalculateGraphingController_scrubberController);
}

- (void)setScrubberController:(id)a3
{
  sub_1AC946CE0();
}

- (ICCalculateGraphingController)initWithNote:(id)a3
{
  id v3;
  ICCalculateGraphingController *v4;

  v3 = a3;
  v4 = (ICCalculateGraphingController *)sub_1AC970D8C(v3);

  return v4;
}

- (id)insertionDecisionForExpressionsInRange:(_NSRange)a3
{
  Swift::Int length;
  Swift::Int location;
  ICCalculateGraphingController *v5;
  __C::_NSRange v6;
  void *v7;

  length = a3.length;
  location = a3.location;
  v5 = self;
  v6.location = location;
  v6.length = length;
  v7 = (void *)ICCalculateGraphingController.insertionDecision(forExpressionsIn:)(v6);

  return v7;
}

- (void)performDecision:(id)a3
{
  id v4;
  ICCalculateGraphingController *v5;
  int v6;
  id v7;
  ICCalculateGraphingController *v8;

  v4 = a3;
  v5 = self;
  v6 = (int)v5;
  v8 = v5;
  v7 = v4;
  ICCalculateGraphingController.perform(_:)(*(ICCalculateGraphingControllerInsertionDecision *)(&v6 - 2));

}

- (ICCalculateGraphingController)init
{
  ICCalculateGraphingController *result;

  result = (ICCalculateGraphingController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();

}

@end
