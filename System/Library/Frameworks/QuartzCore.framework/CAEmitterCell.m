@implementation CAEmitterCell

- (void)dealloc
{
  CA::Transaction *v3;
  const void *v4;
  CA::AttrList *v5;
  CA::Transaction *v6;
  int v7;
  unsigned int *state;
  unsigned int *v9;
  unsigned int v10;
  unsigned int v11;
  objc_super v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  CAMediaTimingInvalidate((uint64_t)self);
  v5 = (CA::AttrList *)self->_attr[0];
  if (v5)
  {
    v6 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
    if (!v6)
      v6 = (CA::Transaction *)CA::Transaction::create(v3);
    v7 = *((_DWORD *)v6 + 25);
    *((_DWORD *)v6 + 25) = v7 + 1;
    if (!v7)
      os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
    CA::AttrList::free(v5, v4);
    CA::Transaction::unlock(v6);
  }
  state = (unsigned int *)self->_state;
  if (state)
  {
    v9 = state + 2;
    do
    {
      v10 = __ldaxr(v9);
      v11 = v10 - 1;
    }
    while (__stlxr(v11, v9));
    if (!v11)
      (*(void (**)(unsigned int *))(*(_QWORD *)state + 16))(state);
  }
  v12.receiver = self;
  v12.super_class = (Class)CAEmitterCell;
  -[CAEmitterCell dealloc](&v12, sel_dealloc);
}

- (void)CA_prepareRenderValue
{
  CA::Render *v2;
  CA::Render *v3;
  CFTypeID v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  CGImage *v8;

  v2 = -[CAEmitterCell contents](self, "contents");
  if (v2)
  {
    v3 = v2;
    v4 = CFGetTypeID(v2);
    if (v4 == CGImageGetTypeID())
    {
      v6 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
      if (v6 && (v7 = *(_QWORD *)(v6 + 40)) != 0)
        v8 = *(CGImage **)(v7 + 112);
      else
        v8 = (CGImage *)CAGetColorSpace(0x1Du);
      CA::Render::prepare_image(v3, v8, 0, v5);
    }
  }
}

