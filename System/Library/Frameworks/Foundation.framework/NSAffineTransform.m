@implementation NSAffineTransform

+ (NSAffineTransform)transform
{
  return (NSAffineTransform *)objc_alloc_init((Class)a1);
}

- (NSAffineTransform)init
{
  NSAffineTransform *result;
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)NSAffineTransform;
  result = -[NSAffineTransform init](&v3, sel_init);
  *(_OWORD *)&result->_transformStruct.m11 = NSAffineTransformStructIdentity;
  *(_OWORD *)&result->_transformStruct.m21 = unk_182188BC0;
  *(_OWORD *)&result->_transformStruct.tX = xmmword_182188BD0;
  return result;
}

- (NSAffineTransform)initWithTransform:(NSAffineTransform *)transform
{
  NSAffineTransform *v4;
  _OWORD v6[3];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = -[NSAffineTransform init](self, "init");
  if (transform)
    -[NSAffineTransform transformStruct](transform, "transformStruct");
  else
    memset(v6, 0, sizeof(v6));
  -[NSAffineTransform setTransformStruct:](v4, "setTransformStruct:", v6);
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithTransform:", self);
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
    return 1;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (a3)
      objc_msgSend(a3, "transformStruct");
    if (self->_transformStruct.m11 == 0.0
      && self->_transformStruct.m12 == 0.0
      && self->_transformStruct.m21 == 0.0
      && self->_transformStruct.m22 == 0.0
      && self->_transformStruct.tX == 0.0)
    {
      return self->_transformStruct.tY == 0.0;
    }
  }
  return 0;
}

- (unint64_t)hash
{
  return (unint64_t)(self->_transformStruct.m11
                          + self->_transformStruct.m12
                          + self->_transformStruct.m21
                          + self->_transformStruct.m22
                          + self->_transformStruct.tX
                          + self->_transformStruct.tY);
}

- (void)translateXBy:(CGFloat)deltaX yBy:(CGFloat)deltaY
{
  *(float64x2_t *)&self->_transformStruct.tX = vaddq_f64(*(float64x2_t *)&self->_transformStruct.tX, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&self->_transformStruct.m21, deltaY), *(float64x2_t *)&self->_transformStruct.m11, deltaX));
}

- (void)rotateByDegrees:(CGFloat)angle
{
  double m11;
  double m12;
  double m21;
  double m22;
  double tX;
  double tY;
  __double2 v10;

  m11 = self->_transformStruct.m11;
  m12 = self->_transformStruct.m12;
  m21 = self->_transformStruct.m21;
  m22 = self->_transformStruct.m22;
  tX = self->_transformStruct.tX;
  tY = self->_transformStruct.tY;
  v10 = __sincos_stret(angle * 3.14159265 / 180.0);
  self->_transformStruct.m11 = v10.__sinval * m21 + v10.__cosval * m11;
  self->_transformStruct.m12 = v10.__sinval * m22 + v10.__cosval * m12;
  self->_transformStruct.m21 = v10.__cosval * m21 - v10.__sinval * m11;
  self->_transformStruct.m22 = v10.__cosval * m22 - v10.__sinval * m12;
  self->_transformStruct.tX = m21 * 0.0 + m11 * 0.0 + tX;
  self->_transformStruct.tY = m22 * 0.0 + m12 * 0.0 + tY;
}

- (void)rotateByRadians:(CGFloat)angle
{
  double m11;
  double m12;
  double m21;
  double m22;
  double tX;
  double tY;
  __double2 v10;

  m11 = self->_transformStruct.m11;
  m12 = self->_transformStruct.m12;
  m21 = self->_transformStruct.m21;
  m22 = self->_transformStruct.m22;
  tX = self->_transformStruct.tX;
  tY = self->_transformStruct.tY;
  v10 = __sincos_stret(angle);
  self->_transformStruct.m11 = v10.__sinval * m21 + v10.__cosval * m11;
  self->_transformStruct.m12 = v10.__sinval * m22 + v10.__cosval * m12;
  self->_transformStruct.m21 = v10.__cosval * m21 - v10.__sinval * m11;
  self->_transformStruct.m22 = v10.__cosval * m22 - v10.__sinval * m12;
  self->_transformStruct.tX = m21 * 0.0 + m11 * 0.0 + tX;
  self->_transformStruct.tY = m22 * 0.0 + m12 * 0.0 + tY;
}

