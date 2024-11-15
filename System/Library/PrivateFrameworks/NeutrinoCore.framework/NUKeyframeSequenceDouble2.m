@implementation NUKeyframeSequenceDouble2

- (void)_compressAndStoreValues:(NUKeyframeSequenceDouble2 *)self count:(SEL)a2
{
  float64x2_t *v2;
  size_t v3;
  unint64_t v4;
  float64x2_t *v5;
  float64x2_t v7;
  unsigned int v8;
  unint64_t v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  uint64_t v14;
  float64x2_t v20;
  int32x2_t v21;
  _WORD *v22;

  v4 = v3;
  v5 = v2;
  *(_QWORD *)self->_values = malloc_type_calloc(v3, 4uLL, 0x100004052888210uLL);
  v7 = *v5;
  if (v4 < 2)
  {
    v10 = *v5;
  }
  else
  {
    v8 = 2;
    v9 = 1;
    v10 = *v5;
    do
    {
      v11 = v5[v9];
      v10 = vminnmq_f64(v10, v11);
      v7 = vmaxnmq_f64(v7, v11);
      v9 = v8++;
    }
    while (v9 < v4);
  }
  v12 = vsubq_f64(v7, v10);
  v13 = (float64x2_t)vdupq_n_s64(0x40EFFFE000000000uLL);
  *(float64x2_t *)self->_scale = vdivq_f64(v12, v13);
  *(float64x2_t *)self->_bias = v10;
  if (v4)
  {
    v14 = 0;
    __asm { FMOV            V3.2D, #1.0 }
    v20 = (float64x2_t)vbslq_s8((int8x16_t)vcgtzq_f64(*(float64x2_t *)self->_scale), (int8x16_t)vdivq_f64(_Q3, *(float64x2_t *)self->_scale), (int8x16_t)_Q3);
    do
    {
      v21 = vmovn_s64(vcvtq_s64_f64(vminnmq_f64(vmaxnmq_f64(vrndaq_f64(vmulq_f64(v20, vsubq_f64(v5[v14], *(float64x2_t *)self->_bias))), (float64x2_t)0), v13)));
      v22 = (_WORD *)(*(_QWORD *)self->_values + 4 * v14);
      v22[1] = v21.i16[2];
      *v22 = v21.i16[0];
      ++v14;
    }
    while (v4 > v14);
  }
}

- (NUKeyframeSequenceDouble2)initWithInterpolation:(int64_t)a3 count:(unint64_t)a4 times:(id *)a5 values:
{
  uint64_t v5;
  uint64_t v6;
  NUKeyframeSequenceDouble2 *v8;
  NUKeyframeSequenceDouble2 *v9;
  objc_super v11;

  v6 = v5;
  v11.receiver = self;
  v11.super_class = (Class)NUKeyframeSequenceDouble2;
  v8 = -[NUKeyframeSequence initWithInterpolation:count:times:](&v11, sel_initWithInterpolation_count_times_, a3, a4, a5);
  v9 = v8;
  if (a4)
    -[NUKeyframeSequenceDouble2 _compressAndStoreValues:count:](v8, "_compressAndStoreValues:count:", v6, a4);
  return v9;
}

- (NUKeyframeSequenceDouble2)initWithKeyframeSequence:(id)a3 values:
{
  uint64_t v3;
  uint64_t v4;
  NUKeyframeSequenceDouble2 *v5;
  objc_super v7;

  v4 = v3;
  v7.receiver = self;
  v7.super_class = (Class)NUKeyframeSequenceDouble2;
  v5 = -[NUKeyframeSequence initWithKeyframeSequence:](&v7, sel_initWithKeyframeSequence_, a3);
  if (-[NUKeyframeSequence count](v5, "count"))
    -[NUKeyframeSequenceDouble2 _compressAndStoreValues:count:](v5, "_compressAndStoreValues:count:", v4, -[NUKeyframeSequence count](v5, "count"));
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
  v4.super_class = (Class)NUKeyframeSequenceDouble2;
  -[NUKeyframeSequence dealloc](&v4, sel_dealloc);
}

- (double)valueOfKeyframeAtIndex:(uint64_t)a3
{
  uint64_t v5;
  unsigned __int16 *v6;
  uint64x2_t v7;
  double result;

  if (!*(_QWORD *)(a1 + 80))
    return 0.0;
  v5 = objc_msgSend((id)a1, "count") - 1;
  if (v5 >= a3)
    v5 = a3;
  v6 = (unsigned __int16 *)(*(_QWORD *)(a1 + 80) + 4 * (v5 & ~(v5 >> 63)));
  v7.i64[0] = *v6;
  v7.i64[1] = v6[1];
  *(_QWORD *)&result = *(_OWORD *)&vmlaq_f64(*(float64x2_t *)(a1 + 64), *(float64x2_t *)(a1 + 48), vcvtq_f64_u64(v7));
  return result;
}

- (double)tangentOfKeyframeAtIndex:(uint64_t)a3
{
  double result;
  uint64_t v4;
  uint64_t v7;
  float64x2_t v8;
  uint64_t v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  CMTime rhs;
  CMTime lhs;
  CMTime v15;
  CMTime v16[2];

  result = 0.0;
  v4 = a3 - 1;
  if (a3 >= 1)
  {
    v7 = objc_msgSend(a1, "count", 0.0);
    result = 0.0;
    if (v7 - 1 > a3)
    {
      objc_msgSend(a1, "valueOfKeyframeAtIndex:", v4, 0.0);
      v12 = v8;
      v9 = a3 + 1;
      objc_msgSend(a1, "valueOfKeyframeAtIndex:", v9);
      v11 = v10;
      memset(&v16[1], 0, sizeof(CMTime));
      objc_msgSend(a1, "timeOfKeyframeAtIndex:", v4);
      memset(v16, 0, 24);
      objc_msgSend(a1, "timeOfKeyframeAtIndex:", v9);
      memset(&v15, 0, sizeof(v15));
      lhs = v16[0];
      rhs = v16[1];
      CMTimeSubtract(&v15, &lhs, &rhs);
      if (v15.value < 1)
        return 0.0;
      else
        *(_QWORD *)&result = *(_OWORD *)&vdivq_f64(vsubq_f64(v11, v12), (float64x2_t)vdupq_lane_s64(COERCE__INT64(fmax((double)v15.value / (double)v15.timescale, 0.015625)), 0));
    }
  }
  return result;
}

- (double)sampleAtTime:(__int128 *)a3
{
  double result;
  uint64_t v6;
  uint64_t v7;
  float64x2_t v8;
  float64x2_t v9;
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
  __int128 v23;
  uint64_t v24;

  if ((*((_BYTE *)a3 + 12) & 1) != 0)
  {
    v23 = *a3;
    v24 = *((_QWORD *)a3 + 2);
    v6 = objc_msgSend(a1, "indexOfKeyframeAtOrBeforeTime:", &v23);
    v7 = objc_msgSend(a1, "interpolation");
    switch(v7)
    {
      case 2:
        objc_msgSend(a1, "valueOfKeyframeAtIndex:", v6);
        v18 = v8;
        objc_msgSend(a1, "valueOfKeyframeAtIndex:", v6 + 1);
        v16 = v9;
        objc_msgSend(a1, "tangentOfKeyframeAtIndex:", v6);
        v15 = v10;
        objc_msgSend(a1, "tangentOfKeyframeAtIndex:", v6 + 1);
        v14 = v11;
        v23 = *a3;
        v24 = *((_QWORD *)a3 + 2);
        objc_msgSend(a1, "interpolantAtTime:", &v23);
        *(_QWORD *)&result = *(_OWORD *)&vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_n_f64(vmulq_laneq_f64(v15, v20, 1), v18, v20.f64[0]), v16, v21.f64[0]), v14, v21, 1);
        break;
      case 1:
        objc_msgSend(a1, "valueOfKeyframeAtIndex:", v6);
        v19 = v12;
        objc_msgSend(a1, "valueOfKeyframeAtIndex:", v6 + 1);
        v17 = v13;
        v23 = *a3;
        v24 = *((_QWORD *)a3 + 2);
        objc_msgSend(a1, "interpolantAtTime:", &v23);
        *(_QWORD *)&result = *(_OWORD *)&vmlaq_n_f64(vmulq_laneq_f64(v17, v22, 1), v19, v22.f64[0]);
        break;
      case 0:
        objc_msgSend(a1, "valueOfKeyframeAtIndex:", v6);
        break;
    }
  }
  else
  {
    objc_msgSend(a1, "valueOfKeyframeAtIndex:", 0);
  }
  return result;
}

