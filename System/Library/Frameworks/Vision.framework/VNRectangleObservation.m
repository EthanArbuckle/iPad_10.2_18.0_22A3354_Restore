@implementation VNRectangleObservation

- (VNRectangleObservation)initWithTopLeft:(CGPoint)a3 bottomLeft:(CGPoint)a4 bottomRight:(CGPoint)a5 topRight:(CGPoint)a6
{
  return -[VNRectangleObservation initWithRequestRevision:topLeft:topRight:bottomRight:bottomLeft:](self, "initWithRequestRevision:topLeft:topRight:bottomRight:bottomLeft:", 1, a3.x, a3.y, a6.x, a6.y, a5.x, a5.y, a4.x, a4.y);
}

- (VNRectangleObservation)initWithRequestRevision:(unint64_t)a3 topLeft:(CGPoint)a4 bottomLeft:(CGPoint)a5 bottomRight:(CGPoint)a6 topRight:(CGPoint)a7
{
  return -[VNRectangleObservation initWithRequestRevision:topLeft:topRight:bottomRight:bottomLeft:](self, "initWithRequestRevision:topLeft:topRight:bottomRight:bottomLeft:", a3, a4.x, a4.y, a7.x, a7.y, a6.x, a6.y, a5.x, a5.y);
}

- (VNRectangleObservation)initWithRequestRevision:(unint64_t)a3 topLeft:(CGPoint)a4 topRight:(CGPoint)a5 bottomRight:(CGPoint)a6 bottomLeft:(CGPoint)a7
{
  CGFloat y;
  CGFloat x;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  VNRectangleObservation *result;
  objc_super v18;

  y = a7.y;
  x = a7.x;
  v9 = a6.y;
  v10 = a6.x;
  v11 = a5.y;
  v12 = a5.x;
  v13 = a4.y;
  v14 = a4.x;
  VisionCoreBoundingBoxForQuadrilateralPoints();
  v18.receiver = self;
  v18.super_class = (Class)VNRectangleObservation;
  result = -[VNDetectedObjectObservation initWithRequestRevision:boundingBox:](&v18, sel_initWithRequestRevision_boundingBox_, a3);
  if (result)
  {
    result->_topLeft.x = v14;
    result->_topLeft.y = v13;
    result->_topRight.x = v12;
    result->_topRight.y = v11;
    result->_bottomRight.x = v10;
    result->_bottomRight.y = v9;
    result->_bottomLeft.x = x;
    result->_bottomLeft.y = y;
  }
  return result;
}

- (VNRectangleObservation)initWithOriginatingRequestSpecifier:(id)a3 boundingBox:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  VNRectangleObservation *v10;
  VNRectangleObservation *v11;
  VNRectangleObservation *v12;
  objc_super v14;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VNRectangleObservation;
  v10 = -[VNDetectedObjectObservation initWithOriginatingRequestSpecifier:boundingBox:](&v14, sel_initWithOriginatingRequestSpecifier_boundingBox_, v9, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    -[VNRectangleObservation _setQuadrilateralPointsFromBoundingBox:](v10, "_setQuadrilateralPointsFromBoundingBox:", x, y, width, height);
    v12 = v11;
  }

  return v11;
}

- (VNRectangleObservation)initWithOriginatingRequestSpecifier:(id)a3 topLeft:(CGPoint)a4 topRight:(CGPoint)a5 bottomRight:(CGPoint)a6 bottomLeft:(CGPoint)a7
{
  CGFloat y;
  CGFloat x;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  id v16;
  VNRectangleObservation *v17;
  VNRectangleObservation *v18;
  objc_super v20;

  y = a7.y;
  x = a7.x;
  v9 = a6.y;
  v10 = a6.x;
  v11 = a5.y;
  v12 = a5.x;
  v13 = a4.y;
  v14 = a4.x;
  v16 = a3;
  VisionCoreBoundingBoxForQuadrilateralPoints();
  v20.receiver = self;
  v20.super_class = (Class)VNRectangleObservation;
  v17 = -[VNDetectedObjectObservation initWithOriginatingRequestSpecifier:boundingBox:](&v20, sel_initWithOriginatingRequestSpecifier_boundingBox_, v16);
  v18 = v17;
  if (v17)
  {
    v17->_topLeft.x = v14;
    v17->_topLeft.y = v13;
    v17->_topRight.x = v12;
    v17->_topRight.y = v11;
    v17->_bottomRight.x = v10;
    v17->_bottomRight.y = v9;
    v17->_bottomLeft.x = x;
    v17->_bottomLeft.y = y;
  }

  return v18;
}

