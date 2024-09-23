@implementation UIDevice(JFX)

- (uint64_t)jfx_memorySize
{
  if (jfx_memorySize_onceToken != -1)
    dispatch_once(&jfx_memorySize_onceToken, &__block_literal_global_64);
  return jfx_memorySize_mem;
}

- (uint64_t)jfx_numberOfCPU
{
  if (jfx_numberOfCPU_onceToken != -1)
    dispatch_once(&jfx_numberOfCPU_onceToken, &__block_literal_global_1_0);
  return jfx_numberOfCPU_cpuCount;
}

- (uint64_t)jfx_cpuFamily
{
  if (jfx_cpuFamily_onceToken != -1)
    dispatch_once(&jfx_cpuFamily_onceToken, &__block_literal_global_3_0);
  return jfx_cpuFamily_cpuFamily;
}

- (id)jfx_deviceCharacteristicsDict
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  _QWORD v17[7];
  _QWORD v18[7];
  utsname v19;
  uint64_t v20;
  CGRect v21;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&v19, 0, 512);
  if (uname(&v19) < 0)
  {
    objc_msgSend(v1, "model");
    v2 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v19.machine);
  }
  v16 = (void *)v2;
  objc_msgSend(v1, "systemVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v1, "jfx_numberOfCPU"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v1, "jfx_memorySize"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bounds");
  NSStringFromCGRect(v21);
  v6 = v0;
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v6, "scale");
  *(float *)&v9 = v9;
  objc_msgSend(v8, "numberWithFloat:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberWithInteger:", objc_msgSend(v12, "userInterfaceIdiom"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = CFSTR("cores");
  v17[1] = CFSTR("memory");
  v18[0] = v4;
  v18[1] = v5;
  v17[2] = CFSTR("model");
  v17[3] = CFSTR("screenBounds");
  v18[2] = v16;
  v18[3] = v7;
  v17[4] = CFSTR("screenScale");
  v17[5] = CFSTR("systemVersion");
  v18[4] = v10;
  v18[5] = v3;
  v17[6] = CFSTR("uiIdiom");
  v18[6] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (uint64_t)jfx_hasDepthCapableCamera
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__UIDevice_JFX__jfx_hasDepthCapableCamera__block_invoke;
  block[3] = &unk_24EE57B60;
  block[4] = a1;
  if (jfx_hasDepthCapableCamera_onceToken != -1)
    dispatch_once(&jfx_hasDepthCapableCamera_onceToken, block);
  return jfx_hasDepthCapableCamera_result;
}

- (uint64_t)jfx_hasTrueDepthFrontCamera
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__UIDevice_JFX__jfx_hasTrueDepthFrontCamera__block_invoke;
  block[3] = &unk_24EE57B60;
  block[4] = a1;
  if (jfx_hasTrueDepthFrontCamera_onceToken != -1)
    dispatch_once(&jfx_hasTrueDepthFrontCamera_onceToken, block);
  return jfx_hasTrueDepthFrontCamera_result;
}

- (uint64_t)jfx_hasTrueDepthFrontCameraCustomZoomFormat
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__UIDevice_JFX__jfx_hasTrueDepthFrontCameraCustomZoomFormat__block_invoke;
  block[3] = &unk_24EE57B60;
  block[4] = a1;
  if (jfx_hasTrueDepthFrontCameraCustomZoomFormat_onceToken != -1)
    dispatch_once(&jfx_hasTrueDepthFrontCameraCustomZoomFormat_onceToken, block);
  return jfx_hasTrueDepthFrontCameraCustomZoomFormat_result;
}

- (uint64_t)jfx_hasDualBackCamera
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__UIDevice_JFX__jfx_hasDualBackCamera__block_invoke;
  block[3] = &unk_24EE57B60;
  block[4] = a1;
  if (jfx_hasDualBackCamera_onceToken != -1)
    dispatch_once(&jfx_hasDualBackCamera_onceToken, block);
  return jfx_hasDualBackCamera_result;
}

- (uint64_t)jfx_hasHDRCamera
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__UIDevice_JFX__jfx_hasHDRCamera__block_invoke;
  block[3] = &unk_24EE57B60;
  block[4] = a1;
  if (jfx_hasHDRCamera_onceToken != -1)
    dispatch_once(&jfx_hasHDRCamera_onceToken, block);
  return jfx_hasHDRCamera_hasHDRCamera;
}

- (id)jfx_displayColorSpace
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__UIDevice_JFX__jfx_displayColorSpace__block_invoke;
  block[3] = &unk_24EE57B60;
  block[4] = a1;
  if (jfx_displayColorSpace_onceToken != -1)
    dispatch_once(&jfx_displayColorSpace_onceToken, block);
  return (id)jfx_displayColorSpace_s_displayColorSpace;
}

- (id)jfx_recommendedDisplayColorSpaceForColorSpace:()JFX
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "jfx_displayColorSpace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isHDRSpace"))
  {
    if (!objc_msgSend(v5, "isWideGamutSpace"))
      goto LABEL_8;
    if ((objc_msgSend(v4, "isHDRSpace") & 1) != 0)
    {
LABEL_7:
      objc_msgSend(MEMORY[0x24BE78FF8], "p3d65GammaColorSpace");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
LABEL_6:
    if (objc_msgSend(v4, "isWideGamutSpace"))
      goto LABEL_7;
LABEL_8:
    objc_msgSend(MEMORY[0x24BE78FF8], "rec709GammaColorSpace");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (!objc_msgSend(v4, "isHDRSpace"))
    goto LABEL_6;
  v6 = v5;
LABEL_9:
  v7 = v6;

  return v7;
}

- (BOOL)jfx_supportsHDRExport
{
  if (jfx_supportsHDRExport_onceToken != -1)
    dispatch_once(&jfx_supportsHDRExport_onceToken, &__block_literal_global_29);
  return (jfx_supportsHDRExport_isA10OrLater & 1) == 0;
}

- (uint64_t)jfx_supportsHDR
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "displayGamut");
  v5 = objc_msgSend(MEMORY[0x24BDB2610], "availableHDRModes") & 6;
  v6 = objc_msgSend(a1, "jfx_memorySize");
  if (v4 != 1 || v5 == 0 || v6 < 2684354561)
    v9 = 0;
  else
    v9 = objc_msgSend(a1, "jfx_supportsHDRExport");

  return v9;
}

- (id)jfx_getCaptureDeviceForType:()JFX
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = jfx_getCaptureDeviceForType__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&jfx_getCaptureDeviceForType__onceToken, &__block_literal_global_31_0);
  objc_msgSend((id)jfx_getCaptureDeviceForType__captureDeviceLookup, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
