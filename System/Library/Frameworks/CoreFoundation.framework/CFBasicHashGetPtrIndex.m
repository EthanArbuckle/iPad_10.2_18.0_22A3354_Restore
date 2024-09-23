@implementation CFBasicHashGetPtrIndex

_QWORD *__CFBasicHashGetPtrIndex_block_invoke()
{
  _QWORD *result;

  CFBasicHashCallBackPtrsLock = 0;
  result = malloc_type_malloc(0x100uLL, 0x80040B8603338uLL);
  CFBasicHashCallBackPtrs[0] = (uint64_t)result;
  if (result)
  {
    *result = 0;
    result[1] = CFCopyDescription;
    result[2] = __CFTypeCollectionRelease;
    result[3] = __CFTypeCollectionRetain;
    result[4] = CFEqual;
    result[5] = CFHash;
    result[6] = __CFStringCollectionCopy;
    result[7] = 0;
    atomic_store(8u, &CFBasicHashCallBackPtrsCount);
  }
  else
  {
    __break(1u);
  }
  return result;
}

@end
