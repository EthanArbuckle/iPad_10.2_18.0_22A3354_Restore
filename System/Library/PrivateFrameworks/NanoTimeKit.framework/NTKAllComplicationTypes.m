@implementation NTKAllComplicationTypes

void __NTKAllComplicationTypes_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, 59);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)NTKAllComplicationTypes_allTypes;
  NTKAllComplicationTypes_allTypes = v0;

}

@end
