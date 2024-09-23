@implementation AFUIResponderIsExemptFromDetectionHints

void __AFUIResponderIsExemptFromDetectionHints_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("CKMessageEntryRichTextView"), CFSTR("Reminders.TTRIReminderTitleTextView"), CFSTR("UnifiedField"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)AFUIResponderIsExemptFromDetectionHints__exemptClasses;
  AFUIResponderIsExemptFromDetectionHints__exemptClasses = v0;

}

@end
