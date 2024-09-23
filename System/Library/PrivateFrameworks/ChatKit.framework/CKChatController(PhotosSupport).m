@implementation CKChatController(PhotosSupport)

- (void)_gridViewNavigationControllerForMomentShareURL:()PhotosSupport chatItem:tapbackManager:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10_0(&dword_18DFCD000, v0, v1, "Will fetch moment share for URL: %@, generation: %td");
  OUTLINED_FUNCTION_2();
}

- (void)_gridViewNavigationControllerForChatItem:()PhotosSupport assetReference:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_18DFCD000, v0, v1, "Create and return a standard grid view navigation controller", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_previewViewControllerForAssetReference:()PhotosSupport dataSource:previewDelegate:previewMode:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_2(&dword_18DFCD000, a2, v3, "Cannot return a preview controller for data source: %{public}@", v4);
  OUTLINED_FUNCTION_1_0();
}

- (void)_presentPreviewViewControllerFromPhotosViewController:()PhotosSupport assetReference:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_8(&dword_18DFCD000, v1, (uint64_t)v1, "No preview controller for photos view Controller: %@, asset reference: %@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)retractScheduledChatItem:()PhotosSupport .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "retractChatItem: can't retract a chat item that is not a IMMessagePartChatItem", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)retractScheduledChatItems:()PhotosSupport fromAggregateChatItem:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "retractScheduledChatItems: can't retract chat items without target message parts or an aggregate chat item", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)retractScheduledChatItems:()PhotosSupport fromAggregateChatItem:.cold.2(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_18DFCD000, log, OS_LOG_TYPE_ERROR, "retractScheduledChatItems: can't retract chat items unless their IMChatItems are all of type IMMessagePartChatItem", buf, 2u);
}

- (void)retractScheduledChatItems:()PhotosSupport fromAggregateChatItem:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "retractScheduledChatItems: can't retract from a chat item that is not a IMAggregateMessagePartChatItem", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_assetReferenceForDisplayedGridChatItem:()PhotosSupport selectionSnapshot:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "transferGUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_2(&dword_18DFCD000, a2, v4, "nil asset reference for media object %{public}@", v5);

  OUTLINED_FUNCTION_1_0();
}

- (void)_assetReferenceForDisplayedGridChatItem:()PhotosSupport selectionSnapshot:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_2(&dword_18DFCD000, a2, v3, "Cannot look up asset reference for chat item with grid data source of type %{public}@", v4);
  OUTLINED_FUNCTION_1_0();
}

- (void)actionManager:()PhotosSupport quickLookChatItem:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_2(&dword_18DFCD000, v0, v1, "Could not look up asset reference for quick look on chat item: %@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)actionManager:()PhotosSupport tapbackChatItem:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_2(&dword_18DFCD000, v0, v1, "Could not look up asset reference for tapback on chat item: %@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)selectAllForActionManager:()PhotosSupport .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Could not select all because selection is not allowed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
