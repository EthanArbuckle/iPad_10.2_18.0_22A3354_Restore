@implementation CATextLayer

+ (id)defaultValueForKey:(id)a3
{
  int v5;
  id result;
  id v7;
  double v8;
  CGColorSpace *v9;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = CAInternAtom((const __CFString *)a3, 0);
  if (v5 > 229)
  {
    if (v5 > 563)
    {
      if (v5 == 564)
        return CFSTR("none");
      if (v5 != 565)
        goto LABEL_24;
      result = (id)+[CATextLayer defaultValueForKey:]::defTrunc;
      if (!+[CATextLayer defaultValueForKey:]::defTrunc)
      {
        result = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCharacters:length:", &+[CATextLayer defaultValueForKey:]::mark, 1);
        +[CATextLayer defaultValueForKey:]::defTrunc = (uint64_t)result;
      }
    }
    else
    {
      if (v5 != 230)
      {
        if (v5 == 390)
          return (id)*MEMORY[0x1E0C9AE50];
        goto LABEL_24;
      }
      result = (id)+[CATextLayer defaultValueForKey:]::white;
      if (!+[CATextLayer defaultValueForKey:]::white)
      {
        v9 = (CGColorSpace *)CAGetColorSpace(0x1Du);
        result = CGColorCreate(v9, +[CATextLayer defaultValueForKey:]::comp);
        +[CATextLayer defaultValueForKey:]::white = (uint64_t)result;
      }
    }
  }
  else
  {
    if (v5 <= 225)
    {
      if (v5 == 7)
        return CFSTR("natural");
      if (v5 == 129)
        return CFSTR("topLeft");
      goto LABEL_24;
    }
    if (v5 != 226)
    {
      if (v5 == 227)
      {
        result = (id)+[CATextLayer defaultValueForKey:]::defFontSize;
        if (!+[CATextLayer defaultValueForKey:]::defFontSize)
        {
          v7 = objc_alloc(MEMORY[0x1E0CB37E8]);
          LODWORD(v8) = 1108344832;
          result = (id)objc_msgSend(v7, "initWithFloat:", v8);
          +[CATextLayer defaultValueForKey:]::defFontSize = (uint64_t)result;
        }
        return result;
      }
LABEL_24:
      v10.receiver = a1;
      v10.super_class = (Class)&OBJC_METACLASS___CATextLayer;
      return objc_msgSendSuper2(&v10, sel_defaultValueForKey_, a3);
    }
    result = (id)+[CATextLayer defaultValueForKey:]::defFont;
    if (!+[CATextLayer defaultValueForKey:]::defFont)
    {
      result = CTFontCreateWithName(CFSTR("Helvetica"), 36.0, 0);
      +[CATextLayer defaultValueForKey:]::defFont = (uint64_t)result;
    }
  }
  return result;
}

+ (BOOL)needsDisplayForKey:(id)a3
{
  int v3;

  v3 = CAInternAtom((const __CFString *)a3, 0);
  return CAAtomIndexInArray(12, (uint64_t)&+[CATextLayer needsDisplayForKey:]::atoms, v3) != -1;
}

- (void)drawInContext:(CGContext *)a3
{
  Class v5;
  CGFloat v6;
  CGAffineTransform transform;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if ((-[CATextLayer drawInContext:]::initialized & 1) == 0)
  {
    v5 = NSClassFromString(CFSTR("NSGraphicsContext"));
    -[CATextLayer drawInContext:]::gfxCtx = (uint64_t)v5;
    -[CATextLayer drawInContext:]::initialized = 1;
    if (!v5)
      goto LABEL_6;
    goto LABEL_5;
  }
  v5 = (Class)-[CATextLayer drawInContext:]::gfxCtx;
  if (-[CATextLayer drawInContext:]::gfxCtx)
  {
LABEL_5:
    -[objc_class saveGraphicsState](v5, "saveGraphicsState");
    objc_msgSend((id)-[CATextLayer drawInContext:]::gfxCtx, "setCurrentContext:", objc_msgSend((id)-[CATextLayer drawInContext:]::gfxCtx, "graphicsContextWithGraphicsPort:flipped:", a3, 0));
  }
LABEL_6:
  if (-[CALayer contentsAreFlipped](self, "contentsAreFlipped"))
  {
    -[CALayer size](self, "size");
    transform.b = 0.0;
    transform.c = 0.0;
    transform.a = 1.0;
    *(_OWORD *)&transform.d = xmmword_18474DFF0;
    transform.ty = v6;
    CGContextConcatCTM(a3, &transform);
  }
  -[CATextLayer _applyLinesToFunction:info:](self, "_applyLinesToFunction:info:", drawLine, a3);
  if (-[CATextLayer drawInContext:]::gfxCtx)
    objc_msgSend((id)-[CATextLayer drawInContext:]::gfxCtx, "restoreGraphicsState");
}

