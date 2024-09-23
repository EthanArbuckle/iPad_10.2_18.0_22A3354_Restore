@implementation VNFaceScreenGaze

- (unint64_t)hash
{
  double x;
  double y;

  x = self->_screenGaze.x;
  if (x == 0.0)
    x = 0.0;
  y = self->_screenGaze.y;
  if (y == 0.0)
    y = 0.0;
  return -[VNRequestSpecifier hash](self->_originatingRequestSpecifier, "hash") ^ __ROR8__(*(_QWORD *)&y ^ __ROR8__(*(_QWORD *)&x, 51), 51);
}

- (BOOL)isEqual:(id)a3
{
  VNFaceScreenGaze *v4;
  VNFaceScreenGaze *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  char v11;
  double v12;
  void *v13;
  void *v14;
  objc_super v16;

  v4 = (VNFaceScreenGaze *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)VNFaceScreenGaze;
    if (-[VNFaceScreenGaze isEqual:](&v16, sel_isEqual_, v4) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      -[VNFaceScreenGaze screenGazeRawOutputInCentimeters](self, "screenGazeRawOutputInCentimeters");
      v7 = v6;
      v9 = v8;
      -[VNFaceScreenGaze screenGazeRawOutputInCentimeters](v5, "screenGazeRawOutputInCentimeters");
      v11 = 0;
      if (v7 == v12 && v9 == v10)
      {
        -[VNFaceScreenGaze originatingRequestSpecifier](self, "originatingRequestSpecifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[VNFaceScreenGaze originatingRequestSpecifier](v5, "originatingRequestSpecifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v13, "isEqual:", v14);

      }
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "vn_encodePoint:forKey:", CFSTR("gaze"), self->_screenGaze.x, self->_screenGaze.y);
  objc_msgSend(v4, "encodeObject:forKey:", self->_originatingRequestSpecifier, CFSTR("oreq"));

}

- (VNFaceScreenGaze)initWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  id v10;
  void *v11;
  unsigned int v12;
  unsigned int v13;
  VNFaceScreenGaze *v14;
  float32x2_t v16[2];
  id v17;

  v4 = a3;
  objc_msgSend(v4, "vn_decodePointForKey:", CFSTR("gaze"));
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("oreq"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v17 = 0;
    +[VNRequestSpecifier specifierForRequestClassName:revision:error:](VNRequestSpecifier, "specifierForRequestClassName:revision:error:", CFSTR("VNDetectScreenGazeRequest"), 1, &v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v17;
    v11 = v10;
    if (!v9)
    {
      objc_msgSend(v4, "failWithError:", v10);
      v14 = 0;
      goto LABEL_5;
    }

  }
  v16[1] = (float32x2_t)vdup_n_s32(0x7FC00000u);
  *(float *)&v12 = v6;
  *(float *)&v13 = v8;
  v16[0] = (float32x2_t)__PAIR64__(v13, v12);
  self = -[VNFaceScreenGaze initWithScreenGaze:originatingRequestSpecifier:](self, v16, v9);
  v11 = v9;
  v14 = self;
LABEL_5:

  return v14;
}

- (CGPoint)screenGazeRawOutputInCentimeters
{
  double x;
  double y;
  CGPoint result;

  x = self->_screenGaze.x;
  y = self->_screenGaze.y;
  result.y = y;
  result.x = x;
  return result;
}

- (float)difficultToSay
{
  return NAN;
}

- (VNRequestSpecifier)originatingRequestSpecifier
{
  return self->_originatingRequestSpecifier;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  float v8;
  double v9;
  float v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[VNFaceScreenGaze screenGazeRawOutputInCentimeters](self, "screenGazeRawOutputInCentimeters");
  v5 = v4;
  -[VNFaceScreenGaze screenGazeRawOutputInCentimeters](self, "screenGazeRawOutputInCentimeters");
  v7 = v6;
  -[VNFaceScreenGaze lookingAtDevice](self, "lookingAtDevice");
  v9 = v8;
  -[VNFaceScreenGaze notLookingAtDevice](self, "notLookingAtDevice");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("screen gaze in cm [%f, %f]. Probabilities: looking = %f, notLooking = %f,"), v5, v7, *(_QWORD *)&v9, v10);
}

- (float)lookingAtDevice
{
  return self->_lookingAtDevice;
}

- (float)notLookingAtDevice
{
  return self->_notLookingAtDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingRequestSpecifier, 0);
}

- (void)initWithScreenGaze:(void *)a3 originatingRequestSpecifier:
{
  id v6;
  id v7;
  objc_super v9;

  v6 = a3;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)VNFaceScreenGaze;
    v7 = objc_msgSendSuper2(&v9, sel_init);
    a1 = v7;
    if (v7)
    {
      *((float64x2_t *)v7 + 1) = vcvtq_f64_f32(*a2);
      *((_DWORD *)v7 + 8) = a2[1].i32[1];
      *((_DWORD *)v7 + 9) = a2[1].i32[0];
      objc_storeStrong((id *)v7 + 1, a3);
    }
  }

  return a1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
