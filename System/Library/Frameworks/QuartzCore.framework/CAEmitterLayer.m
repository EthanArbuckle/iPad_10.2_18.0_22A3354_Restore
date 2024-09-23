@implementation CAEmitterLayer

+ (id)defaultValueForKey:(id)a3
{
  int v5;
  void *v6;
  double v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = CAInternAtom((const __CFString *)a3, 0);
  if (v5 > 203)
  {
    if (v5 > 474)
    {
      if (v5 == 475 || v5 == 517 || v5 == 578)
        return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
    }
    else
    {
      switch(v5)
      {
        case 204:
          return CFSTR("point");
        case 338:
          return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
        case 457:
          return CFSTR("unordered");
      }
    }
  }
  else
  {
    if (v5 <= 155)
    {
      if (v5 != 59)
      {
        if (v5 == 154)
        {
          v6 = (void *)MEMORY[0x1E0CB37E8];
          v7 = INFINITY;
          return (id)objc_msgSend(v6, "numberWithDouble:", v7);
        }
        if (v5 == 155)
        {
          v6 = (void *)MEMORY[0x1E0CB37E8];
          v7 = -INFINITY;
          return (id)objc_msgSend(v6, "numberWithDouble:", v7);
        }
        goto LABEL_24;
      }
      return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
    }
    switch(v5)
    {
      case 156:
        return (id)objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", *MEMORY[0x1E0C9D5E0], *(double *)(MEMORY[0x1E0C9D5E0] + 8), *(double *)(MEMORY[0x1E0C9D5E0] + 16), *(double *)(MEMORY[0x1E0C9D5E0] + 24));
      case 199:
        return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
      case 200:
        return CFSTR("volume");
    }
  }
LABEL_24:
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___CAEmitterLayer;
  return objc_msgSendSuper2(&v9, sel_defaultValueForKey_, a3);
}

+ (BOOL)_hasRenderLayerSubclass
{
  return 1;
}

+ (BOOL)CA_automaticallyNotifiesObservers:(Class)a3
{
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((Class)objc_opt_class() == a3)
    return 0;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CAEmitterLayer;
  return objc_msgSendSuper2(&v6, sel_CA_automaticallyNotifiesObservers_, a3);
}

- (void)didChangeValueForKey:(id)a3
{
  int v5;
  CA::Transaction *v6;
  CA::Transaction *v7;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = CAInternAtom((const __CFString *)a3, 0);
  v6 = (CA::Transaction *)CAAtomIndexInArray(24, (uint64_t)&-[CAEmitterLayer didChangeValueForKey:]::atoms, v5);
  if (v6 != (CA::Transaction *)-1)
  {
    v7 = CA::Transaction::ensure_compat(v6);
    CA::Layer::set_commit_needed((CA::Layer *)self->super._attr.layer, v7, 0x10000);
  }
  v8.receiver = self;
  v8.super_class = (Class)CAEmitterLayer;
  -[CAEmitterLayer didChangeValueForKey:](&v8, sel_didChangeValueForKey_, a3);
}

- (void)reloadValueForKeyPath:(id)a3
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  CA::Transaction *v9;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a3, "rangeOfString:", CFSTR("."));
  v6 = a3;
  if (v7)
    v6 = (id)objc_msgSend(a3, "substringToIndex:", v5);
  v8 = objc_msgSend(v6, "isEqualToString:", CFSTR("emitterCells"));
  if ((v8 & 1) != 0 || (v8 = objc_msgSend(v6, "isEqualToString:", CFSTR("emitterBehaviors")), (_DWORD)v8))
  {
    v9 = CA::Transaction::ensure_compat((CA::Transaction *)v8);
    CA::Layer::set_commit_needed((CA::Layer *)self->super._attr.layer, v9, 0x10000);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)CAEmitterLayer;
    -[CALayer reloadValueForKeyPath:](&v10, sel_reloadValueForKeyPath_, a3);
  }
}

