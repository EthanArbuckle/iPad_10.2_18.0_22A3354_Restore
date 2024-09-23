@implementation AVCaptureDevice

void __52__AVCaptureDevice_JFX__jfx_highestQualityColorSpace__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)jfx_highestQualityColorSpace_s_colorSpaceLookup;
  jfx_highestQualityColorSpace_s_colorSpaceLookup = v0;

}

void __52__AVCaptureDevice_JFX__jfx_highestQualityColorSpace__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[5];

  objc_msgSend(a2, "supportedColorSpaces");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __52__AVCaptureDevice_JFX__jfx_highestQualityColorSpace__block_invoke_3;
  v4[3] = &unk_24EE5A738;
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);

}

uint64_t __52__AVCaptureDevice_JFX__jfx_highestQualityColorSpace__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v4;

  result = objc_msgSend(a2, "integerValue");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (result > *(_QWORD *)(v4 + 24))
    *(_QWORD *)(v4 + 24) = result;
  return result;
}

@end
