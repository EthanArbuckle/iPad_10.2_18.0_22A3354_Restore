@implementation CKMultiFrameImage(CPBitmap_Persistence)

+ (void)multiFrameImageWithContentsOfCPBitmapURL:()CPBitmap_Persistence error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_18DFCD000, v0, v1, "Failed to create CPBitmap from file path, error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)multiFrameImageWithContentsOfCPBitmapURL:()CPBitmap_Persistence error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "CPBitmap file contained zero images, bailing.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)multiFrameImageWithContentsOfCPBitmapURL:()CPBitmap_Persistence error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Per frame scale count does not match frame count", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)firstFrameImageWithContentsOfCPBitmapURL:()CPBitmap_Persistence error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "CPBitmap image metadata includes per frame scale information that does not match count of image, ignoring.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)writeCPBitmapImagesWithCount:()CPBitmap_Persistence imageProvider:frameDurations:frameScales:toFileURL:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Cannot write cpbitmap to empty file path", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)writeCPBitmapImagesWithCount:()CPBitmap_Persistence imageProvider:frameDurations:frameScales:toFileURL:error:.cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_18DFCD000, a2, a3, "Failed to create CPBitmapWriter, stopping serialization. Error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

+ (void)writeCPBitmapImagesWithCount:()CPBitmap_Persistence imageProvider:frameDurations:frameScales:toFileURL:error:.cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_18DFCD000, a2, a3, "Failed to finalize cpbitmap file, stopping serialization. Error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

+ (void)writeCPBitmapImagesWithCount:()CPBitmap_Persistence imageProvider:frameDurations:frameScales:toFileURL:error:.cold.4(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_2_0(&dword_18DFCD000, a3, (uint64_t)a3, "Image provider unexpectedly returned nil, stopping serialization.", a1);
}

+ (void)writeCPBitmapImagesWithCount:()CPBitmap_Persistence imageProvider:frameDurations:frameScales:toFileURL:error:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Cannot write cpbitmap, frame scales do not match frame count.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)writeCPBitmapImagesWithCount:()CPBitmap_Persistence imageProvider:frameDurations:frameScales:toFileURL:error:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Cannot write cpbitmap, frame durations do not match frame count.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)writeAsCPBitmapToURL:()CPBitmap_Persistence error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_18DFCD000, v0, v1, "Writing image to CPBitmap file url failed with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
