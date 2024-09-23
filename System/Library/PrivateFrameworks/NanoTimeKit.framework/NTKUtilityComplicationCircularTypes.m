@implementation NTKUtilityComplicationCircularTypes

void __NTKUtilityComplicationCircularTypes_block_invoke()
{
  uint64_t v0;
  void *v1;
  _OWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = xmmword_1B7560490;
  v2[1] = unk_1B75604A0;
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexes:count:", v2, 4);
  v1 = (void *)NTKUtilityComplicationCircularTypes_utilityComplicationCircularTypes;
  NTKUtilityComplicationCircularTypes_utilityComplicationCircularTypes = v0;

}

@end
