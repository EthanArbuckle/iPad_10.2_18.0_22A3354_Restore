@implementation CHTriangleRecognitionResult

- (CHTriangleRecognitionResult)initWithString:(id)a3 score:(double)a4 rotation:(double)a5 vertex1:(CGPoint)a6 vertex2:(CGPoint)a7 vertex3:(CGPoint)a8
{
  CGFloat y;
  CGFloat x;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CHTriangleRecognitionResult *result;
  objc_super v15;

  y = a8.y;
  x = a8.x;
  v10 = a7.y;
  v11 = a7.x;
  v12 = a6.y;
  v13 = a6.x;
  v15.receiver = self;
  v15.super_class = (Class)CHTriangleRecognitionResult;
  result = -[CHSketchRecognitionResult initWithString:score:rotation:](&v15, sel_initWithString_score_rotation_, a3, a4, a5);
  if (result)
  {
    result->_vertex1.x = v13;
    result->_vertex1.y = v12;
    result->_vertex2.x = v11;
    result->_vertex2.y = v10;
    result->_vertex3.x = x;
    result->_vertex3.y = y;
  }
  return result;
}

- (CHTriangleRecognitionResult)initWithCoder:(id)a3
{
  id v4;
  CHTriangleRecognitionResult *v5;
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
  double v18;
  double v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  NSString *v24;
  double v25;
  double v26;
  objc_super v28;
  float *v29;
  float *v30;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CHTriangleRecognitionResult;
  v5 = -[CHSketchRecognitionResult initWithCoder:](&v28, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("vertex1"), v8, v9);
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    parseFloatsFromString(v10, (char **)&v29);
    if ((char *)v30 - (char *)v29 == 8)
    {
      v11 = *v29;
      v12 = v29[1];
    }
    else
    {
      v11 = *MEMORY[0x1E0C9D538];
      v12 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      if (!v29)
        goto LABEL_6;
    }
    v30 = v29;
    operator delete(v29);
LABEL_6:
    v5->_vertex1.x = v11;
    v5->_vertex1.y = v12;

    v13 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v13, (uint64_t)CFSTR("vertex2"), v15, v16);
    v17 = (NSString *)objc_claimAutoreleasedReturnValue();
    parseFloatsFromString(v17, (char **)&v29);
    if ((char *)v30 - (char *)v29 == 8)
    {
      v18 = *v29;
      v19 = v29[1];
    }
    else
    {
      v18 = *MEMORY[0x1E0C9D538];
      v19 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      if (!v29)
        goto LABEL_10;
    }
    v30 = v29;
    operator delete(v29);
LABEL_10:
    v5->_vertex2.x = v18;
    v5->_vertex2.y = v19;

    v20 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v21, v20, (uint64_t)CFSTR("vertex3"), v22, v23);
    v24 = (NSString *)objc_claimAutoreleasedReturnValue();
    parseFloatsFromString(v24, (char **)&v29);
    if ((char *)v30 - (char *)v29 == 8)
    {
      v25 = *v29;
      v26 = v29[1];
    }
    else
    {
      v25 = *MEMORY[0x1E0C9D538];
      v26 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      if (!v29)
      {
LABEL_14:
        v5->_vertex3.x = v25;
        v5->_vertex3.y = v26;

        goto LABEL_15;
      }
    }
    v30 = v29;
    operator delete(v29);
    goto LABEL_14;
  }
LABEL_15:

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
  v35.super_class = (Class)CHTriangleRecognitionResult;
  v5 = -[CHSketchRecognitionResult encodeWithCoder:](&v35, sel_encodeWithCoder_, v4);
  pointToString(self->_vertex1, (uint64_t)v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)v11, (uint64_t)CFSTR("vertex1"), v13, v14);

  pointToString(self->_vertex2, v15, v16, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v22, (uint64_t)v21, (uint64_t)CFSTR("vertex2"), v23, v24);

  pointToString(self->_vertex3, v25, v26, v27, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v32, (uint64_t)v31, (uint64_t)CFSTR("vertex3"), v33, v34);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CGPoint)vertex1
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_vertex1, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)vertex2
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_vertex2, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)vertex3
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_vertex3, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

@end
