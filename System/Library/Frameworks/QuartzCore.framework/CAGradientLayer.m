@implementation CAGradientLayer

- (void)didChangeValueForKey:(id)a3
{
  CA::Transaction *v5;
  uint64_t v6;
  CA::Transaction *v7;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = (CA::Transaction *)CAInternAtom((const __CFString *)a3, 0);
  v6 = 0;
  while ((_DWORD)v5 != (unsigned __int16)-[CAGradientLayer didChangeValueForKey:]::atoms[v6])
  {
    if (++v6 == 9)
      goto LABEL_6;
  }
  v7 = CA::Transaction::ensure_compat(v5);
  CA::Layer::set_commit_needed((CA::Layer *)self->super._attr.layer, v7, 0x10000);
LABEL_6:
  v8.receiver = self;
  v8.super_class = (Class)CAGradientLayer;
  -[CAGradientLayer didChangeValueForKey:](&v8, sel_didChangeValueForKey_, a3);
}

+ (id)defaultValueForKey:(id)a3
{
  int v5;
  void *v6;
  double v7;
  double v8;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = CAInternAtom((const __CFString *)a3, 0);
  if (v5 <= 433)
  {
    if (v5 == 211)
    {
      v6 = (void *)MEMORY[0x1E0CB3B18];
      v7 = 0.5;
      v8 = 1.0;
      return (id)objc_msgSend(v6, "valueWithPoint:", v7, v8);
    }
    if (v5 == 393)
      return &unk_1E15D6E90;
  }
  else
  {
    switch(v5)
    {
      case 434:
        return (id)*MEMORY[0x1E0C9AE40];
      case 566:
        return CFSTR("axial");
      case 525:
        v6 = (void *)MEMORY[0x1E0CB3B18];
        v7 = 0.5;
        v8 = 0.0;
        return (id)objc_msgSend(v6, "valueWithPoint:", v7, v8);
    }
  }
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___CAGradientLayer;
  return objc_msgSendSuper2(&v10, sel_defaultValueForKey_, a3);
}

- (void)setColors:(NSArray *)colors
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3[0] = colors;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x6C, (const CGAffineTransform *)3, v3);
}

- (void)setLocations:(NSArray *)locations
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3[0] = locations;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x164, (const CGAffineTransform *)3, v3);
}

- (BOOL)CA_validateValue:(id)a3 forKey:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CFTypeID v11;
  BOOL result;
  objc_super v13;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
LABEL_18:
    v13.receiver = self;
    v13.super_class = (Class)CAGradientLayer;
    return -[CALayer CA_validateValue:forKey:](&v13, sel_CA_validateValue_forKey_, a3, a4);
  }
  if (!objc_msgSend(a4, "isEqualToString:", CFSTR("colors")))
  {
    if (objc_msgSend(a4, "isEqualToString:", CFSTR("locations"))
      || objc_msgSend(a4, "isEqualToString:", CFSTR("interpolations")))
    {
      objc_opt_class();
      return CAObject_validateArrayOfClass(a3);
    }
    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
LABEL_6:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v9)
        objc_enumerationMutation(a3);
      v11 = CFGetTypeID(*(CFTypeRef *)(*((_QWORD *)&v15 + 1) + 8 * v10));
      if (v11 != CGColorGetTypeID())
        return 0;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
        result = 1;
        if (v8)
          goto LABEL_6;
        return result;
      }
    }
  }
  return 1;
}

- (BOOL)_renderLayerDefinesProperty:(unsigned int)a3
{
  uint64_t v3;
  objc_super v5;
  uint64_t v6;

  v3 = 0;
  v6 = *MEMORY[0x1E0C80C00];
  while ((unsigned __int16)defines_property::atoms[v3] != a3)
  {
    if (++v3 == 9)
    {
      v5.receiver = self;
      v5.super_class = (Class)CAGradientLayer;
      return -[CALayer _renderLayerDefinesProperty:](&v5, sel__renderLayerDefinesProperty_);
    }
  }
  return 1;
}

