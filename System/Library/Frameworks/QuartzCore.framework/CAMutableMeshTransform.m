@implementation CAMutableMeshTransform

- (void)setSubdivisionSteps:(int)a3
{
  _DWORD *impl;

  self->super._subdivisionSteps = a3;
  impl = self->super._impl;
  if (impl)
  {
    impl[24] = self->super._normalization;
    impl[25] = a3;
    *((_BYTE *)impl + 108) = self->super._replicatesEdges;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CAMeshTransform _initWithMeshTransform:]([CAMeshTransform alloc], "_initWithMeshTransform:", self);
}

- (CAMutableMeshTransform)init
{
  int64x2_t *v2;
  malloc_zone_t *malloc_zone;
  char *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)CAMutableMeshTransform;
  v2 = -[CAMeshTransform _init](&v6, sel__init);
  if (v2)
  {
    malloc_zone = (malloc_zone_t *)get_malloc_zone();
    v4 = (char *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0xD0uLL, 0x743898A5uLL);
    if (v4)
    {
      *((_DWORD *)v4 + 2) = 1;
      ++dword_1ECDC7CAC;
      *(_QWORD *)v4 = off_1E1597170;
      *(_QWORD *)(v4 + 12) = 33;
      *(_OWORD *)(v4 + 84) = 0u;
      *(_OWORD *)(v4 + 72) = 0u;
      *(_OWORD *)(v4 + 56) = 0u;
      *(_OWORD *)(v4 + 40) = 0u;
      *(_OWORD *)(v4 + 24) = 0u;
      *((_DWORD *)v4 + 26) = 0;
      v4[108] = 0;
      *((_QWORD *)v4 + 25) = 0;
      v2->i64[1] = (uint64_t)v4;
      *((int32x2_t *)v4 + 12) = vmovn_s64(v2[1]);
      v4[108] = v2[2].i8[0];
    }
    else
    {

      return 0;
    }
  }
  return (CAMutableMeshTransform *)v2;
}

- (void)setDepthNormalization:(id)a3
{
  setDepthNormalization(&self->super, (NSString *)a3);
}

- (void)setReplicatesEdges:(BOOL)a3
{
  int32x2_t *impl;

  self->super._replicatesEdges = a3;
  impl = (int32x2_t *)self->super._impl;
  if (impl)
  {
    impl[12] = vmovn_s64(*(int64x2_t *)&self->super._normalization);
    impl[13].i8[4] = a3;
  }
}

- (void)replaceVertexAtIndex:(unint64_t)a3 withVertex:(CAMeshVertex *)a4
{
  _QWORD *impl;
  uint64_t v5;
  float32x2_t *v6;
  float64x2_t v7;
  float32_t z;

  impl = self->super._impl;
  v5 = impl[3];
  if (a3 >= (impl[4] - v5) >> 5)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CAMeshTransform"), CFSTR("%@: trying to replace non-existent vertex %ld"), self, a3);
  }
  else
  {
    v6 = (float32x2_t *)(v5 + 32 * a3);
    v7 = *(float64x2_t *)&a4->var1.x;
    *v6 = vcvt_f32_f64((float64x2_t)a4->var0);
    v6[2] = vcvt_f32_f64(v7);
    z = a4->var1.z;
    v6[3].f32[0] = z;
    v6[3].i32[1] = 1065353216;
    *((_DWORD *)impl + 3) &= 0xFFFFD4FF;
  }
}

