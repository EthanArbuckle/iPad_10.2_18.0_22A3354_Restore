@implementation VNHorizonObservation

- (VNHorizonObservation)initWithCoder:(id)a3
{
  id v4;
  VNHorizonObservation *v5;
  double v6;
  VNHorizonObservation *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VNHorizonObservation;
  v5 = -[VNObservation initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("angle"));
    v5->_angle = v6;
    if (v4)
    {
      objc_msgSend(v4, "vn_decodeCGAffineTransformForKey:", CFSTR("transform"));
    }
    else
    {
      v10 = 0u;
      v11 = 0u;
      v9 = 0u;
    }
    *(_OWORD *)&v5->_transform.a = v9;
    *(_OWORD *)&v5->_transform.c = v10;
    *(_OWORD *)&v5->_transform.tx = v11;
    v7 = v5;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  __int128 v5;
  _OWORD v6[3];
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)VNHorizonObservation;
  -[VNObservation encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("angle"), self->_angle);
  v5 = *(_OWORD *)&self->_transform.c;
  v6[0] = *(_OWORD *)&self->_transform.a;
  v6[1] = v5;
  v6[2] = *(_OWORD *)&self->_transform.tx;
  objc_msgSend(v4, "vn_encodeCGAffineTransform:forKey:", v6, CFSTR("transform"));

}

- (id)vn_cloneObject
{
  void *v3;
  void *v4;
  __int128 v5;
  _OWORD v7[3];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VNHorizonObservation;
  -[VNObservation vn_cloneObject](&v8, sel_vn_cloneObject);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = *(_OWORD *)&self->_transform.c;
    v7[0] = *(_OWORD *)&self->_transform.a;
    v7[1] = v5;
    v7[2] = *(_OWORD *)&self->_transform.tx;
    objc_msgSend(v3, "setTransform:", v7);
    objc_msgSend(v4, "setAngle:", self->_angle);
  }
  return v4;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  double v5;
  double v6;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VNHorizonObservation;
  v3 = -[VNObservation hash](&v9, sel_hash);
  -[VNHorizonObservation transform](self, "transform");
  v4 = VNHashCGAffineTransform((uint64_t)&v8) ^ __ROR8__(v3, 51);
  -[VNHorizonObservation angle](self, "angle");
  v6 = v5;
  if (v5 == 0.0)
    v6 = 0.0;
  return *(_QWORD *)&v6 ^ __ROR8__(v4, 51);
}

- (BOOL)isEqual:(id)a3
{
  VNHorizonObservation *v4;
  VNHorizonObservation *v5;
  BOOL v6;
  double v7;
  double v8;
  double v9;
  CGAffineTransform v11;
  CGAffineTransform t1;
  objc_super v13;

  v4 = (VNHorizonObservation *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)VNHorizonObservation;
    if (-[VNObservation isEqual:](&v13, sel_isEqual_, v4) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      -[VNHorizonObservation transform](self, "transform");
      if (v5)
        -[VNHorizonObservation transform](v5, "transform");
      else
        memset(&v11, 0, sizeof(v11));
      if (CGAffineTransformEqualToTransform(&t1, &v11))
      {
        -[VNHorizonObservation angle](self, "angle");
        v8 = v7;
        -[VNHorizonObservation angle](v5, "angle");
        v6 = v8 == v9;
      }
      else
      {
        v6 = 0;
      }

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (CGAffineTransform)transformForImageWidth:(SEL)a3 height:(size_t)width
{
  double v7;
  double v8;
  __int128 v9;
  CGFloat v10;
  __int128 v11;
  __int128 v12;
  CGAffineTransform *result;
  __int128 v14;
  CGAffineTransform v15;
  CGAffineTransform v16;
  CGAffineTransform v17;

  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  v7 = (double)width;
  *(_OWORD *)&retstr->a = 0u;
  v8 = (double)height;
  CGAffineTransformMakeTranslation(retstr, (double)width * 0.5, (double)height * 0.5);
  v9 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v16.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v16.c = v9;
  *(_OWORD *)&v16.tx = *(_OWORD *)&retstr->tx;
  -[VNHorizonObservation angle](self, "angle");
  CGAffineTransformRotate(&v17, &v16, v10);
  v11 = *(_OWORD *)&v17.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v17.a;
  *(_OWORD *)&retstr->c = v11;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v17.tx;
  v12 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v15.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v15.c = v12;
  *(_OWORD *)&v15.tx = *(_OWORD *)&retstr->tx;
  result = CGAffineTransformTranslate(&v17, &v15, v7 * -0.5, v8 * -0.5);
  v14 = *(_OWORD *)&v17.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v17.a;
  *(_OWORD *)&retstr->c = v14;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v17.tx;
  return result;
}

- (CGAffineTransform)transform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[2].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[2].tx;
  return self;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v4 = *(_OWORD *)&a3->c;
  v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_transform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_transform.c = v4;
  *(_OWORD *)&self->_transform.tx = v3;
}

- (CGFloat)angle
{
  return self->_angle;
}

- (void)setAngle:(double)a3
{
  self->_angle = a3;
}

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  return CFSTR("VNDetectHorizonRequest");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (double)angleInTopLeftOrigin:(BOOL)a3 orientation:(unsigned int)a4
{
  double result;
  double v6;

  -[VNHorizonObservation angle](self, "angle", a3);
  v6 = -result;
  if (((1 << a4) & 0xB4) == 0)
    v6 = result;
  if (a4 <= 7)
    return v6;
  return result;
}

@end
