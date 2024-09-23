@implementation MUIManualSummaryController

- (void).cxx_destruct
{
  swift_getObjectType();

}

+ (BOOL)shouldAlwaysHideConversationSummarizeControl
{
  swift_getObjCClassMetadata();
  swift_getObjCClassMetadata();
  sub_1D5615C4C();
  return sub_1D565EE08() & 1;
}

- (MUIManualSummaryController)initWithMessages:(id)a3 sourceViewController:(id)a4
{
  id v4;
  id v5;
  uint64_t v6;
  MUIManualSummaryController *v10;

  swift_getObjectType();
  v4 = a3;
  v5 = a4;
  sub_1D55D6268();
  v6 = sub_1D565FF90();
  v10 = (MUIManualSummaryController *)sub_1D5615F30(v6, a4);

  return v10;
}

- (void)summarizeMessageWithCompletion:(id)a3
{
  MUIManualSummaryController *v4;
  void *v6;
  uint64_t v7;

  swift_getObjectType();
  v6 = _Block_copy(a3);
  v4 = self;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  MUIManualSummaryController.summarizeMessage(completion:)((uint64_t)sub_1D561651C, v7);
  swift_release();

}

- (void)provideFeedbackWithType:(int64_t)a3
{
  MUIManualSummaryController *v4;

  swift_getObjectType();
  v4 = self;
  MUIManualSummaryController.provideFeedback(with:)(a3);

}

+ (BOOL)shouldAllowSummarizationForContentLength:(int64_t)a3
{
  swift_getObjCClassMetadata();
  swift_getObjCClassMetadata();
  static MUIManualSummaryController.shouldAllowSummarization(forContentLength:)(a3);
  return sub_1D565EE08() & 1;
}

- (MUIManualSummaryController)init
{
  swift_getObjectType();
  return (MUIManualSummaryController *)MUIManualSummaryController.init()();
}

@end
