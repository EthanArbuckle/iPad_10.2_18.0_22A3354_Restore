@implementation CAShapeLayer

- (void)didChangeValueForKey:(id)a3
{
  int v5;
  CA::Transaction *v6;
  CA::Transaction *v7;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = CAInternAtom((const __CFString *)a3, 0);
  v6 = (CA::Transaction *)CAAtomIndexInArray(12, (uint64_t)&-[CAShapeLayer didChangeValueForKey:]::atoms, v5);
  if (v6 != (CA::Transaction *)-1)
  {
    v7 = CA::Transaction::ensure_compat(v6);
    CA::Layer::set_commit_needed((CA::Layer *)self->super._attr.layer, v7, 0x10000);
  }
  v8.receiver = self;
  v8.super_class = (Class)CAShapeLayer;
  -[CAShapeLayer didChangeValueForKey:](&v8, sel_didChangeValueForKey_, a3);
}

+ (id)defaultValueForKey:(id)a3
{
  int v5;
  id result;
  void *v7;
  uint64_t v8;
  CGColorSpace *v9;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = CAInternAtom((const __CFString *)a3, 0);
  if (v5 > 347)
  {
    if (v5 <= 382)
    {
      if (v5 == 348)
        return CFSTR("miter");
      if (v5 != 349)
        goto LABEL_18;
      goto LABEL_12;
    }
    if (v5 == 383)
    {
      v7 = (void *)MEMORY[0x1E0CB37E8];
      v8 = 10;
      return (id)objc_msgSend(v7, "numberWithInt:", v8);
    }
    if (v5 == 532)
    {
LABEL_12:
      v7 = (void *)MEMORY[0x1E0CB37E8];
      v8 = 1;
      return (id)objc_msgSend(v7, "numberWithInt:", v8);
    }
LABEL_18:
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_METACLASS___CAShapeLayer;
    return objc_msgSendSuper2(&v10, sel_defaultValueForKey_, a3);
  }
  switch(v5)
  {
    case 218:
      result = (id)+[CAShapeLayer defaultValueForKey:]::black;
      if (!+[CAShapeLayer defaultValueForKey:]::black)
      {
        v9 = (CGColorSpace *)CAGetColorSpace(0x1Du);
        result = CGColorCreate(v9, +[CAShapeLayer defaultValueForKey:]::values);
        +[CAShapeLayer defaultValueForKey:]::black = (uint64_t)result;
      }
      break;
    case 220:
      return CFSTR("non-zero");
    case 345:
      return CFSTR("butt");
    default:
      goto LABEL_18;
  }
  return result;
}

- (void)setLineWidth:(CGFloat)lineWidth
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  v3[0] = lineWidth;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x15D, (const CGAffineTransform *)0x12, v3);
}

- (void)setLineCap:(CAShapeLayerLineCap)lineCap
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3[0] = lineCap;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x159, (const CGAffineTransform *)3, v3);
}

- (void)setLineJoin:(CAShapeLayerLineJoin)lineJoin
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3[0] = lineJoin;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x15C, (const CGAffineTransform *)3, v3);
}

- (void)setPath:(CGPathRef)path
{
  const CGPath *v5;
  double v6[2];

  v6[1] = *(double *)MEMORY[0x1E0C80C00];
  if ((dyld_program_sdk_at_least() & 1) != 0)
  {
    v5 = (const CGPath *)MEMORY[0x186DBC640](path);
    *(_QWORD *)&v6[0] = v5;
    CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x19E, (const CGAffineTransform *)2, v6);
    CGPathRelease(v5);
  }
  else
  {
    *(_QWORD *)&v6[0] = path;
    CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x19E, (const CGAffineTransform *)2, v6);
  }
}

- (void)setStrokeColor:(CGColorRef)strokeColor
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3[0] = strokeColor;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x213, (const CGAffineTransform *)2, v3);
}

