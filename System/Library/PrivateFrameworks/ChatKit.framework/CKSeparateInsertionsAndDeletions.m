@implementation CKSeparateInsertionsAndDeletions

uint64_t __CKSeparateInsertionsAndDeletions_block_invoke(uint64_t result, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;

  v2 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  v3 = *(_QWORD *)(v2 + 24);
  if (v3 >= a2)
    *(_QWORD *)(v2 + 24) = v3 + 1;
  return result;
}

@end
