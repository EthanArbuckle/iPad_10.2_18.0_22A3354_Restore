@implementation ABPK2D3DLiftingData

- (ABPK2D3DLiftingData)initWithJoints:(ABPK2D3DLiftingData *)self numberOfJoints:(SEL)a2 liftingData3D:liftingData3DElementCount:
{
  const void *v2;
  unint64_t v3;
  __int128 *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 *v7;
  unint64_t v8;
  const void *v9;
  char *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  ABPK2D3DLiftingData *v18;
  __int128 v20;
  uint64_t v21;
  objc_super v22;

  v6 = v5;
  v7 = v4;
  v8 = v3;
  v9 = v2;
  v22.receiver = self;
  v22.super_class = (Class)ABPK2D3DLiftingData;
  v10 = -[ABPK2D3DLiftingData init](&v22, sel_init);
  if (v10)
  {
    if (v6 != 32)
    {
      v18 = 0;
      goto LABEL_8;
    }
    v20 = 0uLL;
    v21 = 0;
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPKS1_S7_EEvT_T0_m(&v20, v9, (uint64_t)v9 + 8 * v8, v8);
    v11 = (void *)*((_QWORD *)v10 + 1);
    if (v11)
    {
      *((_QWORD *)v10 + 2) = v11;
      operator delete(v11);
      *((_QWORD *)v10 + 1) = 0;
      *((_QWORD *)v10 + 2) = 0;
      *((_QWORD *)v10 + 3) = 0;
    }
    *(_OWORD *)(v10 + 8) = v20;
    *((_QWORD *)v10 + 3) = v21;
    v12 = *v7;
    v13 = v7[1];
    v14 = v7[2];
    *(_OWORD *)(v10 + 104) = v7[3];
    *(_OWORD *)(v10 + 88) = v14;
    *(_OWORD *)(v10 + 72) = v13;
    *(_OWORD *)(v10 + 56) = v12;
    v15 = v7[4];
    v16 = v7[5];
    v17 = v7[6];
    *(_OWORD *)(v10 + 168) = v7[7];
    *(_OWORD *)(v10 + 152) = v17;
    *(_OWORD *)(v10 + 136) = v16;
    *(_OWORD *)(v10 + 120) = v15;
  }
  v18 = v10;
LABEL_8:

  return v18;
}

- (ABPK2D3DLiftingData)initWithJoints:(ABPK2D3DLiftingData *)self numberOfJoints:(SEL)a2 rotation:croppedRect:liftingData3D:liftingData3DElementCount:
{
  const void *v2;
  unint64_t v3;
  uint64_t v4;
  __int128 *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  __int128 *v12;
  uint64_t v13;
  unint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  const void *v19;
  char *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  double v28;
  double v29;
  double v30;
  double v31;
  ABPK2D3DLiftingData *v32;
  __int128 v34;
  uint64_t v35;
  objc_super v36;

  v11 = v6;
  v12 = v5;
  v13 = v4;
  v14 = v3;
  v15 = v10;
  v16 = v9;
  v17 = v8;
  v18 = v7;
  v19 = v2;
  v36.receiver = self;
  v36.super_class = (Class)ABPK2D3DLiftingData;
  v20 = -[ABPK2D3DLiftingData init](&v36, sel_init);
  if (v20)
  {
    if (v11 != 32)
    {
      v32 = 0;
      goto LABEL_22;
    }
    v34 = 0uLL;
    v35 = 0;
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPKS1_S7_EEvT_T0_m(&v34, v19, (uint64_t)v19 + 8 * v14, v14);
    v21 = (void *)*((_QWORD *)v20 + 1);
    if (v21)
    {
      *((_QWORD *)v20 + 2) = v21;
      operator delete(v21);
      *((_QWORD *)v20 + 1) = 0;
      *((_QWORD *)v20 + 2) = 0;
      *((_QWORD *)v20 + 3) = 0;
    }
    *(_OWORD *)(v20 + 8) = v34;
    *((_QWORD *)v20 + 3) = v35;
    v22 = *v12;
    v23 = v12[1];
    v24 = v12[2];
    *(_OWORD *)(v20 + 104) = v12[3];
    *(_OWORD *)(v20 + 88) = v24;
    *(_OWORD *)(v20 + 72) = v23;
    *(_OWORD *)(v20 + 56) = v22;
    v25 = v12[4];
    v26 = v12[5];
    v27 = v12[6];
    *(_OWORD *)(v20 + 168) = v12[7];
    *(_OWORD *)(v20 + 152) = v27;
    *(_OWORD *)(v20 + 136) = v26;
    *(_OWORD *)(v20 + 120) = v25;
    *((_QWORD *)v20 + 39) = v13;
    if (v13 == -90)
      v28 = v17;
    else
      v28 = v18;
    if (v13 == -90)
      v29 = v18;
    else
      v29 = v17;
    if (v13 == -90)
      v30 = v15;
    else
      v30 = v16;
    if (v13 == -90)
      v31 = v16;
    else
      v31 = v15;
    if (v13 == 90)
    {
      v28 = v17;
      v29 = v18;
      v30 = v15;
      v31 = v16;
    }
    objc_msgSend(v20, "_rotateAndUndoCroppingFromRect:", v28, v29, v30, v31);
  }
  v32 = v20;
LABEL_22:

  return v32;
}