- (void)_renderForegroundInContext:(CGContext *)a3
{
  CA::Transaction *v5;
  CA::Transaction *v6;
  int v7;
  const CGPath *v8;
  CGColor *v9;
  CGColor *v10;
  CGPathDrawingMode v11;
  CGColor *v12;
  CGColor *v13;
  CGLineCap v14;
  CGLineJoin v15;
  double v16;
  CGFloat v17;
  NSArray *v18;
  NSArray *v19;
  size_t v20;
  size_t v21;
  char *v22;
  uint64_t i;
  uint64_t v24;
  CGFloat v25;
  double v26;
  double v27;
  const CGPath *v28;
  double v29;
  double v30;
  double v31;
  const CGPath *v32;
  int v33;
  CA::Render::Path *v34;
  unsigned int *v35;
  double *v36;
  unsigned int *v37;
  const CGPath *v38;
  unsigned int *v39;
  unsigned int v40;
  unsigned int v41;
  unsigned int *v42;
  unsigned int v43;
  unsigned int v44;
  uint64_t v45;
  objc_super v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v46.receiver = self;
  v46.super_class = (Class)CAShapeLayer;
  v5 = (CA::Transaction *)-[CALayer _renderForegroundInContext:](&v46, sel__renderForegroundInContext_);
  v6 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v6)
    v6 = (CA::Transaction *)CA::Transaction::create(v5);
  v7 = *((_DWORD *)v6 + 25);
  *((_DWORD *)v6 + 25) = v7 + 1;
  if (!v7)
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  v8 = -[CAShapeLayer path](self, "path");
  if (v8)
  {
    v9 = -[CAShapeLayer fillColor](self, "fillColor");
    v10 = v9;
    if (v9 && CGColorGetAlpha(v9) > 0.0)
    {
      v11 = -[NSString isEqualToString:](-[CAShapeLayer fillRule](self, "fillRule"), "isEqualToString:", CFSTR("even-odd"));
      CGContextSetFillColorWithColor(a3, v10);
      CGContextAddPath(a3, v8);
      CGContextDrawPath(a3, v11);
    }
    v12 = -[CAShapeLayer strokeColor](self, "strokeColor");
    v13 = v12;
    if (v12)
    {
      if (CGColorGetAlpha(v12) > 0.0)
      {
        if (-[NSString isEqualToString:](-[CAShapeLayer lineCap](self, "lineCap"), "isEqualToString:", CFSTR("round")))
        {
          v14 = kCGLineCapRound;
        }
        else if (-[NSString isEqualToString:](-[CAShapeLayer lineCap](self, "lineCap"), "isEqualToString:", CFSTR("square")))
        {
          v14 = kCGLineCapSquare;
        }
        else
        {
          v14 = kCGLineCapButt;
        }
        if (-[NSString isEqualToString:](-[CAShapeLayer lineJoin](self, "lineJoin"), "isEqualToString:", CFSTR("round")))
        {
          v15 = kCGLineJoinRound;
        }
        else if (-[NSString isEqualToString:](-[CAShapeLayer lineJoin](self, "lineJoin"), "isEqualToString:", CFSTR("bevel")))
        {
          v15 = kCGLineJoinBevel;
        }
        else
        {
          v15 = kCGLineJoinMiter;
        }
        -[CAShapeLayer lineWidth](self, "lineWidth");
        if (v16 < 0.0)
          v16 = *MEMORY[0x1E0C9DB10];
        CGContextSetLineWidth(a3, v16);
        CGContextSetLineCap(a3, v14);
        CGContextSetLineJoin(a3, v15);
        -[CAShapeLayer miterLimit](self, "miterLimit");
        CGContextSetMiterLimit(a3, v17);
        v18 = -[CAShapeLayer lineDashPattern](self, "lineDashPattern");
        v19 = v18;
        if (v18)
        {
          v20 = -[NSArray count](v18, "count");
          MEMORY[0x1E0C80A78](v20);
          v22 = (char *)&v45 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
          bzero(v22, v21);
          if (v20)
          {
            for (i = 0; i != v20; ++i)
            {
              objc_msgSend(-[NSArray objectAtIndex:](v19, "objectAtIndex:", i), "doubleValue");
              *(_QWORD *)&v22[8 * i] = v24;
            }
          }
          -[CAShapeLayer lineDashPhase](self, "lineDashPhase");
          CGContextSetLineDash(a3, v25, (const CGFloat *)v22, v20);
        }
        CGContextSetStrokeColorWithColor(a3, v13);
        -[CAShapeLayer strokeStart](self, "strokeStart");
        v27 = v26;
        -[CAShapeLayer strokeEnd](self, "strokeEnd");
        v29 = fmax(v27, 0.0);
        v31 = fmin(v30, 1.0);
        if (v29 == 0.0 && v31 == 1.0)
        {
          v32 = (const CGPath *)MEMORY[0x186DBC640](v8);
        }
        else
        {
          if (v29 >= v31)
            goto LABEL_41;
          v34 = (CA::Render::Path *)CA::Render::Path::new_path(v8, v28);
          if (!v34)
            goto LABEL_41;
          v35 = (unsigned int *)v34;
          v36 = CA::Render::Path::copy_subpath(v34, v29, v31);
          if (v36)
          {
            v37 = (unsigned int *)v36;
            v38 = (const CGPath *)CA::Render::Path::cg_path((CA::Render::Path *)v36);
            v32 = CGPathRetain(v38);
            v39 = v37 + 2;
            do
            {
              v40 = __ldaxr(v39);
              v41 = v40 - 1;
            }
            while (__stlxr(v41, v39));
            if (!v41)
              (*(void (**)(unsigned int *))(*(_QWORD *)v37 + 16))(v37);
          }
          else
          {
            v32 = 0;
          }
          v42 = v35 + 2;
          do
          {
            v43 = __ldaxr(v42);
            v44 = v43 - 1;
          }
          while (__stlxr(v44, v42));
          if (!v44)
            (*(void (**)(unsigned int *))(*(_QWORD *)v35 + 16))(v35);
        }
        if (v32)
        {
          CA::Transaction::unlock(v6);
          CGContextAddPath(a3, v32);
          CGContextDrawPath(a3, kCGPathStroke);
          CGPathRelease(v32);
          v33 = *((_DWORD *)v6 + 25);
          *((_DWORD *)v6 + 25) = v33 + 1;
          if (!v33)
            os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
        }
      }
    }
  }
