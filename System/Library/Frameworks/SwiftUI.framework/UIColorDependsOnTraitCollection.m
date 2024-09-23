@implementation UIColorDependsOnTraitCollection

uint64_t ___UIColorDependsOnTraitCollection_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0DC3658], "instanceMethodForSelector:", *(_QWORD *)(a1 + 32));
  _UIColorDependsOnTraitCollection_UIColor_imp = result;
  return result;
}

@end