+ (BOOL)_hasRenderLayerSubclass
{
  return 1;
}

- (unsigned)_renderLayerPropertyAnimationFlags:(unsigned int)a3
{
  uint64_t v3;
  objc_super v5;
  uint64_t v6;

  v3 = 0;
  v6 = *MEMORY[0x1E0C80C00];
  while ((unsigned __int16)defines_property::atoms[v3] != a3)
  {
    if (++v3 == 9)
    {
      v5.receiver = self;
      v5.super_class = (Class)CAGradientLayer;
      return -[CALayer _renderLayerPropertyAnimationFlags:](&v5, sel__renderLayerPropertyAnimationFlags_);
    }
  }
  return 32;
}

- (id)implicitAnimationForKeyPath:(id)a3
{
  id result;
  uint64_t v6;
  uint64_t v7;
  int v8;
  signed int v9;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)CAGradientLayer;
  result = -[CALayer implicitAnimationForKeyPath:](&v10, sel_implicitAnimationForKeyPath_);
  if (!result)
  {
    v6 = objc_msgSend(a3, "rangeOfString:", CFSTR("."));
    if (v7)
    {
      v8 = CAInternAtom((const __CFString *)objc_msgSend(a3, "substringToIndex:", v6), 0);
      v9 = 0;
      result = 0;
      if (v8 <= 355)
      {
        if (v8 != 108 && v8 != 322)
          return result;
        return CALayerCreateImplicitAnimation((CAMediaTimingFunction *)self, a3, v9);
      }
      if (v8 == 434 || v8 == 356)
        return CALayerCreateImplicitAnimation((CAMediaTimingFunction *)self, a3, v9);
    }
    else
    {
      v9 = CAInternAtom((const __CFString *)a3, 0);
      result = 0;
      if (v9 <= 355)
      {
        if (v9 == 108 || v9 == 211 || v9 == 322)
          return CALayerCreateImplicitAnimation((CAMediaTimingFunction *)self, a3, v9);
      }
      else if (v9 > 433)
      {
        if (v9 == 434 || v9 == 525)
          return CALayerCreateImplicitAnimation((CAMediaTimingFunction *)self, a3, v9);
      }
      else if (v9 == 356 || v9 == 393)
      {
        return CALayerCreateImplicitAnimation((CAMediaTimingFunction *)self, a3, v9);
      }
    }
  }
  return result;
}

