@implementation VNRecognizeDocumentElementsRequestElementConfiguration

- (unint64_t)hash
{
  uint64_t v3;
  _BOOL4 v4;
  uint64_t v5;

  if (-[VNRecognizeDocumentElementsRequestElementConfiguration recognize](self, "recognize"))
    v3 = 357908480;
  else
    v3 = 178954240;
  v4 = -[VNRecognizeDocumentElementsRequestElementConfiguration generateSegmentationMask](self, "generateSegmentationMask");
  v5 = 21845;
  if (v4)
    v5 = 43690;
  return v5 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  VNRecognizeDocumentElementsRequestElementConfiguration *v4;
  VNRecognizeDocumentElementsRequestElementConfiguration *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;

  v4 = (VNRecognizeDocumentElementsRequestElementConfiguration *)a3;
  if (self == v4)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[VNRecognizeDocumentElementsRequestElementConfiguration recognize](self, "recognize");
      if (v6 == -[VNRecognizeDocumentElementsRequestElementConfiguration recognize](v5, "recognize"))
      {
        v8 = -[VNRecognizeDocumentElementsRequestElementConfiguration generateSegmentationMask](self, "generateSegmentationMask");
        v7 = v8 ^ -[VNRecognizeDocumentElementsRequestElementConfiguration generateSegmentationMask](v5, "generateSegmentationMask") ^ 1;
      }
      else
      {
        LOBYTE(v7) = 0;
      }

    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  if (v4)
  {
    objc_msgSend(v4, "setRecognize:", -[VNRecognizeDocumentElementsRequestElementConfiguration recognize](self, "recognize"));
    objc_msgSend(v4, "setGenerateSegmentationMask:", -[VNRecognizeDocumentElementsRequestElementConfiguration generateSegmentationMask](self, "generateSegmentationMask"));
  }
  return v4;
}

- (BOOL)recognize
{
  return self->_recognize;
}

- (void)setRecognize:(BOOL)a3
{
  self->_recognize = a3;
}

- (BOOL)generateSegmentationMask
{
  return self->_generateSegmentationMask;
}

- (void)setGenerateSegmentationMask:(BOOL)a3
{
  self->_generateSegmentationMask = a3;
}

@end
