@implementation CopyIsDirectoryKeyArray

CFArrayRef ___CopyIsDirectoryKeyArray_block_invoke(uint64_t a1)
{
  CFArrayRef result;

  result = CFArrayCreate(0, (const void **)&kCFURLIsDirectoryKey, 1, &kCFTypeArrayCallBacks);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