- (void)_renderBackgroundInContext:(CGContext *)a3
{
  CA::Transaction *v5;
  CA::Transaction *v6;
  int v7;
  NSArray *v8;
  unint64_t v9;
  NSArray *v10;
  NSArray *v11;
  uint64_t v12;
  size_t v13;
  char *v14;
  uint64_t i;
  uint64_t v16;
  uint64_t v17;
  CGGradient *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  double v33;
  double v34;
  double v35;
  long double v36;
  int v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  objc_super v42;
  uint64_t v43;
  _QWORD v44[2];
  CGPoint v45;
  CGPoint v46;
  CGPoint v47;
  CGPoint v48;
  CGPoint v49;
  CGRect v50;

  v44[1] = *MEMORY[0x1E0C80C00];
  v42.receiver = self;
  v42.super_class = (Class)CAGradientLayer;
  v5 = (CA::Transaction *)-[CALayer _renderBackgroundInContext:](&v42, sel__renderBackgroundInContext_);
  v6 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v6)
    v6 = (CA::Transaction *)CA::Transaction::create(v5);
  v7 = *((_DWORD *)v6 + 25);
  *((_DWORD *)v6 + 25) = v7 + 1;
  if (!v7)
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  v8 = -[CAGradientLayer colors](self, "colors");
  v9 = -[NSArray count](v8, "count");
  if (v9 >= 2)
  {
    v10 = -[CAGradientLayer locations](self, "locations");
    v11 = v10;
    if (v10)
    {
      v12 = -[NSArray count](v10, "count");
      if (v12 != v9)
        goto LABEL_29;
      MEMORY[0x1E0C80A78](v12);
      v14 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v14, v13);
      for (i = 0; i != v9; ++i)
      {
        objc_msgSend(-[NSArray objectAtIndex:](v11, "objectAtIndex:", i), "doubleValue");
        *(_QWORD *)&v14[8 * i] = v16;
      }
    }
    else
    {
      v14 = 0;
    }
    if (-[CAGradientLayer premultiplied](self, "premultiplied"))
    {
      v43 = *MEMORY[0x1E0C9DA88];
      v44[0] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1);
      v17 = CGGradientCreateWithColorsAndOptions();
    }
    else
    {
      v17 = (uint64_t)CGGradientCreateWithColors(0, (CFArrayRef)v8, (const CGFloat *)v14);
    }
    v18 = (CGGradient *)v17;
    if (v17)
    {
      -[CALayer bounds](self, "bounds");
      v20 = v19;
      v22 = v21;
      v24 = v23;
      v26 = v25;
      CGContextSaveGState(a3);
      if (-[CALayer _usesCornerRadii](self, "_usesCornerRadii"))
      {
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        if (self)
          -[CALayer cornerRadii](self, "cornerRadii", v38, v39, v40, v41);
        CA_CGContextAddUnevenRoundRect(a3, (uint64_t)&v38, v20, v22, v24, v26);
        CGContextClip(a3);
      }
      else
      {
        -[CALayer cornerRadius](self, "cornerRadius");
        if (v27 <= 0.0)
        {
          v50.origin.x = v20;
          v50.origin.y = v22;
          v50.size.width = v24;
          v50.size.height = v26;
          CGContextClipToRect(a3, v50);
        }
        else
        {
          CA_CGContextAddRoundRect(a3, -[CALayer _continuousCorners](self, "_continuousCorners"), v20, v22, v24, v26, v27);
          CGContextClip(a3);
        }
      }
      -[CAGradientLayer startPoint](self, "startPoint", v38, v39, v40, v41);
      v29 = v28;
      v31 = v30;
      -[CAGradientLayer endPoint](self, "endPoint");
      v33 = v32;
      v35 = v34;
      if (-[NSString isEqualToString:](-[CAGradientLayer type](self, "type"), "isEqualToString:", CFSTR("axial")))
      {
        CA::Transaction::unlock(v6);
        CGContextTranslateCTM(a3, v20, v22);
        CGContextScaleCTM(a3, v24, v26);
        v45.x = v29;
        v45.y = v31;
        v48.x = v33;
        v48.y = v35;
        CGContextDrawLinearGradient(a3, v18, v45, v48, 3u);
      }
      else if (-[NSString isEqualToString:](-[CAGradientLayer type](self, "type"), "isEqualToString:", CFSTR("radial")))
      {
        CA::Transaction::unlock(v6);
        CGContextTranslateCTM(a3, v20, v22);
        CGContextScaleCTM(a3, v24, v26);
        CGContextTranslateCTM(a3, v29, v31);
        CGContextScaleCTM(a3, vabdd_f64(v33, v29), vabdd_f64(v35, v31));
        v46 = *(CGPoint *)*(_QWORD *)&MEMORY[0x1E0C9D538];
        v49.x = *(CGFloat *)MEMORY[0x1E0C9D538];
        v49.y = v46.y;
        CGContextDrawRadialGradient(a3, v18, *MEMORY[0x1E0C9D538], 0.0, v49, 1.0, 3u);
      }
      else
      {
        if (!-[NSString isEqualToString:](-[CAGradientLayer type](self, "type"), "isEqualToString:", CFSTR("conic")))
        {
LABEL_28:
          CGContextRestoreGState(a3);
          CGGradientRelease(v18);
          goto LABEL_29;
        }
        CA::Transaction::unlock(v6);
        v36 = atan2(v35 - v31, v33 - v29);
        CGContextTranslateCTM(a3, v20, v22);
        CGContextScaleCTM(a3, v24, v26);
        v47.x = v29;
        v47.y = v31;
        CGContextDrawConicGradient(a3, v18, v47, v36);
      }
      v37 = *((_DWORD *)v6 + 25);
      *((_DWORD *)v6 + 25) = v37 + 1;
      if (!v37)
        os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
      goto LABEL_28;
    }
  }
