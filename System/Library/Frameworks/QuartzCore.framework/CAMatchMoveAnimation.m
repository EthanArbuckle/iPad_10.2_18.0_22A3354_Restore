@implementation CAMatchMoveAnimation

- (unsigned)_propertyFlagsForLayer:(id)a3
{
  return animation_property_flags((__CFString *)-[CAMatchMoveAnimation keyPath](self, "keyPath"), (CALayer *)a3);
}

- (void)_copyRenderAnimationForLayer:(id)a3
{
  malloc_zone_t *malloc_zone;
  char *v6;
  char *v7;
  unsigned int *v8;
  unsigned int v9;

  malloc_zone = (malloc_zone_t *)get_malloc_zone();
  v6 = (char *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0x90uLL, 0x743898A5uLL);
  v7 = v6;
  if (v6)
  {
    *((_DWORD *)v6 + 2) = 1;
    v8 = (unsigned int *)(v6 + 8);
    *(_OWORD *)(v6 + 40) = 0u;
    *(_OWORD *)(v6 + 56) = 0u;
    *((_QWORD *)v6 + 9) = 0;
    *((_QWORD *)v6 + 2) = 0;
    *((_QWORD *)v6 + 3) = 0;
    *((_DWORD *)v6 + 8) = 0;
    *((_QWORD *)v6 + 13) = 0;
    *((_QWORD *)v6 + 16) = 0;
    *((_QWORD *)v6 + 17) = 0;
    *((_QWORD *)v6 + 15) = 0;
    *((_DWORD *)v6 + 3) = 31;
    ++dword_1ECDC7CA4;
    *(_QWORD *)v6 = off_1E1598098;
    if (!-[CAMatchMoveAnimation _setCARenderAnimation:layer:](self, "_setCARenderAnimation:layer:", v6, a3))
    {
      do
        v9 = __ldaxr(v8);
      while (__stlxr(v9 - 1, v8));
      if (v9 == 1)
        (*(void (**)(char *))(*(_QWORD *)v7 + 16))(v7);
      return 0;
    }
  }
  else
  {
    -[CAMatchMoveAnimation _setCARenderAnimation:layer:](self, "_setCARenderAnimation:layer:", 0, a3);
  }
  return v7;
}

