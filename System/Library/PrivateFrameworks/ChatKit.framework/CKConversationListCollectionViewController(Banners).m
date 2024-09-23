@implementation CKConversationListCollectionViewController(Banners)

- (void)addBanner:()Banners animated:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = 0;
  _os_log_error_impl(&dword_18DFCD000, a2, OS_LOG_TYPE_ERROR, "Not displaying banner, banner superview: %@ isn't the view controller's view: %@ after insertion", (uint8_t *)&v4, 0x16u);

}

@end