- (void)scaleBy:(CGFloat)scale
{
  *(float64x2_t *)&self->_transformStruct.m11 = vmulq_n_f64(*(float64x2_t *)&self->_transformStruct.m11, scale);
  *(float64x2_t *)&self->_transformStruct.m21 = vmulq_n_f64(*(float64x2_t *)&self->_transformStruct.m21, scale);
}

- (void)scaleXBy:(CGFloat)scaleX yBy:(CGFloat)scaleY
{
  *(float64x2_t *)&self->_transformStruct.m11 = vmulq_n_f64(*(float64x2_t *)&self->_transformStruct.m11, scaleX);
  *(float64x2_t *)&self->_transformStruct.m21 = vmulq_n_f64(*(float64x2_t *)&self->_transformStruct.m21, scaleY);
}

- (void)invert
{
  double m11;
  double m12;
  double m21;
  double m22;
  double v6;
  double tX;
  double tY;
  double v9[7];

  v9[6] = *(double *)MEMORY[0x1E0C80C00];
  m11 = self->_transformStruct.m11;
  m12 = self->_transformStruct.m12;
  m21 = self->_transformStruct.m21;
  m22 = self->_transformStruct.m22;
  v6 = m11 * m22 - m12 * m21;
  if (fabs(v6) <= 2.22044605e-16)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("NSAffineTransform: Transform has no inverse"), 0));
  tX = self->_transformStruct.tX;
  tY = self->_transformStruct.tY;
  v9[0] = m22 / v6;
  v9[1] = -m12 / v6;
  v9[2] = -m21 / v6;
  v9[3] = m11 / v6;
  v9[4] = (m21 * tY - m22 * tX) / v6;
  v9[5] = (m12 * tX - m11 * tY) / v6;
  -[NSAffineTransform setTransformStruct:](self, "setTransformStruct:", v9);
}

- (void)appendTransform:(NSAffineTransform *)transform
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double m11;
  double m12;
  double m21;
  double m22;
  double tX;
  double tY;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (transform)
  {
    -[NSAffineTransform transformStruct](transform, "transformStruct");
    v5 = v16;
    v4 = v17;
    v7 = v18;
    v6 = v19;
    v9 = v20;
    v8 = v21;
  }
  else
  {
    v8 = 0.0;
    v9 = 0.0;
    v6 = 0.0;
    v7 = 0.0;
    v4 = 0.0;
    v5 = 0.0;
  }
  m11 = self->_transformStruct.m11;
  m12 = self->_transformStruct.m12;
  m21 = self->_transformStruct.m21;
  m22 = self->_transformStruct.m22;
  tX = self->_transformStruct.tX;
  tY = self->_transformStruct.tY;
  v16 = v7 * m12 + m11 * v5;
  v17 = v6 * m12 + m11 * v4;
  v18 = v7 * m22 + m21 * v5;
  v19 = v6 * m22 + m21 * v4;
  v20 = v9 + v7 * tY + tX * v5;
  v21 = v8 + v6 * tY + tX * v4;
  -[NSAffineTransform setTransformStruct:](self, "setTransformStruct:", &v16);
}

- (void)prependTransform:(NSAffineTransform *)transform
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double m11;
  double m12;
  double m21;
  double m22;
  double tY;
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
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (transform)
  {
    -[NSAffineTransform transformStruct](transform, "transformStruct");
    v4 = v20;
    v5 = v21;
    v6 = v22;
    v7 = v23;
    v9 = v24;
    v8 = v25;
  }
  else
  {
    v8 = 0.0;
    v9 = 0.0;
    v7 = 0.0;
    v6 = 0.0;
    v5 = 0.0;
    v4 = 0.0;
  }
  m11 = self->_transformStruct.m11;
  m12 = self->_transformStruct.m12;
  m21 = self->_transformStruct.m21;
  m22 = self->_transformStruct.m22;
  tY = self->_transformStruct.tY;
  v15 = v5 * m21 + v4 * m11;
  v16 = v5 * m22 + v4 * m12;
  v17 = v7 * m21 + v6 * m11;
  v18 = v7 * m22 + v6 * m12;
  v19 = v8 * m21 + v9 * m11 + self->_transformStruct.tX;
  v20 = v15;
  v21 = v16;
  v22 = v17;
  v23 = v18;
  v24 = v19;
  v25 = v8 * m22 + v9 * m12 + tY;
  -[NSAffineTransform setTransformStruct:](self, "setTransformStruct:", &v20);
}

