@implementation NSISWrapLinearExpression

uint64_t __NSISWrapLinearExpression_block_invoke(uint64_t a1, unsigned int *a2, double a3)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", NSISWrapVariable(a2));
  return objc_msgSend(*(id *)(a1 + 40), "addObject:", NSISWrapExactFloat(a3));
}

@end
