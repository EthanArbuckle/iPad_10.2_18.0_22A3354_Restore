@implementation ICDocCamImageQuad

- (ICDocCamImageQuad)initWithBottomLeft:(CGPoint)a3 bottomRight:(CGPoint)a4 topLeft:(CGPoint)a5 topRight:(CGPoint)a6
{
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  ICDocCamImageQuad *result;

  y = a6.y;
  x = a6.x;
  v8 = a5.y;
  v9 = a5.x;
  v10 = a4.y;
  v11 = a4.x;
  v12 = a3.y;
  v13 = a3.x;
  result = -[ICDocCamImageQuad init](self, "init");
  if (result)
  {
    result->_bottomLeft.x = v13;
    result->_bottomLeft.y = v12;
    result->_bottomRight.x = v11;
    result->_bottomRight.y = v10;
    result->_topLeft.x = v9;
    result->_topLeft.y = v8;
    result->_topRight.x = x;
    result->_topRight.y = y;
  }
  return result;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\ntopLeft    : %.2f %.2f \ntopRight   : %.2f %.2f \nbottomLeft : %.2f %.2f \nbottomRight: %.2f %.2f"), *(_QWORD *)&self->_topLeft.x, *(_QWORD *)&self->_topLeft.y, *(_QWORD *)&self->_topRight.x, *(_QWORD *)&self->_topRight.y, *(_QWORD *)&self->_bottomLeft.x, *(_QWORD *)&self->_bottomLeft.y, *(_QWORD *)&self->_bottomRight.x, *(_QWORD *)&self->_bottomRight.y);
}

- (id)imageQuadByScalingBy:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;

  height = a3.height;
  width = a3.width;
  -[ICDocCamImageQuad bottomLeft](self, "bottomLeft");
  v7 = v6;
  v9 = v8;
  -[ICDocCamImageQuad bottomRight](self, "bottomRight");
  v11 = v10;
  v13 = v12;
  -[ICDocCamImageQuad topLeft](self, "topLeft");
  v15 = v14;
  v17 = v16;
  -[ICDocCamImageQuad topRight](self, "topRight");
  return -[ICDocCamImageQuad initWithBottomLeft:bottomRight:topLeft:topRight:]([ICDocCamImageQuad alloc], "initWithBottomLeft:bottomRight:topLeft:topRight:", width * v7, height * v9, width * v11, height * v13, width * v15, height * v17, width * v18, height * v19);
}

