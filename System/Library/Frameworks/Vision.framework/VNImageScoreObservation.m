@implementation VNImageScoreObservation

- (VNImageScoreObservation)initWithCoder:(id)a3
{
  id v4;
  VNImageScoreObservation *v5;
  uint64_t v6;
  NSNumber *blurScore;
  uint64_t v8;
  NSNumber *exposureScore;
  VNImageScoreObservation *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VNImageScoreObservation;
  v5 = -[VNObservation initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("blur"));
    v6 = objc_claimAutoreleasedReturnValue();
    blurScore = v5->_blurScore;
    v5->_blurScore = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("exposure"));
    v8 = objc_claimAutoreleasedReturnValue();
    exposureScore = v5->_exposureScore;
    v5->_exposureScore = (NSNumber *)v8;

    v10 = v5;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VNImageScoreObservation;
  -[VNObservation encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_blurScore, CFSTR("blur"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_exposureScore, CFSTR("exposure"));

}

- (id)vn_cloneObject
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VNImageScoreObservation;
  -[VNObservation vn_cloneObject](&v6, sel_vn_cloneObject);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "setBlurScore:", self->_blurScore);
    objc_msgSend(v4, "setExposureScore:", self->_exposureScore);
  }
  return v4;
}

- (unint64_t)hash
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VNImageScoreObservation;
  v3 = -[VNObservation hash](&v9, sel_hash);
  -[VNImageScoreObservation blurScore](self, "blurScore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");

  -[VNImageScoreObservation exposureScore](self, "exposureScore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash") ^ __ROR8__(v5 ^ __ROR8__(v3, 51), 51);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  VNImageScoreObservation *v4;
  VNImageScoreObservation *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  objc_super v13;

  v4 = (VNImageScoreObservation *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)VNImageScoreObservation;
    if (-[VNObservation isEqual:](&v13, sel_isEqual_, v4) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      -[VNImageScoreObservation blurScore](self, "blurScore");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNImageScoreObservation blurScore](v5, "blurScore");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = VisionCoreEqualOrNilObjects();

      if ((v8 & 1) != 0)
      {
        -[VNImageScoreObservation exposureScore](self, "exposureScore");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[VNImageScoreObservation exposureScore](v5, "exposureScore");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = VisionCoreEqualOrNilObjects();

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VNImageScoreObservation;
  -[VNObservation description](&v11, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNImageScoreObservation blurScore](self, "blurScore");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" blurScore=%@"), v4);
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }
  -[VNImageScoreObservation exposureScore](self, "exposureScore");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
  {
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" exposureScore=%@"), v7);
    v9 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v9;
  }

  return v3;
}

- (NSNumber)blurScore
{
  return self->_blurScore;
}

- (void)setBlurScore:(id)a3
{
  objc_storeStrong((id *)&self->_blurScore, a3);
}

- (NSNumber)exposureScore
{
  return self->_exposureScore;
}

- (void)setExposureScore:(id)a3
{
  objc_storeStrong((id *)&self->_exposureScore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exposureScore, 0);
  objc_storeStrong((id *)&self->_blurScore, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  return 0;
}

@end
