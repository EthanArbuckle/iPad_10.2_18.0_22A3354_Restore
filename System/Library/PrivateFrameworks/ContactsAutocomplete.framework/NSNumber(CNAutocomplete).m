@implementation NSNumber(CNAutocomplete)

+ (uint64_t)_cnac_numberWithAutocompleteAddressType:()CNAutocomplete
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
}

@end