- (id)implicitAnimationForKeyPath:(id)a3
{
  id result;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)CAEmitterLayer;
  result = -[CALayer implicitAnimationForKeyPath:](&v9, sel_implicitAnimationForKeyPath_);
  if (!result)
  {
    v6 = objc_msgSend(a3, "rangeOfString:", CFSTR("."));
    if (v7)
    {
      v8 = 0;
      if ((CAInternAtom((const __CFString *)objc_msgSend(a3, "substringToIndex:", v6), 0) & 0xFFFFFFFE) != 0xC4)
        return 0;
    }
    else
    {
      v8 = CAInternAtom((const __CFString *)a3, 0);
      if (CAAtomIndexInArray(14, (uint64_t)&-[CAEmitterLayer implicitAnimationForKeyPath:]::atoms, v8) == -1)
        return 0;
    }
    return CALayerCreateImplicitAnimation((CAMediaTimingFunction *)self, a3, v8);
  }
  return result;
}

- (void)_copyRenderLayer:(void *)a3 layerFlags:(unsigned int)a4 commitFlags:(unsigned int *)a5
{
  void *v6;
  malloc_zone_t *malloc_zone;
  char *v8;
  unsigned int *v9;
  _DWORD *v10;
  int v11;
  int v12;
  int v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  int v20;
  int v21;
  int v22;
  int v23;
  double x;
  double y;
  double width;
  double height;
  float v28;
  float v29;
  float v30;
  float v31;
  double v32;
  double v33;
  NSArray *v34;
  unsigned int *v35;
  unsigned int *v36;
  unsigned int *v37;
  unsigned int v38;
  unsigned int v39;
  unsigned int *v40;
  unsigned int v41;
  unsigned int *v42;
  unsigned int v43;
  unsigned int *v44;
  unsigned int v45;
  unsigned int v46;
  NSArray *v47;
  unsigned int *v48;
  unsigned int *v49;
  unsigned int *v50;
  unsigned int v51;
  unsigned int v52;
  unsigned int *v53;
  unsigned int v54;
  unsigned int *v55;
  unsigned int v56;
  unsigned int *v57;
  unsigned int v58;
  unsigned int v59;
  CGPath *v60;
  const CGPath *v61;
  int8x16_t *v62;
  int8x16_t *v63;
  unsigned int *v64;
  unsigned int *v65;
  unsigned int v66;
  unsigned int v67;
  NSArray *v68;
  NSArray *v69;
  uint64_t v70;
  const double *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  _DWORD *v76;
  double v77;
  uint64_t v78;
  double *v79;
  double v80;
  double v81;
  uint64_t v82;
  uint64_t v83;
  unsigned int *v84;
  unsigned int *v85;
  unsigned int v86;
  unsigned int v87;
  const __CFString *v88;
  const __CFString *v89;
  const __CFString *v90;
  uint64_t v91;
  unsigned int v92;
  unsigned int v93;
  _DWORD *v95;
  id v96;
  char *v97;
  objc_super v99;
  _BYTE v100[128];
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  uint64_t v105;
  CGRect v106;

  v105 = *MEMORY[0x1E0C80C00];
  v99.receiver = self;
  v99.super_class = (Class)CAEmitterLayer;
  v96 = -[CALayer _copyRenderLayer:layerFlags:commitFlags:](&v99, sel__copyRenderLayer_layerFlags_commitFlags_, a3, *(_QWORD *)&a4);
  v6 = v96;
  if (v96)
  {
    if ((*((_BYTE *)a5 + 2) & 1) != 0)
    {
      malloc_zone = (malloc_zone_t *)get_malloc_zone();
      v8 = (char *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0xA8uLL, 0x743898A5uLL);
      if (v8)
      {
        *((_DWORD *)v8 + 2) = 1;
        v9 = (unsigned int *)(v8 + 8);
        *((_DWORD *)v8 + 3) = 15;
        ++dword_1ECDC7C64;
        *(_QWORD *)v8 = off_1E15967E8;
        *(_OWORD *)(v8 + 24) = 0u;
        *(_OWORD *)(v8 + 40) = 0u;
        *((_QWORD *)v8 + 7) = 0;
        *((_QWORD *)v8 + 8) = 0x24E000001ABLL;
        *((_DWORD *)v8 + 18) = 567;
        *(_OWORD *)(v8 + 76) = 0u;
        v10 = v8 + 76;
        *((_QWORD *)v8 + 20) = 0;
        *(_OWORD *)(v8 + 92) = 0u;
        *(_OWORD *)(v8 + 108) = 0u;
        *(_OWORD *)(v8 + 124) = 0u;
        *(_OWORD *)(v8 + 140) = 0u;
        v97 = v8;
        *((_QWORD *)v8 + 2) = self;
        -[CAEmitterLayer birthRate](self, "birthRate");
        *v10 = v11;
        -[CAEmitterLayer lifetime](self, "lifetime");
        *((_DWORD *)v97 + 20) = v12;
        -[CAEmitterLayer emitterDuration](self, "emitterDuration");
        *((_DWORD *)v97 + 21) = v13;
        -[CAEmitterLayer emitterPosition](self, "emitterPosition");
        *(float *)&v14 = v14;
        *(float *)&v15 = v15;
        *((_DWORD *)v97 + 22) = LODWORD(v14);
        *((_DWORD *)v97 + 23) = LODWORD(v15);
        -[CAEmitterLayer emitterZPosition](self, "emitterZPosition");
        *(float *)&v16 = v16;
        *((_DWORD *)v97 + 24) = LODWORD(v16);
        -[CAEmitterLayer emitterSize](self, "emitterSize");
        *(float *)&v17 = v17;
        *(float *)&v18 = v18;
        *((_DWORD *)v97 + 25) = LODWORD(v17);
        *((_DWORD *)v97 + 26) = LODWORD(v18);
        -[CAEmitterLayer emitterDepth](self, "emitterDepth");
        *(float *)&v19 = v19;
        *((_DWORD *)v97 + 27) = LODWORD(v19);
        -[CAEmitterLayer velocity](self, "velocity");
        *((_DWORD *)v97 + 28) = v20;
        -[CAEmitterLayer scale](self, "scale");
        *((_DWORD *)v97 + 29) = v21;
        -[CAEmitterLayer spin](self, "spin");
        *((_DWORD *)v97 + 30) = v22;
        -[CAEmitterLayer spinBias](self, "spinBias");
        *((_DWORD *)v97 + 31) = v23;
        -[CAEmitterLayer cullRect](self, "cullRect");
        x = v106.origin.x;
        y = v106.origin.y;
        width = v106.size.width;
        height = v106.size.height;
        if (CGRectIsInfinite(v106))
        {
          v28 = INFINITY;
          v29 = -INFINITY;
          v30 = -INFINITY;
          v31 = INFINITY;
        }
        else
        {
          v29 = x;
          v30 = y;
          v28 = x + width;
          v31 = y + height;
        }
        *((float *)v97 + 32) = v29;
        *((float *)v97 + 33) = v30;
        *((float *)v97 + 34) = v28;
        *((float *)v97 + 35) = v31;
        -[CAEmitterLayer cullMinZ](self, "cullMinZ");
        *(float *)&v32 = v32;
        *((_DWORD *)v97 + 36) = LODWORD(v32);
        -[CAEmitterLayer cullMaxZ](self, "cullMaxZ");
        *(float *)&v33 = v33;
        *((_DWORD *)v97 + 37) = LODWORD(v33);
        v34 = -[CAEmitterLayer emitterCells](self, "emitterCells");
        if (v34)
        {
          v35 = CA::Render::copy_render_array((const __CFArray *)v34, 14);
          v36 = (unsigned int *)*((_QWORD *)v97 + 4);
          if (v36 != v35)
          {
            if (v36)
            {
              v37 = v36 + 2;
              do
              {
                v38 = __ldaxr(v37);
                v39 = v38 - 1;
              }
              while (__stlxr(v39, v37));
              if (!v39)
                (*(void (**)(unsigned int *))(*(_QWORD *)v36 + 16))(v36);
            }
            if (v35)
            {
              v40 = v35 + 2;
              do
                v41 = __ldaxr(v40);
              while (__stlxr(v41 + 1, v40));
              v42 = v35;
              if (!v41)
              {
                v42 = 0;
                do
                  v43 = __ldaxr(v40);
                while (__stlxr(v43 - 1, v40));
              }
            }
            else
            {
              v42 = 0;
            }
            *((_QWORD *)v97 + 4) = v42;
          }
          if (v35)
          {
            v44 = v35 + 2;
            do
            {
              v45 = __ldaxr(v44);
              v46 = v45 - 1;
            }
            while (__stlxr(v46, v44));
            if (!v46)
              (*(void (**)(unsigned int *))(*(_QWORD *)v35 + 16))(v35);
          }
        }
        v47 = -[CAEmitterLayer emitterBehaviors](self, "emitterBehaviors");
        if (v47)
        {
          v48 = CA::Render::copy_render_array((const __CFArray *)v47, 13);
          v49 = (unsigned int *)*((_QWORD *)v97 + 5);
          if (v49 != v48)
          {
            if (v49)
            {
              v50 = v49 + 2;
              do
              {
                v51 = __ldaxr(v50);
                v52 = v51 - 1;
              }
              while (__stlxr(v52, v50));
              if (!v52)
                (*(void (**)(unsigned int *))(*(_QWORD *)v49 + 16))(v49);
            }
            if (v48)
            {
              v53 = v48 + 2;
              do
                v54 = __ldaxr(v53);
              while (__stlxr(v54 + 1, v53));
              v55 = v48;
              if (!v54)
              {
                v55 = 0;
                do
                  v56 = __ldaxr(v53);
                while (__stlxr(v56 - 1, v53));
              }
            }
            else
            {
              v55 = 0;
            }
            *((_QWORD *)v97 + 5) = v55;
          }
          if (v48)
          {
            v57 = v48 + 2;
            do
            {
              v58 = __ldaxr(v57);
              v59 = v58 - 1;
            }
            while (__stlxr(v59, v57));
            if (!v59)
              (*(void (**)(unsigned int *))(*(_QWORD *)v48 + 16))(v48);
          }
        }
        v60 = -[CAEmitterLayer emitterPath](self, "emitterPath");
        if (v60)
        {
          v62 = CA::Render::Path::new_path(v60, v61);
          if (v62)
          {
            v63 = v62;
            v64 = (unsigned int *)*((_QWORD *)v97 + 6);
            *((_QWORD *)v97 + 6) = v63;
            if (v64)
            {
              v65 = v64 + 2;
              do
              {
                v66 = __ldaxr(v65);
                v67 = v66 - 1;
              }
              while (__stlxr(v67, v65));
              if (!v67)
                (*(void (**)(unsigned int *))(*(_QWORD *)v64 + 16))(v64);
            }
          }
        }
        v68 = -[CAEmitterLayer emitterRects](self, "emitterRects");
        v69 = v68;
        if (v68)
        {
          v70 = -[NSArray count](v68, "count");
          v95 = CA::Render::Vector::new_vector((CA::Render::Vector *)(5 * v70), 0, v71);
          if (v95)
          {
            v103 = 0u;
            v104 = 0u;
            v101 = 0u;
            v102 = 0u;
            v72 = -[NSArray countByEnumeratingWithState:objects:count:](v69, "countByEnumeratingWithState:objects:count:", &v101, v100, 16);
            if (v72)
            {
              v73 = 0;
              v74 = *(_QWORD *)v102;
              v75 = (uint64_t)&v95[8 * v70 + 6];
              v76 = v95 + 12;
              v77 = 0.0;
              do
              {
                v78 = 0;
                v79 = (double *)&v76[8 * v73];
                do
                {
                  if (*(_QWORD *)v102 != v74)
                    objc_enumerationMutation(v69);
                  objc_msgSend(*(id *)(*((_QWORD *)&v101 + 1) + 8 * v78), "rectValue", v95);
                  v77 = v77 + v80 * v81;
                  *((_QWORD *)v79 - 3) = v82;
                  *((_QWORD *)v79 - 2) = v83;
                  *(v79 - 1) = v80;
                  *v79 = v81;
                  *(double *)(v75 + 8 * v73 + 8 * v78++) = v77;
                  v79 += 4;
                }
                while (v72 != v78);
                v72 = -[NSArray countByEnumeratingWithState:objects:count:](v69, "countByEnumeratingWithState:objects:count:", &v101, v100, 16);
                v73 += v78;
              }
              while (v72);
            }
            v84 = (unsigned int *)*((_QWORD *)v97 + 7);
            *((_QWORD *)v97 + 7) = v95;
            if (v84)
            {
              v85 = v84 + 2;
              do
              {
                v86 = __ldaxr(v85);
                v87 = v86 - 1;
              }
              while (__stlxr(v87, v85));
              if (!v87)
                (*(void (**)(unsigned int *))(*(_QWORD *)v84 + 16))(v84);
            }
          }
        }
        v88 = -[CAEmitterLayer emitterShape](self, "emitterShape", v95);
        if (v88)
          *((_DWORD *)v97 + 16) = CAInternAtom(v88, 0);
        v89 = -[CAEmitterLayer emitterMode](self, "emitterMode");
        if (v89)
          *((_DWORD *)v97 + 17) = CAInternAtom(v89, 0);
        v90 = -[CAEmitterLayer renderMode](self, "renderMode");
        if (v90)
          *((_DWORD *)v97 + 18) = CAInternAtom(v90, 0);
        if (-[CAEmitterLayer preservesDepth](self, "preservesDepth"))
          *((_DWORD *)v97 + 3) |= 0x100u;
        *((_DWORD *)v97 + 38) = -[CAEmitterLayer seed](self, "seed");
        -[CAEmitterLayer updateInterval](self, "updateInterval");
        *((_QWORD *)v97 + 20) = v91;
        CA::Render::Layer::set_subclass((unsigned int *)v96, (CA::Render::LayerSubclass *)v97);
        do
        {
          v92 = __ldaxr(v9);
          v93 = v92 - 1;
        }
        while (__stlxr(v93, v9));
        v6 = v96;
        if (!v93)
          (*(void (**)(char *))(*(_QWORD *)v97 + 16))(v97);
      }
    }
  }
  return v6;
}