- (BOOL)_setCARenderAnimation:(void *)a3 layer:(id)a4
{
  _BOOL4 v7;
  const __CFString *v8;
  const __CFString *v9;
  void **v10;
  unint64_t v11;
  unint64_t v12;
  int v13;
  int v14;
  CALayer *v15;
  CALayer *v16;
  unsigned int v17;
  unint64_t v18;
  int v19;
  NSArray *v20;
  unsigned int *v21;
  unsigned int *v22;
  unsigned int *v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int *v26;
  unsigned int v27;
  unsigned int *v28;
  unsigned int v29;
  unsigned int *v30;
  unsigned int v31;
  unsigned int v32;
  _BOOL4 v33;
  _BOOL4 v34;
  _BOOL4 v35;
  _BOOL4 v36;
  _BOOL4 v37;
  _BOOL4 v38;
  int v39;
  unint64_t v41;
  objc_super v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v42.receiver = self;
  v42.super_class = (Class)CAMatchMoveAnimation;
  v7 = -[CAAnimation _setCARenderAnimation:layer:](&v42, sel__setCARenderAnimation_layer_);
  if (!v7)
    return v7;
  v8 = -[CAMatchMoveAnimation keyPath](self, "keyPath");
  if (!v8)
    goto LABEL_11;
  v41 = 0;
  CA::Render::key_path_set((CA::Render *)&v41, v8, v9);
  v11 = v41;
  if (!v41)
  {
LABEL_7:
    v12 = 0;
    goto LABEL_9;
  }
  if ((v41 & 1) == 0)
  {
    if (*(_DWORD *)v41)
    {
      v12 = *(unsigned int *)(v41 + 4);
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  v12 = v41 >> 1;
LABEL_9:
  CA::Render::key_path_free(*((CA::Render **)a3 + 15), v10);
  *((_QWORD *)a3 + 15) = v11;
  if (a4)
  {
    v13 = objc_msgSend(a4, "_renderLayerPropertyAnimationFlags:", v12);
    goto LABEL_12;
  }
LABEL_11:
  v13 = 0;
LABEL_12:
  if (-[CAMatchMoveAnimation targetsSuperlayer](self, "targetsSuperlayer"))
    v14 = 1049600;
  else
    v14 = 1024;
  *((_QWORD *)a3 + 12) = CA::Render::Object::render_id(*((CA::Render::Object **)a4 + 2));
  v15 = -[CAMatchMoveAnimation sourceLayer](self, "sourceLayer");
  if (v15)
  {
    v16 = v15;
    *((_QWORD *)a3 + 13) = CA::Render::Object::render_id((CA::Render::Object *)v15->_attr.layer);
    v17 = objc_msgSend(-[CALayer context](v16, "context"), "contextId");
LABEL_19:
    *((_DWORD *)a3 + 28) = v17;
    goto LABEL_20;
  }
  v18 = -[CAMatchMoveAnimation sourceLayerRenderId](self, "sourceLayerRenderId");
  if (v18)
  {
    *((_QWORD *)a3 + 13) = v18;
    v17 = -[CAMatchMoveAnimation sourceContextId](self, "sourceContextId");
    goto LABEL_19;
  }
LABEL_20:
  v19 = v14 | v13;
  v20 = -[CAMatchMoveAnimation sourcePoints](self, "sourcePoints");
  if (v20)
  {
    v21 = point_vector_from_array(v20);
    v22 = (unsigned int *)*((_QWORD *)a3 + 17);
    if (v22 != v21)
    {
      if (v22)
      {
        v23 = v22 + 2;
        do
        {
          v24 = __ldaxr(v23);
          v25 = v24 - 1;
        }
        while (__stlxr(v25, v23));
        if (!v25)
          (*(void (**)(unsigned int *))(*(_QWORD *)v22 + 16))(v22);
      }
      if (v21)
      {
        v26 = v21 + 2;
        do
          v27 = __ldaxr(v26);
        while (__stlxr(v27 + 1, v26));
        v28 = v21;
        if (!v27)
        {
          v28 = 0;
          do
            v29 = __ldaxr(v26);
          while (__stlxr(v29 - 1, v26));
        }
      }
      else
      {
        v28 = 0;
      }
      *((_QWORD *)a3 + 17) = v28;
    }
    if (v21)
    {
      v30 = v21 + 2;
      do
      {
        v31 = __ldaxr(v30);
        v32 = v31 - 1;
      }
      while (__stlxr(v32, v30));
      if (!v32)
        (*(void (**)(unsigned int *))(*(_QWORD *)v21 + 16))(v21);
    }
  }
  v33 = -[CAMatchMoveAnimation appliesX](self, "appliesX");
  v34 = -[CAMatchMoveAnimation appliesY](self, "appliesY");
  v35 = -[CAMatchMoveAnimation appliesScale](self, "appliesScale");
  v36 = -[CAMatchMoveAnimation appliesRotation](self, "appliesRotation");
  v37 = -[CAMatchMoveAnimation usesNormalizedCoordinates](self, "usesNormalizedCoordinates");
  v38 = -[CAMatchMoveAnimation isAdditive](self, "isAdditive");
  v39 = v19 << 8;
  if (v33)
    v39 = (v19 << 8) | 0x1000000;
  if (v34)
    v39 |= 0x2000000u;
  if (v35)
    v39 |= 0x4000000u;
  if (v36)
    v39 |= 0x8000000u;
  if (v37)
    v39 |= 0x20000000u;
  if (v38)
    v39 |= 0x200u;
  *((_DWORD *)a3 + 3) |= v39;
  return v7;
}

- (NSString)keyPath
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 330, (const CGAffineTransform *)3, (CA::Mat4Impl *)v3);
  return (NSString *)v3[0];
}

- (BOOL)usesNormalizedCoordinates
{
  char v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  CAAnimation_getter((CA::Transaction *)self, 570, (const CGAffineTransform *)7, (CA::Mat4Impl *)&v3);
  return v3 != 0;
}

- (BOOL)targetsSuperlayer
{
  char v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  CAAnimation_getter((CA::Transaction *)self, 544, (const CGAffineTransform *)7, (CA::Mat4Impl *)&v3);
  return v3 != 0;
}

- (NSArray)sourcePoints
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 514, (const CGAffineTransform *)3, (CA::Mat4Impl *)v3);
  return (NSArray *)v3[0];
}

