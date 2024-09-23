@implementation CHOutlinedArrowSketchRecognitionResult

- (CHOutlinedArrowSketchRecognitionResult)initWithString:(id)a3 score:(double)a4 rotation:(double)a5 center:(CGPoint)a6 size:(CGSize)a7 controlPointLocation:(CGPoint)a8
{
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  CGFloat v12;
  CGFloat v13;
  CHOutlinedArrowSketchRecognitionResult *result;
  objc_super v15;

  y = a8.y;
  x = a8.x;
  height = a7.height;
  width = a7.width;
  v12 = a6.y;
  v13 = a6.x;
  v15.receiver = self;
  v15.super_class = (Class)CHOutlinedArrowSketchRecognitionResult;
  result = -[CHSketchRecognitionResult initWithString:score:rotation:](&v15, sel_initWithString_score_rotation_, a3, a4, a5);
  if (result)
  {
    result->_center.x = v13;
    result->_center.y = v12;
    result->_size.width = width;
    result->_size.height = height;
    result->_controlPoint.x = x;
    result->_controlPoint.y = y;
  }
  return result;
}

- (CHOutlinedArrowSketchRecognitionResult)initWithCoder:(id)a3
{
  id v4;
  CHOutlinedArrowSketchRecognitionResult *v5;
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
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  NSString *v23;
  double v24;
  double v25;
  objc_super v27;
  float *v28;
  float *v29;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)CHOutlinedArrowSketchRecognitionResult;
  v5 = -[CHSketchRecognitionResult initWithCoder:](&v27, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("center"), v8, v9);
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    parseFloatsFromString(v10, (char **)&v28);
    if ((char *)v29 - (char *)v28 == 8)
    {
      v11 = *v28;
      v12 = v28[1];
    }
    else
    {
      v11 = *MEMORY[0x1E0C9D538];
      v12 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      if (!v28)
        goto LABEL_6;
    }
    v29 = v28;
    operator delete(v28);
LABEL_6:
    v5->_center.x = v11;
    v5->_center.y = v12;

    v13 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v13, (uint64_t)CFSTR("size"), v15, v16);
    v17 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5->_size.width = sizeFromString(v17);
    v5->_size.height = v18;

    v19 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v20, v19, (uint64_t)CFSTR("controlPoint"), v21, v22);
    v23 = (NSString *)objc_claimAutoreleasedReturnValue();
    parseFloatsFromString(v23, (char **)&v28);
    if ((char *)v29 - (char *)v28 == 8)
    {
      v24 = *v28;
      v25 = v28[1];
    }
    else
    {
      v24 = *MEMORY[0x1E0C9D538];
      v25 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      if (!v28)
      {
LABEL_10:
        v5->_controlPoint.x = v24;
        v5->_controlPoint.y = v25;

        goto LABEL_11;
      }
    }
    v29 = v28;
    operator delete(v28);
    goto LABEL_10;
  }
LABEL_11:

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
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)CHOutlinedArrowSketchRecognitionResult;
  v5 = -[CHSketchRecognitionResult encodeWithCoder:](&v35, sel_encodeWithCoder_, v4);
  pointToString(self->_center, (uint64_t)v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)v11, (uint64_t)CFSTR("center"), v13, v14);

  sizeToString(self->_size, v15, v16, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v22, (uint64_t)v21, (uint64_t)CFSTR("size"), v23, v24);

  pointToString(self->_controlPoint, v25, v26, v27, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v32, (uint64_t)v31, (uint64_t)CFSTR("controlPoint"), v33, v34);

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

- (CGPoint)controlPoint
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_controlPoint, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

@end