LABEL_29:
  CA::Transaction::unlock(v6);
}

- (void)_copyRenderLayer:(void *)a3 layerFlags:(unsigned int)a4 commitFlags:(unsigned int *)a5
{
  id v8;
  CA::Transaction *v9;
  id v10;
  NSArray *v11;
  NSArray *v12;
  uint64_t v13;
  malloc_zone_t *malloc_zone;
  _DWORD *v15;
  double v16;
  _DWORD *v17;
  int v18;
  uint64_t v19;
  unsigned int *v20;
  unsigned int *v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int *v24;
  unsigned int v25;
  uint64_t v26;
  unsigned int v27;
  unint64_t v28;
  unint64_t v29;
  CFTypeID TypeID;
  CFTypeID v31;
  uint64_t v32;
  CFIndex v33;
  int v34;
  float32x4_t *v35;
  CGColor *v36;
  unint64_t v37;
  uint64_t v38;
  unsigned int *v39;
  unsigned int *v40;
  unsigned int v41;
  unsigned int v42;
  unsigned int *v43;
  unsigned int v44;
  unsigned int v45;
  unint64_t v46;
  unsigned int v47;
  unint64_t Count;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  CFIndex v52;
  char v53;
  const __CFNumber *ValueAtIndex;
  float *v55;
  BOOL v56;
  unint64_t v57;
  int v58;
  unint64_t v59;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  unint64_t v70;
  _OWORD *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  int v76;
  double v77;
  unsigned int *v78;
  unsigned int v79;
  unsigned int v80;
  NSArray *v82;
  unint64_t v83;
  id v84;
  __int128 v85;
  CGColorSpace *cf;
  NSArray *v87;
  objc_super v88;
  float64x2_t v89;
  float64x2_t v90;
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v88.receiver = self;
  v88.super_class = (Class)CAGradientLayer;
  v8 = -[CALayer _copyRenderLayer:layerFlags:commitFlags:](&v88, sel__copyRenderLayer_layerFlags_commitFlags_, a3, *(_QWORD *)&a4);
  if (!v8 || (*((_BYTE *)a5 + 2) & 1) == 0)
    return v8;
  cf = -[CAGradientLayer colorSpace](self, "colorSpace");
  if (!cf)
    cf = (CGColorSpace *)CA::Context::current_colorspace((CA::Context *)a3, v9);
  v10 = -[CAGradientLayer colorMap](self, "colorMap");
  if (v10)
  {
    v11 = 0;
    v12 = 0;
    v87 = 0;
    v13 = 0;
  }
  else
  {
    v11 = -[CAGradientLayer colors](self, "colors");
    v13 = -[NSArray count](v11, "count");
    v12 = -[CAGradientLayer locations](self, "locations");
    v87 = -[CAGradientLayer interpolations](self, "interpolations");
  }
  malloc_zone = (malloc_zone_t *)get_malloc_zone();
  v15 = malloc_type_zone_calloc(malloc_zone, 1uLL, 0x90uLL, 0x743898A5uLL);
  v17 = v15;
  if (v15)
  {
    if (v87)
      v18 = (2 * (v12 != 0)) | 4;
    else
      v18 = 2 * (v12 != 0);
    v15[2] = 1;
    v15[3] = 20;
    ++dword_1ECDC7C78;
    *(_QWORD *)v15 = off_1E1596F38;
    CA::Render::Gradient::Gradient((CA::Render::Gradient *)(v15 + 4), v13, v18);
    v16 = 0.0;
    *(_OWORD *)(v17 + 22) = 0u;
    *(_OWORD *)(v17 + 18) = 0u;
    *((_QWORD *)v17 + 13) = 0x3F80000000000000;
    *((_OWORD *)v17 + 7) = 0u;
    *((_OWORD *)v17 + 8) = 0u;
  }
  if (!v10)
  {
    v83 = v13;
    if (!v11 || !*((_QWORD *)v17 + 6))
    {
LABEL_63:
      if (v12 && *((_QWORD *)v17 + 7))
      {
        Count = CFArrayGetCount((CFArrayRef)v12);
        v49 = *((_QWORD *)v17 + 4);
        if (v49 >= Count)
          v50 = Count;
        else
          v50 = *((_QWORD *)v17 + 4);
        if (v50)
        {
          v51 = 0;
          v52 = 0;
          v53 = 1;
          do
          {
            ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex((CFArrayRef)v12, v52);
            CFNumberGetValue(ValueAtIndex, kCFNumberFloatType, (void *)(*((_QWORD *)v17 + 7) + v51));
            if (v52)
            {
              v55 = (float *)(*((_QWORD *)v17 + 7) + 4 * v52);
              *(float *)&v16 = *v55;
              if (*v55 < *(v55 - 1))
                v53 = 0;
            }
            ++v52;
            v51 += 4;
          }
          while (v50 != v52);
          v49 = *((_QWORD *)v17 + 4);
        }
        else
        {
          v53 = 1;
        }
        v56 = v49 > v50;
        v57 = v49 - v50;
        if (v56)
          memset_pattern16((void *)(*((_QWORD *)v17 + 7) + 4 * v50), &unk_18474EA00, 4 * v57);
        if ((v53 & 1) != 0)
          v58 = 256;
        else
          v58 = 0;
        v17[7] = v17[7] & 0xFFFFFCFF | v58 | 0x200;
      }
      if (!v87 || v83 < 2)
        goto LABEL_97;
      v59 = -[NSArray count](v87, "count");
      __asm { FMOV            V0.2D, #1.0 }
      v85 = _Q0;
      if (v59 >= v83 - 1)
      {
        v66 = *((_QWORD *)v17 + 8);
        v65 = v83 - 1;
      }
      else
      {
        v65 = -[NSArray count](v87, "count");
        v66 = *((_QWORD *)v17 + 8);
        if (!v65)
          goto LABEL_94;
      }
      v67 = 0;
      v68 = v66;
      do
      {
        v69 = -[NSArray objectAtIndexedSubscript:](v87, "objectAtIndexedSubscript:", v67, v82);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v69, "_getPoints:", v68);
        }
        else
        {
          *(_QWORD *)v68 = 0;
          *(_QWORD *)(v68 + 8) = 0;
          *(_OWORD *)(v68 + 16) = v85;
        }
        ++v67;
        v68 += 32;
      }
      while (v65 != v67);
LABEL_94:
      v16 = *(double *)&v85;
      if (v65 < v83 - 1)
      {
        v70 = ~v65 + v83;
        v71 = (_OWORD *)(v66 + 32 * v65 + 16);
        do
        {
          *((_QWORD *)v71 - 2) = 0;
          *((_QWORD *)v71 - 1) = 0;
          *v71 = v85;
          v71 += 2;
          --v70;
        }
        while (v70);
      }
      goto LABEL_97;
    }
    v28 = CFArrayGetCount((CFArrayRef)v11);
    if (*((_QWORD *)v17 + 4) >= v28)
      v29 = v28;
    else
      v29 = *((_QWORD *)v17 + 4);
    TypeID = CGColorGetTypeID();
    if (v29)
    {
      v31 = TypeID;
      v82 = v12;
      v84 = v8;
      v32 = 0;
      v33 = 0;
      LOBYTE(v34) = 1;
      do
      {
        v35 = (float32x4_t *)(*((_QWORD *)v17 + 6) + v32);
        v36 = (CGColor *)CFArrayGetValueAtIndex((CFArrayRef)v11, v33);
        if (CFGetTypeID(v36) == v31)
        {
          v89 = 0u;
          v90 = 0u;
          CA_CGColorGetRGBComponents(v36, cf, v89.f64);
          HIDWORD(v16) = HIDWORD(v90.f64[0]);
          *v35 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v89), v90);
          LODWORD(v16) = v35->i32[3];
        }
        else
        {
          v35->i64[0] = 0;
          v35->i64[1] = 0;
          LODWORD(v16) = 0;
        }
        v34 = (*(float *)&v16 >= 1.0) & v34;
        ++v33;
        v32 += 16;
      }
      while (v29 != v33);
      v37 = *((_QWORD *)v17 + 4);
      v8 = v84;
      v12 = v82;
      if (v29 >= v37)
      {
        if (v34)
          goto LABEL_61;
LABEL_60:
        v47 = v17[7] & 0xFFFFF7FF;
LABEL_62:
        v17[7] = v47;
        goto LABEL_63;
      }
    }
    else
    {
      v37 = *((_QWORD *)v17 + 4);
      if (!v37)
      {
LABEL_61:
        v47 = v17[7] | 0x800;
        goto LABEL_62;
      }
    }
    v46 = v37 - v29;
    if ((v46 & 0x3FFFFFFFFFFFFFFFLL) != 0)
      bzero((void *)(*((_QWORD *)v17 + 6) + 16 * v29), 16 * v46);
    goto LABEL_60;
  }
  v19 = objc_msgSend(v10, "CA_copyRenderValue");
  v20 = (unsigned int *)*((_QWORD *)v17 + 14);
  if (v20 != (unsigned int *)v19)
  {
    if (v20)
    {
      v21 = v20 + 2;
      do
      {
        v22 = __ldaxr(v21);
        v23 = v22 - 1;
      }
      while (__stlxr(v23, v21));
      if (!v23)
        (*(void (**)(unsigned int *))(*(_QWORD *)v20 + 16))(v20);
    }
    if (v19)
    {
      v24 = (unsigned int *)(v19 + 8);
      do
        v25 = __ldaxr(v24);
      while (__stlxr(v25 + 1, v24));
      v26 = v19;
      if (!v25)
      {
        v26 = 0;
        do
          v27 = __ldaxr(v24);
        while (__stlxr(v27 - 1, v24));
      }
    }
    else
    {
      v26 = 0;
    }
    *((_QWORD *)v17 + 14) = v26;
    v38 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v19 + 80))(v19);
    if (v38 && (*(_BYTE *)(v38 + 13) & 0x10) != 0)
      v17[3] |= 0x1000u;
    v17[3] |= 0x800u;
  }
  v39 = (unsigned int *)*((_QWORD *)v17 + 15);
  if (v39)
  {
    v40 = v39 + 2;
    do
    {
      v41 = __ldaxr(v40);
      v42 = v41 - 1;
    }
    while (__stlxr(v42, v40));
    if (!v42)
      (*(void (**)(unsigned int *))(*(_QWORD *)v39 + 16))(v39);
    *((_QWORD *)v17 + 15) = 0;
  }
  if (v19)
  {
    v43 = (unsigned int *)(v19 + 8);
    do
    {
      v44 = __ldaxr(v43);
      v45 = v44 - 1;
    }
    while (__stlxr(v45, v43));
    if (!v45)
      (*(void (**)(uint64_t))(*(_QWORD *)v19 + 16))(v19);
  }