- (CALayer)sourceLayer
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 510, (const CGAffineTransform *)4, (CA::Mat4Impl *)v3);
  return (CALayer *)v3[0];
}

- (BOOL)isAdditive
{
  char v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  CAAnimation_getter((CA::Transaction *)self, 2, (const CGAffineTransform *)7, (CA::Mat4Impl *)&v3);
  return v3 != 0;
}

- (BOOL)appliesY
{
  char v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  CAAnimation_getter((CA::Transaction *)self, 37, (const CGAffineTransform *)7, (CA::Mat4Impl *)&v3);
  return v3 != 0;
}

- (BOOL)appliesX
{
  char v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  CAAnimation_getter((CA::Transaction *)self, 36, (const CGAffineTransform *)7, (CA::Mat4Impl *)&v3);
  return v3 != 0;
}

- (BOOL)appliesScale
{
  char v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  CAAnimation_getter((CA::Transaction *)self, 35, (const CGAffineTransform *)7, (CA::Mat4Impl *)&v3);
  return v3 != 0;
}

- (BOOL)appliesRotation
{
  char v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  CAAnimation_getter((CA::Transaction *)self, 34, (const CGAffineTransform *)7, (CA::Mat4Impl *)&v3);
  return v3 != 0;
}

- (void)setSourcePoints:(id)a3
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0x202, 3, (unsigned __int8 *)v3);
}

- (void)setSourceLayer:(id)a3
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0x1FE, 4, (unsigned __int8 *)v3);
}

+ (id)defaultValueForKey:(id)a3
{
  int v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v5 = CAInternAtom((const __CFString *)a3, 0);
  if ((v5 - 34) < 4)
    return (id)*MEMORY[0x1E0C9AE50];
  if (v5 == 330)
    return CFSTR("position");
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___CAMatchMoveAnimation;
  return objc_msgSendSuper2(&v7, sel_defaultValueForKey_, a3);
}

