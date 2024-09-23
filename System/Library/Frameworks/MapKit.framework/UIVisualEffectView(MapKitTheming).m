@implementation UIVisualEffectView(MapKitTheming)

+ (id)photoSmallAttributionVisualEffectView
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  if (MapKitIdiomIsMacCatalyst())
  {
    v0 = (void *)MEMORY[0x1E0CEABE0];
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.370000005);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "effectCompositingColor:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA398], "effectWithBlurRadius:", 15.0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_alloc(MEMORY[0x1E0CEABE8]);
    v5 = (void *)MEMORY[0x1E0CEABE0];
    v13[0] = v2;
    v13[1] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "effectCombiningEffects:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v4, "initWithEffect:", v7);

    return v8;
  }
  else
  {
    v10 = objc_alloc(MEMORY[0x1E0CEABE8]);
    objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithEffect:", v11);

    return v12;
  }
}

@end