LABEL_97:
  v17[26] = CAInternAtom((const __CFString *)-[CAGradientLayer type](self, "type", v16, v82), 0);
  -[CAGradientLayer startPoint](self, "startPoint");
  *((_QWORD *)v17 + 9) = v72;
  *((_QWORD *)v17 + 10) = v73;
  -[CAGradientLayer endPoint](self, "endPoint");
  *((_QWORD *)v17 + 11) = v74;
  *((_QWORD *)v17 + 12) = v75;
  X::CFRef<__CFDictionary const*>::operator=((const void **)v17 + 16, cf);
  if (-[CAGradientLayer premultiplied](self, "premultiplied"))
    v76 = 4096;
  else
    v76 = 0;
  v17[7] = v17[7] & 0xFFFFEFFF | v76;
  -[CAGradientLayer noiseScale](self, "noiseScale");
  *(float *)&v77 = v77;
  v17[27] = LODWORD(v77);
  CA::Render::Layer::set_subclass((unsigned int *)v8, (CA::Render::LayerSubclass *)v17);
  v78 = v17 + 2;
  do
  {
    v79 = __ldaxr(v78);
    v80 = v79 - 1;
  }
  while (__stlxr(v80, v78));
  if (!v80)
    (*(void (**)(_DWORD *))(*(_QWORD *)v17 + 16))(v17);
  return v8;
}