- (double)initWithOriginatingRequestSpecifier:(double)a3 topLeft:(double)a4 topRight:(double)a5 bottomRight:(double)a6 bottomLeft:(double)a7 boundingBox:(double)a8
{
  double *result;
  objc_super v29;

  v29.receiver = a1;
  v29.super_class = (Class)VNRectangleObservation;
  result = (double *)objc_msgSendSuper2(&v29, sel_initWithOriginatingRequestSpecifier_boundingBox_, a10, a11, a12, a13);
  if (result)
  {
    result[20] = a2;
    result[21] = a3;
    result[22] = a8;
    result[23] = a9;
    result[24] = a6;
    result[25] = a7;
    result[26] = a4;
    result[27] = a5;
  }
  return result;
}

- (VNRectangleObservation)initWithCoder:(id)a3
{
  id v4;
  VNRectangleObservation *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  VNRectangleObservation *v26;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)VNRectangleObservation;
  v5 = -[VNDetectedObjectObservation initWithCoder:](&v28, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("TLX"));
    v7 = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("TLY"));
    v9 = v8;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("TRX"));
    v11 = v10;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("TRY"));
    v13 = v12;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("BLX"));
    v15 = v14;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("BLY"));
    v17 = v16;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("BRX"));
    v19 = v18;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("BRY"));
    v21 = v20;
    VisionCoreBoundingBoxForQuadrilateralPoints();
    v5->super._boundingBox.origin.x = v22;
    v5->super._boundingBox.origin.y = v23;
    v5->super._boundingBox.size.width = v24;
    v5->super._boundingBox.size.height = v25;
    v5->_topLeft.x = v7;
    v5->_topLeft.y = v9;
    v5->_topRight.x = v11;
    v5->_topRight.y = v13;
    v5->_bottomRight.x = v19;
    v5->_bottomRight.y = v21;
    v5->_bottomLeft.x = v15;
    v5->_bottomLeft.y = v17;
    v26 = v5;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VNRectangleObservation;
  -[VNDetectedObjectObservation encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("TLX"), self->_topLeft.x);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("TLY"), self->_topLeft.y);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("TRX"), self->_topRight.x);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("TRY"), self->_topRight.y);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("BLX"), self->_bottomLeft.x);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("BLY"), self->_bottomLeft.y);
  self = (VNRectangleObservation *)((char *)self + 192);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("BRX"), *(double *)&self->super.super.super.isa);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("BRY"), *(double *)&self->super.super._originatingRequestSpecifier);

}

- (id)vn_cloneObject
{
  CGPoint *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VNRectangleObservation;
  -[VNDetectedObjectObservation vn_cloneObject](&v5, sel_vn_cloneObject);
  v3 = (CGPoint *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v3[10] = self->_topLeft;
    v3[13] = self->_topRight;
    v3[11] = self->_bottomLeft;
    v3[12] = self->_bottomRight;
  }
  return v3;
}

- (unint64_t)hash
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)VNRectangleObservation;
  v3 = -[VNDetectedObjectObservation hash](&v24, sel_hash);
  -[VNRectangleObservation topLeft](self, "topLeft");
  v6 = v5;
  if (v5 == 0.0)
    v6 = 0.0;
  v7 = v4;
  if (v4 == 0.0)
    v7 = 0.0;
  v8 = *(_QWORD *)&v7 ^ __ROR8__(*(_QWORD *)&v6, 51) ^ __ROR8__(v3, 51);
  -[VNRectangleObservation topRight](self, "topRight");
  v11 = v10;
  if (v10 == 0.0)
    v11 = 0.0;
  v12 = v9;
  if (v9 == 0.0)
    v12 = 0.0;
  v13 = *(_QWORD *)&v12 ^ __ROR8__(*(_QWORD *)&v11, 51) ^ __ROR8__(v8, 51);
  -[VNRectangleObservation bottomLeft](self, "bottomLeft");
  v16 = v15;
  if (v15 == 0.0)
    v16 = 0.0;
  v17 = v14;
  if (v14 == 0.0)
    v17 = 0.0;
  v18 = *(_QWORD *)&v17 ^ __ROR8__(*(_QWORD *)&v16, 51) ^ __ROR8__(v13, 51);
  -[VNRectangleObservation bottomRight](self, "bottomRight");
  v21 = v20;
  if (v20 == 0.0)
    v21 = 0.0;
  v22 = v19;
  if (v19 == 0.0)
    v22 = 0.0;
  return *(_QWORD *)&v22 ^ __ROR8__(*(_QWORD *)&v21, 51) ^ __ROR8__(v18, 51);
}