- (void)_applyLinesToFunction:(void *)a3 info:(void *)a4 truncated:(BOOL *)a5
{
  CA::Transaction *v8;
  int v9;
  __CTTypesetter *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  __CFString *v16;
  double v17;
  int v18;
  int v19;
  int v20;
  __CTLine *v21;
  CFIndex v22;
  double v23;
  double v24;
  CFIndex v25;
  const __CTLine *Line;
  const __CTLine *v27;
  double v28;
  double v29;
  double v30;
  const __CTLine *v31;
  const __CTLine *v32;
  CTLineRef v33;
  double width;
  const __CTLine *TruncatedLine;
  int v36;
  CTLineRef JustifiedLine;
  __n128 v38;
  double PenOffsetForFlush;
  double v40;
  double v41;
  double v42;
  double v43;
  CTLineTruncationType truncationType;
  BOOL *v46;
  int v47;
  double v48;
  double v49;
  int v51;
  _BOOL4 v52;
  double v53;
  double v54;
  double v55[3];
  CFRange v56;
  CFRange v57;
  CFRange v58;
  CGRect BoundsWithOptions;
  CGRect v60;
  CGRect v61;

  v55[1] = *(double *)MEMORY[0x1E0C80C00];
  if (a5)
    *a5 = 0;
  v8 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v8)
    v8 = (CA::Transaction *)CA::Transaction::create((CA::Transaction *)self);
  v9 = *((_DWORD *)v8 + 25);
  *((_DWORD *)v8 + 25) = v9 + 1;
  if (!v9)
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  v10 = -[CATextLayer _retainTypesetter](self, "_retainTypesetter");
  if (!v10)
  {
    CA::Transaction::unlock(v8);
    return;
  }
  -[CALayer bounds](self, "bounds");
  v12 = v11;
  v14 = v13;
  v48 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v49 = *MEMORY[0x1E0C9D538];
  v52 = -[CATextLayer isWrapped](self, "isWrapped");
  v15 = objc_msgSend(-[CATextLayer string](self, "string"), "length");
  v16 = -[CATextLayer alignmentMode](self, "alignmentMode");
  if (-[__CFString isEqual:](v16, "isEqual:", CFSTR("natural")))
  {
    if (get_natural_alignment(void)::once_alignment != -1)
      dispatch_once_f(&get_natural_alignment(void)::once_alignment, 0, (dispatch_function_t)init_alignment);
    if ((natural_alignment & 1) == 0)
    {
      v51 = 0;
      v17 = 0.0;
      goto LABEL_21;
    }
    goto LABEL_17;
  }
  v18 = CAInternAtom(v16, 0);
  if (v18 == 81)
  {
    v51 = 0;
    v17 = 0.5;
  }
  else
  {
    v17 = 0.0;
    if (v18 == 328)
    {
      v51 = 1;
    }
    else
    {
      if (v18 == 465)
      {
LABEL_17:
        v51 = 0;
        v17 = 1.0;
        goto LABEL_21;
      }
      v51 = 0;
    }
  }
LABEL_21:
  v19 = CAInternAtom((const __CFString *)-[CATextLayer truncationMode](self, "truncationMode"), 0);
  v46 = a5;
  switch(v19)
  {
    case 209:
      v20 = 1;
      goto LABEL_26;
    case 523:
      truncationType = kCTLineTruncationStart;
      goto LABEL_28;
    case 379:
      v20 = 2;
LABEL_26:
      truncationType = v20;
LABEL_28:
      v21 = -[CATextLayer _createTruncationToken](self, "_createTruncationToken");
      goto LABEL_30;
  }
  v21 = 0;
  truncationType = -1;
