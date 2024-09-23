@implementation NSData(ADCoreExtensions)

- (uint64_t)AD_dataStringForJSON
{
  uint64_t v1;

  v1 = objc_msgSend(a1, "length");
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Binary data, %ld bytes, ..."), v1);
}

@end
