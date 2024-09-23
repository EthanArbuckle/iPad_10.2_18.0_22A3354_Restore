@implementation IFSymbol

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IFSymbol)initWithSymbolName:(id)a3 bundleURL:(id)a4
{
  id v6;
  id v7;
  IFSymbol *v8;
  uint64_t v9;
  NSString *name;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IFSymbol;
  v8 = -[IFSymbol init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    name = v8->_name;
    v8->_name = (NSString *)v9;

    objc_storeStrong((id *)&v8->_bundleURL, a4);
    v8->_lock._os_unfair_lock_opaque = 0;
  }

  return v8;
}

- (IFSymbol)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  IFSymbol *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleURL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[IFSymbol initWithSymbolName:bundleURL:](self, "initWithSymbolName:bundleURL:", v6, v5);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *bundleURL;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("name"));
  bundleURL = self->_bundleURL;
  if (bundleURL)
    objc_msgSend(v5, "encodeObject:forKey:", bundleURL, CFSTR("bundleURL"));

}

- (CUICatalog)catalog
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  CUICatalog *v6;
  CUICatalog *catalog;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_catalog)
  {
    +[IFBundle bundleWithURL:](IFBundle, "bundleWithURL:", self->_bundleURL);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetCatalogURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (CUICatalog *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1A6A8]), "initWithURL:error:", v5, 0);
    catalog = self->_catalog;
    self->_catalog = v6;

  }
  os_unfair_lock_unlock(p_lock);
  return self->_catalog;
}

+ (id)_coreGlyphsBundle
{
  if (_coreGlyphsBundle_onceToken != -1)
    dispatch_once(&_coreGlyphsBundle_onceToken, &__block_literal_global_6);
  return (id)_coreGlyphsBundle_bundle;
}

void __29__IFSymbol__coreGlyphsBundle__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)MEMORY[0x1E0CB34D0];
  objc_msgSend(MEMORY[0x1E0C99E98], "coreGlyphsBundleURL");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleWithURL:", v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_coreGlyphsBundle_bundle;
  _coreGlyphsBundle_bundle = v1;

}

+ (id)_coreGlyphsPrivateBundle
{
  if (_coreGlyphsPrivateBundle_onceToken != -1)
    dispatch_once(&_coreGlyphsPrivateBundle_onceToken, &__block_literal_global_8);
  return (id)_coreGlyphsPrivateBundle_bundle;
}

void __36__IFSymbol__coreGlyphsPrivateBundle__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)MEMORY[0x1E0CB34D0];
  objc_msgSend(MEMORY[0x1E0C99E98], "coreGlyphsPrivateBundleURL");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleWithURL:", v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_coreGlyphsPrivateBundle_bundle;
  _coreGlyphsPrivateBundle_bundle = v1;

}

