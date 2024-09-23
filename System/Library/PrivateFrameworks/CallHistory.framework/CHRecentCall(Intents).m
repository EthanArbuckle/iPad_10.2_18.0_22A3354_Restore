@implementation CHRecentCall(Intents)

- (void)interaction
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_1B3FA4000, log, OS_LOG_TYPE_ERROR, "Retrieving interaction for call with identifier %{public}@ failed with error %{public}@", (uint8_t *)&v3, 0x16u);
}

@end
