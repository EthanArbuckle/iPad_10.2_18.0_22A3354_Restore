@implementation StackshotTaken

void ___StackshotTaken_block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  const __CFURL *inFileURL;

  v0 = objc_allocWithZone(MEMORY[0x24BDBCF48]);
  v1 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/CoreServices/VoiceOverTouch.app"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resourcePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@/%@"), v3, CFSTR("Sounds/StackShot.aiff"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  inFileURL = (const __CFURL *)objc_msgSend(v0, "initFileURLWithPath:isDirectory:", v4, 0);

  AudioServicesCreateSystemSoundID(inFileURL, (SystemSoundID *)&_StackshotTaken_SoundID);
}

@end
