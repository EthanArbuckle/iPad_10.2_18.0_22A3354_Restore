@implementation VNDetectionprintObservation

- (VNDetectionprintObservation)initWithOriginatingRequestSpecifier:(id)a3 detectionprint:(id)a4
{
  id v6;
  VNDetectionprintObservation *v7;
  uint64_t v8;
  VNDetectionprint *detectionprint;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)VNDetectionprintObservation;
  v7 = -[VNObservation initWithOriginatingRequestSpecifier:](&v11, sel_initWithOriginatingRequestSpecifier_, a3);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    detectionprint = v7->_detectionprint;
    v7->_detectionprint = (VNDetectionprint *)v8;

  }
  return v7;
}

- (unint64_t)hash
{
  id v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNDetectionprintObservation;
  v3 = -[VNObservation hash](&v7, sel_hash);
  -[VNDetectionprintObservation detectionprint](self, "detectionprint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ __ROR8__(v3, 51);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  VNDetectionprintObservation *v4;
  VNDetectionprintObservation *v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v10;

  v4 = (VNDetectionprintObservation *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)VNDetectionprintObservation;
    if (-[VNObservation isEqual:](&v10, sel_isEqual_, v4) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      -[VNDetectionprintObservation detectionprint](self, "detectionprint");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNDetectionprintObservation detectionprint](v5, "detectionprint");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqual:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)vn_cloneObject
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNDetectionprintObservation;
  -[VNObservation vn_cloneObject](&v7, sel_vn_cloneObject);
  v3 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[VNDetectionprint copy](self->_detectionprint, "copy");
    v5 = (void *)v3[12];
    v3[12] = v4;

  }
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VNDetectionprintObservation;
  v4 = a3;
  -[VNObservation encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_detectionprint, CFSTR("detectionprint"), v5.receiver, v5.super_class);

}

- (VNDetectionprintObservation)initWithCoder:(id)a3
{
  id v4;
  VNDetectionprintObservation *v5;
  uint64_t v6;
  VNDetectionprint *detectionprint;
  VNDetectionprintObservation *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VNDetectionprintObservation;
  v5 = -[VNObservation initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5
    && (objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("detectionprint")),
        v6 = objc_claimAutoreleasedReturnValue(),
        detectionprint = v5->_detectionprint,
        v5->_detectionprint = (VNDetectionprint *)v6,
        detectionprint,
        !v5->_detectionprint))
  {
    v8 = 0;
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (VNDetectionprint)detectionprint
{
  return (VNDetectionprint *)objc_getProperty(self, a2, 96, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectionprint, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