- (void)_colorSpaceDidChange
{
  CA::Transaction *v3;
  CA::Transaction *v4;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)CAEmitterLayer;
  v3 = (CA::Transaction *)-[CALayer _colorSpaceDidChange](&v5, sel__colorSpaceDidChange);
  v4 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v4)
    v4 = (CA::Transaction *)CA::Transaction::create(v3);
  CA::Layer::set_commit_needed((CA::Layer *)self->super._attr.layer, v4, 0x10000);
}

- (BOOL)_renderLayerDefinesProperty:(unsigned int)a3
{
  uint64_t v3;
  objc_super v6;
  uint64_t v7;

  v3 = *(_QWORD *)&a3;
  v7 = *MEMORY[0x1E0C80C00];
  if (CAAtomIndexInArray(23, (uint64_t)&defines_property::atoms, a3) != -1)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)CAEmitterLayer;
  return -[CALayer _renderLayerDefinesProperty:](&v6, sel__renderLayerDefinesProperty_, v3);
}

- (unsigned)_renderLayerPropertyAnimationFlags:(unsigned int)a3
{
  uint64_t v3;
  objc_super v6;
  uint64_t v7;

  v3 = *(_QWORD *)&a3;
  v7 = *MEMORY[0x1E0C80C00];
  if (CAAtomIndexInArray(23, (uint64_t)&defines_property::atoms, a3) != -1)
    return 32;
  v6.receiver = self;
  v6.super_class = (Class)CAEmitterLayer;
  return -[CALayer _renderLayerPropertyAnimationFlags:](&v6, sel__renderLayerPropertyAnimationFlags_, v3);
}

