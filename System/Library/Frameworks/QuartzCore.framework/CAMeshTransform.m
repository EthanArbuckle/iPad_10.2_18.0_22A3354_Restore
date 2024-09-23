@implementation CAMeshTransform

- (Object)CA_copyRenderValue
{
  Object *result;
  Atomic *p_var1;
  unsigned int v4;
  unsigned int v5;

  result = (Object *)self->_impl;
  if (result)
  {
    p_var1 = &result->var1;
    do
      v4 = __ldaxr((unsigned int *)p_var1);
    while (__stlxr(v4 + 1, (unsigned int *)p_var1));
    if (!v4)
    {
      result = 0;
      do
        v5 = __ldaxr((unsigned int *)p_var1);
      while (__stlxr(v5 - 1, (unsigned int *)p_var1));
    }
  }
  return result;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[CAMeshTransform _initWithMeshTransform:]([CAMutableMeshTransform alloc], "_initWithMeshTransform:", self);
}

- (void)dealloc
{
  unsigned int *impl;
  unsigned int *v4;
  unsigned int v5;
  unsigned int v6;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  impl = (unsigned int *)self->_impl;
  if (impl)
  {
    v4 = impl + 2;
    do
    {
      v5 = __ldaxr(v4);
      v6 = v5 - 1;
    }
    while (__stlxr(v6, v4));
    if (!v6)
      (*(void (**)(unsigned int *, SEL))(*(_QWORD *)impl + 16))(impl, a2);
  }
  v7.receiver = self;
  v7.super_class = (Class)CAMeshTransform;
  -[CAMeshTransform dealloc](&v7, sel_dealloc);
}

