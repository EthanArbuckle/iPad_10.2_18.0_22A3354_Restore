@implementation VNRecognizedTextObservation

- (NSArray)topCandidates:(NSUInteger)maxCandidateCount
{
  void *v4;
  NSUInteger v5;
  NSUInteger v6;
  void *v7;

  if (maxCandidateCount)
  {
    -[VNRecognizedTextObservation textObjects](self, "textObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");
    if (v5 >= maxCandidateCount)
      v6 = maxCandidateCount;
    else
      v6 = v5;
    objc_msgSend(v4, "subarrayWithRange:", 0, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }
  return (NSArray *)v7;
}

- (VNRecognizedTextObservation)initWithCoder:(id)a3
{
  id v4;
  VNRecognizedTextObservation *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSArray *textObjects;
  void *v12;
  VNRecognizedTextObservation *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VNRecognizedTextObservation;
  v5 = -[VNRectangleObservation initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("textObjects"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    textObjects = v5->_textObjects;
    v5->_textObjects = (NSArray *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("text"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      -[VNRecognizedTextObservation setText:](v5, "setText:", v12);
    v13 = v5;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VNRecognizedTextObservation;
  -[VNRectangleObservation encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_text, CFSTR("text"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_textObjects, CFSTR("textObjects"));

}

- (id)vn_cloneObject
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNRecognizedTextObservation;
  -[VNRectangleObservation vn_cloneObject](&v7, sel_vn_cloneObject);
  v3 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[NSArray copy](self->_textObjects, "copy");
    v5 = (void *)v3[29];
    v3[29] = v4;

  }
  return v3;
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VNRecognizedTextObservation;
  return -[NSArray hash](self->_textObjects, "hash") ^ __ROR8__(-[VNRectangleObservation hash](&v3, sel_hash), 51);
}

- (BOOL)isEqual:(id)a3
{
  VNRecognizedTextObservation *v4;
  void *v5;
  char v6;
  objc_super v8;

  v4 = (VNRecognizedTextObservation *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)VNRecognizedTextObservation;
    if (-[VNRectangleObservation isEqual:](&v8, sel_isEqual_, v4)
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[VNRecognizedTextObservation textObjects](v4, "textObjects");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = VisionCoreEqualOrNilObjects();

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (void)setText:(id)a3
{
  NSString *v4;
  NSString *text;
  id v6;

  v6 = a3;
  v4 = (NSString *)objc_msgSend(v6, "copy");
  text = self->_text;
  self->_text = v4;

}

- (NSArray)textObjects
{
  return self->_textObjects;
}

- (void)setTextObjects:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (BOOL)isTitle
{
  return self->_isTitle;
}

- (void)setIsTitle:(BOOL)a3
{
  self->_isTitle = a3;
}

- (NSString)text
{
  return self->_text;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_textObjects, 0);
}

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  return CFSTR("VNRecognizeTextRequest");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
