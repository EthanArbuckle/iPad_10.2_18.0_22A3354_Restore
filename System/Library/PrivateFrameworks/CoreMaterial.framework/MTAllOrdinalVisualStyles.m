@implementation MTAllOrdinalVisualStyles

void __MTAllOrdinalVisualStyles_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[7];

  v2[6] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("primary");
  v2[1] = CFSTR("secondary");
  v2[2] = CFSTR("tertiary");
  v2[3] = CFSTR("quaternary");
  v2[4] = CFSTR("highlight");
  v2[5] = CFSTR("separator");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)MTAllOrdinalVisualStyles___visualStyles;
  MTAllOrdinalVisualStyles___visualStyles = v0;

}

@end