LABEL_41:
  CA::Transaction::unlock(v6);
}

- (void)_copyRenderLayer:(void *)a3 layerFlags:(unsigned int)a4 commitFlags:(unsigned int *)a5
{
  unsigned int *v8;
  malloc_zone_t *malloc_zone;
  _DWORD *v10;
  _DWORD *v11;
  unsigned int *v12;
  const CGPath *v18;
  const CGPath *v19;
  CA::Render::Path *v20;
  unsigned int *v21;
  unsigned int *v22;
  unsigned int v23;
  unsigned int v24;
  CGColor *v25;
  CGColor *v26;
  CA::Render::Pattern **v27;
  unsigned int *v28;
  unsigned int *v29;
  unsigned int *v30;
  unsigned int v31;
  unsigned int v32;
  unsigned int *v33;
  unsigned int v34;
  unsigned int *v35;
  unsigned int v36;
  unsigned int v37;
  __CFString *v38;
  CGColor *v39;
  CA::Render::Pattern **v40;
  unsigned int *v41;
  unsigned int *v42;
  unsigned int *v43;
  unsigned int v44;
  unsigned int v45;
  unsigned int *v46;
  unsigned int v47;
  unsigned int *v48;
  unsigned int v49;
  unsigned int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  __CFString *v55;
  __CFString *v56;
  int v57;
  __CFString *v58;
  __CFString *v59;
  int v60;
  uint64_t v61;
  NSArray *v62;
  NSArray *v63;
  uint64_t v64;
  CA::Render::Vector *v65;
  size_t v66;
  char *v67;
  CA::Render::Vector *i;
  const double *v69;
  uint64_t v70;
  unsigned int *v71;
  unsigned int *v72;
  unsigned int *v73;
  unsigned int v74;
  unsigned int v75;
  unsigned int *v76;
  unsigned int v77;
  unsigned int *v78;
  unsigned int v79;
  unsigned int *v80;
  unsigned int v81;
  unsigned int v82;
  unsigned int v83;
  unsigned int v84;
  unsigned int v86;
  unsigned int v87;
  uint64_t v88;
  unsigned int *v89;
  objc_super v90;
  float32x4_t v91;
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v90.receiver = self;
  v90.super_class = (Class)CAShapeLayer;
  v8 = -[CALayer _copyRenderLayer:layerFlags:commitFlags:](&v90, sel__copyRenderLayer_layerFlags_commitFlags_, a3, *(_QWORD *)&a4);
  if (v8)
  {
    if ((*((_BYTE *)a5 + 2) & 1) != 0)
    {
      malloc_zone = (malloc_zone_t *)get_malloc_zone();
      v10 = malloc_type_zone_calloc(malloc_zone, 1uLL, 0x98uLL, 0x743898A5uLL);
      if (v10)
      {
        v11 = v10;
        v10[2] = 1;
        v12 = v10 + 2;
        v10[3] = 46;
        ++dword_1ECDC7CE0;
        *(_QWORD *)v10 = off_1E1596258;
        *((_OWORD *)v10 + 1) = 0u;
        *((_OWORD *)v10 + 2) = 0u;
        *((_OWORD *)v10 + 3) = 0u;
        *((_OWORD *)v10 + 4) = 0u;
        __asm { FMOV            V0.2D, #1.0 }
        *((_OWORD *)v10 + 5) = _Q0;
        *((_QWORD *)v10 + 13) = 0;
        *((_QWORD *)v10 + 14) = 0;
        *((_QWORD *)v10 + 12) = 0x4024000000000000;
        v10[30] = *((unsigned __int8 *)v10 + 123) << 24;
        *((_QWORD *)v10 + 16) = 0;
        *((_QWORD *)v10 + 17) = 0;
        *((_QWORD *)v10 + 18) = 0x3FF0000000000000;
        v18 = -[CAShapeLayer path](self, "path");
        if (v18)
        {
          v20 = (CA::Render::Path *)CA::Render::Path::new_path(v18, v19);
          if (v20)
          {
            v21 = (unsigned int *)v20;
            CA::Render::ShapeLayer::set_path((CA::Render::ShapeLayer *)v11, v20);
            v22 = v21 + 2;
            do
            {
              v23 = __ldaxr(v22);
              v24 = v23 - 1;
            }
            while (__stlxr(v24, v22));
            if (!v24)
              (*(void (**)(unsigned int *))(*(_QWORD *)v21 + 16))(v21);
          }
        }
        v25 = (CGColor *)CA::Context::current_colorspace((CA::Context *)a3, v19);
        v26 = -[CAShapeLayer fillColor](self, "fillColor");
        if (v26)
        {
          v89 = 0;
          v91 = 0uLL;
          CA::Render::convert_cgcolor_to_float(v26, v25, (CGColorSpace *)&v91, (float *)&v89, v27);
          if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vcgtq_f32((float32x4_t)vdupq_n_s32(0x3A800000u), vabsq_f32(v91))))) & 1) != 0)*(float32x4_t *)(v11 + 6) = v91;
          v28 = v89;
          if (v89)
          {
            v29 = (unsigned int *)*((_QWORD *)v11 + 5);
            if (v29 != v89)
            {
              if (v29)
              {
                v30 = v29 + 2;
                do
                {
                  v31 = __ldaxr(v30);
                  v32 = v31 - 1;
                }
                while (__stlxr(v32, v30));
                if (!v32)
                  (*(void (**)(unsigned int *))(*(_QWORD *)v29 + 16))(v29);
              }
              v33 = v28 + 2;
              do
                v34 = __ldaxr(v33);
              while (__stlxr(v34 + 1, v33));
              if (!v34)
              {
                v28 = 0;
                do
                  v86 = __ldaxr(v33);
                while (__stlxr(v86 - 1, v33));
              }
              *((_QWORD *)v11 + 5) = v28;
              v28 = v89;
            }
            v35 = v28 + 2;
            do
            {
              v36 = __ldaxr(v35);
              v37 = v36 - 1;
            }
            while (__stlxr(v37, v35));
            if (!v37)
              (*(void (**)(unsigned int *))(*(_QWORD *)v28 + 16))(v28);
          }
        }
        v38 = -[CAShapeLayer fillRule](self, "fillRule");
        if (v38 && v38 != CFSTR("non-zero"))
          *((_BYTE *)v11 + 120) = -[__CFString isEqualToString:](v38, "isEqualToString:", CFSTR("even-odd"));
        v39 = -[CAShapeLayer strokeColor](self, "strokeColor");
        if (v39)
        {
          v89 = 0;
          v91 = 0uLL;
          CA::Render::convert_cgcolor_to_float(v39, v25, (CGColorSpace *)&v91, (float *)&v89, v40);
          if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vcgtq_f32((float32x4_t)vdupq_n_s32(0x3A800000u), vabsq_f32(v91))))) & 1) != 0)*((float32x4_t *)v11 + 3) = v91;
          v41 = v89;
          if (v89)
          {
            v42 = (unsigned int *)*((_QWORD *)v11 + 8);
            if (v42 != v89)
            {
              if (v42)
              {
                v43 = v42 + 2;
                do
                {
                  v44 = __ldaxr(v43);
                  v45 = v44 - 1;
                }
                while (__stlxr(v45, v43));
                if (!v45)
                  (*(void (**)(unsigned int *))(*(_QWORD *)v42 + 16))(v42);
              }
              v46 = v41 + 2;
              do
                v47 = __ldaxr(v46);
              while (__stlxr(v47 + 1, v46));
              if (!v47)
              {
                v41 = 0;
                do
                  v87 = __ldaxr(v46);
                while (__stlxr(v87 - 1, v46));
              }
              *((_QWORD *)v11 + 8) = v41;
              v41 = v89;
            }
            v48 = v41 + 2;
            do
            {
              v49 = __ldaxr(v48);
              v50 = v49 - 1;
            }
            while (__stlxr(v50, v48));
            if (!v50)
              (*(void (**)(unsigned int *))(*(_QWORD *)v41 + 16))(v41);
          }
        }
        -[CAShapeLayer strokeStart](self, "strokeStart");
        *((_QWORD *)v11 + 9) = v51;
        CA::Render::ShapeLayer::invalidate_stroke_path((CA::Render::ShapeLayer *)v11);
        -[CAShapeLayer strokeEnd](self, "strokeEnd");
        *((_QWORD *)v11 + 10) = v52;
        CA::Render::ShapeLayer::invalidate_stroke_path((CA::Render::ShapeLayer *)v11);
        -[CAShapeLayer lineWidth](self, "lineWidth");
        *((_QWORD *)v11 + 11) = v53;
        CA::Render::ShapeLayer::invalidate_stroke_path((CA::Render::ShapeLayer *)v11);
        -[CAShapeLayer miterLimit](self, "miterLimit");
        *((_QWORD *)v11 + 12) = v54;
        CA::Render::ShapeLayer::invalidate_stroke_path((CA::Render::ShapeLayer *)v11);
        v55 = -[CAShapeLayer lineJoin](self, "lineJoin");
        if (v55)
        {
          v56 = v55;
          if (v55 != CFSTR("miter"))
          {
            if ((-[__CFString isEqualToString:](v55, "isEqualToString:", CFSTR("round")) & 1) != 0)
            {
              v57 = 256;
            }
            else if (-[__CFString isEqualToString:](v56, "isEqualToString:", CFSTR("bevel")))
            {
              v57 = 512;
            }
            else
            {
              v57 = 0;
            }
            v11[30] = v11[30] & 0xFFFF00FF | v57;
            CA::Render::ShapeLayer::invalidate_stroke_path((CA::Render::ShapeLayer *)v11);
          }
        }
        v58 = -[CAShapeLayer lineCap](self, "lineCap");
        if (v58)
        {
          v59 = v58;
          if (v58 != CFSTR("butt"))
          {
            if ((-[__CFString isEqualToString:](v58, "isEqualToString:", CFSTR("round")) & 1) != 0)
            {
              v60 = 0x10000;
            }
            else if (-[__CFString isEqualToString:](v59, "isEqualToString:", CFSTR("square")))
            {
              v60 = 0x20000;
            }
            else
            {
              v60 = 0;
            }
            v11[30] = v11[30] & 0xFF00FFFF | v60;
            CA::Render::ShapeLayer::invalidate_stroke_path((CA::Render::ShapeLayer *)v11);
          }
        }
        -[CAShapeLayer lineDashPhase](self, "lineDashPhase");
        *((_QWORD *)v11 + 13) = v61;
        CA::Render::ShapeLayer::invalidate_stroke_path((CA::Render::ShapeLayer *)v11);
        v62 = -[CAShapeLayer lineDashPattern](self, "lineDashPattern");
        if (v62)
        {
          v63 = v62;
          v64 = -[NSArray count](v62, "count");
          if (v64)
          {
            v65 = (CA::Render::Vector *)v64;
            v66 = 8 * v64;
            if ((unint64_t)(8 * v64) > 0x1000)
            {
              v67 = (char *)malloc_type_malloc(8 * v64, 0x9AB4338EuLL);
            }
            else
            {
              MEMORY[0x1E0C80A78](v64);
              v67 = (char *)&v88 - ((v66 + 15) & 0xFFFFFFFFFFFFFFF0);
              bzero(v67, v66);
            }
            for (i = 0; i != v65; i = (CA::Render::Vector *)((char *)i + 1))
            {
              objc_msgSend(-[NSArray objectAtIndex:](v63, "objectAtIndex:", i), "doubleValue");
              *(_QWORD *)&v67[8 * (_QWORD)i] = v70;
            }
            v71 = CA::Render::Vector::new_vector(v65, v67, v69);
            v72 = (unsigned int *)*((_QWORD *)v11 + 14);
            if (v72 != v71)
            {
              if (v72)
              {
                v73 = v72 + 2;
                do
                {
                  v74 = __ldaxr(v73);
                  v75 = v74 - 1;
                }
                while (__stlxr(v75, v73));
                if (!v75)
                  (*(void (**)(unsigned int *))(*(_QWORD *)v72 + 16))(v72);
              }
              if (v71)
              {
                v76 = v71 + 2;
                do
                  v77 = __ldaxr(v76);
                while (__stlxr(v77 + 1, v76));
                v78 = v71;
                if (!v77)
                {
                  v78 = 0;
                  do
                    v79 = __ldaxr(v76);
                  while (__stlxr(v79 - 1, v76));
                }
              }
              else
              {
                v78 = 0;
              }
              *((_QWORD *)v11 + 14) = v78;
            }
            if (v71)
            {
              v80 = v71 + 2;
              do
              {
                v81 = __ldaxr(v80);
                v82 = v81 - 1;
              }
              while (__stlxr(v82, v80));
              if (!v82)
                (*(void (**)(unsigned int *))(*(_QWORD *)v71 + 16))(v71);
            }
            if (v66 > 0x1000)
              free(v67);
          }
        }
        CA::Render::Layer::set_subclass(v8, (CA::Render::LayerSubclass *)v11);
        do
        {
          v83 = __ldaxr(v12);
          v84 = v83 - 1;
        }
        while (__stlxr(v84, v12));
        if (!v84)
          (*(void (**)(_DWORD *))(*(_QWORD *)v11 + 16))(v11);
      }
    }
  }
  return v8;
}

