@implementation MTAllPlatformColorVisualStyles

void __MTAllPlatformColorVisualStyles_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[6];

  v2[5] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("platformGray");
  v2[1] = CFSTR("platformBlue");
  v2[2] = CFSTR("platformTeal");
  v2[3] = CFSTR("platformOrange");
  v2[4] = CFSTR("platformGreen");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 5);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)MTAllPlatformColorVisualStyles___systemColorVisualStyles;
  MTAllPlatformColorVisualStyles___systemColorVisualStyles = v0;

}

@end