- (ABPK2D3DLiftingData)initWithHumanForLifting:(const void *)a3 imageSize:(CGSize)a4 rotation:(int64_t)a5 croppedRect:(CGRect)a6
{
  double height;
  double width;
  double y;
  double x;
  double v11;
  double v12;
  char *v14;
  abpk::Human *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_super v21;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v11 = a4.height;
  v12 = a4.width;
  v21.receiver = self;
  v21.super_class = (Class)ABPK2D3DLiftingData;
  v14 = -[ABPK2D3DLiftingData init](&v21, sel_init);
  if (v14)
  {
    v15 = abpk::Human::jointVector((abpk::Human *)a3);
    if (v14 + 8 != (char *)v15)
      _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE18__assign_with_sizeB8ne180100IPS1_S6_EEvT_T0_l(v14 + 8, *(char **)v15, *((_QWORD *)v15 + 1), (uint64_t)(*((_QWORD *)v15 + 1) - *(_QWORD *)v15) >> 3);
    *((_QWORD *)v14 + 39) = a5;
    if (a5 == -90)
      v16 = y;
    else
      v16 = x;
    if (a5 == -90)
      v17 = x;
    else
      v17 = y;
    if (a5 == -90)
      v18 = height;
    else
      v18 = width;
    if (a5 == -90)
      v19 = width;
    else
      v19 = height;
    if (a5 == 90)
    {
      v16 = y;
      v17 = x;
      v18 = height;
      v19 = width;
    }
    objc_msgSend(v14, "_rotateAndUndoCroppingFromRect:", v16, v17, v18, v19);
    objc_msgSend(v14, "prepareLiftingInput:imageSize:pUnnormalizedMultiArray:pMultiArray:", *((_QWORD *)v14 + 1), v14 + 184, v14 + 56, v12, v11);
  }
  return (ABPK2D3DLiftingData *)v14;
}

