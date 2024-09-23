@implementation SFSiteIcon

id __34___SFSiteIcon_defaultIconKeyColor__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;

  v2 = a2;
  if (objc_msgSend(v2, "userInterfaceStyle") == 2)
  {
    v3 = objc_msgSend(v2, "userInterfaceLevel");
    v4 = (void *)MEMORY[0x1E0DC3658];
    if (v3 == 1)
      v5 = 0.294117647;
    else
      v5 = 0.180392157;
    v8 = 1.0;
    v6 = v5;
    v7 = v5;
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0DC3658];
    v5 = 0.8;
    v6 = 0.803921569;
    v7 = 0.831372549;
    v8 = 1.0;
  }
  objc_msgSend(v4, "colorWithRed:green:blue:alpha:", v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __39___SFSiteIcon_precompositedDefaultIcon__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD aBlock[7];

  objc_msgSend(*(id *)(a1 + 32), "defaultSize");
  v3 = v2;
  v5 = v4;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:", v2, v4);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __39___SFSiteIcon_precompositedDefaultIcon__block_invoke_2;
  aBlock[3] = &__block_descriptor_56_e40_v16__0__UIGraphicsImageRendererContext_8l;
  *(double *)&aBlock[4] = v3;
  *(double *)&aBlock[5] = v5;
  aBlock[6] = *(_QWORD *)(a1 + 32);
  v7 = _Block_copy(aBlock);
  objc_msgSend(v6, "imageWithActions:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)precompositedDefaultIcon_icon;
  precompositedDefaultIcon_icon = v8;

  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3E88], "_currentTraitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3E88], "_setCurrentTraitCollection:", v10);
  objc_msgSend(v6, "imageWithActions:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3E88], "_setCurrentTraitCollection:", v11);
  objc_msgSend((id)precompositedDefaultIcon_icon, "imageAsset");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "registerImage:withTraitCollection:", v12, v10);

}

void __39___SFSiteIcon_precompositedDefaultIcon__block_invoke_2(uint64_t a1, void *a2)
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  void *v7;
  id v8;
  double v9;
  CGFloat v10;
  const CGPath *v11;
  CGContext *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  id v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  v3 = *MEMORY[0x1E0C9D538];
  v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v6 = *(double *)(a1 + 32);
  v5 = *(double *)(a1 + 40);
  v7 = *(void **)(a1 + 48);
  v8 = a2;
  objc_msgSend(v7, "cornerRadius");
  v10 = v9;
  v18.origin.x = v3;
  v18.origin.y = v4;
  v18.size.width = v6;
  v18.size.height = v5;
  v11 = CGPathCreateWithRoundedRect(v18, v10, v10, 0);
  v12 = (CGContext *)objc_msgSend(v8, "CGContext");

  CGContextAddPath(v12, v11);
  CGPathRelease(v11);
  CGContextClip(v12);
  v19.origin.x = v3;
  v19.origin.y = v4;
  v19.size.width = v6;
  v19.size.height = v5;
  UIRectFill(v19);
  objc_msgSend(*(id *)(a1 + 48), "defaultIconKeyColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFill");

  v20.origin.x = v3;
  v20.origin.y = v4;
  v20.size.width = v6;
  v20.size.height = v5;
  UIRectFillUsingBlendMode(v20, kCGBlendModeMultiply);
  objc_msgSend(*(id *)(a1 + 48), "defaultGlyph");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "size");
  v16 = _SFCGRectOfSizeAlignedWithinRect(0, 0, v14, v15, v3, v4, v6, v5);
  objc_msgSend(v17, "drawInRect:", _SFRoundRectToPixels(v16));

}

@end