- (id)imageForSize:(CGSize)a3 scale:(double)a4
{
  double height;
  double width;
  void *v8;
  IFSymbolImageDescriptor *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  BOOL v17;
  double v18;
  double v19;
  uint64_t v20;
  const void *v21;
  void *v22;
  void *v23;
  CGAffineTransform v25;
  CGAffineTransform v26;
  CGRect v27;
  CGRect v28;

  height = a3.height;
  width = a3.width;
  -[IFSymbol name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    return 0;
  v9 = objc_alloc_init(IFSymbolImageDescriptor);
  -[IFSymbolImageDescriptor setScale:](v9, "setScale:", a4);
  -[IFSymbol imageForDescriptor:](self, "imageForDescriptor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10
    && (objc_msgSend(v10, "vectorGlyph"), v12 = (void *)objc_claimAutoreleasedReturnValue(), v12, v12))
  {
    objc_msgSend(v11, "vectorGlyph");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "alignmentRect");
    memset(&v26, 0, sizeof(v26));
    v16 = 1.0;
    v17 = v14 <= width;
    v18 = width / v14;
    if (v14 < width)
      v19 = width / v14;
    else
      v19 = 1.0;
    if (v17)
      v18 = v19;
    if (v15 > height || v15 < height)
      v16 = height / v15;
    if (v16 >= v18)
      v16 = v18;
    CGAffineTransformMakeScale(&v26, v16, v16);
    objc_msgSend(v13, "alignmentRect");
    v25 = v26;
    v28 = CGRectApplyAffineTransform(v27, &v25);
    v20 = objc_msgSend(v13, "rasterizeImageUsingScaleFactor:forTargetSize:", a4, v28.size.width, v28.size.height);
    if (v20)
    {
      v21 = (const void *)v20;
      +[IFGraphicsContext bitmapContextWithSize:scale:preset:](IFGraphicsContext, "bitmapContextWithSize:scale:preset:", 0, width, height, a4);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[IFSymbol _shouldFlipFromSymbolImage:desiredDirection:](self, "_shouldFlipFromSymbolImage:desiredDirection:", v11, -[IFSymbolImageDescriptor layoutDirection](v9, "layoutDirection")))
      {
        CGContextTranslateCTM((CGContextRef)objc_msgSend(v22, "cgContext"), width, 0.0);
        CGContextScaleCTM((CGContextRef)objc_msgSend(v22, "cgContext"), -1.0, 1.0);
      }
      objc_msgSend(v22, "drawCGImage:centeredInRect:", v21, 0.0, 0.0, width, height);
      objc_msgSend(v22, "image");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      CFRelease(v21);

    }
    else
    {
      v23 = 0;
    }

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (id)imageForDescriptor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  id v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  IFSymbolImage *v34;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[IFSymbol name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setName:", v5);

  }
  -[IFSymbol catalog](self, "catalog");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IFSymbol name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");
  v9 = v8;
  v10 = objc_msgSend(v4, "layoutDirection");
  v11 = objc_msgSend(v4, "symbolSize");
  v12 = objc_msgSend(v4, "symbolWeight");
  objc_msgSend(v4, "pointSize");
  objc_msgSend(v6, "namedVectorGlyphWithName:scaleFactor:deviceIdiom:layoutDirection:glyphSize:glyphWeight:glyphPointSize:appearanceName:", v7, 0, v10, v11, v12, 0, v9, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v15 = objc_alloc(MEMORY[0x1E0D1A6A8]);
    +[IFSymbol _coreGlyphsBundle](IFSymbol, "_coreGlyphsBundle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithName:fromBundle:error:", CFSTR("Assets"), v16, 0);

    -[IFSymbol name](self, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scale");
    v20 = v19;
    v21 = objc_msgSend(v4, "layoutDirection");
    v22 = objc_msgSend(v4, "symbolSize");
    v23 = objc_msgSend(v4, "symbolWeight");
    objc_msgSend(v4, "pointSize");
    objc_msgSend(v17, "namedVectorGlyphWithName:scaleFactor:deviceIdiom:layoutDirection:glyphSize:glyphWeight:glyphPointSize:appearanceName:", v18, 0, v21, v22, v23, 0, v20, v24);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v6 = v17;
    }
    else
    {
      v25 = objc_alloc(MEMORY[0x1E0D1A6A8]);
      +[IFSymbol _coreGlyphsPrivateBundle](IFSymbol, "_coreGlyphsPrivateBundle");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v25, "initWithName:fromBundle:error:", CFSTR("Assets"), v26, 0);

      -[IFSymbol name](self, "name");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "scale");
      v29 = v28;
      v30 = objc_msgSend(v4, "layoutDirection");
      v31 = objc_msgSend(v4, "symbolSize");
      v32 = objc_msgSend(v4, "symbolWeight");
      objc_msgSend(v4, "pointSize");
      objc_msgSend(v6, "namedVectorGlyphWithName:scaleFactor:deviceIdiom:layoutDirection:glyphSize:glyphWeight:glyphPointSize:appearanceName:", v27, 0, v30, v31, v32, 0, v29, v33);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        v34 = 0;
        goto LABEL_8;
      }
    }
  }
  v34 = -[IFSymbolImage initWithNamedVectorGlyph:]([IFSymbolImage alloc], "initWithNamedVectorGlyph:", v14);
LABEL_8:

  return v34;
}

