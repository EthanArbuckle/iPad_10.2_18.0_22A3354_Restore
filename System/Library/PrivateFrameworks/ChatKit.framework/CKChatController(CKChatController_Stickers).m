@implementation CKChatController(CKChatController_Stickers)

- (void)_prepareForDropAnimationWithItem:()CKChatController_Stickers preview:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_18DFCD000, v0, v1, "_prepareForDropAnimationWithItem failed without a preview container for dragPreview: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_sendStickerForDragItem:()CKChatController_Stickers previewSize:dropLocation:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Missing sticker image in emoji sticker image drag", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)sendSticker:()CKChatController_Stickers withMediaObject:composition:parentMessagePartChatItem:messageSummaryInfo:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Unable to send nil sticker", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)sendSticker:()CKChatController_Stickers withMediaObject:composition:parentMessagePartChatItem:messageSummaryInfo:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Unable to send nil media object", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)sendSticker:()CKChatController_Stickers withMediaObject:composition:parentMessagePartChatItem:messageSummaryInfo:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Unable to send nil composition", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)repositionSticker:()CKChatController_Stickers stickerChatItem:parentMessagePartChatItem:stickerPositioningInfo:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Unable to reposition - missing reposition info", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)repositionSticker:()CKChatController_Stickers stickerChatItem:parentMessagePartChatItem:stickerPositioningInfo:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Unable to reposition - nil sticker positioning info", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)repositionSticker:()CKChatController_Stickers stickerChatItem:parentMessagePartChatItem:stickerPositioningInfo:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Unable to reposition - nil sticker chat item", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)repositionSticker:()CKChatController_Stickers stickerChatItem:parentMessagePartChatItem:stickerPositioningInfo:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Unable to reposition - nil sticker", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)repositionSticker:()CKChatController_Stickers stickerChatItem:parentMessagePartChatItem:stickerPositioningInfo:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Unable to reposition - Sticker repositioning feature flag is turned off", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
