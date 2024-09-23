@implementation BrightnessIdentifier

void __BrightnessIdentifier_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDB2588], "identifierForKey:keySpace:", CFSTR("com.apple.clips.exif.brightness"), *MEMORY[0x24BDB1E48]);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)BrightnessIdentifier_s_brightnessIdentifier;
  BrightnessIdentifier_s_brightnessIdentifier = v0;

}

@end
