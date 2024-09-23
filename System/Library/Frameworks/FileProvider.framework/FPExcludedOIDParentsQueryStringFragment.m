@implementation FPExcludedOIDParentsQueryStringFragment

uint64_t __FPExcludedOIDParentsQueryStringFragment_block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(_kMDItemQueryPathOID != %@)"), a2);
}

@end
