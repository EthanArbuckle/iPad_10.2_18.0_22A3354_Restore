@implementation _BCUCoverEffectsAssets

- (_BCUCoverEffectsAssets)initWithBundle:(id)a3 rtl:(BOOL)a4 night:(BOOL)a5 small:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  id v10;
  _BCUCoverEffectsAssets *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  const __CFURL *v19;
  const __CFURL *v20;
  CGDataProvider *v21;
  CGDataProvider *v22;
  CGImageRef v23;
  void *v24;
  const __CFURL *v25;
  const __CFURL *v26;
  CGDataProvider *v27;
  CGDataProvider *v28;
  CGImageRef v29;
  void *v30;
  const __CFURL *v31;
  const __CFURL *v32;
  CGDataProvider *v33;
  CGDataProvider *v34;
  CGImageRef v35;
  void *v36;
  const __CFURL *v37;
  const __CFURL *v38;
  CGDataProvider *v39;
  CGDataProvider *v40;
  CGImageRef v41;
  objc_super v43;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v10 = a3;
  v43.receiver = self;
  v43.super_class = (Class)_BCUCoverEffectsAssets;
  v11 = -[_BCUCoverEffectsAssets init](&v43, sel_init);
  if (v11)
  {
    v12 = CFSTR("_RTL");
    if (!v8)
      v12 = &stru_24F114130;
    v13 = v12;
    v14 = CFSTR("~Night");
    if (!v7)
      v14 = &stru_24F114130;
    v15 = v14;
    v16 = CFSTR("L");
    if (v6)
      v16 = CFSTR("S");
    v17 = v16;
    v11->_overlayColor = 0;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("iBooks_Covers%@_Flat-%@_Spine_NormalBlend%@"), v13, v17, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLForResource:withExtension:", v18, CFSTR("png"));
    v19 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19 && (v21 = CGDataProviderCreateWithURL(v19)) != 0)
    {
      v22 = v21;
      v23 = CGImageCreateWithPNGDataProvider(v21, 0, 1, kCGRenderingIntentDefault);
      CFRelease(v22);
    }
    else
    {
      v23 = 0;
    }

    v11->_spineNormalBlend = v23;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("iBooks_Covers%@_Flat-%@_Spine_SoftLightBlend%@"), v13, v17, v15);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLForResource:withExtension:", v24, CFSTR("png"));
    v25 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25 && (v27 = CGDataProviderCreateWithURL(v25)) != 0)
    {
      v28 = v27;
      v29 = CGImageCreateWithPNGDataProvider(v27, 0, 1, kCGRenderingIntentDefault);
      CFRelease(v28);
    }
    else
    {
      v29 = 0;
    }

    v11->_spineSoftLightBlend = v29;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("iBooks_Covers%@_Flat-%@_Spine_LinearBurnBlend%@"), v13, v17, v15);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLForResource:withExtension:", v30, CFSTR("png"));
    v31 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (v31 && (v33 = CGDataProviderCreateWithURL(v31)) != 0)
    {
      v34 = v33;
      v35 = CGImageCreateWithPNGDataProvider(v33, 0, 1, kCGRenderingIntentDefault);
      CFRelease(v34);
    }
    else
    {
      v35 = 0;
    }

    v11->_spineLinearBurnBlend = v35;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("iBooks_Covers%@_Flat-%@_Edges%@"), v13, v17, v15);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLForResource:withExtension:", v36, CFSTR("png"));
    v37 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
    v38 = v37;
    if (v37 && (v39 = CGDataProviderCreateWithURL(v37)) != 0)
    {
      v40 = v39;
      v41 = CGImageCreateWithPNGDataProvider(v39, 0, 1, kCGRenderingIntentDefault);
      CFRelease(v40);
    }
    else
    {
      v41 = 0;
    }

    v11->_edges = v41;
  }

  return v11;
}

- (_BCUCoverEffectsAssets)initWithBundle:(id)a3 rtl:(BOOL)a4 night:(BOOL)a5
{
  return -[_BCUCoverEffectsAssets initWithBundle:rtl:night:small:](self, "initWithBundle:rtl:night:small:", a3, a4, a5, 0);
}

- (CGImage)spineNormalBlend
{
  return self->_spineNormalBlend;
}

- (CGImage)spineLinearBurnBlend
{
  return self->_spineLinearBurnBlend;
}

- (CGImage)spineSoftLightBlend
{
  return self->_spineSoftLightBlend;
}

- (CGImage)edges
{
  return self->_edges;
}

- (CGColor)overlayColor
{
  return self->_overlayColor;
}

@end