- (void)_rotateAndUndoCroppingFromRect:(CGRect)a3
{
  char *var0;
  uint64_t v5;
  unint64_t v6;
  CGFloat height;
  CGFloat y;
  unint64_t v9;
  int64_t rotationNeeded;
  float v11;
  __float2 v12;
  vector<float __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> *p_rotatedJointsUsedForLifting;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v14;
  unint64_t v15;
  float32x2_t v16;
  float32x2_t v17;
  unsigned __int8 *v18;
  float32x2_t *v19;
  float32x2_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char *v25;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v26;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v27;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v28;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> *v29;
  float32x2_t v30;

  var0 = (char *)self->_rawJointsUsedForLifting.var0;
  v5 = *(_QWORD *)self->_anon_10;
  if ((char *)v5 == var0)
  {
    v9 = (v5 - (uint64_t)var0) >> 3;
    var0 = *(char **)self->_anon_10;
  }
  else
  {
    v6 = 0;
    height = a3.size.height;
    y = a3.origin.y;
    do
    {
      *(float32x2_t *)&var0[8 * v6] = vcvt_f32_f64(vmlaq_f64((float64x2_t)a3.origin, (float64x2_t)a3.size, vcvtq_f64_f32(*(float32x2_t *)&var0[8 * v6])));
      ++v6;
      var0 = (char *)self->_rawJointsUsedForLifting.var0;
      v5 = *(_QWORD *)self->_anon_10;
      v9 = (v5 - (uint64_t)var0) >> 3;
    }
    while (v9 > v6);
  }
  rotationNeeded = self->_rotationNeeded;
  if (rotationNeeded)
  {
    v11 = (double)rotationNeeded * 3.14159265 / 180.0;
    v12 = __sincosf_stret(v11);
    p_rotatedJointsUsedForLifting = &self->_rotatedJointsUsedForLifting;
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE7reserveEm((void **)&self->_rotatedJointsUsedForLifting.var0, v9);
    v14 = self->_rawJointsUsedForLifting.var0;
    if (*(__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> ***)self->_anon_10 != v14)
    {
      v15 = 0;
      v16 = (float32x2_t)__PAIR64__(LODWORD(v12.__sinval), LODWORD(v12.__cosval));
      v17.f32[0] = -v12.__sinval;
      v17.i32[1] = LODWORD(v12.__cosval);
      v18 = &self->_anon_28[8];
      v19 = *(float32x2_t **)self->_anon_28;
      v30 = v17;
      do
      {
        v20 = vadd_f32(vmla_n_f32(vmul_n_f32(v16, COERCE_FLOAT(v14[v15]) + -0.5), v17, COERCE_FLOAT((unint64_t)v14[v15] >> 32) + -0.5), (float32x2_t)0x3F0000003F000000);
        if ((unint64_t)v19 >= *(_QWORD *)v18)
        {
          v21 = ((char *)v19 - (char *)p_rotatedJointsUsedForLifting->var0) >> 3;
          if ((unint64_t)(v21 + 1) >> 61)
            std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
          v22 = *(_QWORD *)v18 - (unint64_t)p_rotatedJointsUsedForLifting->var0;
          v23 = v22 >> 2;
          if (v22 >> 2 <= (unint64_t)(v21 + 1))
            v23 = v21 + 1;
          if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFF8)
            v24 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v24 = v23;
          if (v24)
            v25 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&self->_anon_28[8], v24);
          else
            v25 = 0;
          v26 = (__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **)&v25[8 * v21];
          *v26 = (__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> *)v20;
          v19 = (float32x2_t *)(v26 + 1);
          v28 = self->_rotatedJointsUsedForLifting.var0;
          v27 = *(__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> ***)self->_anon_28;
          if (v27 != v28)
          {
            do
            {
              v29 = *--v27;
              *--v26 = v29;
            }
            while (v27 != v28);
            v27 = p_rotatedJointsUsedForLifting->var0;
          }
          self->_rotatedJointsUsedForLifting.var0 = v26;
          *(_QWORD *)self->_anon_28 = v19;
          *(_QWORD *)&self->_anon_28[8] = &v25[8 * v24];
          if (v27)
            operator delete(v27);
          v17 = v30;
          v16 = (float32x2_t)__PAIR64__(LODWORD(v12.__sinval), LODWORD(v12.__cosval));
        }
        else
        {
          *v19++ = v20;
        }
        *(_QWORD *)self->_anon_28 = v19;
        ++v15;
        v14 = self->_rawJointsUsedForLifting.var0;
      }
      while (v15 < (uint64_t)(*(_QWORD *)self->_anon_10 - (_QWORD)v14) >> 3);
    }
  }
  else
  {
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE18__assign_with_sizeB8ne180100IPS1_S6_EEvT_T0_l((char *)&self->_rotatedJointsUsedForLifting, var0, v5, v9);
  }
}

