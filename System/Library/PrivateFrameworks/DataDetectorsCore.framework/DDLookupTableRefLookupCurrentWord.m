@implementation DDLookupTableRefLookupCurrentWord

uint64_t __DDLookupTableRefLookupCurrentWord_block_invoke()
{
  uint64_t result;
  int v1;

  v1 = 0;
  result = MEMORY[0x1A1ACAFA0](0, "nfkc", 0, &v1);
  DDLookupTableRefLookupCurrentWord_sQuickCheckNormalizerNFKC = result;
  return result;
}

void __DDLookupTableRefLookupCurrentWord_block_invoke_2()
{
  DDError(CFSTR("Got a length which is greater than the original size"));
}

@end