- (Object)CA_copyRenderValue
{
  char *state;
  uint64_t v4;
  uint64_t v5;
  CGColorSpace *v6;
  malloc_zone_t *malloc_zone;
  char *v8;
  const __CFString *v9;
  const __CFString *v10;
  unsigned int *v11;
  unsigned int *v12;
  unsigned int *v13;
  unsigned int v14;
  unsigned int v15;
  int v16;
  const __CFString *v17;
  uint64_t v18;
  unsigned int *v19;
  unsigned int *v20;
  unsigned int v21;
  unsigned int v22;
  int v23;
  int v24;
  int v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  int v34;
  int v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  CGColor *v46;
  int v47;
  int v48;
  int v49;
  int v50;
  int v51;
  int v52;
  int v53;
  int v54;
  int v55;
  double v56;
  int v57;
  CA::Render *v58;
  CA::Render *v59;
  CFTypeID v60;
  char *v61;
  unsigned int *v62;
  unsigned int *v63;
  unsigned int v64;
  unsigned int v65;
  const __CFString *v66;
  const CA::Rect *v67;
  double v68;
  double v69;
  double v70;
  double v71;
  char *v72;
  unsigned int *v73;
  unsigned int *v74;
  unsigned int v75;
  unsigned int v76;
  const __CFString *v77;
  const __CFString *v78;
  NSArray *v79;
  unsigned int *v80;
  unsigned int *v81;
  unsigned int *v82;
  unsigned int v83;
  unsigned int v84;
  unsigned int *v85;
  unsigned int v86;
  unsigned int *v87;
  unsigned int v88;
  unsigned int *v89;
  unsigned int v90;
  unsigned int v91;
  NSArray *v92;
  unsigned int *v93;
  unsigned int *v94;
  unsigned int *v95;
  unsigned int v96;
  unsigned int v97;
  unsigned int *v98;
  unsigned int v99;
  unsigned int *v100;
  unsigned int v101;
  unsigned int *v102;
  unsigned int v103;
  unsigned int v104;
  unsigned int *v105;
  unsigned int v106;
  unsigned int v108;
  float64x2_t v109;
  float64x2_t v110;
  uint64_t v111;

  v111 = *MEMORY[0x1E0C80C00];
  state = (char *)self->_state;
  if (!state)
  {
    v4 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
    if (v4 && (v5 = *(_QWORD *)(v4 + 40)) != 0)
      v6 = *(CGColorSpace **)(v5 + 112);
    else
      v6 = (CGColorSpace *)CAGetColorSpace(0x1Du);
    malloc_zone = (malloc_zone_t *)get_malloc_zone();
    v8 = (char *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0xE8uLL, 0x743898A5uLL);
    state = v8;
    if (v8)
    {
      *((_DWORD *)v8 + 2) = 1;
      *((_DWORD *)v8 + 3) = 14;
      ++dword_1ECDC7C60;
      *(_QWORD *)v8 = off_1E15964B0;
      *((_OWORD *)v8 + 1) = 0u;
      *((_OWORD *)v8 + 2) = 0u;
      *((_OWORD *)v8 + 3) = 0u;
      *((_QWORD *)v8 + 8) = 0x1F500000209;
      *(_OWORD *)(v8 + 72) = 0u;
      *(_OWORD *)(v8 + 88) = 0u;
      *(_OWORD *)(v8 + 104) = 0u;
      *(_OWORD *)(v8 + 120) = 0u;
      *(_OWORD *)(v8 + 136) = 0u;
      *(_OWORD *)(v8 + 152) = 0u;
      *(_OWORD *)(v8 + 168) = 0u;
      *(_OWORD *)(v8 + 184) = 0u;
      *(_OWORD *)(v8 + 200) = 0u;
      *(_OWORD *)(v8 + 216) = 0u;
      *((_DWORD *)v8 + 54) = 1065353216;
    }
    v9 = -[CAEmitterCell name](self, "name");
    if (v9)
    {
      v11 = CA::Render::String::new_string(v9, v10);
      v12 = (unsigned int *)*((_QWORD *)state + 2);
      *((_QWORD *)state + 2) = v11;
      if (v12)
      {
        v13 = v12 + 2;
        do
        {
          v14 = __ldaxr(v13);
          v15 = v14 - 1;
        }
        while (__stlxr(v15, v13));
        if (!v15)
          (*(void (**)(unsigned int *))(*(_QWORD *)v12 + 16))(v12);
      }
    }
    v16 = -[CAEmitterCell isEnabled](self, "isEnabled");
    v17 = -[CAEmitterCell particleType](self, "particleType");
    if (v17)
      *((_DWORD *)state + 16) = CAInternAtom(v17, 0);
    v18 = CAMediaTimingCopyRenderTiming((unint64_t)self);
    v19 = (unsigned int *)*((_QWORD *)state + 7);
    *((_QWORD *)state + 7) = v18;
    if (v19)
    {
      v20 = v19 + 2;
      do
      {
        v21 = __ldaxr(v20);
        v22 = v21 - 1;
      }
      while (__stlxr(v22, v20));
      if (!v22)
        (*(void (**)(unsigned int *))(*(_QWORD *)v19 + 16))(v19);
    }
    -[CAEmitterCell birthRate](self, "birthRate");
    *((_DWORD *)state + 18) = v23;
    -[CAEmitterCell lifetime](self, "lifetime");
    *((_DWORD *)state + 19) = v24;
    -[CAEmitterCell lifetimeRange](self, "lifetimeRange");
    *((_DWORD *)state + 20) = v25;
    -[CAEmitterCell emissionLatitude](self, "emissionLatitude");
    *(float *)&v26 = v26;
    *((_DWORD *)state + 21) = LODWORD(v26);
    -[CAEmitterCell emissionLongitude](self, "emissionLongitude");
    *(float *)&v27 = v27;
    *((_DWORD *)state + 22) = LODWORD(v27);
    -[CAEmitterCell emissionRange](self, "emissionRange");
    *(float *)&v28 = v28;
    *((_DWORD *)state + 23) = LODWORD(v28);
    -[CAEmitterCell velocity](self, "velocity");
    *(float *)&v29 = v29;
    *((_DWORD *)state + 24) = LODWORD(v29);
    -[CAEmitterCell velocityRange](self, "velocityRange");
    *(float *)&v30 = v30;
    *((_DWORD *)state + 25) = LODWORD(v30);
    -[CAEmitterCell xAcceleration](self, "xAcceleration");
    *(float *)&v31 = v31;
    *((_DWORD *)state + 26) = LODWORD(v31);
    -[CAEmitterCell yAcceleration](self, "yAcceleration");
    *(float *)&v32 = v32;
    *((_DWORD *)state + 27) = LODWORD(v32);
    -[CAEmitterCell zAcceleration](self, "zAcceleration");
    *(float *)&v33 = v33;
    *((_DWORD *)state + 28) = LODWORD(v33);
    -[CAEmitterCell mass](self, "mass");
    *((_DWORD *)state + 29) = v34;
    -[CAEmitterCell massRange](self, "massRange");
    *((_DWORD *)state + 30) = v35;
    -[CAEmitterCell scale](self, "scale");
    *(float *)&v36 = v36;
    *((_DWORD *)state + 31) = LODWORD(v36);
    -[CAEmitterCell scaleRange](self, "scaleRange");
    *(float *)&v37 = v37;
    *((_DWORD *)state + 32) = LODWORD(v37);
    -[CAEmitterCell scaleSpeed](self, "scaleSpeed");
    *(float *)&v38 = v38;
    *((_DWORD *)state + 33) = LODWORD(v38);
    -[CAEmitterCell orientationLatitude](self, "orientationLatitude");
    *(float *)&v39 = v39;
    *((_DWORD *)state + 34) = LODWORD(v39);
    -[CAEmitterCell orientationLongitude](self, "orientationLongitude");
    *(float *)&v40 = v40;
    *((_DWORD *)state + 35) = LODWORD(v40);
    -[CAEmitterCell orientationRange](self, "orientationRange");
    *(float *)&v41 = v41;
    *((_DWORD *)state + 36) = LODWORD(v41);
    -[CAEmitterCell rotation](self, "rotation");
    *(float *)&v42 = v42;
    *((_DWORD *)state + 37) = LODWORD(v42);
    -[CAEmitterCell rotationRange](self, "rotationRange");
    *(float *)&v43 = v43;
    *((_DWORD *)state + 38) = LODWORD(v43);
    -[CAEmitterCell spin](self, "spin");
    *(float *)&v44 = v44;
    *((_DWORD *)state + 39) = LODWORD(v44);
    -[CAEmitterCell spinRange](self, "spinRange");
    *(float *)&v45 = v45;
    *((_DWORD *)state + 40) = LODWORD(v45);
    v46 = -[CAEmitterCell color](self, "color");
    if (v46)
    {
      v109 = 0u;
      v110 = 0u;
      CA_CGColorGetRGBComponents(v46, v6, v109.f64);
      *(float32x4_t *)(state + 164) = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v109), v110);
    }
    -[CAEmitterCell redRange](self, "redRange");
    *((_DWORD *)state + 45) = v47;
    -[CAEmitterCell greenRange](self, "greenRange");
    *((_DWORD *)state + 46) = v48;
    -[CAEmitterCell blueRange](self, "blueRange");
    *((_DWORD *)state + 47) = v49;
    -[CAEmitterCell alphaRange](self, "alphaRange");
    *((_DWORD *)state + 48) = v50;
    -[CAEmitterCell redSpeed](self, "redSpeed");
    *((_DWORD *)state + 49) = v51;
    -[CAEmitterCell greenSpeed](self, "greenSpeed");
    *((_DWORD *)state + 50) = v52;
    -[CAEmitterCell blueSpeed](self, "blueSpeed");
    *((_DWORD *)state + 51) = v53;
    -[CAEmitterCell alphaSpeed](self, "alphaSpeed");
    *((_DWORD *)state + 52) = v54;
    -[CAEmitterCell minificationFilterBias](self, "minificationFilterBias");
    *((_DWORD *)state + 53) = v55;
    -[CAEmitterCell contentsScale](self, "contentsScale");
    *(float *)&v56 = v56;
    *((_DWORD *)state + 54) = LODWORD(v56);
    *((float *)state + 55) = (float)-[CAEmitterCell contentsFrameCount](self, "contentsFrameCount");
    *((float *)state + 56) = (float)-[CAEmitterCell contentsFramesPerRow](self, "contentsFramesPerRow");
    -[CAEmitterCell contentsFramesPerSecond](self, "contentsFramesPerSecond");
    *((_DWORD *)state + 57) = v57;
    v58 = -[CAEmitterCell contents](self, "contents");
    if (v58)
    {
      v59 = v58;
      v60 = CFGetTypeID(v58);
      if (v60 == CGImageGetTypeID())
      {
        v61 = CA::Render::copy_image(v59, v6, 0, 0.0, 1.0);
        v62 = (unsigned int *)*((_QWORD *)state + 3);
        *((_QWORD *)state + 3) = v61;
        if (v62)
        {
          v63 = v62 + 2;
          do
          {
            v64 = __ldaxr(v63);
            v65 = v64 - 1;
          }
          while (__stlxr(v65, v63));
          if (!v65)
            (*(void (**)(unsigned int *))(*(_QWORD *)v62 + 16))(v62);
        }
      }
    }
    v66 = -[CAEmitterCell contentsFrameMode](self, "contentsFrameMode");
    if (v66)
      *((_DWORD *)state + 17) = CAInternAtom(v66, 0);
    -[CAEmitterCell contentsRect](self, "contentsRect");
    if (v68 != 0.0 || v69 != 0.0 || v70 != 1.0 || v71 != 1.0)
    {
      v109.f64[0] = v68;
      v109.f64[1] = v69;
      v110.f64[0] = v70;
      v110.f64[1] = v71;
      if (v70 < 0.0)
      {
        v109.f64[0] = v70 + v68;
        v110.f64[0] = -v70;
      }
      if (v71 < 0.0)
      {
        v109.f64[1] = v71 + v69;
        v110.f64[1] = -v71;
      }
      v72 = CA::Render::Vector::new_rect((CA::Render::Vector *)&v109, v67);
      v73 = (unsigned int *)*((_QWORD *)state + 4);
      *((_QWORD *)state + 4) = v72;
      if (v73)
      {
        v74 = v73 + 2;
        do
        {
          v75 = __ldaxr(v74);
          v76 = v75 - 1;
        }
        while (__stlxr(v76, v74));
        if (!v76)
          (*(void (**)(unsigned int *))(*(_QWORD *)v73 + 16))(v73);
      }
    }
    v77 = -[CAEmitterCell magnificationFilter](self, "magnificationFilter", *(_OWORD *)&v109, *(_OWORD *)&v110);
    if (v77)
      v16 |= 8 * CA::Render::Layer::image_filter_from_string(v77, 0);
    v78 = -[CAEmitterCell minificationFilter](self, "minificationFilter");
    if (v78)
      v16 |= 2 * CA::Render::Layer::image_filter_from_string(v78, (const __CFString *)1);
    v79 = -[CAEmitterCell emitterCells](self, "emitterCells");
    if (v79)
    {
      v80 = CA::Render::copy_render_array((const __CFArray *)v79, 14);
      v81 = (unsigned int *)*((_QWORD *)state + 5);
      if (v81 != v80)
      {
        if (v81)
        {
          v82 = v81 + 2;
          do
          {
            v83 = __ldaxr(v82);
            v84 = v83 - 1;
          }
          while (__stlxr(v84, v82));
          if (!v84)
            (*(void (**)(unsigned int *))(*(_QWORD *)v81 + 16))(v81);
        }
        if (v80)
        {
          v85 = v80 + 2;
          do
            v86 = __ldaxr(v85);
          while (__stlxr(v86 + 1, v85));
          v87 = v80;
          if (!v86)
          {
            v87 = 0;
            do
              v88 = __ldaxr(v85);
            while (__stlxr(v88 - 1, v85));
          }
        }
        else
        {
          v87 = 0;
        }
        *((_QWORD *)state + 5) = v87;
      }
      if (v80)
      {
        v89 = v80 + 2;
        do
        {
          v90 = __ldaxr(v89);
          v91 = v90 - 1;
        }
        while (__stlxr(v91, v89));
        if (!v91)
          (*(void (**)(unsigned int *))(*(_QWORD *)v80 + 16))(v80);
      }
    }
    v92 = -[CAEmitterCell emitterBehaviors](self, "emitterBehaviors");
    if (v92)
    {
      v93 = CA::Render::copy_render_array((const __CFArray *)v92, 13);
      v94 = (unsigned int *)*((_QWORD *)state + 6);
      if (v94 != v93)
      {
        if (v94)
        {
          v95 = v94 + 2;
          do
          {
            v96 = __ldaxr(v95);
            v97 = v96 - 1;
          }
          while (__stlxr(v97, v95));
          if (!v97)
            (*(void (**)(unsigned int *))(*(_QWORD *)v94 + 16))(v94);
        }
        if (v93)
        {
          v98 = v93 + 2;
          do
            v99 = __ldaxr(v98);
          while (__stlxr(v99 + 1, v98));
          v100 = v93;
          if (!v99)
          {
            v100 = 0;
            do
              v101 = __ldaxr(v98);
            while (__stlxr(v101 - 1, v98));
          }
        }
        else
        {
          v100 = 0;
        }
        *((_QWORD *)state + 6) = v100;
      }
      if (v93)
      {
        v102 = v93 + 2;
        do
        {
          v103 = __ldaxr(v102);
          v104 = v103 - 1;
        }
        while (__stlxr(v104, v102));
        if (!v104)
          (*(void (**)(unsigned int *))(*(_QWORD *)v93 + 16))(v93);
      }
    }
    *((_DWORD *)state + 3) |= v16 << 8;
    self->_state = state;
  }
  v105 = (unsigned int *)(state + 8);
  do
    v106 = __ldaxr(v105);
  while (__stlxr(v106 + 1, v105));
  if (!v106)
  {
    state = 0;
    do
      v108 = __ldaxr(v105);
    while (__stlxr(v108 - 1, v105));
  }
  return (Object *)state;
}

