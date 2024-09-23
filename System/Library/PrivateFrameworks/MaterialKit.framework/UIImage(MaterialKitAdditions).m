@implementation UIImage(MaterialKitAdditions)

+ (uint64_t)mt_edgeOutsetsForShadowProperties:()MaterialKitAdditions scale:
{
  return MTEdgeOutsetsForCoreMaterialShadowProperties();
}

+ (id)mt_shadowTemplateImageWithAttributes:()MaterialKitAdditions scale:maskCornerRadius:continuousCorners:maskSize:resizableCapInsets:
{
  CGImage *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  _BYTE v10[20];

  *(_OWORD *)v10 = *(_OWORD *)(a4 + 4);
  *(_DWORD *)&v10[16] = *(_DWORD *)(a4 + 20);
  LODWORD(v8) = *(_DWORD *)a4;
  v9 = *(_QWORD *)(a4 + 24);
  v5 = (CGImage *)MTShadowImageCreateWithCoreMaterialShadowProperties();
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithCGImage:scale:orientation:", v5, 0, a1, v8, *(_QWORD *)&v10[4], *(_QWORD *)&v10[12], v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(v5);
  return v6;
}

@end