- (CGPathRef)path
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x19Eu, (const CGAffineTransform *)2, v3);
  return (CGPathRef)v3[0];
}

- (CGColorRef)fillColor
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0xDAu, (const CGAffineTransform *)2, v3);
  return (CGColorRef)v3[0];
}

- (CGFloat)lineWidth
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x15Du, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (CGColorRef)strokeColor
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x213u, (const CGAffineTransform *)2, v3);
  return (CGColorRef)v3[0];
}

- (CAShapeLayerFillRule)fillRule
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0xDCu, (const CGAffineTransform *)3, v3);
  return (CAShapeLayerFillRule)v3[0];
}

- (CGFloat)strokeStart
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x215u, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (CGFloat)strokeEnd
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x214u, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (CGFloat)miterLimit
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x17Fu, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (CAShapeLayerLineJoin)lineJoin
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x15Cu, (const CGAffineTransform *)3, v3);
  return (CAShapeLayerLineJoin)v3[0];
}

- (CGFloat)lineDashPhase
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x15Bu, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (NSArray)lineDashPattern
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x15Au, (const CGAffineTransform *)3, v3);
  return (NSArray *)v3[0];
}

- (CAShapeLayerLineCap)lineCap
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x159u, (const CGAffineTransform *)3, v3);
  return (CAShapeLayerLineCap)v3[0];
}

