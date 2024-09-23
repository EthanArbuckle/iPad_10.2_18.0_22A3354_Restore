@implementation ARHWFaceDetection

- (void)encodeWithCoder:(id)a3
{
  int64_t ID;
  id v5;
  $95D729B680665BEAEFA1D6FCA8238556 time;

  ID = self->_ID;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", ID, CFSTR("ID"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("rollAngleInDegrees"), self->_rollAngleInDegrees);
  objc_msgSend(v5, "encodeRect:forKey:", CFSTR("boundingBox"), self->_boundingBox.origin.x, self->_boundingBox.origin.y, self->_boundingBox.size.width, self->_boundingBox.size.height);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_detectionOrientation, CFSTR("detectionOrientation"));
  time = self->_time;
  objc_msgSend(v5, "encodeCMTime:forKey:", &time, CFSTR("time"));

}

- (ARHWFaceDetection)initWithCoder:(id)a3
{
  id v4;
  ARHWFaceDetection *v5;
  double v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  __int128 v12;
  int64_t v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ARHWFaceDetection;
  v5 = -[ARHWFaceDetection init](&v14, sel_init);
  if (v5)
  {
    v5->_ID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("ID"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("rollAngleInDegrees"));
    v5->_rollAngleInDegrees = v6;
    objc_msgSend(v4, "decodeRectForKey:", CFSTR("boundingBox"));
    v5->_boundingBox.origin.x = v7;
    v5->_boundingBox.origin.y = v8;
    v5->_boundingBox.size.width = v9;
    v5->_boundingBox.size.height = v10;
    v5->_detectionOrientation = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("detectionOrientation"));
    if (v4)
    {
      objc_msgSend(v4, "decodeCMTimeForKey:", CFSTR("time"));
    }
    else
    {
      v12 = 0uLL;
      v13 = 0;
    }
    *(_OWORD *)&v5->_time.value = v12;
    v5->_time.epoch = v13;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[ARHWFaceDetection isEqualToFaceDetection:](self, "isEqualToFaceDetection:", v4);

  return v5;
}

- (BOOL)isEqualToFaceDetection:(id)a3
{
  id v4;
  int64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  int64_t v21;
  BOOL v22;
  CMTime v24;
  CMTime time1;
  CGRect v26;
  CGRect v27;

  v4 = a3;
  v5 = -[ARHWFaceDetection ID](self, "ID");
  if (v5 != objc_msgSend(v4, "ID"))
    goto LABEL_7;
  -[ARHWFaceDetection rollAngleInDegrees](self, "rollAngleInDegrees");
  v7 = v6;
  objc_msgSend(v4, "rollAngleInDegrees");
  if (v7 != v8)
    goto LABEL_7;
  -[ARHWFaceDetection boundingBox](self, "boundingBox");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  objc_msgSend(v4, "boundingBox");
  v27.origin.x = v17;
  v27.origin.y = v18;
  v27.size.width = v19;
  v27.size.height = v20;
  v26.origin.x = v10;
  v26.origin.y = v12;
  v26.size.width = v14;
  v26.size.height = v16;
  if (!CGRectEqualToRect(v26, v27))
    goto LABEL_7;
  v21 = -[ARHWFaceDetection detectionOrientation](self, "detectionOrientation");
  if (v21 == objc_msgSend(v4, "detectionOrientation"))
  {
    -[ARHWFaceDetection time](self, "time");
    if (v4)
      objc_msgSend(v4, "time");
    else
      memset(&v24, 0, sizeof(v24));
    v22 = CMTimeCompare(&time1, &v24) == 0;
  }
  else
  {
LABEL_7:
    v22 = 0;
  }

  return v22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)faceDetectionFromDictionary:(id)a3
{
  id v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  char v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  const __CFDictionary *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  CMTime v19;
  CMTime v20;
  CGRect rect;

  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("AngleInfoRoll"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    goto LABEL_7;
  objc_msgSend(v3, "objectForKey:", CFSTR("Rect"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v7 = objc_opt_isKindOfClass();

  if ((v7 & 1) == 0)
    goto LABEL_7;
  objc_msgSend(v3, "objectForKey:", CFSTR("timestamp"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v9 = objc_opt_isKindOfClass();

  if ((v9 & 1) == 0)
    goto LABEL_7;
  objc_msgSend(v3, "objectForKey:", CFSTR("FaceID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v11 = objc_opt_isKindOfClass();

  if ((v11 & 1) == 0)
    goto LABEL_7;
  memset(&rect, 0, sizeof(rect));
  objc_msgSend(v3, "objectForKey:", CFSTR("Rect"));
  v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v13 = CGRectMakeWithDictionaryRepresentation(v12, &rect);

  if (v13)
  {
    v14 = (void *)objc_opt_new();
    objc_msgSend(v3, "objectForKey:", CFSTR("FaceID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setID:", objc_msgSend(v15, "integerValue"));

    objc_msgSend(v3, "objectForKey:", CFSTR("AngleInfoRoll"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValue");
    objc_msgSend(v14, "setRollAngleInDegrees:");

    objc_msgSend(v14, "setBoundingBox:", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
    objc_msgSend(v3, "objectForKey:", CFSTR("timestamp"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    CMTimeMake(&v20, objc_msgSend(v17, "integerValue"), 1);
    v19 = v20;
    objc_msgSend(v14, "setTime:", &v19);

  }
  else
  {
LABEL_7:
    v14 = 0;
  }

  return v14;
}

- (int64_t)ID
{
  return self->_ID;
}

- (void)setID:(int64_t)a3
{
  self->_ID = a3;
}

- (double)rollAngleInDegrees
{
  return self->_rollAngleInDegrees;
}

- (void)setRollAngleInDegrees:(double)a3
{
  self->_rollAngleInDegrees = a3;
}

- (CGRect)boundingBox
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_boundingBox.origin.x;
  y = self->_boundingBox.origin.y;
  width = self->_boundingBox.size.width;
  height = self->_boundingBox.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setBoundingBox:(CGRect)a3
{
  self->_boundingBox = a3;
}

- (int64_t)detectionOrientation
{
  return self->_detectionOrientation;
}

- (void)setDetectionOrientation:(int64_t)a3
{
  self->_detectionOrientation = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 32);
  return self;
}

- (void)setTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_time.epoch = a3->var3;
  *(_OWORD *)&self->_time.value = v3;
}

@end
