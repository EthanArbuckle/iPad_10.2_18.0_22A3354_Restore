@implementation UIDevice

void __45__UIDevice_DKExtensions__dk_deviceSupportsGL__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "_graphicsQuality");

  if (v1 == 10)
  {
    dk_deviceSupportsGL_useGL = 0;
  }
  else
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDE2818]), "initWithAPI:", 3);
    dk_deviceSupportsGL_useGL = v2 != 0;

  }
}

@end
