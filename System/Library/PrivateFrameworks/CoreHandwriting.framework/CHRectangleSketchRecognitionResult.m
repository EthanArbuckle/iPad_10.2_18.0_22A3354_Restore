@implementation CHRectangleSketchRecognitionResult

- (CHRectangleSketchRecognitionResult)initWithString:(id)a3 score:(double)a4 rotation:(double)a5 upperLeftPoint:(CGPoint)a6 upperRightPoint:(CGPoint)a7 lowerLeftPoint:(CGPoint)a8 lowerRightPoint:(CGPoint)a9 size:(CGSize)a10
{
  CGFloat y;
  CGFloat x;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CHRectangleSketchRecognitionResult *result;
  objc_super v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;

  y = a8.y;
  x = a8.x;
  v12 = a7.y;
  v13 = a7.x;
  v14 = a6.y;
  v15 = a6.x;
  v17.receiver = self;
  v17.super_class = (Class)CHRectangleSketchRecognitionResult;
  result = -[CHSketchRecognitionResult initWithString:score:rotation:](&v17, sel_initWithString_score_rotation_, a3, *(_QWORD *)&a9.x, *(_QWORD *)&a9.y, *(_QWORD *)&a10.width, *(_QWORD *)&a10.height, a4, a5);
  if (result)
  {
    result->_upperLeftPoint.x = v15;
    result->_upperLeftPoint.y = v14;
    result->_upperRightPoint.x = v13;
    result->_upperRightPoint.y = v12;
    result->_lowerLeftPoint.x = x;
    result->_lowerLeftPoint.y = y;
    result->_lowerRightPoint.x = v18;
    result->_lowerRightPoint.y = v19;
    result->_size.width = v20;
    result->_size.height = v21;
  }
  return result;
}

- (CHRectangleSketchRecognitionResult)initWithCoder:(id)a3
{
  id v4;
  CHRectangleSketchRecognitionResult *v5;
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
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  NSString *v31;
  double v32;
  double v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  NSString *v38;
  CGFloat v39;
  objc_super v41;
  float *v42;
  float *v43;

  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)CHRectangleSketchRecognitionResult;
  v5 = -[CHSketchRecognitionResult initWithCoder:](&v41, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("upperLeftPoint"), v8, v9);
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    parseFloatsFromString(v10, (char **)&v42);
    if ((char *)v43 - (char *)v42 == 8)
    {
      v11 = *v42;
      v12 = v42[1];
    }
    else
    {
      v11 = *MEMORY[0x1E0C9D538];
      v12 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      if (!v42)
        goto LABEL_6;
    }
    v43 = v42;
    operator delete(v42);
LABEL_6:
    v5->_upperLeftPoint.x = v11;
    v5->_upperLeftPoint.y = v12;

    v13 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v13, (uint64_t)CFSTR("upperRightPoint"), v15, v16);
    v17 = (NSString *)objc_claimAutoreleasedReturnValue();
    parseFloatsFromString(v17, (char **)&v42);
    if ((char *)v43 - (char *)v42 == 8)
    {
      v18 = *v42;
      v19 = v42[1];
    }
    else
    {
      v18 = *MEMORY[0x1E0C9D538];
      v19 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      if (!v42)
        goto LABEL_10;
    }
    v43 = v42;
    operator delete(v42);
LABEL_10:
    v5->_upperRightPoint.x = v18;
    v5->_upperRightPoint.y = v19;

    v20 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v21, v20, (uint64_t)CFSTR("lowerLeftPoint"), v22, v23);
    v24 = (NSString *)objc_claimAutoreleasedReturnValue();
    parseFloatsFromString(v24, (char **)&v42);
    if ((char *)v43 - (char *)v42 == 8)
    {
      v25 = *v42;
      v26 = v42[1];
    }
    else
    {
      v25 = *MEMORY[0x1E0C9D538];
      v26 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      if (!v42)
        goto LABEL_14;
    }
    v43 = v42;
    operator delete(v42);
LABEL_14:
    v5->_lowerLeftPoint.x = v25;
    v5->_lowerLeftPoint.y = v26;

    v27 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v28, v27, (uint64_t)CFSTR("lowerRightPoint"), v29, v30);
    v31 = (NSString *)objc_claimAutoreleasedReturnValue();
    parseFloatsFromString(v31, (char **)&v42);
    if ((char *)v43 - (char *)v42 == 8)
    {
      v32 = *v42;
      v33 = v42[1];
    }
    else
    {
      v32 = *MEMORY[0x1E0C9D538];
      v33 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      if (!v42)
      {
LABEL_18:
        v5->_lowerRightPoint.x = v32;
        v5->_lowerRightPoint.y = v33;

        v34 = objc_opt_class();
        objc_msgSend_decodeObjectOfClass_forKey_(v4, v35, v34, (uint64_t)CFSTR("size"), v36, v37);
        v38 = (NSString *)objc_claimAutoreleasedReturnValue();
        v5->_size.width = sizeFromString(v38);
        v5->_size.height = v39;

        goto LABEL_19;
      }
    }
    v43 = v42;
    operator delete(v42);
    goto LABEL_18;
  }
LABEL_19:

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
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  objc_super v55;

  v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)CHRectangleSketchRecognitionResult;
  v5 = -[CHSketchRecognitionResult encodeWithCoder:](&v55, sel_encodeWithCoder_, v4);
  pointToString(self->_upperLeftPoint, (uint64_t)v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)v11, (uint64_t)CFSTR("upperLeftPoint"), v13, v14);

  pointToString(self->_upperRightPoint, v15, v16, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v22, (uint64_t)v21, (uint64_t)CFSTR("upperRightPoint"), v23, v24);

  pointToString(self->_lowerLeftPoint, v25, v26, v27, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v32, (uint64_t)v31, (uint64_t)CFSTR("lowerLeftPoint"), v33, v34);

  pointToString(self->_lowerRightPoint, v35, v36, v37, v38, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v42, (uint64_t)v41, (uint64_t)CFSTR("lowerRightPoint"), v43, v44);

  sizeToString(self->_size, v45, v46, v47, v48, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v52, (uint64_t)v51, (uint64_t)CFSTR("size"), v53, v54);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CGPoint)upperLeftPoint
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_upperLeftPoint, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)upperRightPoint
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_upperRightPoint, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)lowerLeftPoint
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_lowerLeftPoint, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)lowerRightPoint
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_lowerRightPoint, 16, 1, 0);
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