- (id)debugQuickLookObject
{
  CGColorSpace *DeviceRGB;
  CGContext *v4;
  double v5;
  CGColor *SRGB;
  CGFloat Width;
  int v8;
  const CGPath *Mutable;
  const CGPath *v10;
  uint64_t v11;
  uint64_t v17;
  float64x2_t v18;
  double v19;
  float64x2_t v20;
  uint64_t v21;
  char v22;
  char v23;
  CGPath *v24;
  int32_t v25;
  double v26;
  double v27;
  double v28;
  __int128 v29;
  uint64_t v30;
  char v31;
  CGPath *v32;
  char v33;
  double v34;
  double v35;
  double v36;
  char v37;
  char v38;
  CGPath *v39;
  uint64_t v40;
  double v41;
  char v42;
  char v43;
  CGPath *v44;
  CGColor *v45;
  CGColor *v46;
  CGImage *Image;
  void *v48;
  const CGPath *v50;
  CGContext *v51;
  float64x2_t v52;
  float64x2_t v53;
  float64x2_t v54;
  __int128 v55;
  float64x2_t v56;
  float64x2_t v57;
  __int128 v58;
  float64x2_t v59;
  float64x2_t v60;
  __int128 v61;
  __int128 v62;
  float64x2_t v63;
  float64x2_t v64;
  CMTime v65;
  CMTime v66;
  CMTime time;
  CMTime v68;
  CMTime v69;
  CMTime rhs;
  CMTime lhs;
  CMTime v72;
  CMTime v73[2];
  _QWORD v74[4];
  CGRect v75;
  CGRect v76;

  v74[2] = *MEMORY[0x1E0C80C00];
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v4 = CGBitmapContextCreate(0, 0x40AuLL, 0x20AuLL, 8uLL, 0, DeviceRGB, 1u);
  CGColorSpaceRelease(DeviceRGB);
  CGContextSetAllowsAntialiasing(v4, 1);
  CGContextSetShouldAntialias(v4, 1);
  v5 = 0.0;
  SRGB = CGColorCreateSRGB(0.0, 0.0, 0.0, 1.0);
  CGContextSetFillColorWithColor(v4, SRGB);
  Width = (double)CGBitmapContextGetWidth(v4);
  v75.size.height = (double)CGBitmapContextGetHeight(v4);
  v75.origin.x = 0.0;
  v75.origin.y = 0.0;
  v75.size.width = Width;
  CGContextFillRect(v4, v75);
  CGColorRelease(SRGB);
  CGContextSetLineWidth(v4, 1.5);
  v8 = -[NUKeyframeSequence count](self, "count");
  memset(&v73[1], 0, sizeof(CMTime));
  -[NUKeyframeSequence timeOfKeyframeAtIndex:](self, "timeOfKeyframeAtIndex:", 0);
  memset(v73, 0, 24);
  -[NUKeyframeSequence timeOfKeyframeAtIndex:](self, "timeOfKeyframeAtIndex:", v8 - 1);
  memset(&v72, 0, sizeof(v72));
  lhs = v73[0];
  rhs = v73[1];
  CMTimeSubtract(&v72, &lhs, &rhs);
  v56 = *(float64x2_t *)self->_scale;
  Mutable = CGPathCreateMutable();
  v74[0] = Mutable;
  v10 = CGPathCreateMutable();
  v74[1] = v10;
  memset(&lhs, 0, sizeof(lhs));
  -[NUKeyframeSequence timeOfKeyframeAtIndex:](self, "timeOfKeyframeAtIndex:", 0);
  if (v8 >= 1)
  {
    v50 = v10;
    v51 = v4;
    v11 = 0;
    __asm { FMOV            V1.2D, #1.0 }
    v54 = (float64x2_t)vbslq_s8((int8x16_t)vcgtzq_f64(v56), (int8x16_t)vdivq_f64(_Q1, v56), (int8x16_t)_Q1);
    v17 = v8;
    v18 = 0uLL;
    v52 = (float64x2_t)vdupq_n_s64(0x3F7F601F601F601FuLL);
    do
    {
      v57 = v18;
      memset(&rhs, 0, sizeof(rhs));
      -[NUKeyframeSequence timeOfKeyframeAtIndex:](self, "timeOfKeyframeAtIndex:", v11, v50, v51);
      memset(&v69, 0, sizeof(v69));
      v68 = rhs;
      time = v73[1];
      CMTimeSubtract(&v69, &v68, &time);
      v19 = (double)v69.value / (double)v69.timescale * 1024.0 / ((double)v72.value / (double)v72.timescale);
      -[NUKeyframeSequenceDouble2 valueOfKeyframeAtIndex:](self, "valueOfKeyframeAtIndex:", v11);
      v18 = vmulq_f64(v54, vmulq_f64(vsubq_f64(v20, *(float64x2_t *)self->_bias), v52));
      v53 = v18;
      v21 = 0;
      if (v11)
      {
        v22 = 1;
        do
        {
          v23 = v22;
          v24 = (CGPath *)v74[v21];
          v64 = v57;
          CGPathMoveToPoint(v24, 0, v5 + 5.0, *(double *)((unint64_t)&v64 & 0xFFFFFFFFFFFFFFF7 | (8 * (v21 & 1))) * 0.5+ (double)(int)v21 * 512.0 * 0.5+ 5.0);
          v22 = 0;
          v21 = 1;
        }
        while ((v23 & 1) != 0);
        v25 = 1;
        v26 = 1.0;
        v27 = 1.0;
        do
        {
          v28 = v19 * (v26 * 0.03125) + 5.0 + v5 * (v27 - v26 * 0.03125);
          memset(&v68, 0, sizeof(v68));
          time = rhs;
          CMTimeMultiplyByRatio(&v66, &time, v25, 32);
          time = lhs;
          CMTimeMultiplyByRatio(&v65, &time, 32 - v25, 32);
          CMTimeAdd(&v68, &v66, &v65);
          time = v68;
          -[NUKeyframeSequenceDouble2 sampleAtTime:](self, "sampleAtTime:", &time);
          v58 = v29;
          v30 = 0;
          v55 = *(_OWORD *)self->_bias;
          v31 = 1;
          do
          {
            v32 = (CGPath *)v74[v30];
            v33 = v31;
            v61 = v58;
            v34 = *(double *)((unint64_t)&v61 & 0xFFFFFFFFFFFFFFF7 | (8 * (v30 & 1)));
            v62 = v55;
            v35 = (v34 - *(double *)((unint64_t)&v62 & 0xFFFFFFFFFFFFFFF7 | (8 * (v30 & 1)))) * 0.00766002899;
            v63 = v54;
            CGPathAddLineToPoint(v32, 0, v28, (double)(int)v30 * 512.0 * 0.5+ *(double *)((unint64_t)&v63 & 0xFFFFFFFFFFFFFFF7 | (8 * (v30 & 1))) * v35 * 0.5+ 5.0);
            v31 = 0;
            v30 = 1;
          }
          while ((v33 & 1) != 0);
          v27 = 1.0;
          v26 = v26 + 1.0;
          ++v25;
        }
        while (v25 != 33);
        v36 = v19 + 5.0;
        v18 = v53;
      }
      else
      {
        v36 = v19 + 5.0;
        v37 = 1;
        do
        {
          v38 = v37;
          v39 = (CGPath *)v74[v21];
          v60 = v18;
          CGPathMoveToPoint(v39, 0, v19 + 5.0, *(double *)((unint64_t)&v60 & 0xFFFFFFFFFFFFFFF7 | (8 * (v21 & 1))) * 0.5+ (double)(int)v21 * 512.0 * 0.5+ 5.0);
          v18 = v53;
          v37 = 0;
          v21 = 1;
        }
        while ((v38 & 1) != 0);
      }
      v40 = 0;
      v41 = v36 + -1.0;
      v42 = 1;
      do
      {
        v43 = v42;
        v44 = (CGPath *)v74[v40];
        v59 = v18;
        v76.origin.y = *(double *)((unint64_t)&v59 & 0xFFFFFFFFFFFFFFF7 | (8 * (v40 & 1))) * 0.5
                     + (double)(int)v40 * 512.0 * 0.5
                     + 5.0
                     + -2.0;
        v76.size.width = 5.0;
        v76.size.height = 5.0;
        v76.origin.x = v41;
        CGPathAddEllipseInRect(v44, 0, v76);
        v18 = v53;
        v42 = 0;
        v40 = 1;
      }
      while ((v43 & 1) != 0);
      lhs = rhs;
      ++v11;
      v5 = v19;
    }
    while (v11 != v17);
    Mutable = (const CGPath *)v74[0];
    v10 = v50;
    v4 = v51;
  }
  v45 = CGColorCreateSRGB(1.0, 0.0, 0.0, 1.0);
  v46 = CGColorCreateSRGB(0.0, 1.0, 0.0, 1.0);
  CGContextAddPath(v4, Mutable);
  CGContextSetStrokeColorWithColor(v4, v45);
  CGContextStrokePath(v4);
  CGPathRelease(Mutable);
  CGColorRelease(v45);
  CGContextAddPath(v4, v10);
  CGContextSetStrokeColorWithColor(v4, v46);
  CGContextStrokePath(v4);
  CGPathRelease(v10);
  CGColorRelease(v46);
  CGContextFlush(v4);
  Image = CGBitmapContextCreateImage(v4);
  NUDebugQuicklookWrapCGImage((uint64_t)Image);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(Image);
  CGContextRelease(v4);
  return v48;
}

@end
