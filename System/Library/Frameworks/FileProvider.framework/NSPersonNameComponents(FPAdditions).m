@implementation NSPersonNameComponents(FPAdditions)

- (uint64_t)fp_formattedName
{
  return objc_msgSend(MEMORY[0x1E0CB3858], "localizedStringFromPersonNameComponents:style:options:", a1, 0, 0);
}

@end