- (id)_lookupResolvedName:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "pathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "rangeOfString:options:", CFSTR("svg"), 1) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(v3, "stringByDeletingPathExtension");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)imageForGraphicSymbolDescriptor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  const void *v29;
  void *v30;
  IFImage *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  CGColor *v35;
  double Alpha;
  CGColorRef CopyWithAlpha;
  CGColorRef v38;
  CGColorRef v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  id v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  CGContext *v59;
  CGFloat v60;
  double v61;
  double v62;
  double v63;
  NSObject *v64;
  IFImage *v65;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  id v82;
  void *v83;
  CGColorRef cf;
  void *cfa;
  _QWORD v86[4];
  id v87;
  _QWORD v88[4];
  id v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _QWORD v94[3];
  uint8_t buf[4];
  void *v96;
  __int16 v97;
  NSObject *v98;
  __int16 v99;
  uint64_t v100;
  __int16 v101;
  uint64_t v102;
  __int16 v103;
  uint64_t v104;
  __int16 v105;
  uint64_t v106;
  __int16 v107;
  void *v108;
  __int16 v109;
  void *v110;
  __int16 v111;
  uint64_t v112;
  __int16 v113;
  uint64_t v114;
  _BYTE v115[128];
  uint64_t v116;

  v116 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IFSymbol imageForDescriptor:](self, "imageForDescriptor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[IFSymbol name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setName:", v6);

    objc_msgSend(v5, "vectorGlyph");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "renditionName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[IFSymbol _lookupResolvedName:](self, "_lookupResolvedName:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setResolvedName:", v9);

    if (-[IFSymbol _shouldFlipFromSymbolImage:desiredDirection:](self, "_shouldFlipFromSymbolImage:desiredDirection:", v5, objc_msgSend(v4, "layoutDirection")))
    {
      objc_msgSend(v4, "setFlipXOffsetOverride:", 1);
    }
    v10 = objc_alloc_init(MEMORY[0x1E0D1A6F0]);
    -[NSObject setShape:](v10, "setShape:", objc_msgSend(v4, "resolvedShape"));
    -[NSObject setFill:](v10, "setFill:", objc_msgSend(v4, "resolvedFill"));
    -[NSObject setContentEffect:](v10, "setContentEffect:", objc_msgSend(v4, "resolvedSymbolEffect"));
    -[NSObject setShapeEffect:](v10, "setShapeEffect:", objc_msgSend(v4, "resolvedEnclosureEffect"));
    objc_msgSend(v4, "symbolOffset");
    -[NSObject setImageOffset:](v10, "setImageOffset:");
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v90 = 0u;
    v91 = 0u;
    v92 = 0u;
    v93 = 0u;
    objc_msgSend(v4, "resolvedEnclosureColors");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v90, v115, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v91;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v91 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(v11, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v90 + 1) + 8 * i), "cgColor"));
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v90, v115, 16);
      }
      while (v14);
    }

    -[NSObject setFillColors:](v10, "setFillColors:", v11);
    objc_msgSend(v4, "resolvedBorderWidth");
    -[NSObject setBorderWidth:](v10, "setBorderWidth:");
    objc_msgSend(v4, "resolvedBorderColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setBorderColor:](v10, "setBorderColor:", objc_msgSend(v17, "cgColor"));

    objc_msgSend(v5, "vectorGlyph");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v4, "resolvedRenderingModeFromSuggestedMode:", objc_msgSend(v18, "preferredRenderingMode"));

    if (v19 == 1)
    {
      objc_msgSend(v4, "resolvedSymbolColors");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setMonochromeForegroundColor:](v10, "setMonochromeForegroundColor:", objc_msgSend(v21, "cgColor"));

    }
    IFDefaultLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      -[IFSymbol name](self, "name");
      cfa = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject fillColors](v10, "fillColors");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = -[NSObject shape](v10, "shape");
      v80 = -[NSObject fill](v10, "fill");
      v79 = -[NSObject contentEffect](v10, "contentEffect");
      -[NSObject monochromeForegroundColor](v10, "monochromeForegroundColor");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "resolvedName");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject borderWidth](v10, "borderWidth");
      v70 = v69;
      -[NSObject borderColor](v10, "borderColor");
      v71 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138414594;
      v96 = cfa;
      v97 = 2112;
      v98 = v10;
      v99 = 2112;
      v100 = (uint64_t)v83;
      v101 = 2048;
      v102 = v81;
      v103 = 2048;
      v104 = v80;
      v105 = 2048;
      v106 = v79;
      v107 = 2112;
      v108 = v67;
      v109 = 2112;
      v110 = v68;
      v111 = 2048;
      v112 = v70;
      v113 = 2112;
      v114 = v71;
      v72 = (void *)v71;

    }
    objc_msgSend(v5, "vectorGlyph");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "graphicVariantWithOptions:", v10);
    v24 = objc_claimAutoreleasedReturnValue();

    if (!v24)
    {
      IFDefaultLog();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        -[IFSymbol imageForGraphicSymbolDescriptor:].cold.1(self, (uint64_t)v10, v32);

      goto LABEL_40;
    }
    if (v19 == 1)
    {
      objc_msgSend(v4, "scale");
      v26 = v25;
      objc_msgSend(v4, "size");
      v29 = (const void *)-[NSObject rasterizeImageUsingScaleFactor:forTargetSize:](v24, "rasterizeImageUsingScaleFactor:forTargetSize:", v26, v27, v28);
    }
    else
    {
      if (v19 == 2)
      {
        v86[0] = MEMORY[0x1E0C809B0];
        v86[1] = 3221225472;
        v86[2] = __44__IFSymbol_imageForGraphicSymbolDescriptor___block_invoke_22;
        v86[3] = &unk_1E97687E8;
        v47 = v4;
        v87 = v47;
        v48 = (void *)MEMORY[0x1D82581C0](v86);
        objc_msgSend(v47, "scale");
        v50 = v49;
        objc_msgSend(v47, "size");
        v29 = (const void *)-[NSObject rasterizeImageUsingScaleFactor:forTargetSize:withColorResolver:](v24, "rasterizeImageUsingScaleFactor:forTargetSize:withColorResolver:", v48, v50, v51, v52);

        v46 = v87;
      }
      else
      {
        if (v19 != 3)
        {
          v29 = 0;
          goto LABEL_34;
        }
        objc_msgSend(v4, "resolvedSymbolColors");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "objectAtIndexedSubscript:", 0);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = (CGColor *)objc_msgSend(v34, "cgColor");

        Alpha = CGColorGetAlpha(v35);
        CopyWithAlpha = CGColorCreateCopyWithAlpha(v35, Alpha * 0.5);
        v38 = CGColorCreateCopyWithAlpha(v35, Alpha * 0.3);
        v94[0] = v35;
        v94[1] = CopyWithAlpha;
        v39 = CopyWithAlpha;
        cf = v38;
        v94[2] = v38;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v94, 3);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v88[0] = MEMORY[0x1E0C809B0];
        v88[1] = 3221225472;
        v88[2] = __44__IFSymbol_imageForGraphicSymbolDescriptor___block_invoke;
        v88[3] = &unk_1E97687C0;
        v89 = v40;
        v82 = v40;
        v41 = (void *)MEMORY[0x1D82581C0](v88);
        objc_msgSend(v4, "scale");
        v43 = v42;
        objc_msgSend(v4, "size");
        v29 = (const void *)-[NSObject rasterizeImageUsingScaleFactor:forTargetSize:withHierarchyColorResolver:](v24, "rasterizeImageUsingScaleFactor:forTargetSize:withHierarchyColorResolver:", v41, v43, v44, v45);
        if (v39)
          CFRelease(v39);
        if (cf)
          CFRelease(cf);

        v46 = v82;
      }

    }
