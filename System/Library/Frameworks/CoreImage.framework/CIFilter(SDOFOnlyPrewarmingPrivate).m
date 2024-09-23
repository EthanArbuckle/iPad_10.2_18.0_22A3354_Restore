@implementation CIFilter(SDOFOnlyPrewarmingPrivate)

- (void)prewarmingString
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_1();
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "description");
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_1(&dword_1921E4000, v0, v1, "%{public}@: Unable to create XMP data from CGImageMetadataRef for key %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)prewarmedFilterFromString:()SDOFOnlyPrewarmingPrivate .cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_1();
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "description");
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_1(&dword_1921E4000, v0, v1, "%{public}@: Unable to unarchive data: = %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)prewarmedFilterFromString:()SDOFOnlyPrewarmingPrivate .cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend((id)OUTLINED_FUNCTION_3(), "description");
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_2(&dword_1921E4000, v0, v1, "%{public}@: Unable to find name of filter to create", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)prewarmedFilterFromString:()SDOFOnlyPrewarmingPrivate .cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_1();
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "description");
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_1(&dword_1921E4000, v0, v1, "%{public}@: Unable to create filter with name %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)prewarmedFilterFromString:()SDOFOnlyPrewarmingPrivate .cold.4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_1();
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "description");
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_1(&dword_1921E4000, v0, v1, "%{public}@: Unable extract XMP metadata for key %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)prewarmedFilterFromString:()SDOFOnlyPrewarmingPrivate .cold.5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend((id)OUTLINED_FUNCTION_3(), "description");
  OUTLINED_FUNCTION_1(&dword_1921E4000, v0, v1, "%{public}@: Unable to load camera calibration data %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

+ (void)prewarmedFilterFromString:()SDOFOnlyPrewarmingPrivate .cold.6()
{
  __assert_rtn("+[CIFilter(SDOFOnlyPrewarmingPrivate) prewarmedFilterFromString:]", "CIFilter+Prewarming.m", 182, "[objectDescription[@\"type\"] isEqualToString:[[CIImage class] description]]");
}

+ (void)prewarmedFilterFromString:()SDOFOnlyPrewarmingPrivate .cold.7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_1();
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "description");
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_1(&dword_1921E4000, v0, v1, "%{public}@: Unable to decompress data: = %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)verifyPrewarmedFilter:()SDOFOnlyPrewarmingPrivate .cold.1()
{
  __assert_rtn("-[CIFilter(SDOFOnlyPrewarmingPrivate) verifyPrewarmedFilter:]", "CIFilter+Prewarming.m", 218, "CGRectEqualToRect(goldImage.extent, fakeImage.extent)");
}

- (void)verifyPrewarmedFilter:()SDOFOnlyPrewarmingPrivate .cold.2()
{
  __assert_rtn("-[CIFilter(SDOFOnlyPrewarmingPrivate) verifyPrewarmedFilter:]", "CIFilter+Prewarming.m", 301, "[goldCCDDict isEqualToDictionary:fakeCCDDict]");
}

- (void)verifyPrewarmedFilter:()SDOFOnlyPrewarmingPrivate .cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend((id)objc_opt_class(), "description");
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_2(&dword_1921E4000, v0, v1, "%{public}@: pixel size not identical", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)verifyPrewarmedFilter:()SDOFOnlyPrewarmingPrivate .cold.4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend((id)objc_opt_class(), "description");
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_2(&dword_1921E4000, v0, v1, "%{public}@: lens distortion center not identical", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)verifyPrewarmedFilter:()SDOFOnlyPrewarmingPrivate .cold.5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend((id)objc_opt_class(), "description");
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_2(&dword_1921E4000, v0, v1, "%{public}@: inverse lens distortion lookup table not identical", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)verifyPrewarmedFilter:()SDOFOnlyPrewarmingPrivate .cold.6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend((id)objc_opt_class(), "description");
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_2(&dword_1921E4000, v0, v1, "%{public}@: lens distortion lookup table not identical", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)verifyPrewarmedFilter:()SDOFOnlyPrewarmingPrivate .cold.7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend((id)objc_opt_class(), "description");
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_2(&dword_1921E4000, v0, v1, "%{public}@: Extrinsic matrix dimensions not identical", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)verifyPrewarmedFilter:()SDOFOnlyPrewarmingPrivate .cold.8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend((id)objc_opt_class(), "description");
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_2(&dword_1921E4000, v0, v1, "%{public}@: Intrinsic matrix dimensions not identical", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)verifyPrewarmedFilter:()SDOFOnlyPrewarmingPrivate .cold.9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend((id)objc_opt_class(), "description");
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_2(&dword_1921E4000, v0, v1, "%{public}@: Intrinsic matrix may not identical", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)verifyPrewarmedFilter:()SDOFOnlyPrewarmingPrivate .cold.10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend((id)objc_opt_class(), "description");
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_2(&dword_1921E4000, v0, v1, "%{public}@: Colorspaces not identical", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
