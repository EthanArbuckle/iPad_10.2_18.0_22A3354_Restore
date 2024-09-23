@implementation NUKeyframeSequenceDouble4

- (void)_compressAndStoreValues:(NUKeyframeSequenceDouble4 *)self count:(SEL)a2
{
  float64x2_t *v2;
  size_t v3;
  unint64_t v4;
  float64x2_t *v5;
  float64x2_t v7;
  float64x2_t v8;
  unsigned int v9;
  unint64_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t *v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  uint64_t v17;
  float64x2_t v23;
  float64x2_t v24;

  v4 = v3;
  v5 = v2;
  *(_QWORD *)self->_values = malloc_type_calloc(v3, 8uLL, 0x100004000313F17uLL);
  v8 = *v5;
  v7 = v5[1];
  if (v4 < 2)
  {
    v11 = *v5;
    v12 = v5[1];
  }
  else
  {
    v9 = 2;
    v10 = 1;
    v11 = *v5;
    v12 = v5[1];
    do
    {
      v13 = &v5[2 * v10];
      v14 = v13[1];
      v11 = vminnmq_f64(v11, *v13);
      v12 = vminnmq_f64(v12, v14);
      v8 = vmaxnmq_f64(v8, *v13);
      v7 = vmaxnmq_f64(v7, v14);
      v10 = v9++;
    }
    while (v10 < v4);
  }
  v15 = vsubq_f64(v7, v12);
  v16 = (float64x2_t)vdupq_n_s64(0x40EFFFE000000000uLL);
  *(float64x2_t *)self->_scale = vdivq_f64(vsubq_f64(v8, v11), v16);
  *(float64x2_t *)&self->_scale[16] = vdivq_f64(v15, v16);
  *(float64x2_t *)self->_bias = v11;
  *(float64x2_t *)&self->_bias[16] = v12;
  if (v4)
  {
    v17 = 0;
    __asm { FMOV            V4.2D, #1.0 }
    v23 = (float64x2_t)vbslq_s8((int8x16_t)vcgtzq_f64(*(float64x2_t *)&self->_scale[16]), (int8x16_t)vdivq_f64(_Q4, *(float64x2_t *)&self->_scale[16]), (int8x16_t)vdupq_n_s64(0x7FF0000000000000uLL));
    v24 = (float64x2_t)vbslq_s8((int8x16_t)vcgtzq_f64(*(float64x2_t *)self->_scale), (int8x16_t)vdivq_f64(_Q4, *(float64x2_t *)self->_scale), (int8x16_t)xmmword_1A671A2B0);
    do
    {
      *(int16x4_t *)(*(_QWORD *)self->_values + 8 * v17) = vmovn_s32(vuzp1q_s32((int32x4_t)vcvtq_s64_f64(vminnmq_f64(vmaxnmq_f64(vrndaq_f64(vmulq_f64(v24, vsubq_f64(v5[2 * v17], *(float64x2_t *)self->_bias))), (float64x2_t)0), v16)), (int32x4_t)vcvtq_s64_f64(vminnmq_f64(vmaxnmq_f64(vrndaq_f64(vmulq_f64(v23, vsubq_f64(
                                                                                      v5[2 * v17 + 1],
                                                                                      *(float64x2_t *)&self->_bias[16]))),
                                                                                (float64x2_t)0),
                                                                              v16))));
      ++v17;
    }
    while (v4 > v17);
  }
}

- (NUKeyframeSequenceDouble4)initWithInterpolation:(int64_t)a3 count:(unint64_t)a4 times:(id *)a5 values:
{
  uint64_t v5;
  uint64_t v6;
  NUKeyframeSequenceDouble4 *v8;
  NUKeyframeSequenceDouble4 *v9;
  objc_super v11;

  v6 = v5;
  v11.receiver = self;
  v11.super_class = (Class)NUKeyframeSequenceDouble4;
  v8 = -[NUKeyframeSequence initWithInterpolation:count:times:](&v11, sel_initWithInterpolation_count_times_, a3, a4, a5);
  v9 = v8;
  if (a4)
    -[NUKeyframeSequenceDouble4 _compressAndStoreValues:count:](v8, "_compressAndStoreValues:count:", v6, a4);
  return v9;
}

- (NUKeyframeSequenceDouble4)initWithKeyframeSequence:(id)a3 values:
{
  uint64_t v3;
  uint64_t v4;
  NUKeyframeSequenceDouble4 *v5;
  objc_super v7;

  v4 = v3;
  v7.receiver = self;
  v7.super_class = (Class)NUKeyframeSequenceDouble4;
  v5 = -[NUKeyframeSequence initWithKeyframeSequence:](&v7, sel_initWithKeyframeSequence_, a3);
  if (-[NUKeyframeSequence count](v5, "count"))
    -[NUKeyframeSequenceDouble4 _compressAndStoreValues:count:](v5, "_compressAndStoreValues:count:", v4, -[NUKeyframeSequence count](v5, "count"));
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = *(void **)self->_values;
  if (v3)
    free(v3);
  v4.receiver = self;
  v4.super_class = (Class)NUKeyframeSequenceDouble4;
  -[NUKeyframeSequence dealloc](&v4, sel_dealloc);
}

- (float64x2_t)valueOfKeyframeAtIndex:(float64x2_t *)a3@<X8>
{
  float64x2_t *v5;
  uint64_t v6;
  uint32x4_t v7;
  uint64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;

  if (*(_QWORD *)&result[7].f64[0])
  {
    v5 = result;
    result = (float64x2_t *)-[float64x2_t count](result, "count");
    v6 = (uint64_t)&result[-1].f64[1] + 7;
    if ((uint64_t)&result[-1].f64[1] + 7 >= a2)
      v6 = a2;
    v7 = vmovl_u16(*(uint16x4_t *)(*(_QWORD *)&v5[7].f64[0] + 8 * (v6 & ~(v6 >> 63))));
    v8.i64[0] = v7.u32[0];
    v8.i64[1] = v7.u32[1];
    v9 = vcvtq_f64_u64(v8);
    v8.i64[0] = v7.u32[2];
    v8.i64[1] = v7.u32[3];
    v10 = vmlaq_f64(v5[6], v5[4], vcvtq_f64_u64(v8));
    v11 = vmlaq_f64(v5[5], v5[3], v9);
  }
  else
  {
    v11 = 0uLL;
    v10 = 0uLL;
  }
  *a3 = v11;
  a3[1] = v10;
  return result;
}

- (CMTime)tangentOfKeyframeAtIndex:(float64x2_t *)a3@<X8>
{
  uint64_t v4;
  CMTime *v6;
  uint64_t v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  CMTime rhs;
  CMTime lhs;
  CMTime v17;
  CMTime v18[2];
  float64x2_t v19;
  float64x2_t v20;
  float64x2_t v21;
  float64x2_t v22;

  v4 = a2 - 1;
  if (a2 < 1
    || (v6 = result, result = (CMTime *)-[CMTime count](result, "count"), (uint64_t)&result[-1].epoch + 7 <= a2))
  {
    *a3 = 0u;
    a3[1] = 0u;
  }
  else
  {
    -[CMTime valueOfKeyframeAtIndex:](v6, "valueOfKeyframeAtIndex:", v4);
    v13 = v21;
    v14 = v22;
    v7 = a2 + 1;
    -[CMTime valueOfKeyframeAtIndex:](v6, "valueOfKeyframeAtIndex:", v7);
    v11 = v19;
    v12 = v20;
    memset(&v18[1], 0, sizeof(CMTime));
    -[CMTime timeOfKeyframeAtIndex:](v6, "timeOfKeyframeAtIndex:", v4);
    memset(v18, 0, 24);
    -[CMTime timeOfKeyframeAtIndex:](v6, "timeOfKeyframeAtIndex:", v7);
    memset(&v17, 0, sizeof(v17));
    lhs = v18[0];
    rhs = v18[1];
    result = CMTimeSubtract(&v17, &lhs, &rhs);
    if (v17.value < 1)
    {
      v10 = 0uLL;
      v9 = 0uLL;
    }
    else
    {
      v8 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(fmax((double)v17.value / (double)v17.timescale, 0.015625)), 0);
      v9 = vdivq_f64(vsubq_f64(v12, v14), v8);
      v10 = vdivq_f64(vsubq_f64(v11, v13), v8);
    }
    *a3 = v10;
    a3[1] = v9;
  }
  return result;
}