- (void)addVertex:(CAMeshVertex *)a3
{
  char *impl;
  malloc_zone_t *malloc_zone;
  CA::Render::MeshTransform *v7;
  int32x2_t *v8;
  uint64_t v9;
  uint64_t v10;
  int32x2_t v11;
  uint64_t v12;
  _BYTE *v13;
  _BYTE *v14;
  _BYTE *v15;
  _BYTE *v16;
  unsigned int *v17;
  unsigned int v18;
  unsigned int v19;
  uint64_t v20;
  __int128 v21;
  _OWORD v22[2];
  double z;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  impl = (char *)self->super._impl;
  malloc_zone = (malloc_zone_t *)get_malloc_zone();
  v7 = (CA::Render::MeshTransform *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0xD0uLL, 0x743898A5uLL);
  if (v7)
  {
    v8 = (int32x2_t *)v7;
    CA::Render::MeshTransform::MeshTransform(v7, ((uint64_t)(*((_QWORD *)impl + 4) - *((_QWORD *)impl + 3)) >> 5) + 1, (uint64_t)(*((_QWORD *)impl + 7) - *((_QWORD *)impl + 6)) >> 4, *((_DWORD *)impl + 25));
    v9 = *((_QWORD *)impl + 3);
    v10 = *((_QWORD *)impl + 4);
    if (v9 != v10)
    {
      v11 = v8[3];
      do
      {
        **(_QWORD **)&v11 = *(_QWORD *)v9;
        v12 = *(_QWORD *)(v9 + 16);
        *(_DWORD *)(*(_QWORD *)&v11 + 24) = *(_DWORD *)(v9 + 24);
        *(_QWORD *)(*(_QWORD *)&v11 + 16) = v12;
        *(_DWORD *)(*(_QWORD *)&v11 + 28) = *(_DWORD *)(v9 + 28);
        v9 += 32;
        *(_QWORD *)&v11 += 32;
      }
      while (v9 != v10);
    }
    v13 = (_BYTE *)*((_QWORD *)impl + 6);
    v14 = (_BYTE *)*((_QWORD *)impl + 7);
    if (v14 != v13)
      memmove(*(void **)&v8[6], v13, v14 - v13);
    v15 = (_BYTE *)*((_QWORD *)impl + 9);
    v16 = (_BYTE *)*((_QWORD *)impl + 10);
    if (v16 != v15)
      memmove(*(void **)&v8[9], v15, v16 - v15);
    v17 = (unsigned int *)(impl + 8);
    do
    {
      v18 = __ldaxr(v17);
      v19 = v18 - 1;
    }
    while (__stlxr(v19, v17));
    if (!v19)
      (*(void (**)(char *))(*(_QWORD *)impl + 16))(impl);
    self->super._impl = v8;
    v8[12] = vmovn_s64(*(int64x2_t *)&self->super._normalization);
    v8[13].i8[4] = self->super._replicatesEdges;
    v20 = ((uint64_t)(*(_QWORD *)&v8[4] - *(_QWORD *)&v8[3]) >> 5) - 1;
    v21 = *(_OWORD *)&a3->var1.x;
    v22[0] = a3->var0;
    v22[1] = v21;
    z = a3->var1.z;
    -[CAMutableMeshTransform replaceVertexAtIndex:withVertex:](self, "replaceVertexAtIndex:withVertex:", v20, v22);
  }
}