+ (CAMeshTransform)meshTransformWithVertexCount:(unint64_t)a3 vertices:(const CAMeshVertex *)a4 faceCount:(unint64_t)a5 faces:(const CAMeshFace *)a6 depthNormalization:(id)a7
{
  return (CAMeshTransform *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithVertexCount:vertices:faceCount:faces:depthNormalization:", a3, a4, a5, a6, a7);
}

- (CAMeshTransform)initWithVertexCount:(unint64_t)a3 vertices:(const CAMeshVertex *)a4 faceCount:(unint64_t)a5 faces:(const CAMeshFace *)a6 depthNormalization:(id)a7
{
  id v12;
  malloc_zone_t *malloc_zone;
  CA::Render::MeshTransform *v14;
  int32x2_t *v15;
  float *v16;
  float64x2_t *p_var1;
  float v18;
  uint64_t v19;
  int32x2_t v20;
  uint64_t v21;
  uint64_t i;

  v12 = -[CAMeshTransform _init](self, "_init");
  if (v12)
  {
    malloc_zone = (malloc_zone_t *)get_malloc_zone();
    v14 = (CA::Render::MeshTransform *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0xD0uLL, 0x743898A5uLL);
    if (v14)
    {
      v15 = (int32x2_t *)v14;
      CA::Render::MeshTransform::MeshTransform(v14, a3, a5, -1);
      if (a3)
      {
        v16 = (float *)(*(_QWORD *)&v15[3] + 28);
        p_var1 = (float64x2_t *)&a4->var1;
        do
        {
          *(float32x2_t *)(v16 - 7) = vcvt_f32_f64(p_var1[-1]);
          *(float32x2_t *)(v16 - 3) = vcvt_f32_f64(*p_var1);
          v18 = p_var1[1].f64[0];
          *(v16 - 1) = v18;
          *v16 = 1.0;
          v16 += 8;
          p_var1 = (float64x2_t *)((char *)p_var1 + 40);
          --a3;
        }
        while (a3);
      }
      if (a5)
      {
        v19 = 0;
        v20 = v15[6];
        v21 = *(_QWORD *)&v15[9] + 4;
        do
        {
          for (i = 0; i != 4; ++i)
          {
            *(_DWORD *)(*(_QWORD *)&v20 + i * 4) = a6->var0[i];
            *(float *)(v21 + 1 * i) = a6->var1[i];
          }
          ++v19;
          v21 += 64;
          ++a6;
          *(_QWORD *)&v20 += 16;
        }
        while (v19 != a5);
      }
      setDepthNormalization((CAMeshTransform *)v12, (NSString *)a7);
      v15[1].i32[1] &= 0xFFFFD4FF;
      *((_QWORD *)v12 + 1) = v15;
      v15[12] = vmovn_s64(*((int64x2_t *)v12 + 1));
      v15[13].i8[4] = *((_BYTE *)v12 + 32);
    }
    else
    {

      return 0;
    }
  }
  return (CAMeshTransform *)v12;
}

- (id)_initWithMeshTransform:(id)a3
{
  _QWORD *v4;
  const CA::Render::MeshTransform *v5;
  malloc_zone_t *malloc_zone;
  CA::Render::MeshTransform *v7;
  CA::Render::MeshTransform *v8;
  uint64_t v9;
  uint64_t v10;

  v4 = -[CAMeshTransform _init](self, "_init");
  if (v4)
  {
    v5 = (const CA::Render::MeshTransform *)*((_QWORD *)a3 + 1);
    if (v5
      && (malloc_zone = (malloc_zone_t *)get_malloc_zone(),
          (v7 = (CA::Render::MeshTransform *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0xD0uLL, 0x743898A5uLL)) != 0))
    {
      v8 = CA::Render::MeshTransform::MeshTransform(v7, v5);
      v9 = *((unsigned int *)v8 + 24);
      v10 = *((int *)v8 + 25);
      v4[1] = v8;
      v4[2] = v9;
      v4[3] = v10;
      *((_BYTE *)v4 + 32) = *((_BYTE *)v8 + 108);
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (id)_init
{
  id result;
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)CAMeshTransform;
  result = -[CAMeshTransform init](&v3, sel_init);
  if (result)
    *((_OWORD *)result + 1) = xmmword_18474E040;
  return result;
}

- (CAMeshTransform)init
{

  return 0;
}

- (unint64_t)vertexCount
{
  return (uint64_t)(*((_QWORD *)self->_impl + 4) - *((_QWORD *)self->_impl + 3)) >> 5;
}

- (CAMeshVertex)vertexAtIndex:(SEL)a3
{
  float32x2_t *v4;
  float64x2_t v5;

  v4 = (float32x2_t *)(*(_QWORD *)(*(_QWORD *)&self->var0.y + 24) + 32 * a4);
  v5 = vcvtq_f64_f32(v4[2]);
  retstr->var0 = (CGPoint)vcvtq_f64_f32(*v4);
  *(float64x2_t *)&retstr->var1.x = v5;
  retstr->var1.z = v4[3].f32[0];
  return self;
}

- (unint64_t)faceCount
{
  return (uint64_t)(*((_QWORD *)self->_impl + 7) - *((_QWORD *)self->_impl + 6)) >> 4;
}

- (CAMeshFace)faceAtIndex:(SEL)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  float *var1;
  unint64_t v9;

  v4 = 0;
  v5 = *(_QWORD *)&self->var0[2];
  v6 = *(_QWORD *)(v5 + 48);
  v7 = *(_QWORD *)(v5 + 72);
  *(_QWORD *)&retstr->var1[2] = 0;
  *(_OWORD *)retstr->var0 = *(_OWORD *)(v6 + 16 * a4);
  *(_QWORD *)retstr->var1 = 0;
  var1 = retstr->var1;
  v9 = v7 + (a4 << 6) + 4;
  do
  {
    var1[v4] = *(float *)(v9 + 1 * v4);
    ++v4;
  }
  while (v4 != 4);
  return self;
}

- (NSString)depthNormalization
{
  unint64_t v2;

  v2 = self->_normalization - 2;
  if (v2 > 4)
    return (NSString *)CFSTR("none");
  else
    return (NSString *)*((_QWORD *)&off_1E159CBC0 + v2);
}

- (int)subdivisionSteps
{
  return self->_subdivisionSteps;
}

- (BOOL)replicatesEdges
{
  return self->_replicatesEdges;
}

- (unint64_t)CA_numericValueCount
{
  _QWORD *impl;
  uint64_t v3;

  impl = self->_impl;
  v3 = impl[4] - impl[3];
  return (v3 >> 3) + (v3 >> 5) + ((uint64_t)(impl[7] - impl[6]) >> 2) + 5;
}

- (unint64_t)CA_copyNumericValue:(double *)a3
{
  _QWORD *impl;
  uint64_t v4;
  float32x2_t *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  unint64_t v9;
  double v10;
  float64x2_t *v11;
  BOOL v12;
  uint64_t v13;
  unint64_t v14;
  double v15;
  unint64_t v16;
  float32x2_t *v17;
  float64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64x2_t v22;
  float64x2_t v23;
  float64x2_t *v24;

  impl = self->_impl;
  v5 = (float32x2_t *)impl[3];
  v4 = impl[4];
  v6 = impl[6];
  v7 = impl[7];
  v8 = 0.0;
  v9 = 1.0;
  if (*((_BYTE *)impl + 108))
    v8 = 1.0;
  LODWORD(v9) = *((_DWORD *)impl + 24);
  v10 = (double)*((int *)impl + 25);
  a3[2] = (double)v9;
  a3[3] = v10;
  a3[4] = v8;
  v11 = (float64x2_t *)(a3 + 5);
  v13 = v4 - (_QWORD)v5;
  v12 = v13 == 0;
  v14 = v13 >> 5;
  v15 = (double)(unint64_t)(v13 >> 5);
  v16 = (v7 - v6) >> 4;
  *a3 = v15;
  a3[1] = (double)v16;
  if (!v12)
  {
    if (v14 <= 1)
      v14 = 1;
    v17 = v5 + 2;
    do
    {
      v18 = v17[-2].f32[1];
      v11->f64[0] = v17[-2].f32[0];
      v11->f64[1] = v18;
      v11[1] = vcvtq_f64_f32(*v17);
      v11[2].f64[0] = v17[1].f32[0];
      v11 = (float64x2_t *)((char *)v11 + 40);
      v17 += 4;
      --v14;
    }
    while (v14);
  }
  if (v7 != v6)
  {
    if (v16 <= 1)
      v19 = 1;
    else
      v19 = (v7 - v6) >> 4;
    v20 = (_QWORD *)(v6 + 8);
    do
    {
      v21 = *(v20 - 1);
      v22.i64[0] = v21;
      v22.i64[1] = HIDWORD(v21);
      v23 = vcvtq_f64_u64(v22);
      v24 = v11 + 2;
      v22.i64[0] = *v20;
      v22.i64[1] = HIDWORD(*v20);
      *v11 = v23;
      v11[1] = vcvtq_f64_u64(v22);
      v20 += 2;
      v11 += 2;
      --v19;
    }
    while (v19);
    v11 = v24;
  }
  return ((char *)v11 - (char *)a3) >> 3;
}

- (BOOL)_constructWithData:(id)a3
{
  malloc_zone_t *malloc_zone;
  char *v6;
  int32x2_t *v7;
  char **v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  unsigned int v14;
  uint64_t v15;
  float v16;
  float v17;
  float v18;
  float v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  _DWORD *v23;
  unint64_t v24;
  _DWORD *v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  int32x2_t v31;
  int32x2_t v32;
  int32x2_t v33;
  int32x2_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unsigned int *v45;
  char *v46;
  char *v47;
  unsigned int *v48;
  uint64_t v49;
  __int128 *v50;
  __int128 *v51;
  unint64_t v52;
  int32x2_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  __int128 *v59;
  char *v60;
  char *v61;
  __int128 *v62;
  unint64_t v63;
  char *v64;
  char *v65;
  int32x2_t v66;
  __int128 v67;
  unsigned int v69;
  unsigned int v70;
  const char *v71;
  uint64_t v72;
  const char *v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  malloc_zone = (malloc_zone_t *)get_malloc_zone();
  v6 = (char *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0xD0uLL, 0x743898A5uLL);
  if (!v6)
    return (char)v6;
  v7 = (int32x2_t *)v6;
  *((_DWORD *)v6 + 2) = 1;
  ++dword_1ECDC7CAC;
  *(_QWORD *)v6 = off_1E1597170;
  *(_QWORD *)(v6 + 12) = 33;
  *(_OWORD *)(v6 + 24) = 0u;
  v8 = (char **)(v6 + 24);
  *(_OWORD *)(v6 + 40) = 0u;
  *(_OWORD *)(v6 + 56) = 0u;
  *(_OWORD *)(v6 + 72) = 0u;
  *(_OWORD *)(v6 + 84) = 0u;
  *(_QWORD *)(v6 + 100) = 0xFFFFFFFFLL;
  v6[108] = 0;
  *((_QWORD *)v6 + 25) = 0;
  v9 = objc_msgSend(a3, "length");
  v10 = objc_msgSend(a3, "bytes");
  v73 = (const char *)v10;
  if (v9 < 1)
    goto LABEL_77;
  v11 = v10;
  v12 = 0;
  v71 = (const char *)(v10 + v9);
  v72 = -v10;
  while (2)
  {
    v13 = (const char *)(v72 + v10);
    while (1)
    {
      v14 = *(char *)v10;
      if (v14 <= 0x2E)
      {
        if (((1 << v14) & 0x100100003600) != 0)
          goto LABEL_10;
        if (((1 << v14) & 0x680000000000) != 0)
          goto LABEL_13;
      }
      v15 = v14 - 48;
      if (v15 > 0x39)
        goto LABEL_24;
      if (((1 << (v14 - 48)) & 0x280000000000) == 0)
        break;
LABEL_10:
      v73 = (const char *)++v10;
      if ((uint64_t)++v13 >= v9)
        goto LABEL_77;
    }
    if (((1 << (v14 - 48)) & 0x2000000020003FFLL) == 0)
    {
      if (v15 == 54)
      {
        if (v12 != 4 && v12 != 8)
        {
          NSLog(CFSTR("Invalid number of arguments to 'f' mesh operator"));
          goto LABEL_81;
        }
        v76 = 0u;
        v77 = 0u;
        v16 = 0.0;
        v74 = 0u;
        v75 = 0u;
        if (v12 == 8)
        {
          v17 = *(double *)&v80;
          v18 = *((double *)&v80 + 1);
          *((float *)&v74 + 1) = v17;
          *((float *)&v75 + 1) = v18;
          v19 = *(double *)&v81;
          *((float *)&v76 + 1) = v19;
          v16 = *((double *)&v81 + 1);
        }
        v20 = *((double *)&v78 + 1);
        v21 = *(double *)&v79;
        v22 = *((double *)&v79 + 1);
        *((float *)&v77 + 1) = v16;
        v23 = (_DWORD *)v7[7];
        v24 = (unint64_t)v7[8];
        if ((unint64_t)v23 >= v24)
        {
          v69 = *(double *)&v78;
          v70 = *((double *)&v78 + 1);
          v34 = v7[6];
          v35 = ((uint64_t)v23 - *(_QWORD *)&v34) >> 4;
          v36 = v35 + 1;
          if ((unint64_t)(v35 + 1) >> 60)
            abort();
          v37 = v24 - *(_QWORD *)&v34;
          if (v37 >> 3 > v36)
            v36 = v37 >> 3;
          if ((unint64_t)v37 >= 0x7FFFFFFFFFFFFFF0)
            v38 = 0xFFFFFFFFFFFFFFFLL;
          else
            v38 = v36;
          if (v38)
            v38 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<CA::Render::MeshFace>>(v38);
          else
            v39 = 0;
          v45 = (unsigned int *)(v38 + 16 * v35);
          *v45 = v69;
          v45[1] = v70;
          v45[2] = v21;
          v45[3] = v22;
          v47 = (char *)v7[6];
          v46 = (char *)v7[7];
          v48 = v45;
          if (v46 != v47)
          {
            do
            {
              *((_OWORD *)v48 - 1) = *((_OWORD *)v46 - 1);
              v48 -= 4;
              v46 -= 16;
            }
            while (v46 != v47);
            v46 = (char *)v7[6];
          }
          v25 = v45 + 4;
          v7[6] = (int32x2_t)v48;
          v7[7] = (int32x2_t)(v45 + 4);
          v7[8] = (int32x2_t)(v38 + 16 * v39);
          if (v46)
            operator delete(v46);
        }
        else
        {
          *v23 = *(double *)&v78;
          v23[1] = v20;
          v25 = v23 + 4;
          v23[2] = v21;
          v23[3] = v22;
        }
        v49 = 0;
        v7[7] = (int32x2_t)v25;
        v50 = (__int128 *)v7[10];
        do
        {
          v51 = &v74 + v49;
          v52 = (unint64_t)v7[11];
          if ((unint64_t)v50 >= v52)
          {
            v53 = v7[9];
            v54 = ((uint64_t)v50 - *(_QWORD *)&v53) >> 4;
            if ((unint64_t)(v54 + 1) >> 60)
              abort();
            v55 = v52 - *(_QWORD *)&v53;
            v56 = v55 >> 3;
            if (v55 >> 3 <= (unint64_t)(v54 + 1))
              v56 = v54 + 1;
            if ((unint64_t)v55 >= 0x7FFFFFFFFFFFFFF0)
              v57 = 0xFFFFFFFFFFFFFFFLL;
            else
              v57 = v56;
            if (v57)
              v57 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<CA::Render::MeshFace>>(v57);
            else
              v58 = 0;
            v59 = (__int128 *)(v57 + 16 * v54);
            *v59 = *v51;
            v61 = (char *)v7[9];
            v60 = (char *)v7[10];
            v62 = v59;
            if (v60 != v61)
            {
              do
              {
                *--v62 = *((_OWORD *)v60 - 1);
                v60 -= 16;
              }
              while (v60 != v61);
              v60 = (char *)v7[9];
            }
            v50 = v59 + 1;
            v7[9] = (int32x2_t)v62;
            v7[10] = (int32x2_t)(v59 + 1);
            v7[11] = (int32x2_t)(v57 + 16 * v58);
            if (v60)
              operator delete(v60);
          }
          else
          {
            *v50++ = *v51;
          }
          v7[10] = (int32x2_t)v50;
          ++v49;
        }
        while (v49 != 4);
        v12 = 0;
      }
      else
      {
LABEL_24:
        if (v14 != 118)
        {
          NSLog(CFSTR("Invalid mesh operator: %c"), *(char *)v10);
LABEL_81:
          (*(void (**)(int32x2_t *))(*(_QWORD *)v7 + 8))(v7);
          LOBYTE(v6) = 0;
          return (char)v6;
        }
        if (v12 != 5)
        {
          NSLog(CFSTR("Invalid number of arguments to 'v' mesh operator"));
          goto LABEL_81;
        }
        v26 = *(double *)&v78;
        v27 = *((double *)&v78 + 1);
        v28 = *(double *)&v79;
        v29 = *((double *)&v79 + 1);
        v30 = *(double *)&v80;
        v31 = v7[4];
        v32 = v7[5];
        if (*(_QWORD *)&v31 >= *(_QWORD *)&v32)
        {
          v40 = (uint64_t)(*(_QWORD *)&v31 - (_QWORD)*v8) >> 5;
          v41 = v40 + 1;
          if ((unint64_t)(v40 + 1) >> 59)
            abort();
          v42 = *(_QWORD *)&v32 - (_QWORD)*v8;
          if (v42 >> 4 > v41)
            v41 = v42 >> 4;
          if ((unint64_t)v42 >= 0x7FFFFFFFFFFFFFE0)
            v43 = 0x7FFFFFFFFFFFFFFLL;
          else
            v43 = v41;
          if (v43)
            v43 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<CA::Render::MeshVertex>>(v43);
          else
            v44 = 0;
          v63 = v43 + 32 * v40;
          *(float *)v63 = v26;
          *(float *)(v63 + 4) = v27;
          *(_QWORD *)(v63 + 8) = 0;
          *(float *)(v63 + 16) = v28;
          *(float *)(v63 + 20) = v29;
          *(float *)(v63 + 24) = v30;
          *(_DWORD *)(v63 + 28) = 1065353216;
          v65 = (char *)v7[3];
          v64 = (char *)v7[4];
          v66 = (int32x2_t)v63;
          if (v64 != v65)
          {
            do
            {
              v67 = *((_OWORD *)v64 - 1);
              *(_OWORD *)(*(_QWORD *)&v66 - 32) = *((_OWORD *)v64 - 2);
              *(_OWORD *)(*(_QWORD *)&v66 - 16) = v67;
              *(_QWORD *)&v66 -= 32;
              v64 -= 32;
            }
            while (v64 != v65);
            v64 = *v8;
          }
          v33 = (int32x2_t)(v63 + 32);
          v7[3] = v66;
          v7[4] = (int32x2_t)(v63 + 32);
          v7[5] = (int32x2_t)(v43 + 32 * v44);
          if (v64)
            operator delete(v64);
        }
        else
        {
          *(float *)v31.i32[0] = v26;
          *(float *)(*(_QWORD *)&v31 + 4) = v27;
          *(_QWORD *)(*(_QWORD *)&v31 + 8) = 0;
          *(float *)(*(_QWORD *)&v31 + 16) = v28;
          *(float *)(*(_QWORD *)&v31 + 20) = v29;
          *(float *)(*(_QWORD *)&v31 + 24) = v30;
          v33 = (int32x2_t)(*(_QWORD *)&v31 + 32);
          *(_DWORD *)(*(_QWORD *)&v31 + 28) = 1065353216;
        }
        v12 = 0;
        v7[4] = v33;
      }
      v10 = (uint64_t)++v73;
      goto LABEL_15;
    }
LABEL_13:
    if (v12 == 16)
    {
      NSLog(CFSTR("Invalid number of numeric values in mesh"));
      goto LABEL_81;
    }
    *((double *)&v78 + v12++) = x_strtod((const char *)v10, &v73, v71);
    v10 = (uint64_t)v73;
LABEL_15:
    if (v10 - v11 < v9)
      continue;
    break;
  }
LABEL_77:
  self->_impl = v7;
  v7[12] = vmovn_s64(*(int64x2_t *)&self->_normalization);
  v7[13].i8[4] = self->_replicatesEdges;
  LOBYTE(v6) = 1;
  return (char)v6;
}

- (id)_data
{
  _QWORD *impl;
  __CFString *Mutable;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  CFStringRef v7;
  CFStringRef v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  _DWORD *v12;
  int v13;
  int v14;
  CFStringRef v15;
  CFStringRef v16;
  void *v17;
  float32x4_t v19;
  _DWORD v20[6];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  if (!impl)
    return 0;
  Mutable = CFStringCreateMutable(0, 0);
  v4 = impl[3];
  if (impl[4] != v4)
  {
    v5 = 0;
    v6 = 16;
    do
    {
      v7 = CACreateStringWithFloatArray(v4 + v6 - 16, 2uLL, 1.0e-10);
      v8 = CACreateStringWithFloatArray(impl[3] + v6, 3uLL, 1.0e-10);
      CFStringAppendFormat(Mutable, 0, CFSTR("[%@] [%@] v "), v7, v8);
      CFRelease(v8);
      CFRelease(v7);
      ++v5;
      v4 = impl[3];
      v6 += 32;
    }
    while (v5 < (impl[4] - v4) >> 5);
  }
  v9 = impl[6];
  if (impl[7] != v9)
  {
    v10 = 0;
    v11 = 0;
    do
    {
      v19 = vcvtq_f32_u32(*(uint32x4_t *)(v9 + 16 * v11));
      v12 = (_DWORD *)(impl[9] + v10);
      v13 = v12[5];
      v20[0] = v12[1];
      v20[1] = v13;
      v14 = v12[13];
      v20[2] = v12[9];
      v20[3] = v14;
      v15 = CACreateStringWithFloatArray((uint64_t)&v19, 4uLL, 1.0e-10);
      v16 = CACreateStringWithFloatArray((uint64_t)v20, 4uLL, 1.0e-10);
      CFStringAppendFormat(Mutable, 0, CFSTR("[%@] [%@] f "), v15, v16);
      CFRelease(v16);
      CFRelease(v15);
      ++v11;
      v9 = impl[6];
      v10 += 64;
    }
    while (v11 < (impl[7] - v9) >> 4);
  }
  v17 = (void *)-[__CFString dataUsingEncoding:](Mutable, "dataUsingEncoding:", 4);
  CFRelease(Mutable);
  return v17;
}

- (id)_subdivideToDepth:(int64_t)a3
{
  CAMeshTransform *v3;
  os_unfair_lock_s *v4;
  os_unfair_lock_s *v5;
  uint64_t v6;
  unsigned int *p_os_unfair_lock_opaque;
  unsigned int v8;
  uint64_t os_unfair_lock_opaque;
  os_unfair_lock_s *v10;
  unsigned int *v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v15;

  v3 = self;
  v4 = CA::Render::MeshTransform::retain_subdivided_mesh((os_unfair_lock_s *)self->_impl, a3);
  if (!v4)
    return 0;
  v5 = v4;
  if (v4 != v3->_impl)
  {
    v6 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "_init");
    p_os_unfair_lock_opaque = &v5[2]._os_unfair_lock_opaque;
    do
      v8 = __ldaxr(p_os_unfair_lock_opaque);
    while (__stlxr(v8 + 1, p_os_unfair_lock_opaque));
    if (v8)
    {
      os_unfair_lock_opaque = (int)v5[25]._os_unfair_lock_opaque;
      *(_QWORD *)(v6 + 16) = v5[24]._os_unfair_lock_opaque;
      *(_QWORD *)(v6 + 24) = os_unfair_lock_opaque;
      *(_BYTE *)(v6 + 32) = v5[27]._os_unfair_lock_opaque;
      v10 = v5;
    }
    else
    {
      v10 = 0;
      do
        v15 = __ldaxr(p_os_unfair_lock_opaque);
      while (__stlxr(v15 - 1, p_os_unfair_lock_opaque));
    }
    *(_QWORD *)(v6 + 8) = v10;
    v3 = (CAMeshTransform *)(id)v6;
  }
  v11 = &v5[2]._os_unfair_lock_opaque;
  do
  {
    v12 = __ldaxr(v11);
    v13 = v12 - 1;
  }
  while (__stlxr(v13, v11));
  if (!v13)
    (*(void (**)(os_unfair_lock_s *))(*(_QWORD *)&v5->_os_unfair_lock_opaque + 16))(v5);
  return v3;
}

- (id)subdividedMesh:(int)a3
{
  return -[CAMeshTransform _subdivideToDepth:](self, "_subdivideToDepth:", a3);
}

- (id)inverseMesh
{
  uint64_t v3;
  const CA::Render::MeshTransform *impl;
  malloc_zone_t *malloc_zone;
  CA::Render::MeshTransform *v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "_init");
  impl = (const CA::Render::MeshTransform *)self->_impl;
  malloc_zone = (malloc_zone_t *)get_malloc_zone();
  v6 = (CA::Render::MeshTransform *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0xD0uLL, 0x743898A5uLL);
  if (v6)
    v6 = CA::Render::MeshTransform::MeshTransform(v6, impl);
  v7 = (_QWORD *)*((_QWORD *)v6 + 3);
  v8 = (_QWORD *)*((_QWORD *)v6 + 4);
  while (v7 != v8)
  {
    v9 = v7[2];
    v7[2] = *v7;
    *v7 = v9;
    v7 += 4;
  }
  *((_DWORD *)v6 + 3) &= 0xFFFFFAFF;
  v10 = *((unsigned int *)v6 + 24);
  v11 = *((int *)v6 + 25);
  *(_QWORD *)(v3 + 8) = v6;
  *(_QWORD *)(v3 + 16) = v10;
  *(_QWORD *)(v3 + 24) = v11;
  *(_BYTE *)(v3 + 32) = *((_BYTE *)v6 + 108);
  return (id)v3;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", -[CAMeshTransform _data](self, "_data"), CFSTR("meshData"));
  if (self->_normalization != 1)
    objc_msgSend(a3, "encodeObject:forKey:", -[CAMeshTransform depthNormalization](self, "depthNormalization"), CFSTR("depthNormalization"));
  if ((self->_subdivisionSteps & 0x8000000000000000) == 0)
    objc_msgSend(a3, "encodeInt:forKey:");
  if (self->_replicatesEdges)
    objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("replicatesEdges"));
}