LABEL_30:
  CA::Transaction::unlock(v8);
  v47 = dyld_program_sdk_at_least();
  if (v14 > 0.0 && v15 >= 1)
  {
    v22 = 0;
    if (v52)
      v23 = v12;
    else
      v23 = 1.0e10;
    v24 = 0.0;
    while (1)
    {
      v54 = 0.0;
      v55[0] = 0.0;
      v53 = 0.0;
      v25 = CTTypesetterSuggestLineBreak(v10, v22, v23);
      v56.location = v22;
      v56.length = v25;
      Line = CTTypesetterCreateLine(v10, v56);
      v27 = Line;
      if (!Line)
        goto LABEL_69;
      if (v52)
      {
        get_line_bounds(Line, v55, &v54, &v53);
        if (v25 + v22 < v15)
        {
          v29 = v54;
          v28 = v55[0];
          v30 = v53;
          v57.length = CTTypesetterSuggestLineBreak(v10, v25 + v22, v12);
          v57.location = v25 + v22;
          v31 = CTTypesetterCreateLine(v10, v57);
          v32 = v31;
          if (!v31)
            goto LABEL_69;
          get_line_bounds(v31, v55, &v54, &v53);
          if (v28 + v24 + v29 + v30 + v55[0] + v54 + v53 > v14)
          {
            v25 = CTTypesetterSuggestLineBreak(v10, v22, 1.0e10);
            v58.location = v22;
            v58.length = v25;
            v33 = CTTypesetterCreateLine(v10, v58);
            CFRelease(v27);
            v27 = v33;
            if (!v33)
              goto LABEL_69;
          }
          CFRelease(v32);
        }
      }
      if (!v21)
        goto LABEL_50;
      BoundsWithOptions = CTLineGetBoundsWithOptions(v27, 0x10uLL);
      width = BoundsWithOptions.size.width;
      v60 = CTLineGetBoundsWithOptions(v21, 0x10uLL);
      if (v60.size.width >= width)
        break;
      TruncatedLine = CTLineCreateTruncatedLine(v27, v12, truncationType, v21);
      v61 = CTLineGetBoundsWithOptions(TruncatedLine, 0x10uLL);
      if (v46)
        *v46 = width > v61.size.width;
      CFRelease(v27);
      if (!TruncatedLine)
        goto LABEL_69;
LABEL_51:
      v22 += v25;
      v36 = v51;
      if (v22 >= v15)
        v36 = 0;
      if (v36 != 1
        || (JustifiedLine = CTLineCreateJustifiedLine(TruncatedLine, 1.0, v12),
            CFRelease(TruncatedLine),
            (TruncatedLine = JustifiedLine) != 0))
      {
        get_line_bounds(TruncatedLine, v55, &v54, &v53);
        PenOffsetForFlush = 0.0;
        if (v17 != 0.0)
          PenOffsetForFlush = CTLineGetPenOffsetForFlush(TruncatedLine, v17, v12);
        v40 = v55[0] + v24;
        if (a3)
        {
          v38.n128_f64[0] = v14 - v40 + v48;
          v41 = floor(v38.n128_f64[0] + 0.5);
          if (!v47)
            v38.n128_f64[0] = v41;
          ((void (*)(CATextLayer *, void *, const __CTLine *, double, __n128))a3)(self, a4, TruncatedLine, PenOffsetForFlush + v49, v38);
        }
        v43 = v53;
        v42 = v54;
        CFRelease(TruncatedLine);
        v24 = v42 + v43 + v40;
        if (v24 < v14 && v22 < v15)
          continue;
      }
      goto LABEL_69;
    }
    if (v12 < width)
    {
      if (v46)
        *v46 = 1;
      CFRelease(v27);
      goto LABEL_69;
    }
LABEL_50:
    TruncatedLine = v27;
    goto LABEL_51;
  }
LABEL_69:
  CFRelease(v10);
  if (v21)
    CFRelease(v21);
}

- (id)string
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x212u, (const CGAffineTransform *)3, v3);
  return v3[0];
}

- (CATextLayerTruncationMode)truncationMode
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x234u, (const CGAffineTransform *)3, v3);
  return (CATextLayerTruncationMode)v3[0];
}

- (CATextLayerAlignmentMode)alignmentMode
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 7u, (const CGAffineTransform *)3, v3);
  return (CATextLayerAlignmentMode)v3[0];
}

