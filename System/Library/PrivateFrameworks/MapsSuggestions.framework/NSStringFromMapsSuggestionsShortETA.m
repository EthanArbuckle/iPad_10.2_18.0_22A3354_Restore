@implementation NSStringFromMapsSuggestionsShortETA

uint64_t __NSStringFromMapsSuggestionsShortETA_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3570]);
  v1 = (void *)qword_1ED22F088;
  qword_1ED22F088 = (uint64_t)v0;

  objc_msgSend((id)qword_1ED22F088, "setUnitsStyle:", 2);
  objc_msgSend((id)qword_1ED22F088, "setMaximumUnitCount:", 2);
  return objc_msgSend((id)qword_1ED22F088, "setAllowedUnits:", 112);
}

@end
