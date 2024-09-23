@implementation ATXAppSwitcherSuggestionSender

- (void)blendingLayerDidUpdateAppSwitcherUICache
{
  NSObject *v2;
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_blending();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1C9A3B000, v2, OS_LOG_TYPE_DEFAULT, "%@ - received new ui cache", (uint8_t *)&v5, 0xCu);

  }
  notify_post((const char *)objc_msgSend((id)*MEMORY[0x1E0CF89B8], "UTF8String"));
}

@end
