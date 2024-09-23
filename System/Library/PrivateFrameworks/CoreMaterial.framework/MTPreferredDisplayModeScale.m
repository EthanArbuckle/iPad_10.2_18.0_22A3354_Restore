@implementation MTPreferredDisplayModeScale

void __MTPreferredDisplayModeScale_block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CD2728], "mainDisplay");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "preferredMode");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  *(double *)&MTPreferredDisplayModeScale___cachedScale = (double)(unint64_t)objc_msgSend(v0, "preferredScale");

}

@end