LABEL_34:
    -[NSObject setFillColors:](v10, "setFillColors:", 0);
    -[NSObject setMonochromeForegroundColor:](v10, "setMonochromeForegroundColor:", 0);
    if (v29)
    {
      if (-[IFSymbol _shouldFlipFromSymbolImage:desiredDirection:](self, "_shouldFlipFromSymbolImage:desiredDirection:", v5, objc_msgSend(v4, "layoutDirection")))
      {
        objc_msgSend(v4, "size");
        v54 = v53;
        v56 = v55;
        objc_msgSend(v4, "scale");
        +[IFGraphicsContext bitmapContextWithSize:scale:preset:](IFGraphicsContext, "bitmapContextWithSize:scale:preset:", 0, v54, v56, v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = (CGContext *)objc_msgSend(v58, "cgContext");
        objc_msgSend(v4, "size");
        CGContextTranslateCTM(v59, v60, 0.0);
        CGContextScaleCTM((CGContextRef)objc_msgSend(v58, "cgContext"), -1.0, 1.0);
        objc_msgSend(v4, "size");
        v62 = v61;
        objc_msgSend(v4, "size");
        objc_msgSend(v58, "drawCGImage:centeredInRect:", v29, 0.0, 0.0, v62, v63);
        objc_msgSend(v58, "image");
        v31 = (IFImage *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v65 = [IFImage alloc];
        objc_msgSend(v4, "scale");
        v31 = -[IFImage initWithCGImage:scale:](v65, "initWithCGImage:scale:", v29);
      }
      CFRelease(v29);
      goto LABEL_43;
    }
    IFDefaultLog();
    v64 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
    {
      -[IFSymbol name](self, "name");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "size");
      v75 = v74;
      objc_msgSend(v4, "size");
      v77 = v76;
      objc_msgSend(v4, "scale");
      *(_DWORD *)buf = 138413570;
      v96 = v73;
      v97 = 2112;
      v98 = v24;
      v99 = 2048;
      v100 = v19;
      v101 = 2048;
      v102 = v75;
      v103 = 2048;
      v104 = v77;
      v105 = 2048;
      v106 = v78;

    }
LABEL_40:
    v31 = 0;
LABEL_43:

    goto LABEL_44;
  }
  IFDefaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    -[IFSymbol name](self, "name");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v96 = v30;

  }
  v31 = 0;