- (uint64_t)sampleAtTime:(float64x2_t *)a3@<X8>
{
  uint64_t result;
  float64x2_t v6;
  float64x2_t v7;
  uint64_t v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v18;
  float64x2_t v19;
  float64x2_t v20;
  float64x2_t v21;
  float64x2_t v22;
  float64x2_t v23;
  float64x2_t v24;
  float64x2_t v25;
  float64x2_t v26;
  __int128 v27;
  uint64_t v28;
  float64x2_t v29;
  float64x2_t v30;

  if ((*((_BYTE *)a2 + 12) & 1) != 0)
  {
    v27 = *a2;
    v28 = *((_QWORD *)a2 + 2);
    v9 = objc_msgSend(a1, "indexOfKeyframeAtOrBeforeTime:", &v27);
    result = objc_msgSend(a1, "interpolation");
    if (result == 2)
    {
      objc_msgSend(a1, "valueOfKeyframeAtIndex:", v9);
      objc_msgSend(a1, "valueOfKeyframeAtIndex:", v9 + 1);
      objc_msgSend(a1, "tangentOfKeyframeAtIndex:", v9);
      objc_msgSend(a1, "tangentOfKeyframeAtIndex:", v9 + 1);
      v27 = *a2;
      v28 = *((_QWORD *)a2 + 2);
      result = objc_msgSend(a1, "interpolantAtTime:", &v27);
      v6 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_n_f64(vmulq_laneq_f64(v15, v10, 1), v19, v10.f64[0]), v17, v11.f64[0]), v13, v11, 1);
      v7 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_n_f64(vmulq_laneq_f64(v14, v10, 1), v18, v10.f64[0]), v16, v11.f64[0]), v12, v11, 1);
    }
    else if (result == 1)
    {
      objc_msgSend(a1, "valueOfKeyframeAtIndex:", v9);
      objc_msgSend(a1, "valueOfKeyframeAtIndex:", v9 + 1);
      v27 = *a2;
      v28 = *((_QWORD *)a2 + 2);
      result = objc_msgSend(a1, "interpolantAtTime:", &v27);
      v6 = vmlaq_n_f64(vmulq_laneq_f64(v22, v20, 1), v24, v20.f64[0]);
      v7 = vmlaq_n_f64(vmulq_laneq_f64(v21, v20, 1), v23, v20.f64[0]);
    }
    else
    {
      if (result)
        return result;
      result = objc_msgSend(a1, "valueOfKeyframeAtIndex:", v9);
      v7 = v25;
      v6 = v26;
    }
  }
  else
  {
    result = objc_msgSend(a1, "valueOfKeyframeAtIndex:", 0);
    v7 = v29;
    v6 = v30;
  }
  *a3 = v7;
  a3[1] = v6;
  return result;
}

