@implementation CSSearchQuery(TopHitRanking)

- (void)setupTopHitQueryContextForClientBundleId:()TopHitRanking .cold.6(NSObject *a1)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = qos_class_self();
  _os_log_debug_impl(&dword_18C42F000, a1, OS_LOG_TYPE_DEBUG, "QOS _topHitQueryParameters: %d", (uint8_t *)v2, 8u);
}

@end
