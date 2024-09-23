@implementation NUNIAstronomyVistaConfiguration(NTKDefault)

+ (id)defaultConfigurationWithDevice:()NTKDefault
{
  objc_class *v3;
  id v4;
  void *v5;
  double v6;
  double v7;

  v3 = (objc_class *)MEMORY[0x1E0D518C8];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithDevice:", v4);
  objc_msgSend(v5, "setIsRTLLayout:", CLKLayoutIsRTL());
  objc_msgSend(v5, "setIsGPUEnabled:", NTKGPUIsEnabled());
  objc_msgSend(v4, "screenScale");
  v7 = v6;

  objc_msgSend(v5, "setScreenScale:", v7);
  objc_msgSend(v5, "setQuadViewOptions:", 32);
  return v5;
}

@end
