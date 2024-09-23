@implementation CKMediaObject(EmojiImage)

- (void)cachedBlastdooredAdaptiveImageGlyph
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Emoji image is not previewable, bailing on generation.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)generateAndCacheBlastdooredAdaptiveImageGlyph
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5_1(&dword_18DFCD000, v0, v1, "Generating emoji image for cache key: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)saveAdaptiveImageGlyphToFileCache:()EmojiImage .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_18DFCD000, v0, v1, "Not saving generated adaptive image glyph to file cache due to process limitations.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
