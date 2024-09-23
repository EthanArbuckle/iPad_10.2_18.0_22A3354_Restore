@implementation UIImage

id __136__UIImage_MaterialKitPrivateAdditions__mt_resizableShadowTemplateImageWithAttributes_scale_maskCornerRadius_continuousCorners_maskSize___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  uint64_t v4;
  __int128 v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _OWORD v11[2];
  _OWORD v12[2];
  __int128 v13;
  __int128 v14;

  v13 = 0u;
  v14 = 0u;
  v2 = *(double *)(a1 + 72);
  v3 = *(double *)(a1 + 80);
  v4 = *(unsigned __int8 *)(a1 + 104);
  v5 = *(_OWORD *)(a1 + 56);
  v12[0] = *(_OWORD *)(a1 + 40);
  v12[1] = v5;
  objc_msgSend(MEMORY[0x24BDF6AC8], "mt_shadowTemplateImageWithAttributes:scale:maskCornerRadius:continuousCorners:maskSize:resizableCapInsets:", v12, v4, &v13, v2, v3, *(double *)(a1 + 88), *(double *)(a1 + 96));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!mt_resizableShadowTemplateImageWithAttributes_scale_maskCornerRadius_continuousCorners_maskSize____keysToCapInsets)
  {
    v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v8 = (void *)mt_resizableShadowTemplateImageWithAttributes_scale_maskCornerRadius_continuousCorners_maskSize____keysToCapInsets;
    mt_resizableShadowTemplateImageWithAttributes_scale_maskCornerRadius_continuousCorners_maskSize____keysToCapInsets = (uint64_t)v7;

  }
  v11[0] = v13;
  v11[1] = v14;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", v11, "{UIEdgeInsets=dddd}");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)mt_resizableShadowTemplateImageWithAttributes_scale_maskCornerRadius_continuousCorners_maskSize____keysToCapInsets, "setObject:forKeyedSubscript:", v9, *(_QWORD *)(a1 + 32));

  return v6;
}

void __93__UIImage_MaterialKitPrivateAdditions___mt_imageWithShadowWithAttributes_userInterfaceStyle___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  double v12;
  uint64_t v13;
  void *v14;
  id v15;

  v3 = (objc_class *)MEMORY[0x24BDF6F90];
  v4 = a2;
  v5 = [v3 alloc];
  BSRectWithSize();
  v15 = (id)objc_msgSend(v5, "initWithFrame:");
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v15, "addSubview:", v6);
  BSRectWithSize();
  objc_msgSend(v6, "setFrame:", *(double *)(a1 + 80), *(double *)(a1 + 88));
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithUserInterfaceStyle:", *(_QWORD *)(a1 + 104));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resolvedColorWithTraitCollection:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_retainAutorelease(v10);
  objc_msgSend(v7, "setShadowColor:", objc_msgSend(v11, "CGColor"));
  objc_msgSend(v7, "setShadowOffset:", *(double *)(a1 + 120), *(double *)(a1 + 128));
  objc_msgSend(v7, "setShadowRadius:", *(double *)(a1 + 136));
  LODWORD(v12) = *(_DWORD *)(a1 + 112);
  objc_msgSend(v7, "setShadowOpacity:", v12);
  v13 = objc_msgSend(v4, "CGContext");

  objc_msgSend(v15, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "renderInContext:", v13);

}

@end