- (void)removeVertexAtIndex:(unint64_t)a3
{
  char *impl;
  malloc_zone_t *malloc_zone;
  CA::Render::MeshTransform *v7;
  int32x2_t *v8;
  CA::Render::MeshTransform *v9;
  uint64_t v10;
  int32x2_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  _BYTE *v19;
  _BYTE *v20;
  _BYTE *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  unint64_t v25;
  unsigned int *v26;
  unsigned int v27;
  unsigned int v28;

  impl = (char *)self->super._impl;
  if (a3 >= (uint64_t)(*((_QWORD *)impl + 4) - *((_QWORD *)impl + 3)) >> 5)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CAMeshTransform"), CFSTR("%@: trying to remove non-existent vertex %ld"), self, a3);
  }
  else
  {
    malloc_zone = (malloc_zone_t *)get_malloc_zone();
    v7 = (CA::Render::MeshTransform *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0xD0uLL, 0x743898A5uLL);
    if (v7)
    {
      v8 = (int32x2_t *)v7;
      v9 = CA::Render::MeshTransform::MeshTransform(v7, ((uint64_t)(*((_QWORD *)impl + 4) - *((_QWORD *)impl + 3)) >> 5) - 1, (uint64_t)(*((_QWORD *)impl + 7) - *((_QWORD *)impl + 6)) >> 4, *((_DWORD *)impl + 25));
      v10 = *((_QWORD *)impl + 3);
      v11 = *(int32x2_t *)((char *)v9 + 24);
      if (a3)
      {
        v12 = v10 + 32 * a3;
        do
        {
          **(_QWORD **)&v11 = *(_QWORD *)v10;
          v13 = *(_QWORD *)(v10 + 16);
          *(_DWORD *)(*(_QWORD *)&v11 + 24) = *(_DWORD *)(v10 + 24);
          *(_QWORD *)(*(_QWORD *)&v11 + 16) = v13;
          *(_DWORD *)(*(_QWORD *)&v11 + 28) = *(_DWORD *)(v10 + 28);
          v10 += 32;
          *(_QWORD *)&v11 += 32;
        }
        while (v10 != v12);
        v10 = *((_QWORD *)impl + 3);
        v11 = v8[3];
      }
      v14 = v10 + 32 * a3 + 32;
      v15 = *((_QWORD *)impl + 4);
      if (v14 != v15)
      {
        v16 = *(_QWORD *)&v11 + 32 * a3;
        do
        {
          *(_QWORD *)v16 = *(_QWORD *)v14;
          v17 = *(_QWORD *)(v14 + 16);
          *(_DWORD *)(v16 + 24) = *(_DWORD *)(v14 + 24);
          *(_QWORD *)(v16 + 16) = v17;
          *(_DWORD *)(v16 + 28) = *(_DWORD *)(v14 + 28);
          v14 += 32;
          v16 += 32;
        }
        while (v14 != v15);
      }
      v18 = (_BYTE *)*((_QWORD *)impl + 6);
      v19 = (_BYTE *)*((_QWORD *)impl + 7);
      if (v19 != v18)
        memmove(*(void **)&v8[6], v18, v19 - v18);
      v20 = (_BYTE *)*((_QWORD *)impl + 9);
      v21 = (_BYTE *)*((_QWORD *)impl + 10);
      if (v21 != v20)
        memmove(*(void **)&v8[9], v20, v21 - v20);
      v22 = *((_QWORD *)impl + 6);
      v23 = *((_QWORD *)impl + 7);
      while (v22 != v23)
      {
        for (i = 0; i != 16; i += 4)
        {
          v25 = *(unsigned int *)(v22 + i);
          if (v25 > a3)
            *(_DWORD *)(v22 + i) = v25 - 1;
        }
        v22 += 16;
      }
      v26 = (unsigned int *)(impl + 8);
      do
      {
        v27 = __ldaxr(v26);
        v28 = v27 - 1;
      }
      while (__stlxr(v28, v26));
      if (!v28)
        (*(void (**)(char *))(*(_QWORD *)impl + 16))(impl);
      self->super._impl = v8;
      v8[12] = vmovn_s64(*(int64x2_t *)&self->super._normalization);
      v8[13].i8[4] = self->super._replicatesEdges;
    }
  }
}

- (void)replaceFaceAtIndex:(unint64_t)a3 withFace:(CAMeshFace *)a4
{
  _QWORD *impl;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  impl = self->super._impl;
  v5 = impl[6];
  if (a3 >= (impl[7] - v5) >> 4)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CAMeshTransform"), CFSTR("%@: trying to replace non-existent face %ld"), self, a3);
  }
  else
  {
    v6 = 0;
    v7 = v5 + 16 * a3;
    v8 = impl[9] + (a3 << 6) + 4;
    do
    {
      *(_DWORD *)(v7 + v6 * 4) = a4->var0[v6];
      *(float *)(v8 + 1 * v6) = a4->var1[v6];
      ++v6;
    }
    while (v6 != 4);
    *((_DWORD *)impl + 3) &= 0xFFFFD4FF;
  }
}