- (__CTTypesetter)_retainTypesetter
{
  CATextLayerPrivate *state;
  CATextLayerPrivate *v5;
  CFTypeID v6;
  const __CFDictionary *v7;
  const __CFAttributedString *v8;

  state = self->_state;
  if (!state)
  {
    v5 = -[CATextLayer string](self, "string");
    state = v5;
    if (!v5)
      return state;
    v6 = CFGetTypeID(v5);
    if (v6 == CFStringGetTypeID())
    {
      v7 = -[CATextLayer _createStringDict](self, "_createStringDict");
      v8 = CFAttributedStringCreate(0, (CFStringRef)state, v7);

      self->_state = CTTypesetterCreateWithAttributedString(v8);
      CFRelease(v8);
    }
    else if (v6 == CFAttributedStringGetTypeID())
    {
      state = CTTypesetterCreateWithAttributedString(state);
      self->_state = state;
      if (!state)
        return state;
      goto LABEL_2;
    }
    state = self->_state;
    if (!state)
      return state;
  }
LABEL_2:
  CFRetain(state);
  return state;
}

- (void)_drawLine:(__CTLine *)a3 inContext:(CGContext *)a4 atPoint:(CGPoint)a5
{
  CGContextSetTextPosition(a4, a5.x, a5.y);
  CTLineDraw(a3, a4);
}

- (id)_createStringDict
{
  __CFString *v3;
  double v4;
  float v5;
  CFTypeID v6;
  void *CopyWithAttributes;
  const void *v8;
  CGColor *v9;
  id v10;
  void *v11;

  if ((-[CATextLayer _createStringDict]::initialized & 1) == 0)
  {
    -[CATextLayer _createStringDict]::NSFont_class = (uint64_t)NSClassFromString(CFSTR("NSFont"));
    -[CATextLayer _createStringDict]::initialized = 1;
  }
  v3 = -[CATextLayer font](self, "font");
  -[CATextLayer fontSize](self, "fontSize");
  if (!v3)
    return 0;
  v5 = v4;
  v6 = CFGetTypeID(v3);
  if (v6 == CGFontGetTypeID())
  {
    CopyWithAttributes = CTFontCreateWithGraphicsFont((CGFontRef)v3, v5, 0, 0);
  }
  else if (v6 == CFStringGetTypeID())
  {
    CopyWithAttributes = CTFontCreateWithName(v3, v5, 0);
  }
  else
  {
    if (v6 != CTFontGetTypeID()
      && (!-[CATextLayer _createStringDict]::NSFont_class || (objc_opt_isKindOfClass() & 1) == 0))
    {
      return 0;
    }
    if (CTFontGetSize((CTFontRef)v3) == v5)
      CopyWithAttributes = (void *)CFRetain(v3);
    else
      CopyWithAttributes = CTFontCreateCopyWithAttributes((CTFontRef)v3, v5, 0, 0);
  }
  v8 = CopyWithAttributes;
  if (CopyWithAttributes)
  {
    v9 = -[CATextLayer foregroundColor](self, "foregroundColor");
    v10 = objc_alloc(MEMORY[0x1E0C99D80]);
    v11 = (void *)objc_msgSend(v10, "initWithObjectsAndKeys:", v8, *MEMORY[0x1E0CA8188], v9, *MEMORY[0x1E0CA8550], 0);
    CFRelease(v8);
    return v11;
  }
  return 0;
}

- (CGColorRef)foregroundColor
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0xE6u, (const CGAffineTransform *)2, v3);
  return (CGColorRef)v3[0];
}

- (CFTypeRef)font
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0xE2u, (const CGAffineTransform *)2, v3);
  return v3[0];
}

- (CGFloat)fontSize
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0xE3u, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (void)_applyLinesToFunction:(void *)a3 info:(void *)a4
{
  -[CATextLayer _applyLinesToFunction:info:truncated:](self, "_applyLinesToFunction:info:truncated:", a3, a4, 0);
}

