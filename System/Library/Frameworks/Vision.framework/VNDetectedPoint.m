@implementation VNDetectedPoint

- (VNDetectedPoint)initWithLocation:(CGPoint)a3 confidence:(float)a4
{
  VNDetectedPoint *v5;
  VNDetectedPoint *v6;
  VNDetectedPoint *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VNDetectedPoint;
  v5 = -[VNPoint initWithLocation:](&v9, sel_initWithLocation_, a3.x, a3.y);
  v6 = v5;
  if (v5)
  {
    v5->_confidence = a4;
    v7 = v5;
  }

  return v6;
}

- (VNConfidence)confidence
{
  return self->_confidence;
}

- (unint64_t)hash
{
  id v3;
  float confidence;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNDetectedPoint;
  v3 = -[VNPoint hash](&v7, sel_hash);
  confidence = self->_confidence;
  v5 = LODWORD(confidence);
  if (confidence == 0.0)
    v5 = 0;
  return v5 ^ __ROR8__(v3, 51);
}

- (VNDetectedPoint)initWithCoder:(id)a3
{
  id v4;
  VNDetectedPoint *v5;
  float v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VNDetectedPoint;
  v5 = -[VNPoint initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "vn_decodeValidatedConfidenceForKey:", CFSTR("Confid"));
    v5->_confidence = v6;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  double v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)VNDetectedPoint;
  -[VNPoint encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  *(float *)&v5 = self->_confidence;
  objc_msgSend(v4, "vn_encodeValidatedConfidence:forKey:", CFSTR("Confid"), v5);

}

- (BOOL)isEqual:(id)a3
{
  float *v4;
  BOOL v5;
  objc_super v7;

  v4 = (float *)a3;
  v7.receiver = self;
  v7.super_class = (Class)VNDetectedPoint;
  v5 = -[VNPoint isEqual:](&v7, sel_isEqual_, v4)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && self->_confidence == v4[6];

  return v5;
}

- (id)transformedWith:(CGAffineTransform *)a3
{
  double v5;
  double v6;
  id v7;
  int v8;
  double v9;
  float64x2_t v11;

  -[VNPoint location](self, "location");
  v11 = vaddq_f64(*(float64x2_t *)&a3->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a3->c, v5), *(float64x2_t *)&a3->a, v6));
  v7 = objc_alloc((Class)objc_opt_class());
  -[VNDetectedPoint confidence](self, "confidence");
  LODWORD(v9) = v8;
  return (id)objc_msgSend(v7, "initWithLocation:confidence:", *(_OWORD *)&v11, v9);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