- (void)addFace:(CAMeshFace *)a3
{
  char *impl;
  malloc_zone_t *malloc_zone;
  CA::Render::MeshTransform *v7;
  int32x2_t *v8;
  uint64_t v9;
  uint64_t v10;
  int32x2_t v11;
  uint64_t v12;
  _BYTE *v13;
  _BYTE *v14;
  _BYTE *v15;
  _BYTE *v16;
  unsigned int *v17;
  unsigned int v18;
  unsigned int v19;
  uint64_t v20;
  __int128 v21;
  _OWORD v22[2];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  impl = (char *)self->super._impl;
  malloc_zone = (malloc_zone_t *)get_malloc_zone();
  v7 = (CA::Render::MeshTransform *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0xD0uLL, 0x743898A5uLL);
  if (v7)
  {
    v8 = (int32x2_t *)v7;
    CA::Render::MeshTransform::MeshTransform(v7, (uint64_t)(*((_QWORD *)impl + 4) - *((_QWORD *)impl + 3)) >> 5, ((uint64_t)(*((_QWORD *)impl + 7) - *((_QWORD *)impl + 6)) >> 4) + 1, *((_DWORD *)impl + 25));
    v9 = *((_QWORD *)impl + 3);
    v10 = *((_QWORD *)impl + 4);
    if (v9 != v10)
    {
      v11 = v8[3];
      do
      {
        **(_QWORD **)&v11 = *(_QWORD *)v9;
        v12 = *(_QWORD *)(v9 + 16);
        *(_DWORD *)(*(_QWORD *)&v11 + 24) = *(_DWORD *)(v9 + 24);
        *(_QWORD *)(*(_QWORD *)&v11 + 16) = v12;
        *(_DWORD *)(*(_QWORD *)&v11 + 28) = *(_DWORD *)(v9 + 28);
        v9 += 32;
        *(_QWORD *)&v11 += 32;
      }
      while (v9 != v10);
    }
    v13 = (_BYTE *)*((_QWORD *)impl + 6);
    v14 = (_BYTE *)*((_QWORD *)impl + 7);
    if (v14 != v13)
      memmove(*(void **)&v8[6], v13, v14 - v13);
    v15 = (_BYTE *)*((_QWORD *)impl + 9);
    v16 = (_BYTE *)*((_QWORD *)impl + 10);
    if (v16 != v15)
      memmove(*(void **)&v8[9], v15, v16 - v15);
    v17 = (unsigned int *)(impl + 8);
    do
    {
      v18 = __ldaxr(v17);
      v19 = v18 - 1;
    }
    while (__stlxr(v19, v17));
    if (!v19)
      (*(void (**)(char *))(*(_QWORD *)impl + 16))(impl);
    v8[1].i32[1] &= 0xFFFFD4FF;
    self->super._impl = v8;
    v8[12] = vmovn_s64(*(int64x2_t *)&self->super._normalization);
    v8[13].i8[4] = self->super._replicatesEdges;
    v20 = ((uint64_t)(*(_QWORD *)&v8[7] - *(_QWORD *)&v8[6]) >> 4) - 1;
    v21 = *(_OWORD *)a3->var1;
    v22[0] = *(_OWORD *)a3->var0;
    v22[1] = v21;
    -[CAMutableMeshTransform replaceFaceAtIndex:withFace:](self, "replaceFaceAtIndex:withFace:", v20, v22);
  }
}