- (ABPK2D3DLiftingData)initWithJoints:(ABPK2D3DLiftingData *)self numberOfJoints:(SEL)a2
{
  return -[ABPK2D3DLiftingData initWithJoints:numberOfJoints:imageSize:](self, "initWithJoints:numberOfJoints:imageSize:", 1000.0, 1000.0);
}

- (ABPK2D3DLiftingData)initWithJoints:(ABPK2D3DLiftingData *)self numberOfJoints:(SEL)a2 imageSize:
{
  const void *v2;
  unint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  unint64_t v8;
  const void *v9;
  char *v10;
  void *v11;
  uint64_t v12;
  __int128 v14;
  uint64_t v15;
  objc_super v16;

  v6 = v5;
  v7 = v4;
  v8 = v3;
  v9 = v2;
  v16.receiver = self;
  v16.super_class = (Class)ABPK2D3DLiftingData;
  v10 = -[ABPK2D3DLiftingData init](&v16, sel_init);
  if (v10)
  {
    v14 = 0uLL;
    v15 = 0;
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPKS1_S7_EEvT_T0_m(&v14, v9, (uint64_t)v9 + 8 * v8, v8);
    v11 = (void *)*((_QWORD *)v10 + 1);
    if (v11)
    {
      *((_QWORD *)v10 + 2) = v11;
      operator delete(v11);
      *((_QWORD *)v10 + 1) = 0;
      *((_QWORD *)v10 + 2) = 0;
      *((_QWORD *)v10 + 3) = 0;
    }
    v12 = v14;
    *(_OWORD *)(v10 + 8) = v14;
    *((_QWORD *)v10 + 3) = v15;
    objc_msgSend(v10, "prepareLiftingInput:imageSize:pUnnormalizedMultiArray:pMultiArray:", v12, v10 + 184, v10 + 56, v7, v6);
  }
  return (ABPK2D3DLiftingData *)v10;
}

- (uint64_t)joints
{
  return *(_QWORD *)(a1 + 8);
}

- (uint64_t)rotatedJoints
{
  return *(_QWORD *)(a1 + 32);
}

- (unint64_t)jointCount
{
  return (uint64_t)(*(_QWORD *)self->_anon_28 - (unint64_t)self->_rotatedJointsUsedForLifting.var0) >> 3;
}

- (const)unnormalizedLiftingData3D
{
  return self->_unnormalizedMultiArray.__elems_;
}

- (const)liftingData3D
{
  return self->_multiArray.__elems_;
}

- (unint64_t)liftingData3DElementCount
{
  return 32;
}

