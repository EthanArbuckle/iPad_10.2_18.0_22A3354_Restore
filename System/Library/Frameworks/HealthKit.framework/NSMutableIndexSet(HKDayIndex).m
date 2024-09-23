@implementation NSMutableIndexSet(HKDayIndex)

- (uint64_t)hk_addDayIndex:()HKDayIndex
{
  void *v7;

  if (a3 < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSIndexSet+HKDayIndex.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dayIndex >= 0"));

  }
  return objc_msgSend(a1, "addIndex:", a3);
}

@end
