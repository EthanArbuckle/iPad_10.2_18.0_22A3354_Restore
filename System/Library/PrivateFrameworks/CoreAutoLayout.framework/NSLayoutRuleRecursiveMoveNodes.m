@implementation NSLayoutRuleRecursiveMoveNodes

void *___NSLayoutRuleRecursiveMoveNodes_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *result;

  v4 = *(void **)(a1 + 32);
  if (v4)
    objc_msgSend(v4, "removeObject:", a2);
  result = *(void **)(a1 + 40);
  if (result)
    return (void *)objc_msgSend(result, "addObject:", a2);
  return result;
}

@end
