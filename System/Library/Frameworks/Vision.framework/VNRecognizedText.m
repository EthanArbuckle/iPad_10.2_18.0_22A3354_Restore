@implementation VNRecognizedText

- (VNRecognizedText)initWithRequestRevision:(unint64_t)a3 CRImageReaderOutput:(id)a4
{
  id v7;
  VNRecognizedText *v8;
  VNRecognizedText *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)VNRecognizedText;
  v8 = -[VNRecognizedText init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_crOutput, a4);
    v9->_requestRevision = a3;
  }

  return v9;
}

- (VNRecognizedText)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  VNRecognizedText *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("crOutput"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  if (v6)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestRevision"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      self = -[VNRecognizedText initWithRequestRevision:CRImageReaderOutput:](self, "initWithRequestRevision:CRImageReaderOutput:", objc_msgSend(v7, "unsignedIntegerValue"), v6);
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
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", self->_crOutput, CFSTR("crOutput"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_requestRevision);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("requestRevision"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  VNRecognizedText *v4;
  unint64_t requestRevision;
  void *v6;
  VNRecognizedText *v7;

  v4 = [VNRecognizedText alloc];
  requestRevision = self->_requestRevision;
  v6 = (void *)-[CRImageReaderOutput copy](self->_crOutput, "copy");
  v7 = -[VNRecognizedText initWithRequestRevision:CRImageReaderOutput:](v4, "initWithRequestRevision:CRImageReaderOutput:", requestRevision, v6);

  return v7;
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VNRecognizedText;
  return self->_requestRevision ^ __ROR8__(-[CRImageReaderOutput hash](self->_crOutput, "hash") ^ __ROR8__(-[VNRecognizedText hash](&v3, sel_hash), 51), 51);
}

- (BOOL)isEqual:(id)a3
{
  VNRecognizedText *v4;
  VNRecognizedText *v5;
  void *v6;
  char v7;
  VNRecognizedText *v8;

  v4 = (VNRecognizedText *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[VNRecognizedText crOutput](v5, "crOutput");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = VisionCoreEqualOrNilObjects();

      if ((v7 & 1) != 0)
      {
        v8 = v5;
        -[VNRecognizedText requestRevision](self, "requestRevision");
        -[VNRecognizedText requestRevision](v8, "requestRevision");

      }
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (NSString)string
{
  void *v2;
  void *v3;

  -[VNRecognizedText crOutput](self, "crOutput");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (VNConfidence)confidence
{
  void *v2;
  unsigned int v3;
  float v4;

  -[VNRecognizedText crOutput](self, "crOutput");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "confidence");
  v4 = 0.0;
  if (v3 < 3)
    v4 = *(float *)&dword_1A15F8D88[v3];

  return v4;
}

- (VNRectangleObservation)boundingBoxForRange:(NSRange)range error:(NSError *)error
{
  NSUInteger length;
  NSUInteger location;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  VNRectangleObservation *v30;

  length = range.length;
  location = range.location;
  -[VNRecognizedText crOutput](self, "crOutput");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cornersForCharacterRange:error:", location, length, error);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && objc_msgSend(v9, "count") == 4)
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pointValue");
    v12 = v11;
    v14 = v13;

    objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "pointValue");
    v17 = v16;
    v19 = v18;

    objc_msgSend(v9, "objectAtIndexedSubscript:", 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "pointValue");
    v22 = v21;
    v24 = v23;

    objc_msgSend(v9, "objectAtIndexedSubscript:", 3);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "pointValue");
    v27 = v26;
    v29 = v28;

    v30 = -[VNRectangleObservation initWithRequestRevision:topLeft:bottomLeft:bottomRight:topRight:]([VNRectangleObservation alloc], "initWithRequestRevision:topLeft:bottomLeft:bottomRight:topRight:", -[VNRecognizedText requestRevision](self, "requestRevision"), v12, 1.0 - v14, v27, 1.0 - v29, v22, 1.0 - v24, v17, 1.0 - v19);
  }
  else
  {
    v30 = 0;
  }

  return v30;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  float v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VNRecognizedText;
  -[VNRecognizedText debugDescription](&v8, sel_debugDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNRecognizedText string](self, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNRecognizedText confidence](self, "confidence");
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" \"%@\" - (%f) revision: %ld"), v4, v5, -[VNRecognizedText requestRevision](self, "requestRevision"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)requestRevision
{
  return self->_requestRevision;
}

- (void)setRequestRevision:(unint64_t)a3
{
  self->_requestRevision = a3;
}

- (CRImageReaderOutput)crOutput
{
  return (CRImageReaderOutput *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_crOutput, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