- (void)prepareLiftingInput:(ABPK2D3DLiftingData *)self imageSize:(SEL)a2 pUnnormalizedMultiArray:pMultiArray:
{
  float32x2_t *v2;
  float32x2_t *v3;
  uint64_t v4;
  double v5;
  double v6;
  uint64_t v7;
  float32x2_t *v8;
  float32x2_t *v9;
  uint64_t i;
  float32x2_t v11;
  uint64_t v12;
  uint64_t v13;
  float v14;
  float32x2_t v15;
  float32x2_t v16;
  float v17;
  float v18;
  float32x2_t v19;
  float64x2_t v24;
  float v26;
  float v27;
  float v28;
  float v29;
  uint64_t v30;
  float v31;
  float64_t v32;
  float64_t v33;

  v7 = v4;
  v8 = v3;
  v9 = v2;
  for (i = 0; i != 14; ++i)
  {
    v11 = v2[i];
    v13 = *(int *)((char *)&-[ABPK2D3DLiftingData prepareLiftingInput:imageSize:pUnnormalizedMultiArray:pMultiArray:]::mapping
                 + i * 8);
    v12 = *(int *)((char *)&-[ABPK2D3DLiftingData prepareLiftingInput:imageSize:pUnnormalizedMultiArray:pMultiArray:]::mapping
                 + i * 8
                 + 4);
    if (v11.f32[0] < 0.0 || v11.f32[1] < 0.0)
    {
      v3->i32[v13] = -1082130432;
      v14 = -1.0;
    }
    else
    {
      v11.f32[0] = v5 * v11.f32[0];
      v3->i32[v13] = v11.i32[0];
      v14 = v6 * v11.f32[1];
    }
    v3->f32[v12] = v14;
  }
  v32 = v5;
  v33 = v6;
  if ((determineDeviceANEVersionPriorOrEqualToH12() & 1) != 0)
  {
    *v8 = vmul_f32(vadd_f32(v8[4], v8[1]), (float32x2_t)0x3F0000003F000000);
    v15 = v8[8];
    v16 = vmul_f32(vadd_f32(v15, v8[7]), (float32x2_t)0x3F0000003F000000);
    v8[8] = v16;
    v17 = vmlas_n_f32(-v16.f32[0], 2.0, v15.f32[0]);
    v18 = v16.f32[1] * -0.6 + v15.f32[1] * 1.6;
    v8[9].f32[0] = v17;
  }
  else
  {
    v19 = v9[16];
    if (v19.f32[0] < 0.0 || v19.f32[1] < 0.0)
    {
      __asm { FMOV            V0.2S, #-1.0 }
    }
    else
    {
      v24.f64[0] = v32;
      v24.f64[1] = v33;
      _D0 = vcvt_f32_f64(vmulq_f64(v24, vcvtq_f64_f32(v19)));
    }
    *v8 = _D0;
    v26 = v8[7].f32[0];
    if (v26 >= 0.0
      && (v27 = v8[7].f32[1], v27 >= 0.0)
      && (v28 = v8[8].f32[0], v28 >= 0.0)
      && (v29 = v8[8].f32[1], v29 >= 0.0))
    {
      v31 = sqrt((float)(v26 - v28) * (float)(v26 - v28) + (float)(v27 - v29) * (float)(v27 - v29));
      v8[9].f32[0] = v28;
      v18 = v29 + v31 * -0.5;
    }
    else
    {
      v18 = v8[8].f32[1];
      v8[9].i32[0] = v8[8].i32[0];
    }
  }
  v30 = 0;
  v8[9].f32[1] = v18;
  do
  {
    *(float *)(v7 + v30 * 4) = (float)(v8->f32[v30]
                                     - *(float *)&-[ABPK2D3DLiftingData prepareLiftingInput:imageSize:pUnnormalizedMultiArray:pMultiArray:]::means[v30])
                             / *(float *)&-[ABPK2D3DLiftingData prepareLiftingInput:imageSize:pUnnormalizedMultiArray:pMultiArray:]::stdDevs[v30];
    ++v30;
  }
  while (v30 != 32);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ABPK2D3DLiftingData)initWithCoder:(id)a3
{
  id v4;
  char *v5;
  id v6;
  const void *v7;
  unint64_t v8;
  void *v9;
  id v10;
  const void *v11;
  unint64_t v12;
  void *v13;
  __int128 *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  ABPK2D3DLiftingData *v21;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)ABPK2D3DLiftingData;
  v5 = -[ABPK2D3DLiftingData init](&v27, sel_init);
  if (v5)
  {
    *((_QWORD *)v5 + 39) = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("rotationNeeded"));
    v26 = 0;
    v6 = objc_retainAutorelease(v4);
    v7 = (const void *)objc_msgSend(v6, "decodeBytesForKey:returnedLength:", CFSTR("rawJointsUsedForLifting"), &v26);
    v8 = (unint64_t)v26 >> 3;
    v24 = 0uLL;
    v25 = 0;
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPKS1_S7_EEvT_T0_m(&v24, v7, (uint64_t)v7 + 8 * ((unint64_t)v26 >> 3), v26 >> 3);
    v9 = (void *)*((_QWORD *)v5 + 1);
    if (v9)
    {
      *((_QWORD *)v5 + 2) = v9;
      operator delete(v9);
      *((_QWORD *)v5 + 1) = 0;
      *((_QWORD *)v5 + 2) = 0;
      *((_QWORD *)v5 + 3) = 0;
    }
    *(_OWORD *)(v5 + 8) = v24;
    *((_QWORD *)v5 + 3) = v25;
    v23 = 0;
    v10 = objc_retainAutorelease(v6);
    v11 = (const void *)objc_msgSend(v10, "decodeBytesForKey:returnedLength:", CFSTR("rotatedJointsUsedForLifting"), &v23);
    v12 = (unint64_t)v23 >> 3;
    v24 = 0uLL;
    v25 = 0;
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPKS1_S7_EEvT_T0_m(&v24, v11, (uint64_t)v11 + 8 * ((unint64_t)v23 >> 3), v23 >> 3);
    v13 = (void *)*((_QWORD *)v5 + 4);
    if (v13)
    {
      *((_QWORD *)v5 + 5) = v13;
      operator delete(v13);
      *((_QWORD *)v5 + 4) = 0;
      *((_QWORD *)v5 + 5) = 0;
      *((_QWORD *)v5 + 6) = 0;
    }
    *((_OWORD *)v5 + 2) = v24;
    *((_QWORD *)v5 + 6) = v25;
    if (v8 != v12)
      NSLog(CFSTR("Inconsistent joint count while decoding ABPK2D3DLiftingData."));
    *(_QWORD *)&v24 = 0;
    v14 = (__int128 *)objc_msgSend(objc_retainAutorelease(v10), "decodeBytesForKey:returnedLength:", CFSTR("multiArray"), &v24);
    if ((unint64_t)v24 >> 2 != 32)
    {
      NSLog(CFSTR("Inconsistent multiArray size (%lu) while decoding ABPK2D3DLiftingData."), (unint64_t)v24 >> 2);
      v21 = 0;
      goto LABEL_12;
    }
    v15 = *v14;
    v16 = v14[1];
    v17 = v14[2];
    *(_OWORD *)(v5 + 104) = v14[3];
    *(_OWORD *)(v5 + 88) = v17;
    *(_OWORD *)(v5 + 72) = v16;
    *(_OWORD *)(v5 + 56) = v15;
    v18 = v14[4];
    v19 = v14[5];
    v20 = v14[6];
    *(_OWORD *)(v5 + 168) = v14[7];
    *(_OWORD *)(v5 + 152) = v20;
    *(_OWORD *)(v5 + 136) = v19;
    *(_OWORD *)(v5 + 120) = v18;
  }
  v21 = v5;