- (BOOL)_renderLayerDefinesProperty:(unsigned int)a3
{
  uint64_t v3;
  objc_super v6;
  uint64_t v7;

  v3 = *(_QWORD *)&a3;
  v7 = *MEMORY[0x1E0C80C00];
  if (CAAtomIndexInArray(12, (uint64_t)&defines_property::atoms, a3) != -1)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)CAShapeLayer;
  return -[CALayer _renderLayerDefinesProperty:](&v6, sel__renderLayerDefinesProperty_, v3);
}

- (unsigned)_renderLayerPropertyAnimationFlags:(unsigned int)a3
{
  uint64_t v3;
  objc_super v6;
  uint64_t v7;

  v3 = *(_QWORD *)&a3;
  v7 = *MEMORY[0x1E0C80C00];
  if (CAAtomIndexInArray(12, (uint64_t)&defines_property::atoms, a3) != -1)
    return 32;
  v6.receiver = self;
  v6.super_class = (Class)CAShapeLayer;
  return -[CALayer _renderLayerPropertyAnimationFlags:](&v6, sel__renderLayerPropertyAnimationFlags_, v3);
}

+ (BOOL)_hasRenderLayerSubclass
{
  return 1;
}

- (id)implicitAnimationForKeyPath:(id)a3
{
  id result;
  uint64_t v6;
  unsigned int v7;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)CAShapeLayer;
  result = -[CALayer implicitAnimationForKeyPath:](&v8, sel_implicitAnimationForKeyPath_);
  if (!result)
  {
    objc_msgSend(a3, "rangeOfString:", CFSTR("."));
    if (!v6
      && ((v7 = CAInternAtom((const __CFString *)a3, 0), v7 - 347 <= 0x24)
       && ((1 << (v7 - 91)) & 0x1000000005) != 0
       || v7 - 531 < 3
       || v7 == 218))
    {
      return CALayerCreateImplicitAnimation((CAMediaTimingFunction *)self, a3, v7);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)setFillColor:(CGColorRef)fillColor
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3[0] = fillColor;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0xDA, (const CGAffineTransform *)2, v3);
}

