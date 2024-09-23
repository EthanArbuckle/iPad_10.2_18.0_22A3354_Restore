@implementation FPContentTypeQueryStringForFileTypes

uint64_t __FPContentTypeQueryStringForFileTypes_block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@)"), a2);
}

uint64_t __FPContentTypeQueryStringForFileTypes_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(kMDItemContentTypeTree != \"%@\"c)"), a2);
}

uint64_t __FPContentTypeQueryStringForFileTypes_block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(kMDItemContentTypeTree == \"%@\"c)"), a2);
}

@end
