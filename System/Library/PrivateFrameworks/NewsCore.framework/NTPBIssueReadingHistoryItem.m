@implementation NTPBIssueReadingHistoryItem

void __64__NTPBIssueReadingHistoryItem_FCIssueReadingHistory__asCKRecord__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x1E0C95098]);
  v1 = objc_msgSend(v0, "initWithZoneName:ownerName:", CFSTR("IssueReadingHistory"), *MEMORY[0x1E0C94730]);
  v2 = (void *)_MergedGlobals_202;
  _MergedGlobals_202 = v1;

}

@end