- (NSPoint)transformPoint:(NSPoint)aPoint
{
  float64x2_t v3;
  double v4;
  NSPoint result;

  v3 = vaddq_f64(vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&self->_transformStruct.m21, aPoint.y), *(float64x2_t *)&self->_transformStruct.m11, aPoint.x), *(float64x2_t *)&self->_transformStruct.tX);
  v4 = v3.f64[1];
  result.x = v3.f64[0];
  result.y = v4;
  return result;
}

- (NSSize)transformSize:(NSSize)aSize
{
  CGFloat v3;
  double v4;
  double v5;
  NSSize result;

  v3 = aSize.height * self->_transformStruct.m21 + self->_transformStruct.m11 * aSize.width;
  v4 = aSize.height * self->_transformStruct.m22 + self->_transformStruct.m12 * aSize.width;
  v5 = v3;
  result.height = v4;
  result.width = v5;
  return result;
}

- (NSAffineTransformStruct)transformStruct
{
  __int128 v3;

  v3 = *(_OWORD *)&self->m22;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self->m12;
  *(_OWORD *)&retstr->m21 = v3;
  *(_OWORD *)&retstr->tX = *(_OWORD *)&self->tY;
  return self;
}

- (void)setTransformStruct:(NSAffineTransformStruct *)transformStruct
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&transformStruct->m11;
  v4 = *(_OWORD *)&transformStruct->m21;
  *(_OWORD *)&self->_transformStruct.tX = *(_OWORD *)&transformStruct->tX;
  *(_OWORD *)&self->_transformStruct.m21 = v4;
  *(_OWORD *)&self->_transformStruct.m11 = v3;
}

- (void)encodeWithCoder:(id)a3
{
  float64x2_t v5;
  float64x2_t v6;
  double tY;
  double tX;
  double m22;
  _BOOL4 v10;
  unsigned int v12;
  __int8 *v13;
  uint64_t v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  float32x4_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a3, "allowsKeyedCoding"))
  {
    v19 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_transformStruct.m11), *(float64x2_t *)&self->_transformStruct.m21);
    v20[0] = vcvt_f32_f64(*(float64x2_t *)&self->_transformStruct.tX);
    objc_msgSend(a3, "encodeArrayOfObjCType:count:at:", "f", 6, &v19);
    return;
  }
  v5 = *(float64x2_t *)&self->_transformStruct.m11;
  v6.f64[0] = self->_transformStruct.m21;
  if (self->_transformStruct.m12 != 0.0 || v6.f64[0] != 0.0)
  {
    v6.f64[1] = self->_transformStruct.m22;
    v19 = (float32x4_t)vrev32q_s8((int8x16_t)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v5), v6));
    tY = self->_transformStruct.tY;
    *(float *)&v15 = self->_transformStruct.tX;
    LODWORD(v20[0]) = bswap32(v15);
    v13 = (char *)v20 + 4;
    v14 = 24;
LABEL_14:
    *(float *)&v16 = tY;
    *(_DWORD *)v13 = bswap32(v16);
    objc_msgSend(a3, "encodeBytes:length:forKey:", &v19, v14, CFSTR("NSTransformStruct"));
    return;
  }
  tX = self->_transformStruct.tX;
  tY = self->_transformStruct.tY;
  m22 = self->_transformStruct.m22;
  v10 = tX != 0.0;
  if (tY != 0.0)
    v10 = 1;
  if (v5.f64[0] != 1.0 || m22 != 1.0)
  {
    if (v10)
    {
      v5.f64[1] = self->_transformStruct.m22;
      *(int8x8_t *)v19.f32 = vrev32_s8((int8x8_t)vcvt_f32_f64(v5));
      *(float *)&v12 = tX;
      v19.i32[2] = bswap32(v12);
      v13 = (__int8 *)((unint64_t)&v19 | 0xC);
      v14 = 16;
    }
    else
    {
      v19.i8[0] = 2;
      *(float *)&v18 = v5.f64[0];
      *(__int32 *)((char *)v19.i32 + 1) = bswap32(v18);
      v13 = &v19.i8[5];
      v14 = 9;
      tY = m22;
    }
    goto LABEL_14;
  }
  if (v10)
  {
    v19.i8[0] = 1;
    *(float *)&v17 = tX;
    *(__int32 *)((char *)v19.i32 + 1) = bswap32(v17);
    v13 = &v19.i8[5];
    v14 = 9;
    goto LABEL_14;
  }
}