- (void)setFillRule:(CAShapeLayerFillRule)fillRule
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3[0] = fillRule;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0xDC, (const CGAffineTransform *)3, v3);
}

- (void)setStrokeEnd:(CGFloat)strokeEnd
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  v3[0] = strokeEnd;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x214, (const CGAffineTransform *)0x12, v3);
}

+ (BOOL)CA_automaticallyNotifiesObservers:(Class)a3
{
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((Class)objc_opt_class() == a3)
    return 0;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CAShapeLayer;
  return objc_msgSendSuper2(&v6, sel_CA_automaticallyNotifiesObservers_, a3);
}

- (void)setStrokeStart:(CGFloat)strokeStart
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  v3[0] = strokeStart;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x215, (const CGAffineTransform *)0x12, v3);
}

- (void)setLineDashPattern:(NSArray *)lineDashPattern
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3[0] = lineDashPattern;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x15A, (const CGAffineTransform *)3, v3);
}

- (void)setLineDashPhase:(CGFloat)lineDashPhase
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  v3[0] = lineDashPhase;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x15B, (const CGAffineTransform *)0x12, v3);
}

- (void)_colorSpaceDidChange
{
  CA::Transaction *v3;
  CA::Transaction *v4;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)CAShapeLayer;
  v3 = (CA::Transaction *)-[CALayer _colorSpaceDidChange](&v5, sel__colorSpaceDidChange);
  v4 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v4)
    v4 = (CA::Transaction *)CA::Transaction::create(v3);
  CA::Layer::set_commit_needed((CA::Layer *)self->super._attr.layer, v4, 0x10000);
}

- (void)setMiterLimit:(CGFloat)miterLimit
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  v3[0] = miterLimit;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x17F, (const CGAffineTransform *)0x12, v3);
}

@end
