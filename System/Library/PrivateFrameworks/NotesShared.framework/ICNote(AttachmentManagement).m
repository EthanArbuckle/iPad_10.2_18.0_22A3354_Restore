@implementation ICNote(AttachmentManagement)

- (void)addAttachmentWithFileURL:()AttachmentManagement updateFileBasedAttributes:analytics:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_10(&dword_1BD918000, v0, (uint64_t)v0, "Failed to determine if %@ is a directory, error %@", v1);
  OUTLINED_FUNCTION_1_0();
}

- (void)addMediaToAttachment:()AttachmentManagement withBlock:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, v0, v1, "Need to wait for a save before adding media in background for %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)addMediaToAttachment:()AttachmentManagement withBlock:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, v0, v1, "Adding media asynchronously for %@", v2);
  OUTLINED_FUNCTION_1_0();
}

@end
