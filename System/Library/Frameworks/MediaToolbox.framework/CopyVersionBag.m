@implementation CopyVersionBag

uint64_t __rcl_CopyVersionBag_block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  uint64_t result;

  if (!a2)
    return 0;
  if (objc_msgSend(*(id *)(a1 + 32), "rangeOfString:options:", a2, 1) == 0x7FFFFFFFFFFFFFFFLL
    || v7 != objc_msgSend(a2, "length"))
  {
    return 0;
  }
  NSLog(CFSTR("Found the match for %@ with %@"), *(_QWORD *)(a1 + 32), a2);
  result = 1;
  *a4 = 1;
  return result;
}

@end
