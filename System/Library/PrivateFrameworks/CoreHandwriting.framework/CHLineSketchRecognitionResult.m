@implementation CHLineSketchRecognitionResult

- (CHLineSketchRecognitionResult)initWithString:(id)a3 score:(double)a4 rotation:(double)a5 startLocation:(CGPoint)a6 startEndpointType:(int)a7 endLocation:(CGPoint)a8 endEndpointType:(int)a9 midPointLocation:(CGPoint)a10 controlPointLocation:(CGPoint)a11 pathPoints:(id)a12
{
  CGFloat x;
  CGFloat y;
  CGFloat v14;
  CGFloat v16;
  CGFloat v17;
  CGFloat v19;
  CGFloat v20;
  id v25;
  CHLineSketchRecognitionResult *v26;
  CHLineSketchRecognitionResult *v27;
  objc_super v29;
  CGFloat v30;
  CGFloat v31;

  x = a11.x;
  y = a10.y;
  v14 = a10.x;
  v16 = a8.y;
  v17 = a8.x;
  v19 = a6.y;
  v20 = a6.x;
  v25 = *(id *)&a11.x;
  v29.receiver = self;
  v29.super_class = (Class)CHLineSketchRecognitionResult;
  v26 = -[CHSketchRecognitionResult initWithString:score:rotation:](&v29, sel_initWithString_score_rotation_, a3, a4, a5);
  v27 = v26;
  if (v26)
  {
    v26->_startLocation.x = v20;
    v26->_startLocation.y = v19;
    v26->_startEndpointType = a7;
    v26->_endLocation.x = v17;
    v26->_endLocation.y = v16;
    v26->_endEndpointType = a9;
    v26->_midpointLocation.x = v14;
    v26->_midpointLocation.y = y;
    v26->_controlPoint.x = v30;
    v26->_controlPoint.y = v31;
    objc_storeStrong((id *)&v26->_pathPoints, *(id *)&x);
  }

  return v27;
}

- (CHLineSketchRecognitionResult)initWithString:(id)a3 score:(double)a4 rotation:(double)a5 startLocation:(CGPoint)a6 startEndpointType:(int)a7 endLocation:(CGPoint)a8 endEndpointType:(int)a9 midPointLocation:(CGPoint)a10 controlPointLocation:(CGPoint)a11
{
  return (CHLineSketchRecognitionResult *)objc_msgSend_initWithString_score_rotation_startLocation_startEndpointType_endLocation_endEndpointType_midPointLocation_controlPointLocation_pathPoints_(self, a2, (uint64_t)a3, *(uint64_t *)&a7, *(uint64_t *)&a9, 0, *(_QWORD *)&a11.y, a4, a5, a6.x, a6.y, a8.x, a8.y, a10.x, a10.y);
}

- (CHLineSketchRecognitionResult)initWithCoder:(id)a3
{
  id v4;
  CHLineSketchRecognitionResult *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSString *v10;
  double v11;
  double v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  NSString *v21;
  double v22;
  double v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  NSString *v32;
  double v33;
  double v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  NSString *v39;
  double v40;
  double v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSArray *pathPoints;
  objc_super v49;
  float *v50;
  float *v51;

  v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)CHLineSketchRecognitionResult;
  v5 = -[CHSketchRecognitionResult initWithCoder:](&v49, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("starLocation"), v8, v9);
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    parseFloatsFromString(v10, (char **)&v50);
    if ((char *)v51 - (char *)v50 == 8)
    {
      v11 = *v50;
      v12 = v50[1];
    }
    else
    {
      v11 = *MEMORY[0x1E0C9D538];
      v12 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      if (!v50)
        goto LABEL_6;
    }
    v51 = v50;
    operator delete(v50);