- (NSAffineTransform)initWithCoder:(id)a3
{
  NSAffineTransform *v4;
  unsigned int *v5;
  unsigned int v6;
  float32x2_t v7;
  int v8;
  NSString *v9;
  void *v10;
  NSString **v11;
  const __CFString **v12;
  NSString *v13;
  float32x2_t v15[3];
  const __CFString *v16;
  NSString *v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = -[NSAffineTransform init](self, "init");
  if (objc_msgSend(a3, "allowsKeyedCoding"))
  {
    v15[0] = 0;
    v5 = (unsigned int *)objc_msgSend(a3, "decodeBytesForKey:returnedLength:", CFSTR("NSTransformStruct"), v15);
    if (v5 && *(_QWORD *)v15)
    {
      switch((unint64_t)v15[0])
      {
        case 9uLL:
          v8 = *(unsigned __int8 *)v5;
          if (v8 == 2)
          {
            v4->_transformStruct.m11 = COERCE_FLOAT(bswap32(*(unsigned int *)((char *)v5 + 1)));
            v4->_transformStruct.m12 = 0.0;
            v4->_transformStruct.m21 = 0.0;
            v4->_transformStruct.m22 = COERCE_FLOAT(bswap32(*(unsigned int *)((char *)v5 + 5)));
            v4->_transformStruct.tX = 0.0;
            v4->_transformStruct.tY = 0.0;
            return v4;
          }
          if (v8 == 1)
          {
            v4->_transformStruct.m11 = 1.0;
            v4->_transformStruct.m12 = 0.0;
            v4->_transformStruct.m21 = 0.0;
            v4->_transformStruct.m22 = 1.0;
            v4->_transformStruct.tX = COERCE_FLOAT(bswap32(*(unsigned int *)((char *)v5 + 1)));
            v6 = *(unsigned int *)((char *)v5 + 5);
            goto LABEL_13;
          }

          v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unexpected encode state: %lu"), *(_QWORD *)v15);
          v18 = CFSTR("NSLocalizedDescription");
          v19[0] = v13;
          v10 = (void *)MEMORY[0x1E0C99D80];
          v11 = (NSString **)v19;
          v12 = &v18;
          break;
        case 0x10uLL:
          v4->_transformStruct.m11 = COERCE_FLOAT(bswap32(*v5));
          v4->_transformStruct.m12 = 0.0;
          v4->_transformStruct.m21 = 0.0;
          v4->_transformStruct.m22 = COERCE_FLOAT(bswap32(v5[1]));
          v4->_transformStruct.tX = COERCE_FLOAT(bswap32(v5[2]));
          v6 = v5[3];
          goto LABEL_13;
        case 0x18uLL:
          v4->_transformStruct.m11 = COERCE_FLOAT(bswap32(*v5));
          v4->_transformStruct.m12 = COERCE_FLOAT(bswap32(v5[1]));
          v4->_transformStruct.m21 = COERCE_FLOAT(bswap32(v5[2]));
          v4->_transformStruct.m22 = COERCE_FLOAT(bswap32(v5[3]));
          v4->_transformStruct.tX = COERCE_FLOAT(bswap32(v5[4]));
          v6 = v5[5];
LABEL_13:
          v4->_transformStruct.tY = COERCE_FLOAT(bswap32(v6));
          return v4;
        default:

          v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unexpected byte length: %@"), +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(_QWORD *)v15));
          v16 = CFSTR("NSLocalizedDescription");
          v17 = v9;
          v10 = (void *)MEMORY[0x1E0C99D80];
          v11 = &v17;
          v12 = &v16;
          break;
      }
      objc_msgSend(a3, "failWithError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 4864, objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v11, v12, 1)));
      return 0;
    }
  }
  else
  {
    objc_msgSend(a3, "decodeArrayOfObjCType:count:at:", "f", 6, v15);
    *(float64x2_t *)&v4->_transformStruct.m11 = vcvtq_f64_f32(v15[0]);
    v7 = v15[2];
    *(float64x2_t *)&v4->_transformStruct.m21 = vcvtq_f64_f32(v15[1]);
    *(float64x2_t *)&v4->_transformStruct.tX = vcvtq_f64_f32(v7);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)debugDescription
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)NSAffineTransform;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ {m11:%g m12:%g m21:%g m22:%g tX:%g tY:%g)\n"), -[NSAffineTransform debugDescription](&v3, sel_debugDescription), *(_QWORD *)&self->_transformStruct.m11, *(_QWORD *)&self->_transformStruct.m12, *(_QWORD *)&self->_transformStruct.m21, *(_QWORD *)&self->_transformStruct.m22, *(_QWORD *)&self->_transformStruct.tX, *(_QWORD *)&self->_transformStruct.tY);
}

