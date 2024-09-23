@implementation UIDevice

uint64_t __31__UIDevice_JFX__jfx_memorySize__block_invoke()
{
  size_t v1;
  int v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)v2 = 0x1800000006;
  v1 = 8;
  return sysctl(v2, 2u, &jfx_memorySize_mem, &v1, 0, 0);
}

uint64_t __32__UIDevice_JFX__jfx_numberOfCPU__block_invoke()
{
  size_t v1;
  int v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)v2 = 0x1900000006;
  v1 = 4;
  return sysctl(v2, 2u, &jfx_numberOfCPU_cpuCount, &v1, 0, 0);
}

uint64_t __30__UIDevice_JFX__jfx_cpuFamily__block_invoke()
{
  size_t v1;

  v1 = 4;
  return sysctlbyname("hw.cpufamily", &jfx_cpuFamily_cpuFamily, &v1, 0, 0);
}

void __42__UIDevice_JFX__jfx_hasDepthCapableCamera__block_invoke(uint64_t a1)
{
  char v2;
  void *v3;
  char v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "jfx_hasTrueDepthFrontCamera");
  if (objc_msgSend(*(id *)(a1 + 32), "jfx_hasDualBackCamera"))
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("allowsDepthDualBackCamera"));

  }
  else
  {
    v4 = 0;
  }
  jfx_hasDepthCapableCamera_result = v2 | v4;
}

void __44__UIDevice_JFX__jfx_hasTrueDepthFrontCamera__block_invoke(uint64_t a1)
{
  void *v1;

  objc_msgSend(*(id *)(a1 + 32), "jfx_getCaptureDeviceForType:", *MEMORY[0x24BDB1A48]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  jfx_hasTrueDepthFrontCamera_result = v1 != 0;

}

void __60__UIDevice_JFX__jfx_hasTrueDepthFrontCameraCustomZoomFormat__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "jfx_hasTrueDepthFrontCamera"))
  {
    objc_msgSend(*(id *)(a1 + 32), "jfx_getCaptureDeviceForType:", *MEMORY[0x24BDB1A48]);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "formats");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "enumerateObjectsUsingBlock:", &__block_literal_global_24);

  }
}

void __60__UIDevice_JFX__jfx_hasTrueDepthFrontCameraCustomZoomFormat__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v5;
  int v6;
  id v7;

  v7 = a2;
  if (CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)objc_msgSend(v7, "formatDescription")) == 0x90C00000C10)
  {
    objc_msgSend(v7, "supportedColorSpaces");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsObject:", &unk_24EE9BFC0);

    if (v6)
    {
      jfx_hasTrueDepthFrontCameraCustomZoomFormat_result = 1;
      *a4 = 1;
    }
  }

}

void __38__UIDevice_JFX__jfx_hasDualBackCamera__block_invoke(uint64_t a1)
{
  void *v1;

  objc_msgSend(*(id *)(a1 + 32), "jfx_getCaptureDeviceForType:", *MEMORY[0x24BDB1A20]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  jfx_hasDualBackCamera_result = v1 != 0;

}

void __33__UIDevice_JFX__jfx_hasHDRCamera__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "jfx_getCaptureDeviceForType:", *MEMORY[0x24BDB1A48]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "formats");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "enumerateObjectsUsingBlock:", &__block_literal_global_26);

}

void __33__UIDevice_JFX__jfx_hasHDRCamera__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v5;

  objc_msgSend(a2, "supportedColorSpaces");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "containsObject:", &unk_24EE9BFD8))
  {
    jfx_hasHDRCamera_hasHDRCamera = 1;
    *a4 = 1;
  }

}

void __38__UIDevice_JFX__jfx_displayColorSpace__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  if (objc_msgSend(*(id *)(a1 + 32), "jfx_supportsHDR"))
  {
    objc_msgSend(MEMORY[0x24BE78FF8], "rec2100HLGColorSpace");
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)jfx_displayColorSpace_s_displayColorSpace;
    jfx_displayColorSpace_s_displayColorSpace = v1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "displayGamut") == 1)
      objc_msgSend(MEMORY[0x24BE78FF8], "p3d65GammaColorSpace");
    else
      objc_msgSend(MEMORY[0x24BE78FF8], "rec709GammaColorSpace");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)jfx_displayColorSpace_s_displayColorSpace;
    jfx_displayColorSpace_s_displayColorSpace = v4;

    v2 = v6;
  }

}

void __38__UIDevice_JFX__jfx_supportsHDRExport__block_invoke()
{
  void *v0;
  int v1;
  BOOL v2;
  int v3;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "jfx_cpuFamily");

  if (v1 > 214503011)
  {
    if (v1 > 747742333)
    {
      v2 = v1 == 933271106;
      v3 = 747742334;
    }
    else
    {
      v2 = v1 == 214503012;
      v3 = 506291073;
    }
  }
  else if (v1 > -1471079479)
  {
    v2 = v1 == -1471079478;
    v3 = -1122301207;
  }
  else
  {
    v2 = v1 == -1829029944;
    v3 = -1777893647;
  }
  if (v2 || v1 == v3)
    jfx_supportsHDRExport_isA10OrLater = 1;
}

void __45__UIDevice_JFX__jfx_getCaptureDeviceForType___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[8];

  v8[7] = *MEMORY[0x24BDAC8D0];
  v0 = objc_opt_new();
  v1 = (void *)jfx_getCaptureDeviceForType__captureDeviceLookup;
  jfx_getCaptureDeviceForType__captureDeviceLookup = v0;

  v2 = *MEMORY[0x24BDB1A40];
  v8[0] = *MEMORY[0x24BDB1A48];
  v8[1] = v2;
  v3 = *MEMORY[0x24BDB1A20];
  v8[2] = *MEMORY[0x24BDB1A28];
  v8[3] = v3;
  v4 = *MEMORY[0x24BDB1A58];
  v8[4] = *MEMORY[0x24BDB1A50];
  v8[5] = v4;
  v8[6] = *MEMORY[0x24BDB1A30];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDB2468], "discoverySessionWithDeviceTypes:mediaType:position:", v5, *MEMORY[0x24BDB1D50], 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "devices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", &__block_literal_global_36);

}

void __45__UIDevice_JFX__jfx_getCaptureDeviceForType___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)jfx_getCaptureDeviceForType__captureDeviceLookup;
  v3 = a2;
  objc_msgSend(v3, "deviceType");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, v4);

}

@end