LABEL_44:

  return v31;
}

uint64_t __44__IFSymbol_imageForGraphicSymbolDescriptor___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  void *v5;
  NSObject *v6;

  if (objc_msgSend(*(id *)(a1 + 32), "count") <= a3)
  {
    IFDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __44__IFSymbol_imageForGraphicSymbolDescriptor___block_invoke_cold_1(a3, v6);

    return objc_msgSend(*(id *)(a1 + 32), "lastObject");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (uint64_t)v5;
}

uint64_t __44__IFSymbol_imageForGraphicSymbolDescriptor___block_invoke_22(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;

  v5 = a2;
  v6 = -[IFColor _initWithColorStr:appearance:contrast:vibrancy:]([IFColor alloc], "_initWithColorStr:appearance:contrast:vibrancy:", v5, objc_msgSend(*(id *)(a1 + 32), "appearance"), objc_msgSend(*(id *)(a1 + 32), "contrast"), objc_msgSend(*(id *)(a1 + 32), "vibrancy"));

  if (v6 && objc_msgSend(v6, "cgColor"))
    a3 = objc_msgSend(v6, "cgColor");

  return a3;
}

- (BOOL)_shouldFlipFromSymbolImage:(id)a3 desiredDirection:(int64_t)a4
{
  id v5;
  BOOL v6;

  v5 = a3;
  if (!objc_msgSend(v5, "isFlippable"))
    goto LABEL_7;
  if (a4 != 4)
  {
    if (a4 == 5 && objc_msgSend(v5, "layoutDirection") == 4)
      goto LABEL_5;
LABEL_7:
    v6 = 0;
    goto LABEL_8;
  }
  if (objc_msgSend(v5, "layoutDirection") != 5)
    goto LABEL_7;
LABEL_5:
  v6 = 1;
LABEL_8:

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)IFSymbol;
  -[IFSymbol description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IFSymbol name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSURL)bundleURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_storeStrong((id *)&self->_catalog, 0);
}

- (void)imageForGraphicSymbolDescriptor:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_1D4106000, a3, OS_LOG_TYPE_ERROR, "Failed to create graphic variant image for %@ with options %@", (uint8_t *)&v6, 0x16u);

}

void __44__IFSymbol_imageForGraphicSymbolDescriptor___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_debug_impl(&dword_1D4106000, a2, OS_LOG_TYPE_DEBUG, "The hierarchy has more levels then supplied colours. Level: %lu", (uint8_t *)&v2, 0xCu);
}

@end
