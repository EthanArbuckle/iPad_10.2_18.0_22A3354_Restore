@implementation NSString

void __60__NSString_FSPathAdditions__fpfs_extractFSEventsBarrierUUID__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("\\.rendez-vous\\.([0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12})\\.nosync"), 1, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)fpfs_extractFSEventsBarrierUUID_regexp;
  fpfs_extractFSEventsBarrierUUID_regexp = v0;

}

void __59__NSString_FSPathAdditions__fpfs_extractFSEventsNotifyUUID__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("\\.notify\\.([0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12})\\.nosync"), 1, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)fpfs_extractFSEventsNotifyUUID_regexp;
  fpfs_extractFSEventsNotifyUUID_regexp = v0;

}

@end
