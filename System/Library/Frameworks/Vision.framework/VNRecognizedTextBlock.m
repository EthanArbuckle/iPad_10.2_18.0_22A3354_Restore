@implementation VNRecognizedTextBlock

- (VNRecognizedTextBlock)initWithRequestRevision:(unint64_t)a3 crOutputRegion:(id)a4
{
  id v7;
  VNRecognizedTextBlock *v8;
  VNRecognizedTextBlock *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)VNRecognizedTextBlock;
  v8 = -[VNRecognizedTextBlock init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_crOutputRegion, a4);
    v9->_requestRevision = a3;
  }

  return v9;
}

- (VNRecognizedTextBlock)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  VNRecognizedTextBlock *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("crOutputRegion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  if (v6)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestRevision"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      self = -[VNRecognizedTextBlock initWithRequestRevision:crOutputRegion:](self, "initWithRequestRevision:crOutputRegion:", objc_msgSend(v7, "unsignedIntegerValue"), v6);
      v9 = self;
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  CROutputRegion *crOutputRegion;
  id v5;
  id v6;

  crOutputRegion = self->_crOutputRegion;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", crOutputRegion, CFSTR("crOutputRegion"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_requestRevision);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("requestRevision"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  VNRecognizedTextBlock *v4;
  unint64_t requestRevision;
  void *v6;
  VNRecognizedTextBlock *v7;

  v4 = [VNRecognizedTextBlock alloc];
  requestRevision = self->_requestRevision;
  v6 = (void *)-[CROutputRegion copy](self->_crOutputRegion, "copy");
  v7 = -[VNRecognizedTextBlock initWithRequestRevision:crOutputRegion:](v4, "initWithRequestRevision:crOutputRegion:", requestRevision, v6);

  return v7;
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VNRecognizedTextBlock;
  return -[CROutputRegion hash](self->_crOutputRegion, "hash") ^ __ROR8__(-[VNRecognizedText hash](&v3, sel_hash), 51);
}

- (BOOL)isEqual:(id)a3
{
  VNRecognizedTextBlock *v4;
  char v5;

  v4 = (VNRecognizedTextBlock *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = -[CROutputRegion isEqual:](self->_crOutputRegion, "isEqual:", v4->_crOutputRegion);
    else
      v5 = 0;
  }

  return v5;
}

- (id)string
{
  return (id)-[CROutputRegion text](self->_crOutputRegion, "text");
}

- (float)confidence
{
  float result;

  -[CROutputRegion rawConfidence](self->_crOutputRegion, "rawConfidence");
  return result;
}

- (id)boundingBoxForRange:(_NSRange)a3 error:(id *)a4
{
  void *v5;
  void *v6;
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
  VNRectangleObservation *v21;

  -[CROutputRegion quadForTextInCharacterRange:](self->_crOutputRegion, "quadForTextInCharacterRange:", a3.location, a3.length, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "topLeft");
    v8 = v7;
    v10 = 1.0 - v9;
    objc_msgSend(v6, "topRight");
    v12 = v11;
    v14 = 1.0 - v13;
    objc_msgSend(v6, "bottomLeft");
    v16 = v15;
    v18 = 1.0 - v17;
    objc_msgSend(v6, "bottomRight");
    v21 = -[VNRectangleObservation initWithRequestRevision:topLeft:topRight:bottomRight:bottomLeft:]([VNRectangleObservation alloc], "initWithRequestRevision:topLeft:topRight:bottomRight:bottomLeft:", self->_requestRevision, v8, v10, v12, v14, v20, 1.0 - v19, v16, v18);
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)getCROutputRegion
{
  return self->_crOutputRegion;
}

- (unint64_t)requestRevision
{
  return self->_requestRevision;
}

- (NSArray)getRecognizedLanguages
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[VNRecognizedTextBlock getCROutputRegion](self, "getCROutputRegion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recognizedLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v2, "recognizedLocale");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    v8[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }

  return (NSArray *)v6;
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (NSArray)baselines
{
  return self->_baselines;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baselines, 0);
  objc_storeStrong((id *)&self->_attributedString, 0);
  objc_storeStrong((id *)&self->_crOutputRegion, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
