@implementation BKHighlightedTheme

void ___BKHighlightedTheme_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[6];
  _QWORD v3[7];

  v3[6] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("single");
  v2[1] = CFSTR("top");
  v3[0] = CFSTR("  ●━");
  v3[1] = CFSTR("┏━●━");
  v2[2] = CFSTR("middle");
  v2[3] = CFSTR("bottom");
  v3[2] = CFSTR("┣━●━");
  v3[3] = CFSTR("┗━●━");
  v2[4] = CFSTR("indent");
  v2[5] = CFSTR("dropline");
  v3[4] = CFSTR("  ");
  v3[5] = CFSTR("┃ ");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_BKHighlightedTheme_dictionary;
  _BKHighlightedTheme_dictionary = v0;

}

@end
