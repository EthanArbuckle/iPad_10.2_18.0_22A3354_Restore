@implementation ICAttachment(Previews)

- (void)updateAttachmentPreviewImageWithImageData:()Previews size:scale:appearanceType:scaleWhenDrawing:metadata:sendNotification:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Failed saving preview image: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

@end
