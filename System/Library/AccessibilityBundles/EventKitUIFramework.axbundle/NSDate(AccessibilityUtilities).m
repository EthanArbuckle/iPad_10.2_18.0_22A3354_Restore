@implementation NSDate(AccessibilityUtilities)

- (id)_accessibilityTimeString
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x24BDFEA60];
  AXDateStringForFormat();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "axAttributedStringWithString:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setAttribute:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDFEB00]);
  return v2;
}

- (uint64_t)_accessibilityYearlessDayString
{
  return AXDateStringForFormat();
}

@end