- (void)applyForTime:(double)a3 presentationObject:(id)a4 modelObject:(id)a5
{
  CALayer *v8;
  CALayer *v9;
  CALayer *v10;
  NSString *v11;
  _BOOL4 v12;
  CALayer *v13;
  NSArray *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  float64_t *v18;
  int8x16_t *v19;
  id v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  float64_t v24;
  float64x2_t v25;
  float64x2_t *v26;
  uint64_t v27;
  _BOOL4 v28;
  _BOOL4 v29;
  double v30;
  _BOOL4 v31;
  _BOOL4 v32;
  float64_t v33;
  double v34;
  double v35;
  int8x16_t v36;
  int8x16_t v37;
  int8x16_t v38;
  __double2 v39;
  uint64_t v40;
  double v41;
  double v42;
  float64x2_t v43;
  float64x2_t v44;
  unint64_t v45;
  float64x2_t v46;
  float64x2_t v47;
  const double *v48;
  double *v49;
  uint64_t v50;
  uint64_t v51;
  float64x2_t *v52;
  float64x2_t v53;
  double v54;
  double v55;
  _BOOL4 v56;
  _BOOL4 v57;
  _BOOL4 v58;
  int8x16_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  int64x2_t v63;
  int32x2_t v64;
  float64x2_t v65;
  unint64_t v66;
  int64x2_t v67;
  NSString *v68;
  _BOOL4 v69;
  id v70;
  _OWORD v71[8];
  double v72[2];
  float64x2_t v73;
  float64x2_t v74;
  float64x2_t v75;
  float64x2_t v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _OWORD v81[4];
  float64x2_t v82;
  float64x2_t v83;
  float64x2_t v84;
  float64x2_t v85;
  uint64_t v86;
  float64x2x2_t v87;
  float64x2x2_t v88;

  v86 = *MEMORY[0x1E0C80C00];
  if (!-[CAAnimation isEnabled](self, "isEnabled", a3))
    return;
  v8 = -[CAMatchMoveAnimation sourceLayer](self, "sourceLayer");
  v9 = v8;
  if (!v8)
  {
LABEL_5:
    v10 = (CALayer *)a4;
    if (v9 != a5)
      v10 = -[CALayer presentationLayer](v9, "presentationLayer");
    if (!v10)
      return;
    v11 = -[CAMatchMoveAnimation keyPath](self, "keyPath");
    v12 = -[NSString isEqualToString:](v11, "isEqualToString:", CFSTR("position"));
    if (v12 || (v13 = (CALayer *)a4, -[CAMatchMoveAnimation targetsSuperlayer](self, "targetsSuperlayer")))
    {
      v13 = (CALayer *)objc_msgSend(a4, "superlayer");
      if (!v13)
        return;
    }
    v14 = -[CAMatchMoveAnimation sourcePoints](self, "sourcePoints");
    v15 = -[NSArray count](v14, "count");
    v16 = v15 >= 4 ? 4 : v15;
    if (!v16)
      return;
    v66 = v15;
    v69 = v12;
    v68 = v11;
    v70 = a4;
    v17 = 0;
    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    v18 = &v82.f64[1];
    v19 = (int8x16_t *)MEMORY[0x1E0CB3430];
    do
    {
      v20 = -[NSArray objectAtIndex:](v14, "objectAtIndex:", v17, v66);
      v21 = (const char *)objc_msgSend(v20, "objCType");
      if (v21 && !strcmp(v21, "{CGPoint=dd}"))
      {
        objc_msgSend(v20, "pointValue");
      }
      else
      {
        v22 = v19->i64[0];
        v23 = v19->i64[1];
      }
      *((_QWORD *)v18 - 1) = v22;
      *(_QWORD *)v18 = v23;
      ++v17;
      v18 += 2;
    }
    while (v16 != v17);
    if (-[CAMatchMoveAnimation usesNormalizedCoordinates](self, "usesNormalizedCoordinates"))
    {
      -[CALayer bounds](v10, "bounds");
      v25.f64[1] = v24;
      v26 = &v82;
      v27 = v16;
      do
      {
        *v26 = vmulq_f64(*v26, v25);
        ++v26;
        --v27;
      }
      while (v27);
    }
    *(_QWORD *)&v71[0] = &v82;
    *((_QWORD *)&v71[0] + 1) = v16;
    *(_QWORD *)&v73.f64[0] = v71;
    *(_QWORD *)&v73.f64[1] = -[CAMatchMoveAnimation applyForTime:presentationObject:modelObject:]::MapPoints::map;
    *(_QWORD *)&v74.f64[0] = -[CAMatchMoveAnimation applyForTime:presentationObject:modelObject:]::MapPoints::unmap;
    CA::Layer::map_geometry((CA::Transaction *)v10, v13, (void (*)(uint64_t, __int128 *))map_fun, (void (*)(_QWORD, _QWORD))map_unfun, (uint64_t)&v73);
    v28 = -[CAMatchMoveAnimation isAdditive](self, "isAdditive");
    if (v16 == 2)
    {
      v30 = 0.5;
      if (v69)
        objc_msgSend(v70, "anchorPoint", 0.5);
      v67 = (int64x2_t)vaddq_f64((float64x2_t)vbicq_s8((int8x16_t)vmulq_n_f64(vsubq_f64(v83, v82), v30), (int8x16_t)vceqq_f64(v82, v83)), v82);
      v31 = -[CAMatchMoveAnimation appliesScale](self, "appliesScale", v67.i64[0]);
      v32 = -[CAMatchMoveAnimation appliesRotation](self, "appliesRotation");
      if (!v69 || !v31 && !v32)
        goto LABEL_49;
      v33 = v83.f64[0] - v82.f64[0];
      v79 = 0u;
      v80 = 0u;
      v77 = 0u;
      v78 = 0u;
      v75 = 0u;
      v76 = 0u;
      v34 = v83.f64[1] - v82.f64[1];
      v73 = 0u;
      v74 = 0u;
      if (v32)
      {
        v35 = atan2(v83.f64[1] - v82.f64[1], v33);
        v76 = 0u;
        v77 = 0u;
        v78 = xmmword_18474DF40;
        v80 = xmmword_18474DF50;
        v39 = __sincos_stret(v35);
        *(double *)v37.i64 = v39.__cosval;
        *(double *)v36.i64 = v39.__sinval;
        if (fabs(v39.__sinval) >= 0.0000001)
        {
          v38.i64[0] = 1.0;
          v53.f64[0] = NAN;
          v53.f64[1] = NAN;
          v38.i64[0] = vbslq_s8((int8x16_t)vnegq_f64(v53), v38, v36).u64[0];
          if (fabs(v39.__cosval) < 0.0000001)
          {
            *(double *)v36.i64 = 0.0;
          }
          else
          {
            *(double *)v38.i64 = v39.__sinval;
            *(double *)v36.i64 = v39.__cosval;
          }
        }
        else
        {
          v36.i64[0] = 1.0;
          v40 = -1;
          v38.i64[1] = -1;
          v36.i64[0] = vbslq_s8((int8x16_t)vnegq_f64((float64x2_t)v38), v36, v37).u64[0];
          v38.i64[0] = 0;
        }
        *(_QWORD *)&v73.f64[0] = v36.i64[0];
        *(_QWORD *)&v73.f64[1] = v38.i64[0];
        v75.f64[0] = -*(double *)v38.i64;
        *(_QWORD *)&v75.f64[1] = v36.i64[0];
      }
      else
      {
        v73 = (float64x2_t)xmmword_18474DF40;
        v75 = (float64x2_t)xmmword_18474DF50;
        v76 = 0uLL;
        v77 = 0uLL;
        v78 = xmmword_18474DF40;
        v80 = xmmword_18474DF50;
      }
      if (v31)
      {
        objc_msgSend(v70, "size");
        v55 = sqrt(v33 * v33 + v34 * v34) / v54;
        v73 = vmulq_n_f64(v73, v55);
        v74 = vmulq_n_f64((float64x2_t)0, v55);
        v75 = vmulq_n_f64(v75, v55);
        v76 = v74;
        v77 = 0u;
        v78 = xmmword_18474DF40;
      }
      v52 = &v73;
    }
    else
    {
      if (v16 == 1)
      {
        v67.i64[1] = *(_QWORD *)&v82.f64[1];
        v29 = -[CAMatchMoveAnimation appliesX](self, "appliesX", *(_QWORD *)&v82.f64[0]);
LABEL_50:
        v56 = v29;
        v57 = -[CAMatchMoveAnimation appliesY](self, "appliesY");
        v58 = v57;
        if (!v56 && !v57)
          return;
        v59 = 0uLL;
        if (!v56 || !v57 || v28)
        {
          if (v69)
          {
            objc_msgSend(v70, "position", 0.0);
          }
          else
          {
            v61 = (void *)objc_msgSend(v70, "valueForKeyPath:", v68, 0.0);
            v62 = (const char *)objc_msgSend(v61, "objCType");
            if (!v62 || strcmp(v62, "{CGPoint=dd}"))
            {
              v59 = *v19;
              goto LABEL_59;
            }
            objc_msgSend(v61, "pointValue");
          }
          v59.i64[1] = v60;
        }
LABEL_59:
        v63.i64[0] = v56;
        v63.i64[1] = v58;
        v64 = vdup_n_s32(v28);
        v65 = (float64x2_t)vbslq_s8((int8x16_t)vcltzq_s64(vshlq_n_s64(v63, 0x3FuLL)), (int8x16_t)v67, v59);
        v63.i64[0] = v64.u32[0];
        v63.i64[1] = v64.u32[1];
        v73 = vaddq_f64(v65, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_s64(vshlq_n_s64(v63, 0x3FuLL)), v59, (int8x16_t)vdupq_n_s64(0x8000000000000000)));
        objc_msgSend(v70, "setValue:forKeyPath:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v73, "{CGPoint=dd}"), v68);
        return;
      }
      if (v66 < 4)
        return;
      v41 = 0.5;
      v42 = 0.5;
      if (v69)
        objc_msgSend(v70, "anchorPoint", 0.5, 0.5);
      v72[0] = v41;
      v72[1] = v42;
      v43 = vaddq_f64((float64x2_t)vbicq_s8((int8x16_t)vmulq_n_f64(vsubq_f64(v83, v82), v41), (int8x16_t)vceqq_f64(v82, v83)), v82);
      v44 = vaddq_f64((float64x2_t)vbicq_s8((int8x16_t)vmulq_n_f64(vsubq_f64(v84, v85), v41), (int8x16_t)vceqq_f64(v85, v84)), v85);
      v67 = (int64x2_t)vaddq_f64((float64x2_t)vbicq_s8((int8x16_t)vmulq_n_f64(vsubq_f64(v44, v43), v42), (int8x16_t)vceqq_f64(v43, v44)), v43);
      if (!v69)
      {
LABEL_49:
        v29 = -[CAMatchMoveAnimation appliesX](self, "appliesX", v67.i64[0]);
        goto LABEL_50;
      }
      v45 = 0;
      memset(v81, 0, sizeof(v81));
      v46 = (float64x2_t)vdupq_lane_s64(v67.i64[0], 0);
      v47 = (float64x2_t)vdupq_laneq_s64(v67, 1);
      do
      {
        v48 = &v82.f64[v45 / 8];
        v87 = vld2q_f64(v48);
        v88.val[0] = vsubq_f64(v87.val[0], v46);
        v88.val[1] = vsubq_f64(v87.val[1], v47);
        v49 = (double *)&v81[v45 / 0x10];
        vst2q_f64(v49, v88);
        v45 += 32;
      }
      while (v45 != 64);
      v79 = 0u;
      v80 = 0u;
      v77 = 0u;
      v78 = 0u;
      v75 = 0u;
      v76 = 0u;
      v73 = 0u;
      v74 = 0u;
      objc_msgSend(v70, "size");
      *(_QWORD *)&v71[0] = v50;
      *((_QWORD *)&v71[0] + 1) = v51;
      CA::Mat4Impl::mat4_set_corner_matrix((uint64_t)&v73, (double *)v81, (double *)v71, v72);
      v71[0] = v73;
      v71[1] = v74;
      v71[2] = v75;
      v71[3] = v76;
      v71[4] = v77;
      v71[5] = v78;
      v71[6] = v79;
      v71[7] = v80;
      v52 = (float64x2_t *)v71;
    }
    set_layer_transform(v70, (uint64_t)v52, v28);
    goto LABEL_49;
  }
  while (v8 != a5)
  {
    v8 = -[CALayer superlayer](v8, "superlayer");
    if (!v8)
      goto LABEL_5;
  }
}

