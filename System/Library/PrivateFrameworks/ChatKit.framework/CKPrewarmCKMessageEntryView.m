@implementation CKPrewarmCKMessageEntryView

uint64_t __CKPrewarmCKMessageEntryView_block_invoke()
{
  void *v0;
  id v1;
  uint64_t result;

  +[CKMessageEntryView initialize](CKMessageEntryView, "initialize");
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "entryViewlayoutMetrics");

  result = +[CKMessageEntryContentView prewarmTextView](CKMessageEntryContentView, "prewarmTextView");
  CKPrewarmCKMessageEntryView_havePrewarmed = 1;
  return result;
}

@end
