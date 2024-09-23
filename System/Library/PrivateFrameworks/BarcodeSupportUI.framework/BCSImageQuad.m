@implementation BCSImageQuad

- (BCSImageQuad)initWithTopLeft:(CGPoint)a3 topRight:(CGPoint)a4 bottomRight:(CGPoint)a5 bottomLeft:(CGPoint)a6
{
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  BCSImageQuad *v14;
  BCSImageQuad *v15;
  BCSImageQuad *v16;
  objc_super v18;

  y = a6.y;
  x = a6.x;
  v8 = a5.y;
  v9 = a5.x;
  v10 = a4.y;
  v11 = a4.x;
  v12 = a3.y;
  v13 = a3.x;
  v18.receiver = self;
  v18.super_class = (Class)BCSImageQuad;
  v14 = -[BCSImageQuad init](&v18, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_topLeft.x = v13;
    v14->_topLeft.y = v12;
    v14->_topRight.x = v11;
    v14->_topRight.y = v10;
    v14->_bottomRight.x = v9;
    v14->_bottomRight.y = v8;
    v14->_bottomLeft.x = x;
    v14->_bottomLeft.y = y;
    v16 = v14;
  }

  return v15;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromCGPoint(self->_topLeft);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGPoint(self->_topRight);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGPoint(self->_bottomRight);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGPoint(self->_bottomLeft);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, %@, %@, %@"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (CGRect)boundingBox
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
  -[BCSImageQuad topLeft](self, "topLeft");
  v4 = v3;
  v6 = v5;
  -[BCSImageQuad topRight](self, "topRight");
  v23 = v7;
  v24[0] = v8;
  -[BCSImageQuad bottomLeft](self, "bottomLeft");
  v24[1] = v9;
  v24[2] = v10;
  -[BCSImageQuad bottomRight](self, "bottomRight");
  v11 = 0;
  v24[3] = v12;
  v24[4] = v13;
  v14 = v6;
  v15 = v4;
  do
  {
    v16 = *(double *)&v22[v11 * 8 + 16];
    v17 = *(double *)&v24[v11];
    if (v4 >= v16)
      v4 = *(double *)&v22[v11 * 8 + 16];
    if (v15 < v16)
      v15 = *(double *)&v22[v11 * 8 + 16];
    if (v6 >= v17)
      v6 = *(double *)&v24[v11];
    if (v14 < v17)
      v14 = *(double *)&v24[v11];
    v11 += 2;
  }
  while (v11 != 6);
  v18 = v15 - v4;
  v19 = v14 - v6;
  v20 = v4;
  v21 = v6;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (void)normalize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;

  -[BCSImageQuad boundingBox](self, "boundingBox");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[BCSImageQuad _normalizePoint:inBounds:](self, "_normalizePoint:inBounds:", self->_topLeft.x, self->_topLeft.y, v3, v5, v7, v9);
  self->_topLeft.x = v11;
  self->_topLeft.y = v12;
  -[BCSImageQuad _normalizePoint:inBounds:](self, "_normalizePoint:inBounds:", self->_topRight.x, self->_topRight.y, v4, v6, v8, v10);
  self->_topRight.x = v13;
  self->_topRight.y = v14;
  -[BCSImageQuad _normalizePoint:inBounds:](self, "_normalizePoint:inBounds:", self->_bottomRight.x, self->_bottomRight.y, v4, v6, v8, v10);
  self->_bottomRight.x = v15;
  self->_bottomRight.y = v16;
  -[BCSImageQuad _normalizePoint:inBounds:](self, "_normalizePoint:inBounds:", self->_bottomLeft.x, self->_bottomLeft.y, v4, v6, v8, v10);
  self->_bottomLeft.x = v17;
  self->_bottomLeft.y = v18;
}

- (void)denormalize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;

  -[BCSImageQuad bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[BCSImageQuad _denormalizePoint:inBounds:](self, "_denormalizePoint:inBounds:", self->_topLeft.x, self->_topLeft.y, v3, v5, v7, v9);
  self->_topLeft.x = v11;
  self->_topLeft.y = v12;
  -[BCSImageQuad _denormalizePoint:inBounds:](self, "_denormalizePoint:inBounds:", self->_topRight.x, self->_topRight.y, v4, v6, v8, v10);
  self->_topRight.x = v13;
  self->_topRight.y = v14;
  -[BCSImageQuad _denormalizePoint:inBounds:](self, "_denormalizePoint:inBounds:", self->_bottomRight.x, self->_bottomRight.y, v4, v6, v8, v10);
  self->_bottomRight.x = v15;
  self->_bottomRight.y = v16;
  -[BCSImageQuad _denormalizePoint:inBounds:](self, "_denormalizePoint:inBounds:", self->_bottomLeft.x, self->_bottomLeft.y, v4, v6, v8, v10);
  self->_bottomLeft.x = v17;
  self->_bottomLeft.y = v18;
}

- (void)flip
{
  double v3;

  -[BCSImageQuad boundingBox](self, "boundingBox");
  self->_topLeft.y = v3 - self->_topLeft.y;
  self->_topRight.y = v3 - self->_topRight.y;
  self->_bottomLeft.y = v3 - self->_bottomLeft.y;
  self->_bottomRight.y = v3 - self->_bottomRight.y;
}