- (CAMeshTransform)initWithCoder:(id)a3
{
  CAMeshTransform *v4;
  uint64_t v5;
  NSString *v6;

  v4 = -[CAMeshTransform _init](self, "_init");
  if (v4)
  {
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("subdivisionSteps")))
      v4->_subdivisionSteps = (int)objc_msgSend(a3, "decodeIntForKey:", CFSTR("subdivisionSteps"));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("replicatesEdges")))
      v4->_replicatesEdges = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("replicatesEdges"));
    v5 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("meshData"));
    if (v5 && -[CAMeshTransform _constructWithData:](v4, "_constructWithData:", v5))
    {
      v6 = (NSString *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("depthNormalization"));
      setDepthNormalization(v4, v6);
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (void)encodeWithCAMLWriter:(id)a3
{
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  v5 = objc_msgSend(a3, "URLStringForResource:", self);
  if (v5)
  {
    objc_msgSend(a3, "setElementAttribute:forKey:", v5, CFSTR("src"));
  }
  else
  {
    if (self->_normalization != 1)
      objc_msgSend(a3, "setElementAttribute:forKey:", -[CAMeshTransform depthNormalization](self, "depthNormalization"), CFSTR("depthNormalization"));
    if ((self->_subdivisionSteps & 0x8000000000000000) == 0)
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%d"), self->_subdivisionSteps);
      objc_msgSend(a3, "setElementAttribute:forKey:", v6, CFSTR("subdivisionSteps"));

    }
    if (self->_replicatesEdges)
      objc_msgSend(a3, "setElementAttribute:forKey:", CFSTR("1"), CFSTR("replicatesEdges"));
    v7 = -[CAMeshTransform _data](self, "_data");
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v7, 4);
    objc_msgSend(a3, "setElementContent:", v8);

  }
}