- (BOOL)CA_validateValue:(id)a3 forKey:(id)a4
{
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (a3
    && (objc_msgSend(a4, "isEqualToString:", CFSTR("emitterCells"))
     || objc_msgSend(a4, "isEqualToString:", CFSTR("emitterRects"))
     || objc_msgSend(a4, "isEqualToString:", CFSTR("emitterBehaviors"))))
  {
    objc_opt_class();
    return CAObject_validateArrayOfClass(a3);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CAEmitterLayer;
    return -[CALayer CA_validateValue:forKey:](&v8, sel_CA_validateValue_forKey_, a3, a4);
  }
}

- (NSArray)emitterCells
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0xC5u, (const CGAffineTransform *)3, v3);
  return (NSArray *)v3[0];
}

- (void)setEmitterCells:(NSArray *)emitterCells
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3[0] = emitterCells;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0xC5, (const CGAffineTransform *)3, v3);
}

- (float)birthRate
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0.0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x3Bu, (const CGAffineTransform *)0x11, (id *)&v3);
  return v3;
}

- (void)setBirthRate:(float)birthRate
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = birthRate;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x3B, (const CGAffineTransform *)0x11, (double *)&v3);
}

- (float)lifetime
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0.0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x152u, (const CGAffineTransform *)0x11, (id *)&v3);
  return v3;
}

