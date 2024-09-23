@implementation NSStringFromMapsSuggestionsAbbreviatedETA

uint64_t __NSStringFromMapsSuggestionsAbbreviatedETA_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3570]);
  v1 = (void *)qword_1ED22F098;
  qword_1ED22F098 = (uint64_t)v0;

  objc_msgSend((id)qword_1ED22F098, "setUnitsStyle:", 1);
  objc_msgSend((id)qword_1ED22F098, "setMaximumUnitCount:", 2);
  objc_msgSend((id)qword_1ED22F098, "setZeroFormattingBehavior:", 2);
  return objc_msgSend((id)qword_1ED22F098, "setAllowedUnits:", 112);
}

@end