- (BOOL)CA_validateValue:(id)a3 forKey:(id)a4
{
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (a3 && objc_msgSend(a4, "isEqualToString:", CFSTR("sourcePoints")))
  {
    objc_opt_class();
    return CAObject_validateArrayOfClass(a3);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CAMatchMoveAnimation;
    return -[NSObject CA_validateValue:forKey:](&v8, sel_CA_validateValue_forKey_, a3, a4);
  }
}

- (unint64_t)sourceLayerRenderId
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 511, (const CGAffineTransform *)0x10, (CA::Mat4Impl *)v3);
  return v3[0];
}

- (void)setSourceLayerRenderId:(unint64_t)a3
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0x1FF, 16, (unsigned __int8 *)v3);
}

- (unsigned)sourceContextId
{
  unsigned int v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  CAAnimation_getter((CA::Transaction *)self, 508, (const CGAffineTransform *)0xC, (CA::Mat4Impl *)&v3);
  return v3;
}

- (void)setSourceContextId:(unsigned int)a3
{
  unsigned int v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0x1FC, 12, (unsigned __int8 *)&v3);
}

- (void)setKeyPath:(id)a3
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0x14A, 3, (unsigned __int8 *)v3);
}

- (void)setTargetsSuperlayer:(BOOL)a3
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0x220, 7, (unsigned __int8 *)&v3);
}

- (void)setUsesNormalizedCoordinates:(BOOL)a3
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0x23A, 7, (unsigned __int8 *)&v3);
}

- (void)setAppliesX:(BOOL)a3
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0x24, 7, (unsigned __int8 *)&v3);
}

- (void)setAppliesY:(BOOL)a3
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0x25, 7, (unsigned __int8 *)&v3);
}

- (void)setAppliesScale:(BOOL)a3
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0x23, 7, (unsigned __int8 *)&v3);
}

- (void)setAppliesRotation:(BOOL)a3
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0x22, 7, (unsigned __int8 *)&v3);
}

- (void)setAdditive:(BOOL)a3
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CAAnimation_setter((uint64_t)self, (const void *)2, 7, (unsigned __int8 *)&v3);
}

- (void)applyForTime:(_QWORD *)a1 presentationObject:(float64x2_t *)this modelObject:(double *)a3
{
  uint64_t v5;
  unint64_t v6;

  if (a1[1])
  {
    v5 = 0;
    v6 = 0;
    do
    {
      CA::Mat4Impl::mat4_unapply_inverse_to_point2(this, (double *)(*a1 + v5), a3);
      ++v6;
      v5 += 16;
    }
    while (v6 < a1[1]);
  }
}

@end