- (id)sparseSequence
{
  int64x2_t v4;
  void *v5;
  uint64_t v11;
  BOOL v12;
  int32_t v13;
  int32_t v14;
  double v15;
  int64x2_t v16;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  int v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  char *v34;
  uint64_t v35;
  id v36;
  void *v37;
  NUKeyframeSequenceDouble4 *v38;
  char *v39;
  uint64_t v40;
  char *v41;
  __int128 v42;
  id v43;
  float64x2_t v44;
  float64x2_t v45;
  float64x2_t v46;
  float64x2_t v47;
  float64x2_t v48;
  unint64_t v49;
  float64x2_t v50;
  void *v51;
  float64x2_t v52;
  char *v53;
  float64x2_t v54;
  float64x2_t v55;
  uint64_t v56;
  id obj[2];
  float64x2_t objb;
  id obja;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  float64x2_t v68;
  float64x2_t v69;
  CMTime rhs;
  CMTime time;
  CMTime lhs;
  CMTime v73;
  float64x2_t v74;
  float64x2_t v75;
  float64x2_t v76;
  float64x2_t v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];
  __int128 v81;
  __int128 v82;
  CMTime v83;
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  if (-[NUKeyframeSequence count](self, "count") <= 3)
    return self;
  v4 = (int64x2_t)vandq_s8((int8x16_t)vceqzq_f64(*(float64x2_t *)self->_scale), (int8x16_t)vceqzq_f64(*(float64x2_t *)&self->_scale[16]));
  if ((vandq_s8((int8x16_t)v4, (int8x16_t)vdupq_laneq_s64(v4, 1)).u64[0] & 0x8000000000000000) != 0)
  {
    -[NUKeyframeSequence timeOfKeyframeAtIndex:](self, "timeOfKeyframeAtIndex:", 0);
    -[NUKeyframeSequenceDouble4 valueOfKeyframeAtIndex:](self, "valueOfKeyframeAtIndex:", 0);
    v81 = v78;
    v82 = v79;
    v36 = objc_alloc((Class)objc_opt_class());
    v37 = (void *)objc_msgSend(v36, "initWithInterpolation:count:times:values:", -[NUKeyframeSequence interpolation](self, "interpolation"), 1, &v83, &v81);

    return v37;
  }
  else
  {
    v54 = *(float64x2_t *)&self->_scale[16];
    *(_OWORD *)obj = *(_OWORD *)self->_scale;
    v5 = (void *)objc_opt_new();
    if ((int)-[NUKeyframeSequence count](self, "count") >= 5)
    {
      __asm { FMOV            V2.2D, #1.0 }
      v46 = (float64x2_t)vbslq_s8((int8x16_t)vcgtzq_f64(*(float64x2_t *)obj), (int8x16_t)vdivq_f64(_Q2, *(float64x2_t *)obj), (int8x16_t)xmmword_1A671A2B0);
      v45 = (float64x2_t)vbslq_s8((int8x16_t)vcgtzq_f64(v54), (int8x16_t)vdivq_f64(_Q2, v54), (int8x16_t)vdupq_n_s64(0x7FF0000000000000uLL));
      v11 = 2;
      v44 = (float64x2_t)vdupq_n_s64(0x4058000000000000uLL);
      do
      {
        v81 = 0uLL;
        *(_QWORD *)&v82 = 0;
        -[NUKeyframeSequence timeOfKeyframeAtIndex:](self, "timeOfKeyframeAtIndex:", v11 - 2, *(_OWORD *)&v44, *(_OWORD *)&v45, *(_OWORD *)&v46);
        memset(&v83, 0, sizeof(v83));
        -[NUKeyframeSequence timeOfKeyframeAtIndex:](self, "timeOfKeyframeAtIndex:", v11 + 2);
        -[NUKeyframeSequenceDouble4 valueOfKeyframeAtIndex:](self, "valueOfKeyframeAtIndex:", v11 - 2);
        v50 = v76;
        v52 = v77;
        -[NUKeyframeSequenceDouble4 valueOfKeyframeAtIndex:](self, "valueOfKeyframeAtIndex:", v11 + 2);
        v12 = 0;
        v13 = 1;
        v14 = 7;
        v47 = v74;
        v48 = v75;
        while (1)
        {
          memset(&v73, 0, sizeof(v73));
          *(_OWORD *)&time.value = v81;
          time.epoch = v82;
          CMTimeMultiplyByRatio(&lhs, &time, v14, 8);
          time = v83;
          CMTimeMultiplyByRatio(&rhs, &time, v13, 8);
          CMTimeAdd(&v73, &lhs, &rhs);
          v15 = (double)v13 * 0.125;
          v55 = vmlaq_n_f64(vmulq_n_f64(v48, v15), v52, 1.0 - v15);
          objb = vmlaq_n_f64(vmulq_n_f64(v47, v15), v50, 1.0 - v15);
          time = v73;
          -[NUKeyframeSequenceDouble4 sampleAtTime:](self, "sampleAtTime:", &time);
          v16 = (int64x2_t)vorrq_s8((int8x16_t)vcgtq_f64(vmulq_f64(v46, vabdq_f64(objb, v68)), v44), (int8x16_t)vcgtq_f64(vmulq_f64(v45, vabdq_f64(v55, v69)), v44));
          if ((vorrq_s8((int8x16_t)v16, (int8x16_t)vdupq_laneq_s64(v16, 1)).u64[0] & 0x8000000000000000) != 0)
            break;
          v12 = v13++ > 6;
          if (!--v14)
            goto LABEL_14;
        }
        if (!v12)
          goto LABEL_15;
LABEL_14:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v18);

LABEL_15:
        ++v11;
      }
      while (v11 < (int)(-[NUKeyframeSequence count](self, "count") - 2));
    }
    if (objc_msgSend(v5, "count"))
    {
      v19 = -[NUKeyframeSequence count](self, "count");
      v20 = v19 - objc_msgSend(v5, "count");
      v53 = (char *)malloc_type_malloc(24 * v20, 0x1000040504FFAC1uLL);
      v21 = (char *)malloc_type_malloc(32 * v20, 0x1000040E0EAB150uLL);
      v64 = 0u;
      v65 = 0u;
      v66 = 0u;
      v67 = 0u;
      obja = v5;
      v22 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v64, v80, 16);
      if (v22)
      {
        v23 = v22;
        v49 = v20;
        v51 = v5;
        LODWORD(v20) = 0;
        v24 = 0;
        v25 = *(_QWORD *)v65;
        do
        {
          v26 = 0;
          v56 = v23;
          do
          {
            if (*(_QWORD *)v65 != v25)
              objc_enumerationMutation(obja);
            v27 = objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * v26), "intValue");
            if ((int)v20 >= v27)
            {
              v28 = v20;
            }
            else
            {
              v28 = v27;
              v29 = v24;
              v20 = (int)v20;
              v30 = &v53[24 * v24];
              v31 = v27;
              do
              {
                v32 = v29;
                -[NUKeyframeSequence timeOfKeyframeAtIndex:](self, "timeOfKeyframeAtIndex:", v20);
                v33 = v81;
                *((_QWORD *)v30 + 2) = v82;
                *(_OWORD *)v30 = v33;
                v30 += 24;
                -[NUKeyframeSequenceDouble4 valueOfKeyframeAtIndex:](self, "valueOfKeyframeAtIndex:", v20);
                v29 = v32 + 1;
                v34 = &v21[32 * v32];
                *(_OWORD *)v34 = v62;
                *((_OWORD *)v34 + 1) = v63;
                ++v20;
              }
              while (v31 != v20);
              v24 = v32 + 1;
              v23 = v56;
            }
            LODWORD(v20) = v28 + 1;
            ++v26;
          }
          while (v26 != v23);
          v23 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v64, v80, 16);
        }
        while (v23);
        v35 = (int)v20;
        v5 = v51;
        v20 = v49;
      }
      else
      {
        v35 = 0;
        v24 = 0;
      }

      if (v24 < (int)v20)
      {
        v39 = &v21[32 * v24];
        v40 = (int)v20 - (uint64_t)v24;
        v41 = &v53[24 * v24];
        do
        {
          -[NUKeyframeSequence timeOfKeyframeAtIndex:](self, "timeOfKeyframeAtIndex:", v35);
          v42 = v81;
          *((_QWORD *)v41 + 2) = v82;
          *(_OWORD *)v41 = v42;
          v41 += 24;
          -[NUKeyframeSequenceDouble4 valueOfKeyframeAtIndex:](self, "valueOfKeyframeAtIndex:", v35);
          *(_OWORD *)v39 = v60;
          *((_OWORD *)v39 + 1) = v61;
          v39 += 32;
          ++v35;
          --v40;
        }
        while (v40);
      }
      v43 = objc_alloc((Class)objc_opt_class());
      v38 = (NUKeyframeSequenceDouble4 *)objc_msgSend(v43, "initWithInterpolation:count:times:values:", -[NUKeyframeSequence interpolation](self, "interpolation"), v20, v53, v21);

      free(v53);
      free(v21);
    }
    else
    {
      v38 = self;
    }

    return v38;
  }
}

