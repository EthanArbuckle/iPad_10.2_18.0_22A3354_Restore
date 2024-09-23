@implementation NSNumberFormatter

uint64_t __63__NSNumberFormatter_MTUtilities__mtDecimalStyleNumberFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v1 = (void *)mtDecimalStyleNumberFormatter__decimalStyleumberFormatter;
  mtDecimalStyleNumberFormatter__decimalStyleumberFormatter = (uint64_t)v0;

  return objc_msgSend((id)mtDecimalStyleNumberFormatter__decimalStyleumberFormatter, "setNumberStyle:", 1);
}

@end
