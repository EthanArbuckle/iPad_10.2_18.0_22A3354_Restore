@implementation CKChatController(ClickyOrbConformance)

- (void)transcriptCollectionViewController:()ClickyOrbConformance previewForHighlightingContextMenuWithConfiguration:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "No balloonView found to make a preview from.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)transcriptCollectionViewController:()ClickyOrbConformance previewForHighlightingContextMenuWithConfiguration:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Tried to initialize UITargetedPreview with a view that is not in a window", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)transcriptCollectionViewController:()ClickyOrbConformance previewForHighlightingContextMenuWithConfiguration:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Unhandled balloonView type: cannot generate preview", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_showAutoDonationAlertForAppName:()ClickyOrbConformance bundleID:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_1(&dword_18DFCD000, a2, a3, "Not showing SWY alert. AppName: %@ BundleID: %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_2();
}

- (void)_deleteActionForChatItem:()ClickyOrbConformance shouldUseTopMostChatItemIfAggregateChatItem:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_18DFCD000, a1, a3, "%s chatItemToDelete was nil", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_exportActionForChatItem:()ClickyOrbConformance shouldUseTopMostChatItemIfAggregateChatItem:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "The media object was nil while trying to create the export context menu action.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_exportActionForChatItem:()ClickyOrbConformance shouldUseTopMostChatItemIfAggregateChatItem:.cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_18DFCD000, a2, a3, "Trying to export chat item that doesn't have any media objects: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
