@implementation PVColorSpace

void __55__PVColorSpace_JFX__jfx_getColorSpaceFromCGColorSpace___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  _QWORD v8[5];

  v8[4] = *MEMORY[0x24BDAC8D0];
  v7[0] = *MEMORY[0x24BDBF230];
  objc_msgSend(MEMORY[0x24BE78FF8], "p3HLGGammaColorSpace");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v0;
  v7[1] = *MEMORY[0x24BDBF238];
  objc_msgSend(MEMORY[0x24BE78FF8], "p3PQGammaColorSpace");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v1;
  v7[2] = *MEMORY[0x24BDBF2C8];
  objc_msgSend(MEMORY[0x24BE78FF8], "rec2100HLGColorSpace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v2;
  v7[3] = *MEMORY[0x24BDBF2D0];
  objc_msgSend(MEMORY[0x24BE78FF8], "rec2100PQColorSpace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[3] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "mutableCopy");
  v6 = (void *)jfx_getColorSpaceFromCGColorSpace__s_HDRColorSpaceLookup;
  jfx_getColorSpaceFromCGColorSpace__s_HDRColorSpaceLookup = v5;

}

uint64_t __65__PVColorSpace_JFX__jfx_compareAndChooseGreaterColorSpace_right___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_msgSend(v2, "isHDRSpace") & 1) != 0)
    v3 = 2;
  else
    v3 = objc_msgSend(v2, "isWideGamutSpace");

  return v3;
}

@end
