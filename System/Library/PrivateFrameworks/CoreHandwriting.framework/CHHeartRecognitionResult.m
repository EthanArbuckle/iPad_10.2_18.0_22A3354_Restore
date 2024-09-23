@implementation CHHeartRecognitionResult

- (CHHeartRecognitionResult)initWithString:(id)a3 score:(double)a4 rotation:(double)a5 center:(CGPoint)a6 size:(CGSize)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CHHeartRecognitionResult *result;
  objc_super v12;

  height = a7.height;
  width = a7.width;
  y = a6.y;
  x = a6.x;
  v12.receiver = self;
  v12.super_class = (Class)CHHeartRecognitionResult;
  result = -[CHSketchRecognitionResult initWithString:score:rotation:](&v12, sel_initWithString_score_rotation_, a3, a4, a5);
  if (result)
  {
    result->_center.x = x;
    result->_center.y = y;
    result->_size.width = width;
    result->_size.height = height;
  }
  return result;
}

- (CHHeartRecognitionResult)initWithCoder:(id)a3
{
  id v4;
  CHHeartRecognitionResult *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSString *v10;
  double v11;
  double v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  NSString *v17;
  CGFloat v18;
  objc_super v20;
  float *v21;
  float *v22;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CHHeartRecognitionResult;
  v5 = -[CHSketchRecognitionResult initWithCoder:](&v20, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("center"), v8, v9);
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    parseFloatsFromString(v10, (char **)&v21);
    if ((char *)v22 - (char *)v21 == 8)
    {
      v11 = *v21;
      v12 = v21[1];
    }
    else
    {
      v11 = *MEMORY[0x1E0C9D538];
      v12 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      if (!v21)
      {
LABEL_6:
        v5->_center.x = v11;
        v5->_center.y = v12;

        v13 = objc_opt_class();
        objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v13, (uint64_t)CFSTR("size"), v15, v16);
        v17 = (NSString *)objc_claimAutoreleasedReturnValue();
        v5->_size.width = sizeFromString(v17);
        v5->_size.height = v18;

        goto LABEL_7;
      }
    }
    v22 = v21;
    operator delete(v21);
    goto LABEL_6;
  }
LABEL_7:

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CHHeartRecognitionResult;
  v5 = -[CHSketchRecognitionResult encodeWithCoder:](&v25, sel_encodeWithCoder_, v4);
  pointToString(self->_center, (uint64_t)v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)v11, (uint64_t)CFSTR("center"), v13, v14);

  sizeToString(self->_size, v15, v16, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v22, (uint64_t)v21, (uint64_t)CFSTR("size"), v23, v24);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CGPoint)center
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_center, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGSize)size
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_size, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

@end