- (BOOL)shouldArchiveValueForKey:(NSString *)key
{
  CA::Transaction *v5;
  int v6;
  int v7;
  _DWORD *v8;
  BOOL v9;

  v5 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v5)
    v5 = (CA::Transaction *)CA::Transaction::create((CA::Transaction *)self);
  v6 = CAInternAtom((const __CFString *)key, 1);
  v7 = *((_DWORD *)v5 + 25);
  *((_DWORD *)v5 + 25) = v7 + 1;
  if (!v7)
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  v8 = self->_attr[0];
  if (v8)
  {
    while (1)
    {
      v8 = *(_DWORD **)v8;
      v9 = v8 != 0;
      if (!v8)
        break;
      if ((v8[2] & 0xFFFFFF) == v6)
      {
        v9 = 1;
        break;
      }
    }
  }
  else
  {
    v9 = 0;
  }
  CA::Transaction::unlock(v5);
  return v9;
}

- (CAEmitterCell)initWithCoder:(id)a3
{
  return (CAEmitterCell *)CAObject_initWithCoder(self, a3);
}

- (void)encodeWithCoder:(id)a3
{
  CAObject_encodeWithCoder(self, a3);
}

- (id)valueForKey:(id)a3
{
  return CAObject_valueForKey(self, (objc_class *)+[CAEmitterCell superclass](CAEmitterCell, "superclass"), (const __CFString *)a3);
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  CAObject_setValueForKey(self, (objc_class *)+[CAEmitterCell superclass](CAEmitterCell, "superclass"), a3, (const __CFString *)a4);
}

