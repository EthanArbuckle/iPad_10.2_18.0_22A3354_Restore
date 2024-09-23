@implementation CIIndexSetGetTypeID

uint64_t __CIIndexSetGetTypeID_block_invoke()
{
  uint64_t result;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  __kCIIndexSetTypeID = _CFRuntimeRegisterClass();
  result = _CFRuntimeRegisterClass();
  __kCIIndexSetInvertedTypeID = result;
  if (__kCIIndexSetTypeID == result)
  {
    v1 = __si_assert_copy_extra_268();
    __message_assert_272((uint64_t)v1, v2, v3, v4, v5, v6, v7, v8, (char)"CIIndexSet.c");
    free(v1);
    if (__valid_fs(-1))
    {
      MEMORY[0xBAD] = -559038737;
      abort();
    }
    MEMORY[0xC00] = -559038737;
    abort();
  }
  return result;
}

@end
