@implementation AssetViewerLogHandleForCategory

void __AssetViewerLogHandleForCategory_block_invoke()
{
  uint64_t i;
  os_log_t v1;
  void *v2;

  for (i = 0; i != 3; ++i)
  {
    v1 = os_log_create("com.apple.AssetViewer", AssetViewerLogHandleForCategory_categoryNames[i]);
    v2 = (void *)AssetViewerLogHandleForCategory_logHandles[i];
    AssetViewerLogHandleForCategory_logHandles[i] = (uint64_t)v1;

  }
}

@end