- (CGRect)bounds
{
  double v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  _BYTE v22[16];
  uint64_t v23;
  _QWORD v24[6];
  CGRect result;

  v24[5] = *MEMORY[0x24BDAC8D0];
  -[ICDocCamImageQuad topLeft](self, "topLeft");
  v4 = v3;
  v6 = v5;
  -[ICDocCamImageQuad topRight](self, "topRight");
  v23 = v7;
  v24[0] = v8;
  -[ICDocCamImageQuad bottomLeft](self, "bottomLeft");
  v24[1] = v9;
  v24[2] = v10;
  -[ICDocCamImageQuad bottomRight](self, "bottomRight");
  v11 = 0;
  v24[3] = v12;
  v24[4] = v13;
  v14 = v4;
  v15 = v6;
  do
  {
    v16 = *(double *)&v22[v11 * 8 + 16];
    v17 = *(double *)&v24[v11];
    if (v4 >= v16)
      v4 = *(double *)&v22[v11 * 8 + 16];
    if (v14 < v16)
      v14 = *(double *)&v22[v11 * 8 + 16];
    if (v6 >= v17)
      v6 = *(double *)&v24[v11];
    if (v15 < v17)
      v15 = *(double *)&v24[v11];
    v11 += 2;
  }
  while (v11 != 6);
  v18 = v14 - v4;
  v19 = v15 - v6;
  v20 = v4;
  v21 = v6;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (CGSize)perspectiveCorrectedSize
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  float64_t v10;
  float64x2_t v11;
  int8x16_t v12;
  float64_t v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v18;
  int8x16_t v19;
  float32x2_t v24;
  float v25;
  float64x2_t v26;
  float64x2_t v28;
  double v29;
  float64_t v30;
  uint64_t v31;
  float64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  CGSize result;

  -[ICDocCamImageQuad topLeft](self, "topLeft");
  v31 = v3;
  v34 = v4;
  -[ICDocCamImageQuad topRight](self, "topRight");
  v30 = v5;
  v32 = v6;
  -[ICDocCamImageQuad bottomRight](self, "bottomRight");
  v33 = v7;
  v35 = v8;
  -[ICDocCamImageQuad bottomLeft](self, "bottomLeft");
  *(float64_t *)_Q3.i64 = v30;
  *(float64_t *)&_Q3.i64[1] = v10;
  v11 = vsubq_f64((float64x2_t)vdupq_lane_s64(v31, 0), (float64x2_t)_Q3);
  v12 = _Q3;
  *(float64_t *)_Q3.i64 = v32;
  *(float64_t *)&_Q3.i64[1] = v13;
  v14 = vsubq_f64((float64x2_t)vdupq_lane_s64(v34, 0), (float64x2_t)_Q3);
  v15 = vsqrtq_f64(vmlaq_f64(vmulq_f64(v14, v14), v11, v11));
  v16 = vsubq_f64((float64x2_t)vdupq_lane_s64(v33, 0), (float64x2_t)vextq_s8(v12, v12, 8uLL));
  v17 = vsubq_f64((float64x2_t)vdupq_lane_s64(v35, 0), (float64x2_t)vextq_s8(_Q3, _Q3, 8uLL));
  v18 = vsqrtq_f64(vmlaq_f64(vmulq_f64(v17, v17), v16, v16));
  v19 = (int8x16_t)vdivq_f64(v15, v18);
  *(float32x2_t *)v19.i8 = vcvt_f32_f64((float64x2_t)vextq_s8(v19, v19, 8uLL));
  __asm { FMOV            V3.2S, #1.0 }
  v24 = (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(*(float32x2_t *)v19.i8, *(float32x2_t *)_Q3.i8), *(int8x8_t *)v19.i8, (int8x8_t)vdiv_f32(*(float32x2_t *)_Q3.i8, *(float32x2_t *)v19.i8));
  v25 = v24.f32[1];
  if (v24.f32[0] >= v24.f32[1])
    v25 = v24.f32[0];
  if (v25 > 2.0)
    v24 = vcvt_f32_f64(vmulq_n_f64(vcvtq_f64_f32(v24), 2.0 / v25));
  v26 = vrndpq_f64(vmulq_f64((float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v18, v15), (int8x16_t)v18, (int8x16_t)v15), vcvtq_f64_f32(v24)));
  __asm { FMOV            V1.2D, #-2.0 }
  v28 = vaddq_f64(v26, _Q1);
  v29 = v28.f64[1];
  result.width = v28.f64[0];
  result.height = v29;
  return result;
}

- (void)flipPointsWithSourceFrame:(CGRect)a3
{
  -[ICDocCamImageQuad topLeft](self, "topLeft");
  DCTSDFlipPoint();
  -[ICDocCamImageQuad setTopLeft:](self, "setTopLeft:");
  -[ICDocCamImageQuad topRight](self, "topRight");
  DCTSDFlipPoint();
  -[ICDocCamImageQuad setTopRight:](self, "setTopRight:");
  -[ICDocCamImageQuad bottomRight](self, "bottomRight");
  DCTSDFlipPoint();
  -[ICDocCamImageQuad setBottomRight:](self, "setBottomRight:");
  -[ICDocCamImageQuad bottomLeft](self, "bottomLeft");
  DCTSDFlipPoint();
  -[ICDocCamImageQuad setBottomLeft:](self, "setBottomLeft:");
}

- (void)clampQuadToRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[ICDocCamImageQuad topLeft](self, "topLeft");
  -[ICDocCamImageQuad setTopLeft:](self, "setTopLeft:", DCTSDClampPointInRect(v8, v9, x, y, width, height));
  -[ICDocCamImageQuad topRight](self, "topRight");
  -[ICDocCamImageQuad setTopRight:](self, "setTopRight:", DCTSDClampPointInRect(v10, v11, x, y, width, height));
  -[ICDocCamImageQuad bottomRight](self, "bottomRight");
  -[ICDocCamImageQuad setBottomRight:](self, "setBottomRight:", DCTSDClampPointInRect(v12, v13, x, y, width, height));
  -[ICDocCamImageQuad bottomLeft](self, "bottomLeft");
  -[ICDocCamImageQuad setBottomLeft:](self, "setBottomLeft:", DCTSDClampPointInRect(v14, v15, x, y, width, height));
}