- (void)setLifetime:(float)lifetime
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = lifetime;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x152, (const CGAffineTransform *)0x11, (double *)&v3);
}

- (CAEmitterLayerEmitterShape)emitterShape
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0xCCu, (const CGAffineTransform *)3, v3);
  return (CAEmitterLayerEmitterShape)v3[0];
}

- (void)setEmitterShape:(CAEmitterLayerEmitterShape)emitterShape
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3[0] = emitterShape;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0xCC, (const CGAffineTransform *)3, v3);
}

- (CAEmitterLayerEmitterMode)emitterMode
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0xC8u, (const CGAffineTransform *)3, v3);
  return (CAEmitterLayerEmitterMode)v3[0];
}

- (void)setEmitterMode:(CAEmitterLayerEmitterMode)emitterMode
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3[0] = emitterMode;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0xC8, (const CGAffineTransform *)3, v3);
}

- (CGPoint)emitterPosition
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
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0xCAu, (const CGAffineTransform *)0x13, (id *)&v4);
  v2 = v4;
  v3 = v5;
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setEmitterPosition:(CGPoint)emitterPosition
{
  CGPoint v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = emitterPosition;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0xCA, (const CGAffineTransform *)0x13, &v3.x);
}

- (CGFloat)emitterZPosition
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0xCEu, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (void)setEmitterZPosition:(CGFloat)emitterZPosition
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  v3[0] = emitterZPosition;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0xCE, (const CGAffineTransform *)0x12, v3);
}