- (id)valueForUndefinedKey:(id)a3
{
  CA::Transaction *v5;
  int v6;
  int v7;
  void *v8;
  int v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v5)
    v5 = (CA::Transaction *)CA::Transaction::create((CA::Transaction *)self);
  v6 = CAInternAtom((const __CFString *)a3, 1);
  v7 = *((_DWORD *)v5 + 25);
  *((_DWORD *)v5 + 25) = v7 + 1;
  if (!v7)
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  v8 = self->_attr[0];
  if (v8)
  {
    v11[0] = 0;
    v9 = CA::AttrList::get((uint64_t)v8, v6, (const CGAffineTransform *)1, (CA::Mat4Impl *)v11);
    CA::Transaction::unlock(v5);
    if (v9)
      return (id)v11[0];
    else
      return 0;
  }
  else
  {
    CA::Transaction::unlock(v5);
    return 0;
  }
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  CA::Transaction *v6;
  const void *v7;
  int v8;
  CA::AttrList *v9;
  malloc_zone_t *malloc_zone;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v11[0] = a3;
  v6 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v6)
    v6 = (CA::Transaction *)CA::Transaction::create((CA::Transaction *)self);
  v7 = (const void *)CAInternAtom((const __CFString *)a4, 1);
  -[CAEmitterCell willChangeValueForKey:](self, "willChangeValueForKey:", a4, v11[0]);
  v8 = *((_DWORD *)v6 + 25);
  *((_DWORD *)v6 + 25) = v8 + 1;
  if (!v8)
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  v9 = (CA::AttrList *)self->_attr[0];
  if (!v9)
  {
    malloc_zone = (malloc_zone_t *)get_malloc_zone();
    v9 = (CA::AttrList *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0x10uLL, 0x743898A5uLL);
  }
  self->_attr[0] = CA::AttrList::set(v9, v7, 2, (unsigned __int8 *)v11);
  CA::Transaction::unlock(v6);
  -[CAEmitterCell didChangeValueForKey:](self, "didChangeValueForKey:", a4);
}

- (id)valueForKeyPath:(id)a3
{
  return CAObject_valueForKeyPath(self, a3);
}

- (void)setValue:(id)a3 forKeyPath:(id)a4
{
  CAObject_setValueForKeyPath(self, a3, a4);
}

- (void)didChangeValueForKey:(id)a3
{
  unsigned int *state;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_state
    && ((objc_msgSend(a3, "isEqualToString:", CFSTR("emitterCells")) & 1) != 0
     || objc_msgSend(a3, "isEqualToString:", CFSTR("emitterBehaviors"))))
  {
    state = (unsigned int *)self->_state;
    v6 = state + 2;
    do
    {
      v7 = __ldaxr(v6);
      v8 = v7 - 1;
    }
    while (__stlxr(v8, v6));
    if (!v8)
      (*(void (**)(unsigned int *))(*(_QWORD *)state + 16))(state);
    self->_state = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)CAEmitterCell;
  -[CAEmitterCell didChangeValueForKey:](&v9, sel_didChangeValueForKey_, a3);
}

