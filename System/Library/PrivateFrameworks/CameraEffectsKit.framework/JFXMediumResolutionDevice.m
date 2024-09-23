@implementation JFXMediumResolutionDevice

void __JFXMediumResolutionDevice_block_invoke()
{
  void *v0;
  uint64_t v1;
  BOOL v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  if (JFXLowResolutionDevice_onceToken != -1)
    dispatch_once(&JFXLowResolutionDevice_onceToken, &__block_literal_global_69);
  if ((JFXLowResolutionDevice_isLowResolutionDevice & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = objc_msgSend(v0, "userInterfaceIdiom");

    if (v1 == 1)
    {
      v2 = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "jfx_cpuFamily");

      objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "jfx_memorySize");

      v2 = v4 == 1176831186 && v6 < 3800000000 || v4 == 131287967;
    }
    JFXMediumResolutionDevice_isMediumResolutionDevice = v2;
  }
}

@end