- (void)orientIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[5];

  v31[4] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD1968];
  -[ICDocCamImageQuad topLeft](self, "topLeft");
  objc_msgSend(v3, "valueWithCGPoint:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v4;
  v5 = (void *)MEMORY[0x24BDD1968];
  -[ICDocCamImageQuad topRight](self, "topRight");
  objc_msgSend(v5, "valueWithCGPoint:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v6;
  v7 = (void *)MEMORY[0x24BDD1968];
  -[ICDocCamImageQuad bottomLeft](self, "bottomLeft");
  objc_msgSend(v7, "valueWithCGPoint:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v8;
  v9 = (void *)MEMORY[0x24BDD1968];
  -[ICDocCamImageQuad bottomRight](self, "bottomRight");
  objc_msgSend(v9, "valueWithCGPoint:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "sortedArrayUsingComparator:", &__block_literal_global_9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "CGPointValue");
  v15 = v14;

  objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "CGPointValue");
  v18 = v17;

  objc_msgSend(v12, "objectAtIndexedSubscript:", 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "CGPointValue");
  v21 = v20;

  objc_msgSend(v12, "objectAtIndexedSubscript:", 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "CGPointValue");
  v24 = v23;

  if (v24 <= v21)
    v25 = 2;
  else
    v25 = 3;
  if (v24 <= v21)
    v26 = 3;
  else
    v26 = 2;
  objc_msgSend(v12, "objectAtIndexedSubscript:", v15 <= v18);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "CGPointValue");
  -[ICDocCamImageQuad setTopLeft:](self, "setTopLeft:");

  objc_msgSend(v12, "objectAtIndexedSubscript:", v25);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "CGPointValue");
  -[ICDocCamImageQuad setTopRight:](self, "setTopRight:");

  objc_msgSend(v12, "objectAtIndexedSubscript:", v15 > v18);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "CGPointValue");
  -[ICDocCamImageQuad setBottomLeft:](self, "setBottomLeft:");

  objc_msgSend(v12, "objectAtIndexedSubscript:", v26);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "CGPointValue");
  -[ICDocCamImageQuad setBottomRight:](self, "setBottomRight:");

}

uint64_t __38__ICDocCamImageQuad_orientIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(a2, "CGPointValue");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "CGPointValue");
  v9 = v8;

  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "compare:", v10);

  return v11;
}

- (BOOL)isValid
{
  return !-[ICDocCamImageQuad containsIntersectingLines](self, "containsIntersectingLines")
      && !-[ICDocCamImageQuad containsPointsLessThanDistanceThreshold](self, "containsPointsLessThanDistanceThreshold")
      && !-[ICDocCamImageQuad containsPointOutsideOfExtendedImageBounds](self, "containsPointOutsideOfExtendedImageBounds");
}

- (double)mininumAllowedDistanceBetweenPoints
{
  double v2;
  double v3;
  double v4;

  -[ICDocCamImageQuad boundingBox](self, "boundingBox");
  if (v2 >= v3)
    v4 = v3;
  else
    v4 = v2;
  return v4 * 0.1;
}

- (BOOL)containsPointOutsideOfExtendedImageBounds
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  BOOL v29;
  double v31;
  double v32;
  double v33;
  double v34;

  v3 = (void *)-[ICDocCamImageQuad copy](self, "copy");
  -[ICDocCamImageQuad boundingBox](self, "boundingBox");
  objc_msgSend(v3, "addPointToQuadPoints:", DCTSDMultiplyPointScalar(v4, v5, -1.0));
  -[ICDocCamImageQuad boundingBox](self, "boundingBox");
  v7 = 1.0 / v6;
  -[ICDocCamImageQuad boundingBox](self, "boundingBox");
  objc_msgSend(v3, "imageQuadByScalingBy:", v7, 1.0 / v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "topLeft");
  v11 = v10;
  v13 = v12;
  objc_msgSend(v9, "topRight");
  v15 = v14;
  v17 = v16;
  objc_msgSend(v9, "bottomRight");
  v33 = v19;
  v34 = v18;
  objc_msgSend(v9, "bottomLeft");
  v31 = v21;
  v32 = v20;
  v22 = DCTSDRectWithPoints(0.0, 0.0, 1.0);
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v29 = !DCTSDPointInRectInclusive(v11, v13, v22, v23, v25, v27)
     || !DCTSDPointInRectInclusive(v15, v17, v22, v24, v26, v28)
     || !DCTSDPointInRectInclusive(v34, v33, v22, v24, v26, v28)
     || !DCTSDPointInRectInclusive(v32, v31, v22, v24, v26, v28);

  return v29;
}

- (BOOL)containsAngleOutOfValidThreshold
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  BOOL v23;
  double v25;
  double v26;

  -[ICDocCamImageQuad topLeft](self, "topLeft");
  v4 = v3;
  v6 = v5;
  -[ICDocCamImageQuad topRight](self, "topRight");
  v8 = v7;
  v10 = v9;
  -[ICDocCamImageQuad bottomRight](self, "bottomRight");
  v12 = v11;
  v14 = v13;
  -[ICDocCamImageQuad bottomLeft](self, "bottomLeft");
  v16 = v15;
  v18 = v17;
  v26 = DCTSDAngleBetweenPoints(v4, v6, v15, v17, v8, v10);
  v25 = DCTSDAngleBetweenPoints(v8, v10, v4, v6, v12, v14);
  v19 = DCTSDAngleBetweenPoints(v12, v14, v8, v10, v16, v18);
  v20 = DCTSDAngleBetweenPoints(v16, v18, v12, v14, v4, v6);
  v21 = fabs(v19 + -1.57079633);
  v22 = fabs(v20 + -1.57079633);
  v23 = fabs(v26 + -1.57079633) > 1.13446401;
  if (fabs(v25 + -1.57079633) > 1.13446401)
    v23 = 1;
  if (v21 > 1.13446401)
    v23 = 1;
  return v22 > 1.13446401 || v23;
}