- (CGSize)emitterSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  uint64_t v6;
  CGSize result;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = 0.0;
  v5 = 0.0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0xCDu, (const CGAffineTransform *)0x14, (id *)&v4);
  v2 = v4;
  v3 = v5;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setEmitterSize:(CGSize)emitterSize
{
  CGSize v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = emitterSize;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0xCD, (const CGAffineTransform *)0x14, &v3.width);
}

- (CGFloat)emitterDepth
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0xC6u, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (void)setEmitterDepth:(CGFloat)emitterDepth
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  v3[0] = emitterDepth;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0xC6, (const CGAffineTransform *)0x12, v3);
}

- (float)velocity
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0.0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x242u, (const CGAffineTransform *)0x11, (id *)&v3);
  return v3;
}

- (void)setVelocity:(float)velocity
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = velocity;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x242, (const CGAffineTransform *)0x11, (double *)&v3);
}

- (float)scale
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0.0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x1DBu, (const CGAffineTransform *)0x11, (id *)&v3);
  return v3;
}

- (void)setScale:(float)scale
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = scale;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x1DB, (const CGAffineTransform *)0x11, (double *)&v3);
}

- (float)spin
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0.0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x205u, (const CGAffineTransform *)0x11, (id *)&v3);
  return v3;
}

- (void)setSpin:(float)spin
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = spin;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x205, (const CGAffineTransform *)0x11, (double *)&v3);
}