LABEL_12:

  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", self->_rotationNeeded, CFSTR("rotationNeeded"));
  objc_msgSend(v4, "encodeBytes:length:forKey:", self->_rawJointsUsedForLifting.var0, *(_QWORD *)self->_anon_10 - (unint64_t)self->_rawJointsUsedForLifting.var0, CFSTR("rawJointsUsedForLifting"));
  objc_msgSend(v4, "encodeBytes:length:forKey:", self->_rotatedJointsUsedForLifting.var0, *(_QWORD *)self->_anon_28 - (unint64_t)self->_rotatedJointsUsedForLifting.var0, CFSTR("rotatedJointsUsedForLifting"));
  objc_msgSend(v4, "encodeBytes:length:forKey:", &self->_multiArray, 128, CFSTR("multiArray"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char *v5;
  unint64_t v6;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **var0;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v8;
  unint64_t v9;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v10;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v11;
  float32x2_t *v12;
  uint64_t v13;
  float32x2_t v14;
  float32x2_t *v15;
  float32x2_t v16;
  uint64_t v17;
  BOOL v18;
  unint64_t v20;
  unint64_t v21;
  float v22;

  v4 = a3;
  if ((objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v5 = (char *)v4;
    v6 = -[ABPK2D3DLiftingData jointCount](self, "jointCount");
    if (v6 == objc_msgSend(v5, "jointCount"))
    {
      var0 = self->_rawJointsUsedForLifting.var0;
      v8 = *(__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> ***)self->_anon_10;
      v9 = v8 - var0;
      v10 = self->_rotatedJointsUsedForLifting.var0;
      v11 = *(__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> ***)self->_anon_28;
      if (v9 == v11 - v10)
      {
        if (v8 == var0)
        {
LABEL_10:
          if (v11 == v10)
          {
LABEL_15:
            if (self->_rotationNeeded == *((_QWORD *)v5 + 39))
            {
              v17 = 0;
              while (vabds_f32(self->_multiArray.__elems_[v17], *(float *)&v5[v17 * 4 + 56]) <= 0.00000011921)
              {
                if (++v17 == 32)
                {
                  if (vabds_f32(self->_unnormalizedMultiArray.__elems_[0], *((float *)v5 + 46)) > 0.00000011921)
                    break;
                  v20 = 0;
                  do
                  {
                    v21 = v20;
                    if (v20 == 31)
                      break;
                    v22 = vabds_f32(self->_unnormalizedMultiArray.__elems_[v20 + 1], *(float *)&v5[4 * v20 + 188]);
                    ++v20;
                  }
                  while (v22 <= 0.00000011921);
                  v18 = v21 > 0x1E;
                  goto LABEL_21;
                }
              }
            }
          }
          else
          {
            v15 = (float32x2_t *)*((_QWORD *)v5 + 4);
            if (v9 <= 1)
              v9 = 1;
            while (1)
            {
              v16 = vsub_f32(*v15, *(float32x2_t *)v10);
              if (sqrtf(vaddv_f32(vmul_f32(v16, v16))) > 0.00000011921)
                break;
              ++v10;
              ++v15;
              if (!--v9)
                goto LABEL_15;
            }
          }
        }
        else
        {
          v12 = (float32x2_t *)*((_QWORD *)v5 + 1);
          if (v9 <= 1)
            v13 = 1;
          else
            v13 = v9;
          while (1)
          {
            v14 = vsub_f32(*v12, *(float32x2_t *)var0);
            if (sqrtf(vaddv_f32(vmul_f32(v14, v14))) > 0.00000011921)
              break;
            ++var0;
            ++v12;
            if (!--v13)
              goto LABEL_10;
          }
        }
      }
    }
    v18 = 0;
LABEL_21:

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (unint64_t)hash
{
  unint64_t result;
  float v4;
  float v5;

  result = -[ABPK2D3DLiftingData jointCount](self, "jointCount");
  if (result)
  {
    v4 = COERCE_FLOAT(*self->_rotatedJointsUsedForLifting.var0);
    LODWORD(v5) = HIDWORD(*(_QWORD *)(*(_QWORD *)self->_anon_28 - 8));
    return -[ABPK2D3DLiftingData jointCount](self, "jointCount") ^ (unint64_t)v4 ^ (unint64_t)v5;
  }
  return result;
}

- (void).cxx_destruct
{
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **var0;
  __compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **v4;

  var0 = self->_rotatedJointsUsedForLifting.var0;
  if (var0)
  {
    *(_QWORD *)self->_anon_28 = var0;
    operator delete(var0);
  }
  v4 = self->_rawJointsUsedForLifting.var0;
  if (v4)
  {
    *(_QWORD *)self->_anon_10 = v4;
    operator delete(v4);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end
