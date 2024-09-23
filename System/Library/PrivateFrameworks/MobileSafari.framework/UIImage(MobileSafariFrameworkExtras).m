@implementation UIImage(MobileSafariFrameworkExtras)

+ (id)sf_imageNamed:()MobileSafariFrameworkExtras
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(MEMORY[0x1E0CB34D0], "sf_mobileSafariFrameworkBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageNamed:inBundle:compatibleWithTraitCollection:", v3, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:", v3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (void)sf_initWithCGImage:()MobileSafariFrameworkExtras tabSnapshotEffectsVersion:
{
  void *v5;
  const void *v6;
  void *v7;
  id v8;

  v5 = (void *)objc_msgSend(a1, "initWithCGImage:");
  if (v5)
  {
    v6 = (const void *)tabSnapshotEffectsVersionKey;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(v5, v6, v7, (void *)0x301);

    v8 = v5;
  }

  return v5;
}

- (uint64_t)sf_tabSnapshotEffectsVersion
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, (const void *)tabSnapshotEffectsVersionKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "integerValue");

  return v2;
}

+ (__CFString)safari_currentDeviceImageNameForOrientation:()MobileSafariFrameworkExtras
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;

  v3 = 4 * ((unint64_t)(a3 - 3) < 2);
  objc_msgSend(MEMORY[0x1E0CEC3F8], "_typeOfCurrentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D3A838], "symbolForTypeIdentifier:withResolutionStrategy:variantOptions:error:", v5, 1, v3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "name");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = CFSTR("iphone");
  }

  return v8;
}

- (uint64_t)sf_shouldApplyBackingForDarkBackdrop
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  const void *v6;
  void *v7;

  objc_getAssociatedObject(a1, (const void *)shouldApplyBackingForDarkBackdropKey);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "BOOLValue");
  }
  else
  {
    v5 = objc_retainAutorelease(a1);
    objc_msgSend(v5, "CGImage");
    v4 = WBSShouldApplyBackingForDarkBackdropToImage();
    v6 = (const void *)shouldApplyBackingForDarkBackdropKey;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(v5, v6, v7, (void *)1);

  }
  return v4;
}

- (uint64_t)sf_hasRegisteredFaviconForDarkUserInterfaceStyle
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, (const void *)hasRegisteredFaviconForDarkUserInterfaceStyleKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (uint64_t)sf_registerFaviconForDarkUserInterfaceStyle
{
  return objc_msgSend(a1, "sf_registerFaviconForDarkUserInterfaceStyleWithSize:", 18.0, 18.0);
}

- (void)sf_registerFaviconForDarkUserInterfaceStyleWithSize:()MobileSafariFrameworkExtras
{
  void *v6;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[7];
  __int128 v17;
  double v18;
  double v19;

  if (objc_msgSend(a1, "renderingMode") != 2
    && (objc_msgSend(a1, "isSymbolImage") & 1) == 0
    && (objc_msgSend(a1, "sf_hasRegisteredFaviconForDarkUserInterfaceStyle") & 1) == 0)
  {
    if (objc_msgSend(a1, "sf_shouldApplyBackingForDarkBackdrop"))
    {
      objc_msgSend(MEMORY[0x1E0DC3830], "preferredFormat");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setOpaque:", 0);
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:format:", v15, a2, a3);
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __92__UIImage_MobileSafariFrameworkExtras__sf_registerFaviconForDarkUserInterfaceStyleWithSize___block_invoke;
      v16[3] = &unk_1E21E20C8;
      *(double *)&v16[5] = a2;
      *(double *)&v16[6] = a3;
      v16[4] = a1;
      __asm { FMOV            V0.2D, #1.0 }
      v17 = _Q0;
      v18 = a2 + -2.0;
      v19 = a3 + -2.0;
      objc_msgSend(v6, "imageWithActions:", v16);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "imageAsset");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "registerImage:withTraitCollection:", v12, v14);

      objc_setAssociatedObject(a1, (const void *)hasRegisteredFaviconForDarkUserInterfaceStyleKey, MEMORY[0x1E0C9AAB0], (void *)1);
    }
  }
}

- (uint64_t)sf_isMonogram
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, (const void *)isMonogramKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (void)sf_setIsMonogram:()MobileSafariFrameworkExtras
{
  const void *v2;
  id v3;

  v2 = (const void *)isMonogramKey;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, v2, v3, (void *)0x301);

}

- (BOOL)sf_isLaunchImageSizedForOrientation:()MobileSafariFrameworkExtras includesStatusBar:
{
  unint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  id v18;
  double v19;
  double v20;
  double v21;
  BOOL v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  _BOOL8 v30;

  v6 = a3 - 3;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fixedCoordinateSpace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;

  if (v6 >= 2)
    v13 = v12;
  else
    v13 = v10;
  if (v6 >= 2)
    v14 = v10;
  else
    v14 = v12;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "scale");
  v17 = v16;

  v18 = a1;
  objc_msgSend(v18, "scale");
  if (v19 == v17 && ((objc_msgSend(v18, "size"), v21 == v14) ? (v22 = v20 == v13) : (v22 = 0), v22))
  {
    v30 = 1;
  }
  else
  {
    objc_msgSend(v18, "scale");
    v24 = v23;
    objc_msgSend(v18, "size");
    v26 = v25;
    v28 = v27;
    if (v24 != v17)
    {
      objc_msgSend(v18, "size");
      v24 = v24 * (v29 / v14);
      v26 = v26 / v24;
      v28 = v28 / v24;
    }
    if (v24 != v17)
    {

      return 0;
    }
    v30 = v28 == v13 && v26 == v14;
  }

  if (a4 && v30)
  {
    v30 = 1;
    *a4 = 1;
  }
  return v30;
}

+ (id)sf_chicletStyleImageWithImage:()MobileSafariFrameworkExtras backgroundColor:size:cornerRadius:
{
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;

  v15 = a8;
  v16 = a9;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithBounds:", a1, a2, a3, a4);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __104__UIImage_MobileSafariFrameworkExtras__sf_chicletStyleImageWithImage_backgroundColor_size_cornerRadius___block_invoke;
  v22[3] = &unk_1E21E20F0;
  v25 = a1;
  v26 = a2;
  v27 = a3;
  v28 = a4;
  v29 = a5;
  v23 = v16;
  v24 = v15;
  v18 = v15;
  v19 = v16;
  objc_msgSend(v17, "imageWithActions:", v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

@end
