@implementation JFXOSVersionIsAbove

void __JFXOSVersionIsAbove_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemVersion");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)JFXOSVersionIsAbove_systemVersion;
  JFXOSVersionIsAbove_systemVersion = v0;

}

@end