- (BOOL)isEqual:(id)a3
{
  VNRectangleObservation *v4;
  VNRectangleObservation *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;
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
  objc_super v32;

  v4 = (VNRectangleObservation *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    v32.receiver = self;
    v32.super_class = (Class)VNRectangleObservation;
    if (-[VNDetectedObjectObservation isEqual:](&v32, sel_isEqual_, v4)
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      -[VNRectangleObservation topLeft](self, "topLeft");
      v7 = v6;
      v9 = v8;
      -[VNRectangleObservation topLeft](v5, "topLeft");
      v11 = 0;
      if (v7 == v12 && v9 == v10)
      {
        -[VNRectangleObservation topRight](self, "topRight");
        v14 = v13;
        v16 = v15;
        -[VNRectangleObservation topRight](v5, "topRight");
        v11 = 0;
        if (v14 == v18 && v16 == v17)
        {
          -[VNRectangleObservation bottomLeft](self, "bottomLeft");
          v20 = v19;
          v22 = v21;
          -[VNRectangleObservation bottomLeft](v5, "bottomLeft");
          v11 = 0;
          if (v20 == v24 && v22 == v23)
          {
            -[VNRectangleObservation bottomRight](self, "bottomRight");
            v26 = v25;
            v28 = v27;
            -[VNRectangleObservation bottomRight](v5, "bottomRight");
            v11 = v28 == v30 && v26 == v29;
          }
        }
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (VNRectangleObservation)initWithBoundingBox:(CGRect)a3
{
  return -[VNRectangleObservation initWithRequestRevision:boundingBox:](self, "initWithRequestRevision:boundingBox:", 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (VNRectangleObservation)initWithRequestRevision:(unint64_t)a3 boundingBox:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  VNRectangleObservation *v8;
  VNRectangleObservation *v9;
  VNRectangleObservation *v10;
  objc_super v12;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)VNRectangleObservation;
  v8 = -[VNDetectedObjectObservation initWithRequestRevision:boundingBox:](&v12, sel_initWithRequestRevision_boundingBox_, a3);
  v9 = v8;
  if (v8)
  {
    -[VNRectangleObservation _setQuadrilateralPointsFromBoundingBox:](v8, "_setQuadrilateralPointsFromBoundingBox:", x, y, width, height);
    v10 = v9;
  }

  return v9;
}

- (void)_setQuadrilateralPointsFromBoundingBox:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat MaxY;
  CGFloat MinY;
  CGFloat MinX;
  double MaxX;
  CGRect v12;
  CGRect v13;
  CGRect v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  MaxY = CGRectGetMaxY(a3);
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  MinY = CGRectGetMinY(v12);
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  MinX = CGRectGetMinX(v13);
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  MaxX = CGRectGetMaxX(v14);
  if (self)
  {
    self->_topLeft.x = MinX;
    self->_topLeft.y = MaxY;
    self->_topRight.x = MaxX;
    self->_topRight.y = MaxY;
    self->_bottomRight.x = MaxX;
    self->_bottomRight.y = MinY;
    self->_bottomLeft.x = MinX;
    self->_bottomLeft.y = MinY;
  }
}

- (id)debugQuickLookObject
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  CGPath *Mutable;
  const CGAffineTransform *v20;
  void *v21;
  CGColor *v22;
  void *v23;
  objc_super v25;
  _OWORD v26[2];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[VNRectangleObservation topLeft](self, "topLeft");
  v4 = v3;
  v6 = v5;
  -[VNRectangleObservation bottomLeft](self, "bottomLeft");
  v8 = v7;
  v10 = v9;
  -[VNRectangleObservation bottomRight](self, "bottomRight");
  v12 = v11;
  v14 = v13;
  -[VNRectangleObservation topRight](self, "topRight");
  v16 = v15;
  v18 = v17;
  Mutable = CGPathCreateMutable();
  v20 = (const CGAffineTransform *)MEMORY[0x1E0C9BAA8];
  CGPathMoveToPoint(Mutable, MEMORY[0x1E0C9BAA8], v4, v6);
  CGPathAddLineToPoint(Mutable, v20, v8, v10);
  CGPathAddLineToPoint(Mutable, v20, v12, v14);
  CGPathAddLineToPoint(Mutable, v20, v16, v18);
  CGPathAddLineToPoint(Mutable, v20, v4, v6);
  CGPathCloseSubpath(Mutable);
  if (Mutable)
  {
    v25.receiver = self;
    v25.super_class = (Class)VNRectangleObservation;
    -[VNDetectedObjectObservation debugQuickLookObject](&v25, sel_debugQuickLookObject);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v26[0] = xmmword_1A15FAF60;
      v26[1] = unk_1A15FAF70;
      v22 = (CGColor *)VNDebugColorFromValues((const CGFloat *)v26);
      VNDebugImageRenderNormalizedCGPathOnImage((uint64_t)Mutable, v21, v22);
    }
    else
    {
      VNDebugPathFromNormalizedCGPath((uint64_t)Mutable, 512.0, 512.0);
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    CGPathRelease(Mutable);
  }
  else
  {
    v23 = 0;
  }
  return v23;
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

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  return CFSTR("VNDetectRectanglesRequest");
}

+ (VNRectangleObservation)observationWithRequestRevision:(unint64_t)a3 boundingBox:(CGRect)a4
{
  return (VNRectangleObservation *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithRequestRevision:boundingBox:", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

+ (VNRectangleObservation)rectangleObservationWithRequestRevision:(NSUInteger)requestRevision topLeft:(CGPoint)topLeft bottomLeft:(CGPoint)bottomLeft bottomRight:(CGPoint)bottomRight topRight:(CGPoint)topRight
{
  return (VNRectangleObservation *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithRequestRevision:topLeft:bottomLeft:bottomRight:topRight:", requestRevision, topLeft.x, topLeft.y, bottomLeft.x, bottomLeft.y, bottomRight.x, bottomRight.y, topRight.x, topRight.y);
}

+ (VNRectangleObservation)rectangleObservationWithRequestRevision:(NSUInteger)requestRevision topLeft:(CGPoint)topLeft topRight:(CGPoint)topRight bottomRight:(CGPoint)bottomRight bottomLeft:(CGPoint)bottomLeft
{
  return (VNRectangleObservation *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithRequestRevision:topLeft:topRight:bottomRight:bottomLeft:", requestRevision, topLeft.x, topLeft.y, topRight.x, topRight.y, bottomRight.x, bottomRight.y, bottomLeft.x, bottomLeft.y);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)boundingBoxIsCalculatedProperty
{
  return 1;
}

- (void)getTopLeftPoint:(CGPoint *)a3 topRightPoint:(CGPoint *)a4 bottomRightPoint:(CGPoint *)a5 bottomLeftPoint:(CGPoint *)a6 inTopLeftOrigin:(BOOL)a7 orientation:(unsigned int)a8
{
  CGPoint v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  float64x2_t v22;
  float64x2_t v23;
  float64x2_t v24;

  v23 = 0u;
  v24 = 0u;
  v22 = 0u;
  v13.x = VNAffineTransformForVisionToTopLeftOriginOrientation(a7, a8, (uint64_t)&v22);
  if (a3)
  {
    -[VNRectangleObservation topLeft](self, "topLeft", v13.x);
    v13 = (CGPoint)vaddq_f64(v24, vmlaq_n_f64(vmulq_n_f64(v23, v14), v22, v15));
    *a3 = v13;
  }
  if (a4)
  {
    -[VNRectangleObservation topRight](self, "topRight", v13.x);
    v13 = (CGPoint)vaddq_f64(v24, vmlaq_n_f64(vmulq_n_f64(v23, v16), v22, v17));
    *a4 = v13;
  }
  if (a5)
  {
    -[VNRectangleObservation bottomRight](self, "bottomRight", v13.x);
    v13 = (CGPoint)vaddq_f64(v24, vmlaq_n_f64(vmulq_n_f64(v23, v18), v22, v19));
    *a5 = v13;
  }
  if (a6)
  {
    -[VNRectangleObservation bottomLeft](self, "bottomLeft", v13.x);
    *(float64x2_t *)a6 = vaddq_f64(v24, vmlaq_n_f64(vmulq_n_f64(v23, v20), v22, v21));
  }
}

@end