- (CGPoint)_normalizePoint:(CGPoint)a3 inBounds:(CGRect)a4
{
  double v4;
  double v5;
  CGPoint result;

  v4 = (a3.x - a4.origin.x) / a4.size.width;
  v5 = (a3.y - a4.origin.y) / a4.size.height;
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)_denormalizePoint:(CGPoint)a3 inBounds:(CGRect)a4
{
  double v4;
  double v5;
  CGPoint result;

  v4 = a4.origin.x + a3.x * a4.size.width;
  v5 = a4.origin.y + a3.y * a4.size.height;
  result.y = v5;
  result.x = v4;
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
  double v27;
  float64_t v28;
  uint64_t v29;
  float64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  CGSize result;

  -[BCSImageQuad topLeft](self, "topLeft");
  v29 = v3;
  v32 = v4;
  -[BCSImageQuad topRight](self, "topRight");
  v28 = v5;
  v30 = v6;
  -[BCSImageQuad bottomRight](self, "bottomRight");
  v31 = v7;
  v33 = v8;
  -[BCSImageQuad bottomLeft](self, "bottomLeft");
  *(float64_t *)_Q3.i64 = v28;
  *(float64_t *)&_Q3.i64[1] = v10;
  v11 = vsubq_f64((float64x2_t)vdupq_lane_s64(v29, 0), (float64x2_t)_Q3);
  v12 = _Q3;
  *(float64_t *)_Q3.i64 = v30;
  *(float64_t *)&_Q3.i64[1] = v13;
  v14 = vsubq_f64((float64x2_t)vdupq_lane_s64(v32, 0), (float64x2_t)_Q3);
  v15 = vsqrtq_f64(vmlaq_f64(vmulq_f64(v14, v14), v11, v11));
  v16 = vsubq_f64((float64x2_t)vdupq_lane_s64(v31, 0), (float64x2_t)vextq_s8(v12, v12, 8uLL));
  v17 = vsubq_f64((float64x2_t)vdupq_lane_s64(v33, 0), (float64x2_t)vextq_s8(_Q3, _Q3, 8uLL));
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
  v26 = vmulq_f64((float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v18, v15), (int8x16_t)v18, (int8x16_t)v15), vcvtq_f64_f32(v24));
  v27 = v26.f64[1];
  result.width = v26.f64[0];
  result.height = v27;
  return result;
}

- (void)adjustOrientationInImageSpace:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  _BOOL4 v27;
  _BOOL8 v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  CGFloat v32;
  CGFloat v33;
  void *v34;
  CGFloat v35;
  CGFloat v36;
  void *v37;
  CGFloat v38;
  CGFloat v39;
  void *v40;
  CGFloat v41;
  CGFloat v42;
  _QWORD v43[5];

  v3 = a3;
  v43[4] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDD1968];
  -[BCSImageQuad topLeft](self, "topLeft");
  objc_msgSend(v5, "valueWithCGPoint:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v6;
  v7 = (void *)MEMORY[0x24BDD1968];
  -[BCSImageQuad topRight](self, "topRight");
  objc_msgSend(v7, "valueWithCGPoint:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v8;
  v9 = (void *)MEMORY[0x24BDD1968];
  -[BCSImageQuad bottomLeft](self, "bottomLeft");
  objc_msgSend(v9, "valueWithCGPoint:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v43[2] = v10;
  v11 = (void *)MEMORY[0x24BDD1968];
  -[BCSImageQuad bottomRight](self, "bottomRight");
  objc_msgSend(v11, "valueWithCGPoint:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v43[3] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "sortedArrayUsingComparator:", &__block_literal_global_0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "CGPointValue");
  v17 = v16;

  objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "CGPointValue");
  v20 = v19;

  objc_msgSend(v14, "objectAtIndexedSubscript:", 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "CGPointValue");
  v23 = v22;

  objc_msgSend(v14, "objectAtIndexedSubscript:", 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "CGPointValue");
  v26 = v25;

  v27 = v26 < v23;
  if (v3)
  {
    v27 = v26 > v23;
    v28 = v17 <= v20;
  }
  else
  {
    v28 = v17 >= v20;
  }
  if (v27)
    v29 = 3;
  else
    v29 = 2;
  if (v27)
    v30 = 2;
  else
    v30 = 3;
  objc_msgSend(v14, "objectAtIndexedSubscript:", v28);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "CGPointValue");
  self->_topLeft.x = v32;
  self->_topLeft.y = v33;

  objc_msgSend(v14, "objectAtIndexedSubscript:", v29);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "CGPointValue");
  self->_topRight.x = v35;
  self->_topRight.y = v36;

  objc_msgSend(v14, "objectAtIndexedSubscript:", v28 ^ 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "CGPointValue");
  self->_bottomLeft.x = v38;
  self->_bottomLeft.y = v39;

  objc_msgSend(v14, "objectAtIndexedSubscript:", v30);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "CGPointValue");
  self->_bottomRight.x = v41;
  self->_bottomRight.y = v42;

}

uint64_t __46__BCSImageQuad_adjustOrientationInImageSpace___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = a2;
  v5 = a3;
  v6 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "CGPointValue");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "CGPointValue");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "compare:", v9);

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BCSImageQuad *v4;
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

  v4 = [BCSImageQuad alloc];
  -[BCSImageQuad topLeft](self, "topLeft");
  v6 = v5;
  v8 = v7;
  -[BCSImageQuad topRight](self, "topRight");
  v10 = v9;
  v12 = v11;
  -[BCSImageQuad bottomRight](self, "bottomRight");
  v14 = v13;
  v16 = v15;
  -[BCSImageQuad bottomLeft](self, "bottomLeft");
  return -[BCSImageQuad initWithTopLeft:topRight:bottomRight:bottomLeft:](v4, "initWithTopLeft:topRight:bottomRight:bottomLeft:", v6, v8, v10, v12, v14, v16, v17, v18);
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

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_bounds.origin.x;
  y = self->_bounds.origin.y;
  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  self->_bounds = a3;
}

@end