- (BOOL)containsPointsLessThanDistanceThreshold
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v21;

  -[ICDocCamImageQuad mininumAllowedDistanceBetweenPoints](self, "mininumAllowedDistanceBetweenPoints");
  v4 = v3;
  -[ICDocCamImageQuad topLeft](self, "topLeft");
  v6 = v5;
  v8 = v7;
  -[ICDocCamImageQuad topRight](self, "topRight");
  v10 = v9;
  v12 = v11;
  -[ICDocCamImageQuad bottomRight](self, "bottomRight");
  v14 = v13;
  v16 = v15;
  -[ICDocCamImageQuad bottomLeft](self, "bottomLeft");
  v21 = v17;
  v19 = v18;
  return DCTSDDistance(v6, v8, v10, v12) < v4
      || DCTSDDistance(v6, v8, v14, v16) < v4
      || DCTSDDistance(v6, v8, v21, v19) < v4
      || DCTSDDistance(v10, v12, v21, v19) < v4
      || DCTSDDistance(v10, v12, v14, v16) < v4
      || DCTSDDistance(v14, v16, v21, v19) < v4;
}

- (BOOL)containsIntersectingLines
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  BOOL v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;

  -[ICDocCamImageQuad topLeft](self, "topLeft");
  v4 = v3;
  v6 = v5;
  -[ICDocCamImageQuad topRight](self, "topRight");
  v8 = v7;
  v10 = v9;
  -[ICDocCamImageQuad bottomLeft](self, "bottomLeft");
  v12 = v11;
  v14 = v13;
  -[ICDocCamImageQuad bottomRight](self, "bottomRight");
  -[ICDocCamImageQuad intersectionOfLineFrom:to:withLineFrom:to:](self, "intersectionOfLineFrom:to:withLineFrom:to:", v4, v6, v8, v10, v12, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = 1;
  }
  else
  {
    -[ICDocCamImageQuad topRight](self, "topRight");
    v20 = v19;
    v22 = v21;
    -[ICDocCamImageQuad bottomRight](self, "bottomRight");
    v24 = v23;
    v26 = v25;
    -[ICDocCamImageQuad topLeft](self, "topLeft");
    v28 = v27;
    v30 = v29;
    -[ICDocCamImageQuad bottomLeft](self, "bottomLeft");
    -[ICDocCamImageQuad intersectionOfLineFrom:to:withLineFrom:to:](self, "intersectionOfLineFrom:to:withLineFrom:to:", v20, v22, v24, v26, v28, v30, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v33 != 0;

  }
  return v18;
}