- (void)didChangeValueForKey:(id)a3
{
  uint64_t v5;
  CA::Transaction *v6;
  int v7;
  CATextLayerPrivate *state;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = CAInternAtom((const __CFString *)a3, 0);
  if ((int)v5 <= 364)
  {
    if ((int)v5 <= 225)
    {
      if ((_DWORD)v5 != 7)
      {
        if ((_DWORD)v5 != 13)
          goto LABEL_23;
        goto LABEL_16;
      }
    }
    else if ((v5 - 226) >= 2)
    {
      if ((_DWORD)v5 != 230)
        goto LABEL_23;
      goto LABEL_16;
    }
  }
  else if (((v5 - 534) > 0x3D || ((1 << (v5 - 22)) & 0x20000000C0000001) == 0)
         && (_DWORD)v5 != 530
         && (_DWORD)v5 != 365)
  {
    goto LABEL_23;
  }
  v5 = -[CATextLayer isWrapped](self, "isWrapped");
  if ((v5 & 1) == 0)
  {
    -[CALayer setSizeRequisition:](self, "setSizeRequisition:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    v5 = -[CALayer setNeedsLayout](-[CALayer superlayer](self, "superlayer"), "setNeedsLayout");
  }
LABEL_16:
  v6 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v6)
    v6 = (CA::Transaction *)CA::Transaction::create((CA::Transaction *)v5);
  v7 = *((_DWORD *)v6 + 25);
  *((_DWORD *)v6 + 25) = v7 + 1;
  if (!v7)
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  state = self->_state;
  if (state)
  {
    self->_state = 0;
    CA::Transaction::unlock(v6);
    CA::Transaction::release_object(v6, state);
  }
  else
  {
    CA::Transaction::unlock(v6);
  }
LABEL_23:
  v9.receiver = self;
  v9.super_class = (Class)CATextLayer;
  -[CATextLayer didChangeValueForKey:](&v9, sel_didChangeValueForKey_, a3);
}

- (BOOL)isWrapped
{
  char v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x253u, (const CGAffineTransform *)7, (id *)&v3);
  return v3 != 0;
}

+ (BOOL)CA_automaticallyNotifiesObservers:(Class)a3
{
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((Class)objc_opt_class() == a3)
    return 0;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CATextLayer;
  return objc_msgSendSuper2(&v6, sel_CA_automaticallyNotifiesObservers_, a3);
}

- (void)setAlignmentMode:(CATextLayerAlignmentMode)alignmentMode
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3[0] = alignmentMode;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)7, (const CGAffineTransform *)3, v3);
}

- (void)setFont:(CFTypeRef)font
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3[0] = font;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0xE2, (const CGAffineTransform *)2, v3);
}

- (CATextLayer)init
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)CATextLayer;
  return -[CALayer init](&v3, sel_init);
}

- (void)setWrapped:(BOOL)wrapped
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = wrapped;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x253, (const CGAffineTransform *)7, (double *)&v3);
}

- (void)setTruncationMode:(CATextLayerTruncationMode)truncationMode
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3[0] = truncationMode;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x234, (const CGAffineTransform *)3, v3);
}

- (void)_prepareContext:(CGContext *)a3
{
  CGContextSetShouldSmoothFonts(a3, 0);
  CGContextSetAllowsFontSubpixelQuantization(a3, -[CATextLayer allowsFontSubpixelQuantization](self, "allowsFontSubpixelQuantization"));
}

- (BOOL)allowsFontSubpixelQuantization
{
  char v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0xDu, (const CGAffineTransform *)7, (id *)&v3);
  return v3 != 0;
}

- (void)setForegroundColor:(CGColorRef)foregroundColor
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3[0] = foregroundColor;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0xE6, (const CGAffineTransform *)2, v3);
}

- (void)setFontSize:(CGFloat)fontSize
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  v3[0] = fontSize;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0xE3, (const CGAffineTransform *)0x12, v3);
}

- (void)setString:(id)string
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3[0] = string;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x212, (const CGAffineTransform *)3, v3);
}

- (void)dealloc
{
  CATextLayerPrivate *state;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  state = self->_state;
  if (state)
    CFRelease(state);
  v4.receiver = self;
  v4.super_class = (Class)CATextLayer;
  -[CALayer dealloc](&v4, sel_dealloc);
}

- (id)implicitAnimationForKeyPath:(id)a3
{
  id result;
  unsigned int v6;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)CATextLayer;
  result = -[CALayer implicitAnimationForKeyPath:](&v7, sel_implicitAnimationForKeyPath_);
  if (!result)
  {
    v6 = CAInternAtom((const __CFString *)a3, 0);
    if (v6 == 230 || v6 == 227)
      return CALayerCreateImplicitAnimation((CAMediaTimingFunction *)self, a3, v6);
    else
      return 0;
  }
  return result;
}

