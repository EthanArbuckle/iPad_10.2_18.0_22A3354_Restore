@implementation MASoftwareLookupQueryVersionsOnly

uint64_t __MASoftwareLookupQueryVersionsOnly_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;

  v3 = objc_msgSend(a2, "compare:options:", a3, 64);
  if (v3 == 1)
    return -1;
  else
    return v3 == -1;
}

@end