- (id)intersectionOfLineFrom:(CGPoint)a3 to:(CGPoint)a4 withLineFrom:(CGPoint)a5 to:(CGPoint)a6
{
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v15;
  double v16;
  double v17;
  double v19;

  v8 = a4.x - a3.x;
  v9 = a6.y - a5.y;
  v10 = a4.y - a3.y;
  v11 = a6.x - a5.x;
  v12 = v8 * (a6.y - a5.y) - v10 * (a6.x - a5.x);
  v13 = 0;
  if (v12 != 0.0)
  {
    v15 = a5.x - a3.x;
    v16 = a5.y - a3.y;
    v17 = ((a5.x - a3.x) * v9 - v16 * v11) / v12;
    if (v17 >= 0.0 && v17 <= 1.0)
    {
      v19 = (v15 * v10 - v16 * v8) / v12;
      if (v19 >= 0.0 && v19 <= 1.0)
      {
        objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", a3.x + v17 * v8, a3.y + v17 * v10, v6, v7);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  return v13;
}

+ (id)quadFromVNRectangle:(id)a3
{
  id v3;
  ICDocCamImageQuad *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  if (a3)
  {
    v3 = a3;
    v4 = objc_alloc_init(ICDocCamImageQuad);
    objc_msgSend(v3, "topRight");
    -[ICDocCamImageQuad setTopRight:](v4, "setTopRight:");
    objc_msgSend(v3, "topLeft");
    -[ICDocCamImageQuad setTopLeft:](v4, "setTopLeft:");
    objc_msgSend(v3, "bottomRight");
    -[ICDocCamImageQuad setBottomRight:](v4, "setBottomRight:");
    objc_msgSend(v3, "bottomLeft");
    -[ICDocCamImageQuad setBottomLeft:](v4, "setBottomLeft:");
    objc_msgSend(v3, "boundingBox");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

    -[ICDocCamImageQuad setBoundingBox:](v4, "setBoundingBox:", v6, v8, v10, v12);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)quadFromCGRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  double y;
  double x;
  ICDocCamImageQuad *v7;
  CGRect v9;
  CGRect v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = objc_alloc_init(ICDocCamImageQuad);
  -[ICDocCamImageQuad setTopLeft:](v7, "setTopLeft:", x, y);
  v9.origin.x = x;
  v9.origin.y = y;
  v9.size.width = width;
  v9.size.height = height;
  -[ICDocCamImageQuad setTopRight:](v7, "setTopRight:", CGRectGetMaxX(v9), y);
  -[ICDocCamImageQuad setBottomRight:](v7, "setBottomRight:", DCTSDRectGetMaxPoint(x, y, width, height));
  v10.origin.x = x;
  v10.origin.y = y;
  v10.size.width = width;
  v10.size.height = height;
  -[ICDocCamImageQuad setBottomLeft:](v7, "setBottomLeft:", x, CGRectGetMaxY(v10));
  -[ICDocCamImageQuad setBoundingBox:](v7, "setBoundingBox:", x, y, width, height);
  return v7;
}

- (id)flippedQuadFromSourceFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (void *)-[ICDocCamImageQuad copy](self, "copy");
  objc_msgSend(v7, "flipPointsWithSourceFrame:", x, y, width, height);
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  ICDocCamImageQuad *v4;
  ICDocCamImageQuad *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;
  BOOL v13;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;

  v4 = (ICDocCamImageQuad *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v13 = 1;
  }
  else if (v4
         && ((-[ICDocCamImageQuad topLeft](self, "topLeft"),
              v7 = v6,
              v9 = v8,
              -[ICDocCamImageQuad topLeft](v5, "topLeft"),
              v7 == v11)
           ? (v12 = v9 == v10)
           : (v12 = 0),
             v12))
  {
    -[ICDocCamImageQuad topRight](self, "topRight");
    v16 = v15;
    v18 = v17;
    -[ICDocCamImageQuad topRight](v5, "topRight");
    v13 = 0;
    if (v16 == v20 && v18 == v19)
    {
      -[ICDocCamImageQuad bottomRight](self, "bottomRight");
      v22 = v21;
      v24 = v23;
      -[ICDocCamImageQuad bottomRight](v5, "bottomRight");
      v13 = 0;
      if (v22 == v26 && v24 == v25)
      {
        -[ICDocCamImageQuad bottomLeft](self, "bottomLeft");
        v28 = v27;
        v30 = v29;
        -[ICDocCamImageQuad bottomLeft](v5, "bottomLeft");
        v13 = v30 == v32 && v28 == v31;
      }
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ICDocCamImageQuad *v4;

  v4 = objc_alloc_init(ICDocCamImageQuad);
  -[ICDocCamImageQuad topLeft](self, "topLeft");
  -[ICDocCamImageQuad setTopLeft:](v4, "setTopLeft:");
  -[ICDocCamImageQuad topRight](self, "topRight");
  -[ICDocCamImageQuad setTopRight:](v4, "setTopRight:");
  -[ICDocCamImageQuad bottomRight](self, "bottomRight");
  -[ICDocCamImageQuad setBottomRight:](v4, "setBottomRight:");
  -[ICDocCamImageQuad bottomLeft](self, "bottomLeft");
  -[ICDocCamImageQuad setBottomLeft:](v4, "setBottomLeft:");
  -[ICDocCamImageQuad boundingBox](self, "boundingBox");
  -[ICDocCamImageQuad setBoundingBox:](v4, "setBoundingBox:");
  return v4;
}

- (BOOL)isConvex
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;

  -[ICDocCamImageQuad bottomLeft](self, "bottomLeft");
  v4 = v3;
  v6 = v5;
  -[ICDocCamImageQuad bottomRight](self, "bottomRight");
  v8 = v7;
  v10 = v9;
  -[ICDocCamImageQuad topRight](self, "topRight");
  v13 = triangleNormalDirection(v4, v6, v8, v10, v11, v12);
  -[ICDocCamImageQuad bottomRight](self, "bottomRight");
  v15 = v14;
  v17 = v16;
  -[ICDocCamImageQuad topRight](self, "topRight");
  v19 = v18;
  v21 = v20;
  -[ICDocCamImageQuad topLeft](self, "topLeft");
  if (v13 * triangleNormalDirection(v15, v17, v19, v21, v22, v23) <= 0.0)
    return 0;
  -[ICDocCamImageQuad topRight](self, "topRight");
  v25 = v24;
  v27 = v26;
  -[ICDocCamImageQuad topLeft](self, "topLeft");
  v29 = v28;
  v31 = v30;
  -[ICDocCamImageQuad bottomLeft](self, "bottomLeft");
  if (v13 * triangleNormalDirection(v25, v27, v29, v31, v32, v33) <= 0.0)
    return 0;
  -[ICDocCamImageQuad topLeft](self, "topLeft");
  v35 = v34;
  v37 = v36;
  -[ICDocCamImageQuad bottomLeft](self, "bottomLeft");
  v39 = v38;
  v41 = v40;
  -[ICDocCamImageQuad bottomRight](self, "bottomRight");
  return v13 * triangleNormalDirection(v35, v37, v39, v41, v42, v43) > 0.0;
}

- (void)applyOrientation:(int64_t)a3 boundingBox:(CGRect)a4
{
  double v6;
  double v7;
  double v8;

  v6 = DCTSDCenterOfRect(a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v8 = v7;
  -[ICDocCamImageQuad addPointToQuadPoints:](self, "addPointToQuadPoints:", DCTSDMultiplyPointScalar(v6, v7, -1.0));
  -[ICDocCamImageQuad rotatePointsByOrientation:](self, "rotatePointsByOrientation:", a3);
  -[ICDocCamImageQuad addPointToQuadPoints:](self, "addPointToQuadPoints:", v6, v8);
}

- (void)removeOrientation:(int64_t)a3 boundingBox:(CGRect)a4
{
  double v6;
  double v7;
  double v8;

  v6 = DCTSDCenterOfRect(a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v8 = v7;
  -[ICDocCamImageQuad addPointToQuadPoints:](self, "addPointToQuadPoints:", DCTSDMultiplyPointScalar(v6, v7, -1.0));
  -[ICDocCamImageQuad rotatePointsRemovingOrientation:](self, "rotatePointsRemovingOrientation:", a3);
  -[ICDocCamImageQuad addPointToQuadPoints:](self, "addPointToQuadPoints:", v6, v8);
}

- (void)rotatePointsRemovingOrientation:(int64_t)a3
{
  uint64_t i;

  for (i = -dc_clockwiseRotationsFromUpToMatchOrientation(a3) & 3; i; --i)
    -[ICDocCamImageQuad rotatePointsClockwise](self, "rotatePointsClockwise");
}

- (void)rotatePointsByOrientation:(int64_t)a3
{
  uint64_t matched;
  uint64_t v5;

  matched = dc_clockwiseRotationsFromUpToMatchOrientation(a3);
  if (matched)
  {
    v5 = matched;
    do
    {
      -[ICDocCamImageQuad rotatePointsClockwise](self, "rotatePointsClockwise");
      --v5;
    }
    while (v5);
  }
}

- (void)rotatePointsClockwise
{
  -[ICDocCamImageQuad topRight](self, "topRight");
  -[ICDocCamImageQuad pointRotatedClockwiseAroundOrigin:](self, "pointRotatedClockwiseAroundOrigin:");
  -[ICDocCamImageQuad setTopRight:](self, "setTopRight:");
  -[ICDocCamImageQuad topLeft](self, "topLeft");
  -[ICDocCamImageQuad pointRotatedClockwiseAroundOrigin:](self, "pointRotatedClockwiseAroundOrigin:");
  -[ICDocCamImageQuad setTopLeft:](self, "setTopLeft:");
  -[ICDocCamImageQuad bottomRight](self, "bottomRight");
  -[ICDocCamImageQuad pointRotatedClockwiseAroundOrigin:](self, "pointRotatedClockwiseAroundOrigin:");
  -[ICDocCamImageQuad setBottomRight:](self, "setBottomRight:");
  -[ICDocCamImageQuad bottomLeft](self, "bottomLeft");
  -[ICDocCamImageQuad pointRotatedClockwiseAroundOrigin:](self, "pointRotatedClockwiseAroundOrigin:");
  -[ICDocCamImageQuad setBottomLeft:](self, "setBottomLeft:");
}

- (CGPoint)pointRotatedClockwiseAroundOrigin:(CGPoint)a3
{
  CGFloat y;
  double v4;
  double v5;
  CGPoint result;

  y = a3.y;
  v4 = -a3.x;
  v5 = y;
  result.y = v4;
  result.x = v5;
  return result;
}

- (void)addPointToQuadPoints:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;

  y = a3.y;
  x = a3.x;
  -[ICDocCamImageQuad topLeft](self, "topLeft");
  -[ICDocCamImageQuad setTopLeft:](self, "setTopLeft:", DCTSDAddPoints(x, y, v6));
  -[ICDocCamImageQuad topRight](self, "topRight");
  -[ICDocCamImageQuad setTopRight:](self, "setTopRight:", DCTSDAddPoints(x, y, v7));
  -[ICDocCamImageQuad bottomRight](self, "bottomRight");
  -[ICDocCamImageQuad setBottomRight:](self, "setBottomRight:", DCTSDAddPoints(x, y, v8));
  -[ICDocCamImageQuad bottomLeft](self, "bottomLeft");
  -[ICDocCamImageQuad setBottomLeft:](self, "setBottomLeft:", DCTSDAddPoints(x, y, v9));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ICDocCamImageQuad)initWithCoder:(id)a3
{
  id v4;
  ICDocCamImageQuad *v5;
  float v6;
  double v7;
  float v8;
  float v9;
  double v10;
  float v11;
  float v12;
  double v13;
  float v14;
  float v15;
  double v16;
  float v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ICDocCamImageQuad;
  v5 = -[ICDocCamImageQuad init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("kBottomLeftXFieldCodingKey"));
    v7 = v6;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("kBottomLeftYFieldCodingKey"));
    -[ICDocCamImageQuad setBottomLeft:](v5, "setBottomLeft:", v7, v8);
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("kBottomRightXFieldCodingKey"));
    v10 = v9;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("kBottomRightYFieldCodingKey"));
    -[ICDocCamImageQuad setBottomRight:](v5, "setBottomRight:", v10, v11);
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("kTopLeftXFieldCodingKey"));
    v13 = v12;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("kTopLeftYFieldCodingKey"));
    -[ICDocCamImageQuad setTopLeft:](v5, "setTopLeft:", v13, v14);
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("kTopRightXFieldCodingKey"));
    v16 = v15;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("kTopRightYFieldCodingKey"));
    -[ICDocCamImageQuad setTopRight:](v5, "setTopRight:", v16, v17);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;

  v16 = a3;
  -[ICDocCamImageQuad bottomLeft](self, "bottomLeft");
  *(float *)&v4 = v4;
  objc_msgSend(v16, "encodeFloat:forKey:", CFSTR("kBottomLeftXFieldCodingKey"), v4);
  -[ICDocCamImageQuad bottomLeft](self, "bottomLeft");
  *(float *)&v6 = v5;
  objc_msgSend(v16, "encodeFloat:forKey:", CFSTR("kBottomLeftYFieldCodingKey"), v6);
  -[ICDocCamImageQuad bottomRight](self, "bottomRight");
  *(float *)&v7 = v7;
  objc_msgSend(v16, "encodeFloat:forKey:", CFSTR("kBottomRightXFieldCodingKey"), v7);
  -[ICDocCamImageQuad bottomRight](self, "bottomRight");
  *(float *)&v9 = v8;
  objc_msgSend(v16, "encodeFloat:forKey:", CFSTR("kBottomRightYFieldCodingKey"), v9);
  -[ICDocCamImageQuad topLeft](self, "topLeft");
  *(float *)&v10 = v10;
  objc_msgSend(v16, "encodeFloat:forKey:", CFSTR("kTopLeftXFieldCodingKey"), v10);
  -[ICDocCamImageQuad topLeft](self, "topLeft");
  *(float *)&v12 = v11;
  objc_msgSend(v16, "encodeFloat:forKey:", CFSTR("kTopLeftYFieldCodingKey"), v12);
  -[ICDocCamImageQuad topRight](self, "topRight");
  *(float *)&v13 = v13;
  objc_msgSend(v16, "encodeFloat:forKey:", CFSTR("kTopRightXFieldCodingKey"), v13);
  -[ICDocCamImageQuad topRight](self, "topRight");
  *(float *)&v15 = v14;
  objc_msgSend(v16, "encodeFloat:forKey:", CFSTR("kTopRightYFieldCodingKey"), v15);

}

