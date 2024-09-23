@implementation MXMUncacheBeforeIteration

void __MXMUncacheBeforeIteration_block_invoke(uint64_t a1, char a2)
{
  NSObject *v2;
  uint8_t v3[16];

  if ((a2 & 1) == 0)
  {
    _MXMGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_214474000, v2, OS_LOG_TYPE_ERROR, "Unable to uncache before iteration. See error logs for more details.", v3, 2u);
    }

  }
}

@end