- (BOOL)CA_validateValue:(id)a3 forKey:(id)a4
{
  CFTypeID v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a3 && objc_msgSend(a4, "isEqualToString:", CFSTR("font")))
  {
    v7 = CFGetTypeID(a3);
    return v7 == CGFontGetTypeID() || v7 == CFStringGetTypeID() || v7 == CTFontGetTypeID();
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CATextLayer;
    return -[CALayer CA_validateValue:forKey:](&v9, sel_CA_validateValue_forKey_, a3, a4);
  }
}

- (__CTLine)_createTruncationToken
{
  const __CFAttributedString *v3;
  const __CFAttributedString *v4;
  CFTypeID v5;
  const __CFDictionary *v6;
  const __CFAttributedString *v7;
  const __CTTypesetter *v8;
  __CTLine *Line;
  CFRange v11;

  v3 = -[CATextLayer truncationString](self, "truncationString");
  if (!v3)
    return 0;
  v4 = v3;
  v5 = CFGetTypeID(v3);
  if (v5 != CFStringGetTypeID())
  {
    if (v5 != CFAttributedStringGetTypeID())
      return 0;
    v8 = CTTypesetterCreateWithAttributedString(v4);
    if (!v8)
      return 0;
LABEL_7:
    v11.location = 0;
    v11.length = 0;
    Line = CTTypesetterCreateLine(v8, v11);
    CFRelease(v8);
    return Line;
  }
  v6 = -[CATextLayer _createStringDict](self, "_createStringDict");
  v7 = CFAttributedStringCreate(0, (CFStringRef)v4, v6);

  v8 = CTTypesetterCreateWithAttributedString(v7);
  CFRelease(v7);
  if (v8)
    goto LABEL_7;
  return 0;
}

- (CGSize)_preferredSize
{
  _BOOL8 v3;
  double v4;
  double v5;
  double v6;
  CA::Transaction *v7;
  int v8;
  __CTTypesetter *v9;
  uint64_t v10;
  CFIndex v11;
  CFIndex v12;
  const __CTLine *Line;
  const __CTLine *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23[2];
  CFRange v24;
  CGSize result;

  v23[1] = *(double *)MEMORY[0x1E0C80C00];
  v3 = -[CATextLayer isWrapped](self, "isWrapped");
  if (v3)
  {
    -[CATextLayer fontSize](self, "fontSize");
    v5 = v4;
    v6 = 1.0;
  }
  else
  {
    v6 = *MEMORY[0x1E0C9D820];
    v5 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v7 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
    if (!v7)
      v7 = (CA::Transaction *)CA::Transaction::create((CA::Transaction *)v3);
    v8 = *((_DWORD *)v7 + 25);
    *((_DWORD *)v7 + 25) = v8 + 1;
    if (!v8)
      os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
    v9 = -[CATextLayer _retainTypesetter](self, "_retainTypesetter");
    v10 = objc_msgSend(-[CATextLayer string](self, "string"), "length");
    CA::Transaction::unlock(v7);
    if (v9)
    {
      v11 = 0;
      v22 = 0.0;
      v23[0] = 0.0;
      v21 = 0.0;
      do
      {
        v12 = CTTypesetterSuggestLineBreak(v9, v11, 1.0e10);
        v24.location = v11;
        v24.length = v12;
        Line = CTTypesetterCreateLine(v9, v24);
        v14 = Line;
        if (Line)
        {
          v15 = get_line_bounds(Line, v23, &v22, &v21) + 1.0;
          if (v6 <= v15)
            v6 = v15;
          v16 = v21;
          v17 = v22;
          v18 = v23[0];
          CFRelease(v14);
          v5 = v16 + v5 + v17 + v18;
        }
        v11 += v12;
      }
      while (v11 < v10);
      CFRelease(v9);
    }
  }
  v19 = v6;
  v20 = v5;
  result.height = v20;
  result.width = v19;
  return result;
}

- (BOOL)isTruncated
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  -[CATextLayer _applyLinesToFunction:info:truncated:](self, "_applyLinesToFunction:info:truncated:", 0, 0, &v3);
  return v3;
}

- (void)setAllowsFontSubpixelQuantization:(BOOL)allowsFontSubpixelQuantization
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = allowsFontSubpixelQuantization;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0xD, (const CGAffineTransform *)7, (double *)&v3);
}

- (id)truncationString
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x235u, (const CGAffineTransform *)3, v3);
  return v3[0];
}

- (void)setTruncationString:(id)a3
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x235, (const CGAffineTransform *)3, v3);
}

@end
