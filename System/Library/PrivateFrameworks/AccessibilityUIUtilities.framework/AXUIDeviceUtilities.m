@implementation AXUIDeviceUtilities

+ (void)setOrientation:(int64_t)a3
{
  AXPerformSafeBlock();
}

void __38__AXUIDeviceUtilities_setOrientation___block_invoke(uint64_t a1)
{
  const void *v2;
  void *v3;

  v2 = (const void *)GSEventCreateWithEventRecord();
  objc_msgSend((id)*MEMORY[0x1E0DC4730], "_handleDeviceOrientationChangedEvent:", v2);
  objc_msgSend(MEMORY[0x1E0CF4E68], "server");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDeviceOrientation:", *(_QWORD *)(a1 + 32));

  if (v2)
    CFRelease(v2);
}

@end
