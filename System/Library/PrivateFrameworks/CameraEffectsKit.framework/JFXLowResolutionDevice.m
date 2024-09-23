@implementation JFXLowResolutionDevice

void __JFXLowResolutionDevice_block_invoke()
{
  void *v0;
  int v1;
  BOOL v2;
  int v3;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "jfx_cpuFamily");

  if (v1 > 747742333)
  {
    v2 = v1 == 1741614739;
    v3 = 747742334;
  }
  else
  {
    v2 = v1 == -1829029944;
    v3 = -400654602;
  }
  if (v2 || v1 == v3)
    JFXLowResolutionDevice_isLowResolutionDevice = 1;
}

@end
