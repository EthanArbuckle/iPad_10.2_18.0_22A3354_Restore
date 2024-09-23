@implementation BPSWindower(BMBookmarkOperators)

- (void)bookmarkableUpstreams
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A956A000, log, OS_LOG_TYPE_FAULT, "Unexpectedly found nil upstream in BPSWindower", v1, 2u);
}

@end