- (CGPoint)startPoint
{
  double v2;
  double v3;
  double v4;
  double v5;
  uint64_t v6;
  CGPoint result;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = 0.0;
  v5 = 0.0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x20Du, (const CGAffineTransform *)0x13, (id *)&v4);
  v2 = v4;
  v3 = v5;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)endPoint
{
  double v2;
  double v3;
  double v4;
  double v5;
  uint64_t v6;
  CGPoint result;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = 0.0;
  v5 = 0.0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0xD3u, (const CGAffineTransform *)0x13, (id *)&v4);
  v2 = v4;
  v3 = v5;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CAGradientLayerType)type
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x236u, (const CGAffineTransform *)3, v3);
  return (CAGradientLayerType)v3[0];
}

- (BOOL)premultiplied
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x1B2u, (const CGAffineTransform *)6, (id *)&v3);
  return v3;
}

- (NSArray)locations
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x164u, (const CGAffineTransform *)3, v3);
  return (NSArray *)v3[0];
}

- (NSArray)colors
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x6Cu, (const CGAffineTransform *)3, v3);
  return (NSArray *)v3[0];
}

- (double)noiseScale
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x189u, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (id)colorMap
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x64u, (const CGAffineTransform *)2, v3);
  return v3[0];
}

- (NSArray)interpolations
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x142u, (const CGAffineTransform *)3, v3);
  return (NSArray *)v3[0];
}