- (CAEmitterLayerRenderMode)renderMode
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x1C9u, (const CGAffineTransform *)3, v3);
  return (CAEmitterLayerRenderMode)v3[0];
}

- (void)setRenderMode:(CAEmitterLayerRenderMode)renderMode
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3[0] = renderMode;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x1C9, (const CGAffineTransform *)3, v3);
}

- (BOOL)preservesDepth
{
  char v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x1B4u, (const CGAffineTransform *)7, (id *)&v3);
  return v3 != 0;
}

- (void)setPreservesDepth:(BOOL)preservesDepth
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = preservesDepth;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x1B4, (const CGAffineTransform *)7, (double *)&v3);
}

- (unsigned)seed
{
  unsigned int v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x1E3u, (const CGAffineTransform *)0xC, (id *)&v3);
  return v3;
}

- (void)setSeed:(unsigned int)seed
{
  unsigned int v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = seed;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x1E3, (const CGAffineTransform *)0xC, (double *)&v3);
}

- (void)setEmitterPath:(CGPath *)a3
{
  const CGPath *v5;
  double v6[2];

  v6[1] = *(double *)MEMORY[0x1E0C80C00];
  if ((dyld_program_sdk_at_least() & 1) != 0)
  {
    v5 = (const CGPath *)MEMORY[0x186DBC640](a3);
    *(_QWORD *)&v6[0] = v5;
    CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0xC9, (const CGAffineTransform *)2, v6);
    CGPathRelease(v5);
  }
  else
  {
    *(_QWORD *)&v6[0] = a3;
    CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0xC9, (const CGAffineTransform *)2, v6);
  }
}

- (CGPath)emitterPath
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0xC9u, (const CGAffineTransform *)2, v3);
  return (CGPath *)v3[0];
}

- (NSArray)emitterRects
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0xCBu, (const CGAffineTransform *)3, v3);
  return (NSArray *)v3[0];
}

- (void)setEmitterRects:(id)a3
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0xCB, (const CGAffineTransform *)3, v3);
}

- (NSArray)emitterBehaviors
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0xC4u, (const CGAffineTransform *)3, v3);
  return (NSArray *)v3[0];
}

- (void)setEmitterBehaviors:(id)a3
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0xC4, (const CGAffineTransform *)3, v3);
}

- (float)emitterDuration
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0.0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0xC7u, (const CGAffineTransform *)0x11, (id *)&v3);
  return v3;
}

- (void)setEmitterDuration:(float)a3
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0xC7, (const CGAffineTransform *)0x11, (double *)&v3);
}

- (double)updateInterval
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x239u, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (void)setUpdateInterval:(double)a3
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x239, (const CGAffineTransform *)0x12, v3);
}

- (float)spinBias
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0.0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x206u, (const CGAffineTransform *)0x11, (id *)&v3);
  return v3;
}

- (void)setSpinBias:(float)a3
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x206, (const CGAffineTransform *)0x11, (double *)&v3);
}

- (CGRect)cullRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = CALayer_getter_kCAValueRect((CA::Transaction *)self->super._attr.layer, 0x9Cu);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setCullRect:(CGRect)a3
{
  CGRect v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x9C, (const CGAffineTransform *)0x15, &v3.origin.x);
}

- (double)cullMinZ
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x9Bu, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (void)setCullMinZ:(double)a3
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x9B, (const CGAffineTransform *)0x12, v3);
}

- (double)cullMaxZ
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x9Au, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (void)setCullMaxZ:(double)a3
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x9A, (const CGAffineTransform *)0x12, v3);
}

@end