- (id)debugDescription
{
  CA::Transaction *v3;
  __CFString *v4;
  objc_class *v5;
  int v6;
  CA::AttrList **v7;

  v3 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v3)
    v3 = (CA::Transaction *)CA::Transaction::create((CA::Transaction *)self);
  v4 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = (objc_class *)objc_opt_class();
  -[__CFString appendFormat:](v4, "appendFormat:", CFSTR("<%@:%p; "), NSStringFromClass(v5), self);
  v6 = *((_DWORD *)v3 + 25);
  *((_DWORD *)v3 + 25) = v6 + 1;
  if (!v6)
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  v7 = (CA::AttrList **)self->_attr[0];
  if (v7)
    CA::AttrList::append_description(*v7, v4);
  CA::Transaction::unlock(v3);
  -[__CFString appendString:](v4, "appendString:", CFSTR(">"));
  return v4;
}

- (void)CAMLParser:(id)a3 setValue:(id)a4 forKey:(id)a5
{
  -[CAEmitterCell setValue:forKey:](self, "setValue:forKey:", a4, a5);
}

- (void)encodeWithCAMLWriter:(id)a3
{
  CAObject_encodeWithCAMLWriter(self, a3);
}

- (id)CAMLTypeForKey:(id)a3
{
  return (id)CAObject_CAMLTypeForKey((uint64_t)self, (const __CFString *)a3);
}

- (BOOL)CAMLTypeSupportedForKey:(id)a3
{
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("contents")) & 1) != 0)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)CAEmitterCell;
  return -[NSObject CAMLTypeSupportedForKey:](&v6, sel_CAMLTypeSupportedForKey_, a3);
}

- (BOOL)CA_validateValue:(id)a3 forKey:(id)a4
{
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (a3
    && (objc_msgSend(a4, "isEqualToString:", CFSTR("emitterCells"))
     || objc_msgSend(a4, "isEqualToString:", CFSTR("emitterBehaviors"))))
  {
    objc_opt_class();
    return CAObject_validateArrayOfClass(a3);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CAEmitterCell;
    return -[NSObject CA_validateValue:forKey:](&v8, sel_CA_validateValue_forKey_, a3, a4);
  }
}

- (double)beginTime
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x37u, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v3);
  return *(double *)v3;
}

- (void)setBeginTime:(double)a3
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  *(double *)v3 = a3;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x37, 18, (unsigned __int8 *)v3);
}

- (double)timeOffset
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x223u, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v3);
  return *(double *)v3;
}

- (void)setTimeOffset:(double)a3
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  *(double *)v3 = a3;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x223, 18, (unsigned __int8 *)v3);
}

- (double)duration
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0xBBu, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v3);
  return *(double *)v3;
}

- (void)setDuration:(double)a3
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  *(double *)v3 = a3;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0xBB, 18, (unsigned __int8 *)v3);
}

- (float)speed
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0.0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x203u, (const CGAffineTransform *)0x11, (CA::Mat4Impl *)&v3);
  return v3;
}

- (void)setSpeed:(float)a3
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x203, 17, (unsigned __int8 *)&v3);
}

- (float)repeatCount
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0.0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x1CAu, (const CGAffineTransform *)0x11, (CA::Mat4Impl *)&v3);
  return v3;
}

- (void)setRepeatCount:(float)a3
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x1CA, 17, (unsigned __int8 *)&v3);
}

- (double)repeatDuration
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x1CBu, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v3);
  return *(double *)v3;
}

- (void)setRepeatDuration:(double)a3
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  *(double *)v3 = a3;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x1CB, 18, (unsigned __int8 *)v3);
}

- (BOOL)autoreverses
{
  char v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x2Fu, (const CGAffineTransform *)7, (CA::Mat4Impl *)&v3);
  return v3 != 0;
}

- (void)setAutoreverses:(BOOL)a3
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x2F, 7, (unsigned __int8 *)&v3);
}

- (NSString)fillMode
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0xDBu, (const CGAffineTransform *)3, (CA::Mat4Impl *)v3);
  return (NSString *)v3[0];
}

- (void)setFillMode:(id)a3
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = a3;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0xDB, 3, (unsigned __int8 *)v3);
}

- (NSString)name
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x184u, (const CGAffineTransform *)3, (CA::Mat4Impl *)v3);
  return (NSString *)v3[0];
}

- (void)setName:(NSString *)name
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = name;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x184, 3, (unsigned __int8 *)v3);
}

- (BOOL)isEnabled
{
  char v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0xD0u, (const CGAffineTransform *)7, (CA::Mat4Impl *)&v3);
  return v3 != 0;
}

- (void)setEnabled:(BOOL)enabled
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = enabled;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0xD0, 7, (unsigned __int8 *)&v3);
}

- (NSDictionary)style
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x216u, (const CGAffineTransform *)3, (CA::Mat4Impl *)v3);
  return (NSDictionary *)v3[0];
}

- (void)setStyle:(NSDictionary *)style
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = style;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x216, 3, (unsigned __int8 *)v3);
}

- (float)birthRate
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0.0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x3Bu, (const CGAffineTransform *)0x11, (CA::Mat4Impl *)&v3);
  return v3;
}

- (void)setBirthRate:(float)birthRate
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = birthRate;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x3B, 17, (unsigned __int8 *)&v3);
}

- (float)lifetime
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0.0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x152u, (const CGAffineTransform *)0x11, (CA::Mat4Impl *)&v3);
  return v3;
}

- (void)setLifetime:(float)lifetime
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = lifetime;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x152, 17, (unsigned __int8 *)&v3);
}

