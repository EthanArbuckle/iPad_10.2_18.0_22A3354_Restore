@implementation FPRecentDocumentsQueryStringForTypes

uint64_t __FPRecentDocumentsQueryStringForTypes_block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ > 0 && %@ < 3124137600"), a2, a2);
}

@end