- (id)CA_interpolateValue:(id)a3 byFraction:(float)a4
{
  _QWORD *v5;
  CA::Render::Object *v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;
  CA::Render::Object *v11;
  ValueInterpolator v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12.var0 = a4;
  memset(&v12.var1, 0, 112);
  v11 = 0;
  CA::Render::mix_objects((uint64_t)&v11, (CA::Render::Object *)self->_impl, *((CA::Render::Object ***)a3 + 1), &v12);
  v5 = interpolatedMeshTransform((CAMeshTransform *)a3, v11);
  v6 = v11;
  if (v11)
  {
    v7 = (unsigned int *)((char *)v11 + 8);
    do
    {
      v8 = __ldaxr(v7);
      v9 = v8 - 1;
    }
    while (__stlxr(v9, v7));
    if (!v9)
      (*(void (**)(CA::Render::Object *))(*(_QWORD *)v6 + 16))(v6);
  }
  return v5;
}

- (id)CA_interpolateValues:(id)a3 :(id)a4 :(id)a5 interpolator:(const ValueInterpolator *)a6
{
  unint64_t v7;
  CA::Render::Object *impl;
  CA::Render::Object *v9;
  _QWORD *v10;
  CA::Render::Object *v11;
  unsigned int *v12;
  unsigned int v13;
  unsigned int v14;
  CA::Render::Object *v16[2];

  v16[1] = *(CA::Render::Object **)MEMORY[0x1E0C80C00];
  if (a3)
    v7 = *((_QWORD *)a3 + 1);
  else
    v7 = 0;
  impl = (CA::Render::Object *)self->_impl;
  v9 = (CA::Render::Object *)*((_QWORD *)a4 + 1);
  if (a5)
    a5 = (id)*((_QWORD *)a5 + 1);
  v16[0] = 0;
  CA::Render::mix_objects(v16, v7, impl, v9, (unint64_t)a5, (const CA::Render::ValueInterpolator *)a6);
  v10 = interpolatedMeshTransform((CAMeshTransform *)a4, v16[0]);
  v11 = v16[0];
  if (v16[0])
  {
    v12 = (unsigned int *)((char *)v16[0] + 8);
    do
    {
      v13 = __ldaxr(v12);
      v14 = v13 - 1;
    }
    while (__stlxr(v14, v12));
    if (!v14)
      (*(void (**)(CA::Render::Object *))(*(_QWORD *)v11 + 16))(v11);
  }
  return v10;
}