- (float)lifetimeRange
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0.0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x153u, (const CGAffineTransform *)0x11, (CA::Mat4Impl *)&v3);
  return v3;
}

- (void)setLifetimeRange:(float)lifetimeRange
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = lifetimeRange;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x153, 17, (unsigned __int8 *)&v3);
}

- (CGFloat)emissionLatitude
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0xC1u, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v3);
  return *(double *)v3;
}

- (void)setEmissionLatitude:(CGFloat)emissionLatitude
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  *(CGFloat *)v3 = emissionLatitude;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0xC1, 18, (unsigned __int8 *)v3);
}

- (CGFloat)emissionLongitude
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0xC2u, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v3);
  return *(double *)v3;
}

- (void)setEmissionLongitude:(CGFloat)emissionLongitude
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  *(CGFloat *)v3 = emissionLongitude;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0xC2, 18, (unsigned __int8 *)v3);
}

- (CGFloat)emissionRange
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0xC3u, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v3);
  return *(double *)v3;
}

- (void)setEmissionRange:(CGFloat)emissionRange
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  *(CGFloat *)v3 = emissionRange;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0xC3, 18, (unsigned __int8 *)v3);
}

- (CGFloat)velocity
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x242u, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v3);
  return *(double *)v3;
}

- (void)setVelocity:(CGFloat)velocity
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  *(CGFloat *)v3 = velocity;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x242, 18, (unsigned __int8 *)v3);
}

- (CGFloat)velocityRange
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x243u, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v3);
  return *(double *)v3;
}

- (void)setVelocityRange:(CGFloat)velocityRange
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  *(CGFloat *)v3 = velocityRange;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x243, 18, (unsigned __int8 *)v3);
}

- (CGFloat)xAcceleration
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x255u, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v3);
  return *(double *)v3;
}

- (void)setXAcceleration:(CGFloat)xAcceleration
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  *(CGFloat *)v3 = xAcceleration;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x255, 18, (unsigned __int8 *)v3);
}

- (CGFloat)yAcceleration
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x259u, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v3);
  return *(double *)v3;
}

- (void)setYAcceleration:(CGFloat)yAcceleration
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  *(CGFloat *)v3 = yAcceleration;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x259, 18, (unsigned __int8 *)v3);
}

- (CGFloat)zAcceleration
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x25Bu, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v3);
  return *(double *)v3;
}

- (void)setZAcceleration:(CGFloat)zAcceleration
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  *(CGFloat *)v3 = zAcceleration;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x25B, 18, (unsigned __int8 *)v3);
}

- (CGFloat)scale
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x1DBu, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v3);
  return *(double *)v3;
}

- (void)setScale:(CGFloat)scale
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  *(CGFloat *)v3 = scale;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x1DB, 18, (unsigned __int8 *)v3);
}

- (CGFloat)scaleRange
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x1DCu, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v3);
  return *(double *)v3;
}

- (void)setScaleRange:(CGFloat)scaleRange
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  *(CGFloat *)v3 = scaleRange;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x1DC, 18, (unsigned __int8 *)v3);
}

- (CGFloat)scaleSpeed
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x1DDu, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v3);
  return *(double *)v3;
}

- (void)setScaleSpeed:(CGFloat)scaleSpeed
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  *(CGFloat *)v3 = scaleSpeed;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x1DD, 18, (unsigned __int8 *)v3);
}

- (double)orientationLatitude
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x194u, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v3);
  return *(double *)v3;
}

- (void)setOrientationLatitude:(double)a3
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  *(double *)v3 = a3;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x194, 18, (unsigned __int8 *)v3);
}

- (double)orientationLongitude
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x195u, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v3);
  return *(double *)v3;
}

- (void)setOrientationLongitude:(double)a3
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  *(double *)v3 = a3;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x195, 18, (unsigned __int8 *)v3);
}

- (double)orientationRange
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x196u, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v3);
  return *(double *)v3;
}

- (void)setOrientationRange:(double)a3
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  *(double *)v3 = a3;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x196, 18, (unsigned __int8 *)v3);
}

- (double)rotation
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x1D6u, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v3);
  return *(double *)v3;
}

- (void)setRotation:(double)a3
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  *(double *)v3 = a3;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x1D6, 18, (unsigned __int8 *)v3);
}

- (double)rotationRange
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x1D8u, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v3);
  return *(double *)v3;
}

- (void)setRotationRange:(double)a3
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  *(double *)v3 = a3;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x1D8, 18, (unsigned __int8 *)v3);
}

- (CGFloat)spin
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x205u, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v3);
  return *(double *)v3;
}

- (void)setSpin:(CGFloat)spin
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  *(CGFloat *)v3 = spin;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x205, 18, (unsigned __int8 *)v3);
}

- (CGFloat)spinRange
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x207u, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v3);
  return *(double *)v3;
}

- (void)setSpinRange:(CGFloat)spinRange
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  *(CGFloat *)v3 = spinRange;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x207, 18, (unsigned __int8 *)v3);
}

- (CGColorRef)color
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x5Au, (const CGAffineTransform *)2, (CA::Mat4Impl *)v3);
  return (CGColorRef)v3[0];
}

- (void)setColor:(CGColorRef)color
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = color;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x5A, 2, (unsigned __int8 *)v3);
}

- (float)redRange
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0.0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x1C2u, (const CGAffineTransform *)0x11, (CA::Mat4Impl *)&v3);
  return v3;
}

- (void)setRedRange:(float)redRange
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = redRange;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x1C2, 17, (unsigned __int8 *)&v3);
}

- (float)redSpeed
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0.0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x1C3u, (const CGAffineTransform *)0x11, (CA::Mat4Impl *)&v3);
  return v3;
}

