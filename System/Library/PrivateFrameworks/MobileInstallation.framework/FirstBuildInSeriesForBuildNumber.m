@implementation FirstBuildInSeriesForBuildNumber

void ___FirstBuildInSeriesForBuildNumber_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithRange:", 65, 26);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_FirstBuildInSeriesForBuildNumber_uppercaseEnglishCharacterSet;
  _FirstBuildInSeriesForBuildNumber_uppercaseEnglishCharacterSet = v0;

}

@end
