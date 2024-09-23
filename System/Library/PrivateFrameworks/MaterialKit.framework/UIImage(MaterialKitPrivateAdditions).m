@implementation UIImage(MaterialKitPrivateAdditions)

+ (id)mt_resizableShadowTemplateImageWithAttributes:()MaterialKitPrivateAdditions scale:maskCornerRadius:continuousCorners:maskSize:
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  __int128 v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v29[4];
  id v30;
  __int128 v31;
  __int128 v32;
  double v33;
  double v34;
  double v35;
  double v36;
  char v37;

  MTDimensionsForContinuousCornerRadiusInBounds();
  v15 = v14;
  v17 = v16;
  MTResizableAreaForCornerDimensionsInBounds();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%f.%f.%f.%f.%f.%f.%i.%f.%f.%f.%f"), *(float *)a7, *((_QWORD *)a7 + 1), *((_QWORD *)a7 + 2), *((_QWORD *)a7 + 3), *(_QWORD *)&a1, *(_QWORD *)&a2, a8, v15, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTMappedImageCache sharedCache](MTMappedImageCache, "sharedCache");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = 3221225472;
  v22 = a7[1];
  v31 = *a7;
  v29[0] = MEMORY[0x24BDAC760];
  v29[2] = __136__UIImage_MaterialKitPrivateAdditions__mt_resizableShadowTemplateImageWithAttributes_scale_maskCornerRadius_continuousCorners_maskSize___block_invoke;
  v29[3] = &unk_24C3DB810;
  v32 = v22;
  v33 = a1;
  v34 = a2;
  v37 = a8;
  v35 = a3;
  v36 = a4;
  v30 = v20;
  v23 = v20;
  objc_msgSend(v21, "imageForKey:generatingIfNecessaryWithBlock:", v23, v29);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)mt_resizableShadowTemplateImageWithAttributes_scale_maskCornerRadius_continuousCorners_maskSize____keysToCapInsets, "objectForKeyedSubscript:", v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "UIEdgeInsetsValue");
  objc_msgSend(v24, "resizableImageWithCapInsets:");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "imageWithRenderingMode:", 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (id)_mt_imageWithShadowWithAttributes:()MaterialKitPrivateAdditions userInterfaceStyle:
{
  id v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  void *v16;
  void *v17;
  __int128 v18;
  uint64_t v19;
  _QWORD v21[14];
  __int128 v22;
  __int128 v23;

  v6 = a1;
  v8 = v6;
  if (*(float *)a3 > 0.0)
  {
    LODWORD(v7) = *(_DWORD *)a3;
    objc_msgSend(v6, "size", v7);
    v10 = v9;
    v12 = v11;
    v13 = a3[2];
    if (v13 < a3[1])
      v13 = a3[1];
    if (v13 < 1.0)
      v13 = 1.0;
    v14 = v13 + a3[3] * 2.8;
    v15 = objc_alloc(MEMORY[0x24BDF6A98]);
    objc_msgSend(MEMORY[0x24BDF6AA0], "preferredFormat");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithSize:format:", v16, v14 + v10 + v14, v14 + v12 + v14);

    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __93__UIImage_MaterialKitPrivateAdditions___mt_imageWithShadowWithAttributes_userInterfaceStyle___block_invoke;
    v21[3] = &unk_24C3DB838;
    *(double *)&v21[5] = v14 + v10 + v14;
    *(double *)&v21[6] = v14 + v12 + v14;
    v21[4] = v8;
    *(double *)&v21[7] = v10;
    *(double *)&v21[8] = v12;
    *(double *)&v21[9] = v14;
    *(double *)&v21[10] = v14;
    *(double *)&v21[11] = v14;
    *(double *)&v21[12] = v14;
    v21[13] = a4;
    v18 = *((_OWORD *)a3 + 1);
    v22 = *(_OWORD *)a3;
    v23 = v18;
    objc_msgSend(v17, "imageWithActions:", v21);
    v19 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v19;
  }
  return v8;
}

- (id)mt_imageWithDefaultShadowAttributesForUserInterfaceStyle:()MaterialKitPrivateAdditions
{
  int v4;
  __int128 v5;
  uint64_t v6;

  v4 = 1050253722;
  v5 = xmmword_20AE69100;
  v6 = 0x3FE3333333333333;
  objc_msgSend(a1, "_mt_imageWithShadowWithAttributes:userInterfaceStyle:", &v4, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
