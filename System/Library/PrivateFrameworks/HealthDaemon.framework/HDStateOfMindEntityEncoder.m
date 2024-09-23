@implementation HDStateOfMindEntityEncoder

uint64_t __78___HDStateOfMindEntityEncoder_applyPropertiesToObject_persistentID_row_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "integerValue");
  return objc_msgSend(v2, "numberWithInteger:", HKStateOfMindAssociationFromDomain());
}

@end