LABEL_6:
    v5->_startLocation.x = v11;
    v5->_startLocation.y = v12;

    v5->_startEndpointType = objc_msgSend_decodeIntegerForKey_(v4, v13, (uint64_t)CFSTR("startEndpointType"), v14, v15, v16);
    v17 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v18, v17, (uint64_t)CFSTR("endLocation"), v19, v20);
    v21 = (NSString *)objc_claimAutoreleasedReturnValue();
    parseFloatsFromString(v21, (char **)&v50);
    if ((char *)v51 - (char *)v50 == 8)
    {
      v22 = *v50;
      v23 = v50[1];
    }
    else
    {
      v22 = *MEMORY[0x1E0C9D538];
      v23 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      if (!v50)
        goto LABEL_10;
    }
    v51 = v50;
    operator delete(v50);
LABEL_10:
    v5->_endLocation.x = v22;
    v5->_endLocation.y = v23;

    v5->_endEndpointType = objc_msgSend_decodeIntegerForKey_(v4, v24, (uint64_t)CFSTR("endEndpointType"), v25, v26, v27);
    v28 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v29, v28, (uint64_t)CFSTR("midLocation"), v30, v31);
    v32 = (NSString *)objc_claimAutoreleasedReturnValue();
    parseFloatsFromString(v32, (char **)&v50);
    if ((char *)v51 - (char *)v50 == 8)
    {
      v33 = *v50;
      v34 = v50[1];
    }
    else
    {
      v33 = *MEMORY[0x1E0C9D538];
      v34 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      if (!v50)
        goto LABEL_14;
    }
    v51 = v50;
    operator delete(v50);
LABEL_14:
    v5->_midpointLocation.x = v33;
    v5->_midpointLocation.y = v34;

    v35 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v36, v35, (uint64_t)CFSTR("controlPoint"), v37, v38);
    v39 = (NSString *)objc_claimAutoreleasedReturnValue();
    parseFloatsFromString(v39, (char **)&v50);
    if ((char *)v51 - (char *)v50 == 8)
    {
      v40 = *v50;
      v41 = v50[1];
    }
    else
    {
      v40 = *MEMORY[0x1E0C9D538];
      v41 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      if (!v50)
      {
LABEL_18:
        v5->_controlPoint.x = v40;
        v5->_controlPoint.y = v41;

        v42 = objc_opt_class();
        objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(v4, v43, v42, (uint64_t)CFSTR("pathPoints"), v44, v45);
        v46 = objc_claimAutoreleasedReturnValue();
        pathPoints = v5->_pathPoints;
        v5->_pathPoints = (NSArray *)v46;

        goto LABEL_19;
      }
    }
    v51 = v50;
    operator delete(v50);
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
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  objc_super v54;

  v4 = a3;
  v54.receiver = self;
  v54.super_class = (Class)CHLineSketchRecognitionResult;
  v5 = -[CHSketchRecognitionResult encodeWithCoder:](&v54, sel_encodeWithCoder_, v4);
  pointToString(self->_startLocation, (uint64_t)v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)v11, (uint64_t)CFSTR("starLocation"), v13, v14);

  v18 = objc_msgSend_encodeInteger_forKey_(v4, v15, self->_startEndpointType, (uint64_t)CFSTR("startEndpointType"), v16, v17);
  pointToString(self->_endLocation, v18, v19, v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v25, (uint64_t)v24, (uint64_t)CFSTR("endLocation"), v26, v27);

  v31 = objc_msgSend_encodeInteger_forKey_(v4, v28, self->_endEndpointType, (uint64_t)CFSTR("endEndpointType"), v29, v30);
  pointToString(self->_midpointLocation, v31, v32, v33, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v38, (uint64_t)v37, (uint64_t)CFSTR("midLocation"), v39, v40);

  pointToString(self->_controlPoint, v41, v42, v43, v44, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v48, (uint64_t)v47, (uint64_t)CFSTR("controlPoint"), v49, v50);

  objc_msgSend_encodeObject_forKey_(v4, v51, (uint64_t)self->_pathPoints, (uint64_t)CFSTR("pathPoints"), v52, v53);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int)startEndpointType
{
  return self->_startEndpointType;
}

- (int)endEndpointType
{
  return self->_endEndpointType;
}

- (CGPoint)startLocation
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_startLocation, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)endLocation
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_endLocation, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)midpointLocation
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_midpointLocation, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
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

- (NSArray)pathPoints
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)cornerLine
{
  return self->_cornerLine;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathPoints, 0);
}

@end
