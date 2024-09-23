@implementation BPSCollect(BMBookmarkOperators)

+ (void)publisherWithPublisher:()BMBookmarkOperators upstreams:bookmarkState:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A956A000, log, OS_LOG_TYPE_ERROR, "Can't get valid upstreams", v1, 2u);
}

@end
