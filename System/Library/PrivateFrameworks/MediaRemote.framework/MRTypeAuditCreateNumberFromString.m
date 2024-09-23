@implementation MRTypeAuditCreateNumberFromString

uint64_t ___MRTypeAuditCreateNumberFromString_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v1 = (void *)_MRTypeAuditCreateNumberFromString_numberFormatter;
  _MRTypeAuditCreateNumberFromString_numberFormatter = (uint64_t)v0;

  return objc_msgSend((id)_MRTypeAuditCreateNumberFromString_numberFormatter, "setNumberStyle:", 0);
}

@end
