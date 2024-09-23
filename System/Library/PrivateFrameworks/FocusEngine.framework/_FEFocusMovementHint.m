@implementation _FEFocusMovementHint

- (_FEFocusMovementHint)initWithMovementDirection:(CGVector)a3 itemSize:(CGSize)a4
{
  double height;
  double width;
  CGFloat dy;
  CGFloat dx;
  _FEFocusMovementHint *result;
  double v10;
  double v11;
  float64x2_t v12;
  float64x2_t v17;
  objc_super v18;

  height = a4.height;
  width = a4.width;
  dy = a3.dy;
  dx = a3.dx;
  v18.receiver = self;
  v18.super_class = (Class)_FEFocusMovementHint;
  result = -[_FEFocusMovementHint init](&v18, sel_init);
  if (result)
  {
    result->_movementDirection.dx = dx;
    result->_movementDirection.dy = dy;
    if (width == *MEMORY[0x24BDBF148] && height == *(double *)(MEMORY[0x24BDBF148] + 8))
    {
      v17 = (float64x2_t)xmmword_23C4C0680;
    }
    else
    {
      if (height <= width)
        v10 = width;
      else
        v10 = height;
      v11 = v10 / 1920.0;
      if (v11 < 0.0)
        v11 = 0.0;
      v12 = vmulq_n_f64((float64x2_t)xmmword_23C4C0690, fmin(v11, 1.0));
      __asm { FMOV            V1.2D, #6.0 }
      *(_QWORD *)&_Q1.f64[0] = *(_OWORD *)&vaddq_f64(v12, _Q1);
      _Q1.f64[1] = vsubq_f64((float64x2_t)vdupq_n_s64(0x3FBEB851EB851EB8uLL), v12).f64[1];
      v17 = vminnmq_f64((float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64((float64x2_t)xmmword_23C4C06A0, _Q1), (int8x16_t)xmmword_23C4C06A0, (int8x16_t)_Q1), (float64x2_t)xmmword_23C4C06B0);
    }
    *(float64x2_t *)&result->_translationAmount = v17;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (result)
    *(CGVector *)((char *)result + 24) = self->_movementDirection;
  return result;
}

- (CATransform3D)perspectiveTransform
{
  _OWORD *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  v3 = (_OWORD *)MEMORY[0x24BDE5598];
  v4 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
  *(_OWORD *)&retstr->m31 = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
  *(_OWORD *)&retstr->m33 = v4;
  v5 = v3[7];
  *(_OWORD *)&retstr->m41 = v3[6];
  *(_OWORD *)&retstr->m43 = v5;
  v6 = v3[1];
  *(_OWORD *)&retstr->m11 = *v3;
  *(_OWORD *)&retstr->m13 = v6;
  v7 = v3[3];
  *(_OWORD *)&retstr->m21 = v3[2];
  *(_OWORD *)&retstr->m23 = v7;
  retstr->m34 = -0.00111111111;
  return self;
}

- (CGVector)rotation
{
  double rotationAmount;
  double v3;
  double v4;
  CGVector result;

  rotationAmount = self->_rotationAmount;
  v3 = rotationAmount * self->_movementDirection.dy;
  v4 = -(rotationAmount * self->_movementDirection.dx);
  result.dy = v4;
  result.dx = v3;
  return result;
}

- (CGVector)translation
{
  double translationAmount;
  double v3;
  double v4;
  CGVector result;

  translationAmount = self->_translationAmount;
  v3 = translationAmount * self->_movementDirection.dx;
  v4 = translationAmount * self->_movementDirection.dy;
  result.dy = v4;
  result.dx = v3;
  return result;
}

- (CATransform3D)interactionTransform
{
  __int128 *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  CATransform3D *result;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  CGFloat v43;
  CATransform3D v44;
  CATransform3D v45;

  v5 = (__int128 *)MEMORY[0x24BDE5598];
  v41 = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
  v42 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
  *(_OWORD *)&retstr->m31 = v41;
  *(_OWORD *)&retstr->m33 = v42;
  v39 = v5[6];
  v40 = v5[7];
  *(_OWORD *)&retstr->m41 = v39;
  *(_OWORD *)&retstr->m43 = v40;
  v37 = *v5;
  v38 = v5[1];
  *(_OWORD *)&retstr->m11 = *v5;
  *(_OWORD *)&retstr->m13 = v38;
  v35 = v5[2];
  v36 = v5[3];
  *(_OWORD *)&retstr->m21 = v35;
  *(_OWORD *)&retstr->m23 = v36;
  -[_FEFocusMovementHint rotation](self, "rotation");
  v7 = v6;
  v9 = v8;
  -[_FEFocusMovementHint translation](self, "translation");
  v11 = v10;
  v13 = v12;
  *(_OWORD *)&v44.m31 = v41;
  *(_OWORD *)&v44.m33 = v42;
  *(_OWORD *)&v44.m41 = v39;
  *(_OWORD *)&v44.m43 = v40;
  *(_OWORD *)&v44.m11 = v37;
  *(_OWORD *)&v44.m13 = v38;
  *(_OWORD *)&v44.m21 = v35;
  *(_OWORD *)&v44.m23 = v36;
  CATransform3DRotate(&v45, &v44, v9, 0.0, 1.0, 0.0);
  v14 = *(_OWORD *)&v45.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v45.m31;
  *(_OWORD *)&retstr->m33 = v14;
  v15 = *(_OWORD *)&v45.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v45.m41;
  *(_OWORD *)&retstr->m43 = v15;
  v16 = *(_OWORD *)&v45.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v45.m11;
  *(_OWORD *)&retstr->m13 = v16;
  v17 = *(_OWORD *)&v45.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v45.m21;
  *(_OWORD *)&retstr->m23 = v17;
  v18 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&v44.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&v44.m33 = v18;
  v19 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&v44.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&v44.m43 = v19;
  v20 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&v44.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&v44.m13 = v20;
  v21 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&v44.m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&v44.m23 = v21;
  CATransform3DRotate(&v45, &v44, v7, 1.0, 0.0, 0.0);
  v22 = *(_OWORD *)&v45.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v45.m31;
  *(_OWORD *)&retstr->m33 = v22;
  v23 = *(_OWORD *)&v45.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v45.m41;
  *(_OWORD *)&retstr->m43 = v23;
  v24 = *(_OWORD *)&v45.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v45.m11;
  *(_OWORD *)&retstr->m13 = v24;
  v25 = *(_OWORD *)&v45.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v45.m21;
  *(_OWORD *)&retstr->m23 = v25;
  v26 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&v44.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&v44.m33 = v26;
  v27 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&v44.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&v44.m43 = v27;
  v28 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&v44.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&v44.m13 = v28;
  v29 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&v44.m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&v44.m23 = v29;
  CATransform3DTranslate(&v45, &v44, v11, v13, 0.0);
  v30 = *(_OWORD *)&v45.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v45.m31;
  *(_OWORD *)&retstr->m33 = v30;
  v31 = *(_OWORD *)&v45.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v45.m41;
  *(_OWORD *)&retstr->m43 = v31;
  v32 = *(_OWORD *)&v45.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v45.m11;
  *(_OWORD *)&retstr->m13 = v32;
  v33 = *(_OWORD *)&v45.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v45.m21;
  *(_OWORD *)&retstr->m23 = v33;
  result = -[_FEFocusMovementHint perspectiveTransform](self, "perspectiveTransform");
  retstr->m34 = v43;
  return result;
}

- (CGVector)movementDirection
{
  double dx;
  double dy;
  CGVector result;

  dx = self->_movementDirection.dx;
  dy = self->_movementDirection.dy;
  result.dy = dy;
  result.dx = dx;
  return result;
}

- (double)translationAmount
{
  return self->_translationAmount;
}

- (void)setTranslationAmount:(double)a3
{
  self->_translationAmount = a3;
}

- (double)rotationAmount
{
  return self->_rotationAmount;
}

- (void)setRotationAmount:(double)a3
{
  self->_rotationAmount = a3;
}

@end