- (void)removeFaceAtIndex:(unint64_t)a3
{
  char *impl;
  malloc_zone_t *malloc_zone;
  CA::Render::MeshTransform *v7;
  int32x2_t *v8;
  uint64_t v9;
  uint64_t v10;
  int32x2_t v11;
  uint64_t v12;
  _BYTE *v13;
  _BYTE *v14;
  _BYTE *v15;
  _BYTE *v16;
  unsigned int *v17;
  unsigned int v18;
  unsigned int v19;

  impl = (char *)self->super._impl;
  if (a3 >= (uint64_t)(*((_QWORD *)impl + 4) - *((_QWORD *)impl + 3)) >> 5)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CAMeshTransform"), CFSTR("%@: trying to remove non-existent face %ld"), self, a3);
  }
  else
  {
    malloc_zone = (malloc_zone_t *)get_malloc_zone();
    v7 = (CA::Render::MeshTransform *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0xD0uLL, 0x743898A5uLL);
    if (v7)
    {
      v8 = (int32x2_t *)v7;
      CA::Render::MeshTransform::MeshTransform(v7, ((uint64_t)(*((_QWORD *)impl + 4) - *((_QWORD *)impl + 3)) >> 5) - 1, (uint64_t)(*((_QWORD *)impl + 7) - *((_QWORD *)impl + 6)) >> 4, *((_DWORD *)impl + 25));
      v9 = *((_QWORD *)impl + 3);
      v10 = *((_QWORD *)impl + 4);
      if (v9 != v10)
      {
        v11 = v8[3];
        do
        {
          **(_QWORD **)&v11 = *(_QWORD *)v9;
          v12 = *(_QWORD *)(v9 + 16);
          *(_DWORD *)(*(_QWORD *)&v11 + 24) = *(_DWORD *)(v9 + 24);
          *(_QWORD *)(*(_QWORD *)&v11 + 16) = v12;
          *(_DWORD *)(*(_QWORD *)&v11 + 28) = *(_DWORD *)(v9 + 28);
          v9 += 32;
          *(_QWORD *)&v11 += 32;
        }
        while (v9 != v10);
      }
      if (a3)
        memmove(*(void **)&v8[6], *((const void **)impl + 6), 16 * a3);
      v13 = (_BYTE *)*((_QWORD *)impl + 7);
      v14 = (_BYTE *)(*((_QWORD *)impl + 6) + 16 * a3 + 16);
      if (v13 != v14)
        memmove((void *)(*(_QWORD *)&v8[6] + 16 * a3), v14, v13 - v14);
      if ((a3 & 0x3FFFFFFFFFFFFFFLL) != 0)
        memmove(*(void **)&v8[9], *((const void **)impl + 9), a3 << 6);
      v15 = (_BYTE *)*((_QWORD *)impl + 10);
      v16 = (_BYTE *)(*((_QWORD *)impl + 9) + (a3 << 6) + 64);
      if (v15 != v16)
        memmove((void *)(*(_QWORD *)&v8[9] + (a3 << 6)), v16, v15 - v16);
      v17 = (unsigned int *)(impl + 8);
      do
      {
        v18 = __ldaxr(v17);
        v19 = v18 - 1;
      }
      while (__stlxr(v19, v17));
      if (!v19)
        (*(void (**)(char *))(*(_QWORD *)impl + 16))(impl);
      self->super._impl = v8;
      v8[12] = vmovn_s64(*(int64x2_t *)&self->super._normalization);
      v8[13].i8[4] = self->super._replicatesEdges;
    }
  }
}

- (NSString)depthNormalization
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)CAMutableMeshTransform;
  return -[CAMeshTransform depthNormalization](&v3, sel_depthNormalization);
}

- (int)subdivisionSteps
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)CAMutableMeshTransform;
  return -[CAMeshTransform subdivisionSteps](&v3, sel_subdivisionSteps);
}

- (BOOL)replicatesEdges
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)CAMutableMeshTransform;
  return -[CAMeshTransform replicatesEdges](&v3, sel_replicatesEdges);
}

+ (id)meshTransform
{
  return objc_alloc_init((Class)a1);
}

@end