- (CGPoint)topLeft
{
  double x;
  double y;
  CGPoint result;

  x = self->_topLeft.x;
  y = self->_topLeft.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setTopLeft:(CGPoint)a3
{
  self->_topLeft = a3;
}

- (CGPoint)topRight
{
  double x;
  double y;
  CGPoint result;

  x = self->_topRight.x;
  y = self->_topRight.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setTopRight:(CGPoint)a3
{
  self->_topRight = a3;
}

- (CGPoint)bottomLeft
{
  double x;
  double y;
  CGPoint result;

  x = self->_bottomLeft.x;
  y = self->_bottomLeft.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setBottomLeft:(CGPoint)a3
{
  self->_bottomLeft = a3;
}

- (CGPoint)bottomRight
{
  double x;
  double y;
  CGPoint result;

  x = self->_bottomRight.x;
  y = self->_bottomRight.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setBottomRight:(CGPoint)a3
{
  self->_bottomRight = a3;
}

- (CGRect)boundingBox
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_boundingBox.origin.x;
  y = self->_boundingBox.origin.y;
  width = self->_boundingBox.size.width;
  height = self->_boundingBox.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setBoundingBox:(CGRect)a3
{
  self->_boundingBox = a3;
}

- (id)quadByConvertingFromView:(id)a3 toView:(id)a4 isNormalized:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  ICDocCamImageQuad *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init(ICDocCamImageQuad);
  objc_msgSend(v8, "bounds");
  if (v5)
  {
    v14 = v11;
    v15 = v12;
    v16 = v13;
    -[ICDocCamImageQuad topLeft](self, "topLeft");
    objc_msgSend(v8, "convertPoint:toView:", v9, DCTSDPointFromNormalizedRect(v17, v18, v14, v15, v16));
    -[ICDocCamImageQuad setTopLeft:](v10, "setTopLeft:");
    -[ICDocCamImageQuad topRight](self, "topRight");
    objc_msgSend(v8, "convertPoint:toView:", v9, DCTSDPointFromNormalizedRect(v19, v20, v14, v15, v16));
    -[ICDocCamImageQuad setTopRight:](v10, "setTopRight:");
    -[ICDocCamImageQuad bottomRight](self, "bottomRight");
    objc_msgSend(v8, "convertPoint:toView:", v9, DCTSDPointFromNormalizedRect(v21, v22, v14, v15, v16));
    -[ICDocCamImageQuad setBottomRight:](v10, "setBottomRight:");
    -[ICDocCamImageQuad bottomLeft](self, "bottomLeft");
    v25 = DCTSDPointFromNormalizedRect(v23, v24, v14, v15, v16);
  }
  else
  {
    -[ICDocCamImageQuad topLeft](self, "topLeft");
    objc_msgSend(v8, "convertPoint:toView:", v9);
    -[ICDocCamImageQuad setTopLeft:](v10, "setTopLeft:");
    -[ICDocCamImageQuad topRight](self, "topRight");
    objc_msgSend(v8, "convertPoint:toView:", v9);
    -[ICDocCamImageQuad setTopRight:](v10, "setTopRight:");
    -[ICDocCamImageQuad bottomRight](self, "bottomRight");
    objc_msgSend(v8, "convertPoint:toView:", v9);
    -[ICDocCamImageQuad setBottomRight:](v10, "setBottomRight:");
    -[ICDocCamImageQuad bottomLeft](self, "bottomLeft");
  }
  objc_msgSend(v8, "convertPoint:toView:", v9, v25);
  v27 = v26;
  v29 = v28;

  -[ICDocCamImageQuad setBottomLeft:](v10, "setBottomLeft:", v27, v29);
  return v10;
}

- (id)normalizedQuadByConvertingFromView:(id)a3 toView:(id)a4 toViewSize:(CGSize)a5
{
  double width;
  id v8;
  id v9;
  ICDocCamImageQuad *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;

  width = a5.width;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(ICDocCamImageQuad);
  v11 = *MEMORY[0x24BDBF090];
  v12 = *(double *)(MEMORY[0x24BDBF090] + 8);
  -[ICDocCamImageQuad topLeft](self, "topLeft");
  objc_msgSend(v9, "convertPoint:toView:", v8);
  -[ICDocCamImageQuad setTopLeft:](v10, "setTopLeft:");
  -[ICDocCamImageQuad topRight](self, "topRight");
  objc_msgSend(v9, "convertPoint:toView:", v8);
  -[ICDocCamImageQuad setTopRight:](v10, "setTopRight:");
  -[ICDocCamImageQuad bottomRight](self, "bottomRight");
  objc_msgSend(v9, "convertPoint:toView:", v8);
  -[ICDocCamImageQuad setBottomRight:](v10, "setBottomRight:");
  -[ICDocCamImageQuad bottomLeft](self, "bottomLeft");
  objc_msgSend(v9, "convertPoint:toView:", v8);
  v14 = v13;
  v16 = v15;

  -[ICDocCamImageQuad setBottomLeft:](v10, "setBottomLeft:", v14, v16);
  -[ICDocCamImageQuad topLeft](v10, "topLeft");
  -[ICDocCamImageQuad setTopLeft:](v10, "setTopLeft:", DCTSDNormalizedPointInRect(v17, v18, v11, v12, width));
  -[ICDocCamImageQuad topRight](v10, "topRight");
  -[ICDocCamImageQuad setTopRight:](v10, "setTopRight:", DCTSDNormalizedPointInRect(v19, v20, v11, v12, width));
  -[ICDocCamImageQuad bottomRight](v10, "bottomRight");
  -[ICDocCamImageQuad setBottomRight:](v10, "setBottomRight:", DCTSDNormalizedPointInRect(v21, v22, v11, v12, width));
  -[ICDocCamImageQuad bottomLeft](v10, "bottomLeft");
  -[ICDocCamImageQuad setBottomLeft:](v10, "setBottomLeft:", DCTSDNormalizedPointInRect(v23, v24, v11, v12, width));
  return v10;
}

@end
