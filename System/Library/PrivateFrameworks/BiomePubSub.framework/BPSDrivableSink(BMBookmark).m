@implementation BPSDrivableSink(BMBookmark)

- (void)newBookmark
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "status");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subscription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_1A956A000, a2, OS_LOG_TYPE_ERROR, "Subscription %@ could not create bookmark", (uint8_t *)&v5, 0xCu);

}

@end