- (void)setRedSpeed:(float)redSpeed
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = redSpeed;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x1C3, 17, (unsigned __int8 *)&v3);
}

- (float)greenRange
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0.0;
  CAEmitterCell_getter((CA::Transaction *)self, 0xF5u, (const CGAffineTransform *)0x11, (CA::Mat4Impl *)&v3);
  return v3;
}

- (void)setGreenRange:(float)greenRange
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = greenRange;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0xF5, 17, (unsigned __int8 *)&v3);
}

- (float)greenSpeed
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0.0;
  CAEmitterCell_getter((CA::Transaction *)self, 0xF6u, (const CGAffineTransform *)0x11, (CA::Mat4Impl *)&v3);
  return v3;
}

- (void)setGreenSpeed:(float)greenSpeed
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = greenSpeed;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0xF6, 17, (unsigned __int8 *)&v3);
}

- (float)blueRange
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0.0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x3Eu, (const CGAffineTransform *)0x11, (CA::Mat4Impl *)&v3);
  return v3;
}

- (void)setBlueRange:(float)blueRange
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = blueRange;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x3E, 17, (unsigned __int8 *)&v3);
}

- (float)blueSpeed
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0.0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x3Fu, (const CGAffineTransform *)0x11, (CA::Mat4Impl *)&v3);
  return v3;
}

- (void)setBlueSpeed:(float)blueSpeed
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = blueSpeed;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x3F, 17, (unsigned __int8 *)&v3);
}

- (float)alphaRange
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0.0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x15u, (const CGAffineTransform *)0x11, (CA::Mat4Impl *)&v3);
  return v3;
}

- (void)setAlphaRange:(float)alphaRange
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = alphaRange;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x15, 17, (unsigned __int8 *)&v3);
}

- (float)alphaSpeed
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0.0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x16u, (const CGAffineTransform *)0x11, (CA::Mat4Impl *)&v3);
  return v3;
}

- (void)setAlphaSpeed:(float)alphaSpeed
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = alphaSpeed;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x16, 17, (unsigned __int8 *)&v3);
}

- (id)contents
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x75u, (const CGAffineTransform *)2, (CA::Mat4Impl *)v3);
  return (id)v3[0];
}

- (void)setContents:(id)contents
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = contents;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x75, 2, (unsigned __int8 *)v3);
}

- (CGRect)contentsRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  __int128 v6;
  double v7[3];
  uint64_t v8;
  CGRect result;

  v8 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  *(_OWORD *)v7 = 0u;
  CAEmitterCell_getter((CA::Transaction *)self, 0x85u, (const CGAffineTransform *)0x15, (CA::Mat4Impl *)&v6);
  v3 = *((double *)&v6 + 1);
  v2 = *(double *)&v6;
  v5 = v7[1];
  v4 = v7[0];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setContentsRect:(CGRect)contentsRect
{
  CGRect v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = contentsRect;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x85, 21, (unsigned __int8 *)&v3);
}

- (CGFloat)contentsScale
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x86u, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v3);
  return *(double *)v3;
}

- (void)setContentsScale:(CGFloat)contentsScale
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  *(CGFloat *)v3 = contentsScale;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x86, 18, (unsigned __int8 *)v3);
}

- (NSString)magnificationFilter
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x16Cu, (const CGAffineTransform *)3, (CA::Mat4Impl *)v3);
  return (NSString *)v3[0];
}

- (void)setMagnificationFilter:(NSString *)magnificationFilter
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = magnificationFilter;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x16C, 3, (unsigned __int8 *)v3);
}

- (NSString)minificationFilter
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x17Cu, (const CGAffineTransform *)3, (CA::Mat4Impl *)v3);
  return (NSString *)v3[0];
}

- (void)setMinificationFilter:(NSString *)minificationFilter
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = minificationFilter;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x17C, 3, (unsigned __int8 *)v3);
}

- (float)minificationFilterBias
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0.0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x17Du, (const CGAffineTransform *)0x11, (CA::Mat4Impl *)&v3);
  return v3;
}

- (void)setMinificationFilterBias:(float)minificationFilterBias
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = minificationFilterBias;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x17D, 17, (unsigned __int8 *)&v3);
}

- (NSArray)emitterCells
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0xC5u, (const CGAffineTransform *)3, (CA::Mat4Impl *)v3);
  return (NSArray *)v3[0];
}

- (void)setEmitterCells:(NSArray *)emitterCells
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = emitterCells;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0xC5, 3, (unsigned __int8 *)v3);
}

+ (CAEmitterCell)emitterCell
{
  return (CAEmitterCell *)objc_alloc_init((Class)a1);
}

+ (id)defaultValueForKey:(NSString *)key
{
  int v3;
  id result;
  void *v5;
  uint64_t v6;
  CGColorSpace *v7;

  v3 = CAInternAtom((const __CFString *)key, 0);
  if (v3 > 207)
  {
    if (v3 > 379)
    {
      if (v3 <= 474)
      {
        if (v3 == 380)
        {
          if (dyld_program_sdk_at_least())
            return CFSTR("linear");
          else
            return CFSTR("trilinear");
        }
        if (v3 == 413)
          return CFSTR("sprite");
        return 0;
      }
      if (v3 != 475 && v3 != 515)
        return 0;
    }
    else
    {
      if (v3 <= 363)
      {
        if (v3 == 208)
          return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
        if (v3 == 219)
          return CFSTR("removed");
        return 0;
      }
      if (v3 == 364)
        return CFSTR("linear");
      if (v3 != 370)
        return 0;
    }
LABEL_21:
    v5 = (void *)MEMORY[0x1E0CB37E8];
    v6 = 1;
    return (id)objc_msgSend(v5, "numberWithInt:", v6);
  }
  switch(v3)
  {
    case 125:
    case 127:
      return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1);
    case 126:
      return CFSTR("single");
    case 128:
      v5 = (void *)MEMORY[0x1E0CB37E8];
      v6 = 0;
      return (id)objc_msgSend(v5, "numberWithInt:", v6);
    case 129:
    case 130:
    case 131:
    case 132:
      return 0;
    case 133:
      return (id)objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", 0.0, 0.0, 1.0, 1.0);
    case 134:
      goto LABEL_21;
    default:
      if (v3 == 90)
      {
        result = (id)+[CAEmitterCell defaultValueForKey:]::white;
        if (!+[CAEmitterCell defaultValueForKey:]::white)
        {
          v7 = (CGColorSpace *)CAGetColorSpace(0x1Du);
          result = CGColorCreate(v7, +[CAEmitterCell defaultValueForKey:]::values);
          +[CAEmitterCell defaultValueForKey:]::white = (uint64_t)result;
        }
      }
      else
      {
        if (v3 != 187)
          return 0;
        result = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", INFINITY);
      }
      break;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  return CAObject_automaticallyNotifiesObserversForKey(v4, (const __CFString *)a3);
}