- (CGColorSpace)colorSpace
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x6Au, (const CGAffineTransform *)2, v3);
  return (CGColorSpace *)v3[0];
}

- (void)setStartPoint:(CGPoint)startPoint
{
  CGPoint v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = startPoint;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x20D, (const CGAffineTransform *)0x13, &v3.x);
}

- (void)setEndPoint:(CGPoint)endPoint
{
  CGPoint v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = endPoint;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0xD3, (const CGAffineTransform *)0x13, &v3.x);
}

- (void)setType:(CAGradientLayerType)type
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3[0] = type;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x236, (const CGAffineTransform *)3, v3);
}

- (void)setInterpolations:(id)a3
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x142, (const CGAffineTransform *)3, v3);
}

- (void)setPremultiplied:(BOOL)a3
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x1B2, (const CGAffineTransform *)6, (double *)&v3);
}

- (void)setColorSpace:(CGColorSpace *)a3
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x6A, (const CGAffineTransform *)2, v3);
}

+ (BOOL)CA_automaticallyNotifiesObservers:(Class)a3
{
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((Class)objc_opt_class() == a3)
    return 0;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CAGradientLayer;
  return objc_msgSendSuper2(&v6, sel_CA_automaticallyNotifiesObservers_, a3);
}

- (void)_colorSpaceDidChange
{
  CA::Transaction *v3;
  CA::Transaction *v4;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)CAGradientLayer;
  v3 = (CA::Transaction *)-[CALayer _colorSpaceDidChange](&v5, sel__colorSpaceDidChange);
  v4 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v4)
    v4 = (CA::Transaction *)CA::Transaction::create(v3);
  CA::Layer::set_commit_needed((CA::Layer *)self->super._attr.layer, v4, 0x10000);
}

- (void)setColorMap:(id)a3
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x64, (const CGAffineTransform *)2, v3);
}

- (void)setNoiseScale:(double)a3
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x189, (const CGAffineTransform *)0x12, v3);
}

@end