+ (NSAffineTransform)transformWithScale:(double)a3
{
  id v4;
  _QWORD v6[7];

  v6[6] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init((Class)a1);
  *(double *)v6 = a3;
  v6[1] = 0;
  v6[2] = 0;
  *(double *)&v6[3] = a3;
  v6[4] = 0;
  v6[5] = 0;
  objc_msgSend(v4, "setTransformStruct:", v6);
  return (NSAffineTransform *)v4;
}

+ (NSAffineTransform)transformWithXScale:(double)a3 yScale:(double)a4
{
  id v6;
  _QWORD v8[7];

  v8[6] = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc_init((Class)a1);
  *(double *)v8 = a3;
  v8[1] = 0;
  v8[2] = 0;
  *(double *)&v8[3] = a4;
  v8[4] = 0;
  v8[5] = 0;
  objc_msgSend(v6, "setTransformStruct:", v8);
  return (NSAffineTransform *)v6;
}

+ (NSAffineTransform)transformWithXTranslation:(double)a3 yTranslation:(double)a4
{
  id v6;
  _QWORD v8[7];

  v8[6] = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc_init((Class)a1);
  v8[0] = 0x3FF0000000000000;
  v8[1] = 0;
  v8[2] = 0;
  v8[3] = 0x3FF0000000000000;
  *(double *)&v8[4] = a3;
  *(double *)&v8[5] = a4;
  objc_msgSend(v6, "setTransformStruct:", v8);
  return (NSAffineTransform *)v6;
}

+ (NSAffineTransform)transformWithRotationInDegrees:(double)a3
{
  id v4;
  __double2 v5;
  _QWORD v7[7];

  v7[6] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init((Class)a1);
  v5 = __sincos_stret(a3 * 3.14159265 / 180.0);
  v7[0] = *(_QWORD *)&v5.__cosval;
  v7[1] = *(_QWORD *)&v5.__sinval;
  *(double *)&v7[2] = -v5.__sinval;
  v7[3] = *(_QWORD *)&v5.__cosval;
  v7[4] = 0;
  v7[5] = 0;
  objc_msgSend(v4, "setTransformStruct:", v7);
  return (NSAffineTransform *)v4;
}

+ (NSAffineTransform)transformWithRotationInRadians:(double)a3
{
  id v4;
  __double2 v5;
  _QWORD v7[7];

  v7[6] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init((Class)a1);
  v5 = __sincos_stret(a3);
  v7[0] = *(_QWORD *)&v5.__cosval;
  v7[1] = *(_QWORD *)&v5.__sinval;
  *(double *)&v7[2] = -v5.__sinval;
  v7[3] = *(_QWORD *)&v5.__cosval;
  v7[4] = 0;
  v7[5] = 0;
  objc_msgSend(v4, "setTransformStruct:", v7);
  return (NSAffineTransform *)v4;
}

+ (NSAffineTransform)transformWithTransformStruct:(id *)a3
{
  id v4;
  __int128 v5;
  _OWORD v7[3];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init((Class)a1);
  v5 = *(_OWORD *)&a3->var2;
  v7[0] = *(_OWORD *)&a3->var0;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&a3->var4;
  objc_msgSend(v4, "setTransformStruct:", v7);
  return (NSAffineTransform *)v4;
}

+ (NSAffineTransform)transformWithFlipUsingHeight:(double)a3
{
  id v4;
  _QWORD v6[3];
  __int128 v7;
  double v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init((Class)a1);
  v6[1] = 0;
  v6[2] = 0;
  v6[0] = 0x3FF0000000000000;
  v7 = xmmword_182188BA0;
  v8 = a3;
  objc_msgSend(v4, "setTransformStruct:", v6);
  return (NSAffineTransform *)v4;
}

@end
