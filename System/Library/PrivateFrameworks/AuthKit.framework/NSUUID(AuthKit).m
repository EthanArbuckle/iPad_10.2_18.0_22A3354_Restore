@implementation NSUUID(AuthKit)

- (id)ak_uuidData
{
  _BYTE v2[16];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "getUUIDBytes:", v2);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v2, 16);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