- (double)CA_distanceToValue:(id)a3
{
  double result;

  (*(void (**)(void *, _QWORD))(*(_QWORD *)self->_impl + 72))(self->_impl, *((_QWORD *)a3 + 1));
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)CAMLParserStartElement:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSString *v15;
  int32x2_t *v16;

  v4 = objc_msgSend(a3, "attributeForKey:remove:", CFSTR("src"), 1);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:relativeToURL:", v4, objc_msgSend(a3, "baseURL"));
    if (v5)
    {
      v6 = (void *)v5;
      v7 = objc_msgSend(a3, "willLoadResourceFromURL:", v5);
      if (v7 && (v8 = v7, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        objc_msgSend(a3, "setElementValue:", v8);
      }
      else
      {
        v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:", v6);
        if (v9)
        {
          v10 = (void *)v9;
          v11 = -[CAMeshTransform _init]([CAMeshTransform alloc], "_init");
          if ((objc_msgSend(v11, "_constructWithData:", v10) & 1) != 0)
          {

            if (v11)
            {
              objc_msgSend(a3, "setElementValue:", v11);
              objc_msgSend(a3, "didLoadResource:fromURL:", v11, v6);

            }
          }
          else
          {

          }
        }
      }

    }
  }
  v12 = (id)objc_msgSend(a3, "elementValue");
  if (!v12)
  {
    v12 = -[CAMeshTransform _init]([CAMeshTransform alloc], "_init");
    objc_msgSend(a3, "setElementValue:", v12);

  }
  v13 = (void *)objc_msgSend(a3, "attributeForKey:remove:", CFSTR("subdivisionSteps"), 1);
  if (v13)
    *((_QWORD *)v12 + 3) = (int)objc_msgSend(v13, "intValue");
  v14 = (void *)objc_msgSend(a3, "attributeForKey:remove:", CFSTR("replicatesEdges"), 1);
  if (v14)
    *((_BYTE *)v12 + 32) = objc_msgSend(v14, "BOOLValue");
  v15 = (NSString *)objc_msgSend(a3, "attributeForKey:remove:", CFSTR("depthNormalization"), 1);
  if (v15)
    setDepthNormalization((CAMeshTransform *)v12, v15);
  v16 = (int32x2_t *)*((_QWORD *)v12 + 1);
  if (v16)
  {
    v16[12] = vmovn_s64(*((int64x2_t *)v12 + 1));
    v16[13].i8[4] = *((_BYTE *)v12 + 32);
  }
}

+ (void)CAMLParserEndElement:(id)a3 content:(id)a4
{
  _QWORD *v6;

  v6 = (_QWORD *)objc_msgSend(a3, "elementValue");
  if (v6 && !v6[1] && (objc_msgSend(v6, "_constructWithData:", objc_msgSend(a4, "dataUsingEncoding:", 4)) & 1) == 0)
    objc_msgSend(a3, "setElementValue:", 0);
}

@end