+ (BOOL)CA_automaticallyNotifiesObservers:(Class)a3
{
  return objc_opt_class() != (_QWORD)a3;
}

+ (void)CAMLParserStartElement:(id)a3
{
  id v4;

  v4 = objc_alloc_init((Class)a1);
  objc_msgSend(a3, "setElementValue:", v4);

}

- (NSString)particleType
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x19Du, (const CGAffineTransform *)3, (CA::Mat4Impl *)v3);
  return (NSString *)v3[0];
}

- (void)setParticleType:(id)a3
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = a3;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x19D, 3, (unsigned __int8 *)v3);
}

- (float)mass
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0.0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x172u, (const CGAffineTransform *)0x11, (CA::Mat4Impl *)&v3);
  return v3;
}

- (void)setMass:(float)a3
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x172, 17, (unsigned __int8 *)&v3);
}

- (float)massRange
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0.0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x173u, (const CGAffineTransform *)0x11, (CA::Mat4Impl *)&v3);
  return v3;
}

- (void)setMassRange:(float)a3
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x173, 17, (unsigned __int8 *)&v3);
}

- (NSArray)emitterBehaviors
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0xC4u, (const CGAffineTransform *)3, (CA::Mat4Impl *)v3);
  return (NSArray *)v3[0];
}

- (void)setEmitterBehaviors:(id)a3
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = a3;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0xC4, 3, (unsigned __int8 *)v3);
}

- (NSString)contentsFrameMode
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x7Eu, (const CGAffineTransform *)3, (CA::Mat4Impl *)v3);
  return (NSString *)v3[0];
}

- (void)setContentsFrameMode:(id)a3
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = a3;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x7E, 3, (unsigned __int8 *)v3);
}

- (unsigned)contentsFrameCount
{
  unsigned int v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x7Du, (const CGAffineTransform *)0xC, (CA::Mat4Impl *)&v3);
  return v3;
}

- (void)setContentsFrameCount:(unsigned int)a3
{
  unsigned int v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x7D, 12, (unsigned __int8 *)&v3);
}

- (unsigned)contentsFramesPerRow
{
  unsigned int v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x7Fu, (const CGAffineTransform *)0xC, (CA::Mat4Impl *)&v3);
  return v3;
}

- (void)setContentsFramesPerRow:(unsigned int)a3
{
  unsigned int v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x7F, 12, (unsigned __int8 *)&v3);
}

- (float)contentsFramesPerSecond
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0.0;
  CAEmitterCell_getter((CA::Transaction *)self, 0x80u, (const CGAffineTransform *)0x11, (CA::Mat4Impl *)&v3);
  return v3;
}

- (void)setContentsFramesPerSecond:(float)a3
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CAEmitterCell_setter((CA::Transaction *)self, (const void *)0x80, 17, (unsigned __int8 *)&v3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  CA::Transaction *v4;
  const void *v5;
  id v6;
  int v7;
  CA::AttrList *v8;
  CA::AttrList *v9;
  uint64_t v10;
  char *state;
  unsigned int *v12;
  unsigned int v13;
  unsigned int v15;

  v4 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v4)
    v4 = (CA::Transaction *)CA::Transaction::create((CA::Transaction *)self);
  v6 = objc_alloc_init((Class)objc_opt_class());
  if (v6)
  {
    v7 = *((_DWORD *)v4 + 25);
    *((_DWORD *)v4 + 25) = v7 + 1;
    if (!v7)
      os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
    v8 = (CA::AttrList *)*((_QWORD *)v6 + 1);
    if (v8)
      CA::AttrList::free(v8, v5);
    v9 = (CA::AttrList *)self->_attr[0];
    if (v9)
    {
      v10 = *((_QWORD *)v9 + 1) & 7;
      if ((_DWORD)v10 == 7)
        v9 = (CA::AttrList *)CA::AttrList::copy_(v9);
      else
        *((_QWORD *)v9 + 1) = *((_QWORD *)v9 + 1) & 0xFFFFFFFFFFFFFFF8 | (v10 + 1);
    }
    *((_QWORD *)v6 + 1) = v9;
    state = (char *)self->_state;
    if (state)
    {
      v12 = (unsigned int *)(state + 8);
      do
        v13 = __ldaxr(v12);
      while (__stlxr(v13 + 1, v12));
      if (!v13)
      {
        state = 0;
        do
          v15 = __ldaxr(v12);
        while (__stlxr(v15 - 1, v12));
      }
    }
    *((_QWORD *)v6 + 3) = state;
    *((_DWORD *)v6 + 8) = self->_flags;
    CA::Transaction::unlock(v4);
  }
  return v6;
}

@end