- (id)debugQuickLookObject
{
  CGColorSpace *DeviceRGB;
  CGContext *v4;
  double v5;
  CGColor *SRGB;
  CGFloat Width;
  int v8;
  uint64_t v9;
  float64x2_t v15;
  float64x2_t v16;
  double v17;
  uint64_t i;
  CGPath *v19;
  int32_t v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  CGPath *v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  CGPath *v31;
  uint64_t v32;
  double v33;
  CGPath *v34;
  uint64_t v35;
  const CGPath *v36;
  CGColor *v37;
  CGImage *Image;
  void *v39;
  CGContext *c;
  float64x2_t v42;
  uint64_t v43;
  uint64_t v44;
  float64x2_t v45;
  float64x2_t v46;
  float64x2_t v47;
  float64x2_t v48;
  __int128 v49;
  __int128 v50;
  float64x2_t v51;
  float64x2_t v52;
  __int128 v53;
  float64x2_t v54;
  float64x2_t v55;
  __int128 v56;
  _OWORD v57[2];
  _OWORD v58[2];
  _OWORD v59[2];
  _OWORD v60[2];
  _OWORD v61[2];
  _OWORD v62[4];
  CMTime v63;
  CMTime v64;
  float64x2_t v65;
  float64x2_t v66;
  CMTime time;
  CMTime v68;
  CMTime v69;
  CMTime v70;
  CMTime v71;
  CMTime v72[2];
  CMTime rhs;
  CGColorRef v74;
  CMTime lhs;
  CGMutablePathRef Mutable;
  uint64_t v77;
  CGRect v78;
  CGRect v79;

  v77 = *MEMORY[0x1E0C80C00];
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v4 = CGBitmapContextCreate(0, 0x40AuLL, 0x20AuLL, 8uLL, 0, DeviceRGB, 1u);
  CGColorSpaceRelease(DeviceRGB);
  CGContextSetAllowsAntialiasing(v4, 1);
  CGContextSetShouldAntialias(v4, 1);
  v5 = 0.0;
  SRGB = CGColorCreateSRGB(0.0, 0.0, 0.0, 1.0);
  CGContextSetFillColorWithColor(v4, SRGB);
  Width = (double)CGBitmapContextGetWidth(v4);
  v78.size.height = (double)CGBitmapContextGetHeight(v4);
  v78.origin.x = 0.0;
  v78.origin.y = 0.0;
  v78.size.width = Width;
  CGContextFillRect(v4, v78);
  CGColorRelease(SRGB);
  c = v4;
  CGContextSetLineWidth(v4, 1.5);
  v8 = -[NUKeyframeSequence count](self, "count");
  memset(&v72[1], 0, sizeof(CMTime));
  -[NUKeyframeSequence timeOfKeyframeAtIndex:](self, "timeOfKeyframeAtIndex:", 0);
  memset(v72, 0, 24);
  -[NUKeyframeSequence timeOfKeyframeAtIndex:](self, "timeOfKeyframeAtIndex:", v8 - 1);
  memset(&v71, 0, sizeof(v71));
  lhs = v72[0];
  rhs = v72[1];
  CMTimeSubtract(&v71, &lhs, &rhs);
  v51 = *(float64x2_t *)self->_scale;
  v54 = *(float64x2_t *)&self->_scale[16];
  lhs.value = (CMTimeValue)CGPathCreateMutable();
  *(_QWORD *)&lhs.timescale = CGPathCreateMutable();
  lhs.epoch = (CMTimeEpoch)CGPathCreateMutable();
  Mutable = CGPathCreateMutable();
  memset(&v70, 0, sizeof(v70));
  -[NUKeyframeSequence timeOfKeyframeAtIndex:](self, "timeOfKeyframeAtIndex:", 0);
  if (v8 >= 1)
  {
    v9 = 0;
    __asm { FMOV            V2.2D, #1.0 }
    v48 = (float64x2_t)vbslq_s8((int8x16_t)vcgtzq_f64(v54), (int8x16_t)vdivq_f64(_Q2, v54), (int8x16_t)vdupq_n_s64(0x7FF0000000000000uLL));
    v47 = (float64x2_t)vbslq_s8((int8x16_t)vcgtzq_f64(v51), (int8x16_t)vdivq_f64(_Q2, v51), (int8x16_t)xmmword_1A671A2B0);
    v43 = v8;
    v15 = 0uLL;
    v42 = (float64x2_t)vdupq_n_s64(0x3F80001000100010uLL);
    v16 = 0uLL;
    do
    {
      v52 = v16;
      v55 = v15;
      memset(&rhs, 0, sizeof(rhs));
      -[NUKeyframeSequence timeOfKeyframeAtIndex:](self, "timeOfKeyframeAtIndex:", v9);
      memset(&v69, 0, sizeof(v69));
      v68 = rhs;
      time = v72[1];
      CMTimeSubtract(&v69, &v68, &time);
      v17 = (double)v69.value / (double)v69.timescale * 1024.0 / ((double)v71.value / (double)v71.timescale);
      -[NUKeyframeSequenceDouble4 valueOfKeyframeAtIndex:](self, "valueOfKeyframeAtIndex:", v9);
      v16 = vmulq_f64(v48, vmulq_f64(vsubq_f64(v66, *(float64x2_t *)&self->_bias[16]), v42));
      v15 = vmulq_f64(v47, vmulq_f64(vsubq_f64(v65, *(float64x2_t *)self->_bias), v42));
      v45 = v15;
      v46 = v16;
      if (v9)
      {
        v44 = v9;
        for (i = 0; i != 4; ++i)
        {
          v19 = (CGPath *)*(&lhs.value + i);
          v62[0] = v55;
          v62[1] = v52;
          CGPathMoveToPoint(v19, 0, v5 + 5.0, *((double *)v62 + (i & 3)) * 0.25 + (double)(int)i * 512.0 * 0.25 + 5.0);
        }
        v20 = 1;
        v21 = 1.0;
        v22 = 1.0;
        do
        {
          v23 = v17 * (v21 * 0.03125) + 5.0 + v5 * (v22 - v21 * 0.03125);
          memset(&v68, 0, sizeof(v68));
          time = rhs;
          CMTimeMultiplyByRatio(&v64, &time, v20, 32);
          time = v70;
          CMTimeMultiplyByRatio(&v63, &time, 32 - v20, 32);
          CMTimeAdd(&v68, &v64, &v63);
          time = v68;
          -[NUKeyframeSequenceDouble4 sampleAtTime:](self, "sampleAtTime:", &time);
          v24 = 0;
          v53 = v62[2];
          v56 = v62[3];
          v49 = *(_OWORD *)self->_bias;
          v50 = *(_OWORD *)&self->_bias[16];
          do
          {
            v25 = (CGPath *)*(&lhs.value + v24);
            v61[0] = v53;
            v61[1] = v56;
            v26 = 8 * (v24 & 3);
            v27 = *(double *)((char *)v61 + v26);
            v60[0] = v49;
            v60[1] = v50;
            v28 = (v27 - *(double *)((char *)v60 + v26)) * 0.00781261921;
            v59[0] = v47;
            v59[1] = v48;
            CGPathAddLineToPoint(v25, 0, v23, (double)(int)v24++ * 512.0 * 0.25 + *(double *)((char *)v59 + v26) * v28 * 0.25 + 5.0);
          }
          while (v24 != 4);
          v22 = 1.0;
          v21 = v21 + 1.0;
          ++v20;
        }
        while (v20 != 33);
        v29 = v17 + 5.0;
        v9 = v44;
        v15 = v45;
        v16 = v46;
      }
      else
      {
        v30 = 0;
        v29 = v17 + 5.0;
        do
        {
          v31 = (CGPath *)*(&lhs.value + v30);
          v58[0] = v15;
          v58[1] = v16;
          CGPathMoveToPoint(v31, 0, v17 + 5.0, *((double *)v58 + (v30 & 3)) * 0.25 + (double)(int)v30 * 512.0 * 0.25 + 5.0);
          v15 = v45;
          v16 = v46;
          ++v30;
        }
        while (v30 != 4);
      }
      v32 = 0;
      v33 = v29 + -1.0;
      do
      {
        v34 = (CGPath *)*(&lhs.value + v32);
        v57[0] = v15;
        v57[1] = v16;
        v79.origin.y = *((double *)v57 + (v32 & 3)) * 0.25 + (double)(int)v32 * 512.0 * 0.25 + 5.0 + -2.0;
        v79.size.width = 5.0;
        v79.size.height = 5.0;
        v79.origin.x = v33;
        CGPathAddEllipseInRect(v34, 0, v79);
        v15 = v45;
        v16 = v46;
        ++v32;
      }
      while (v32 != 4);
      v70 = rhs;
      ++v9;
      v5 = v17;
    }
    while (v9 != v43);
  }
  rhs.value = (CMTimeValue)CGColorCreateSRGB(1.0, 0.0, 0.0, 1.0);
  *(_QWORD *)&rhs.timescale = CGColorCreateSRGB(0.0, 1.0, 0.0, 1.0);
  rhs.epoch = (CMTimeEpoch)CGColorCreateSRGB(0.0, 0.0, 1.0, 1.0);
  v35 = 0;
  v74 = CGColorCreateSRGB(0.8, 0.8, 0.0, 1.0);
  do
  {
    v36 = *(const CGPath **)((char *)&lhs.value + v35);
    CGContextAddPath(c, v36);
    v37 = *(CGColor **)((char *)&rhs.value + v35);
    CGContextSetStrokeColorWithColor(c, v37);
    CGContextStrokePath(c);
    CGPathRelease(v36);
    CGColorRelease(v37);
    v35 += 8;
  }
  while (v35 != 32);
  CGContextFlush(c);
  Image = CGBitmapContextCreateImage(c);
  NUDebugQuicklookWrapCGImage((uint64_t)Image);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(Image);
  CGContextRelease(c);
  return v39;
}

@end
