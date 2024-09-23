@implementation VNShotflowDetection

- (VNShotflowDetection)initWithBox:(CGRect)a3 defaultBox:(CGRect)a4 confidence:(float)a5 scale:(int)a6 rotationAngle:(float)a7 yawAngle:(float)a8
{
  return -[VNShotflowDetection initWithBox:defaultBox:confidence:scale:rotationAngle:yawAngle:mergesCount:](self, "initWithBox:defaultBox:confidence:scale:rotationAngle:yawAngle:mergesCount:", *(_QWORD *)&a6, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (VNShotflowDetection)initWithBox:(CGRect)a3 defaultBox:(CGRect)a4 confidence:(float)a5 scale:(int)a6 rotationAngle:(float)a7 yawAngle:(float)a8 mergesCount:(int)a9
{
  return -[VNShotflowDetection initWithBox:defaultBox:confidence:scale:rotationAngle:yawAngle:pitchAngle:mergesCount:hasLabel:label:](self, "initWithBox:defaultBox:confidence:scale:rotationAngle:yawAngle:pitchAngle:mergesCount:hasLabel:label:", *(_QWORD *)&a6, *(_QWORD *)&a9, 0, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, *(_QWORD *)&a5, LODWORD(a8));
}

- (VNShotflowDetection)initWithBox:(CGRect)a3 defaultBox:(CGRect)a4 confidence:(float)a5 scale:(int)a6 rotationAngle:(float)a7 yawAngle:(float)a8 hasLabel:(BOOL)a9 label:(int)a10
{
  return -[VNShotflowDetection initWithBox:defaultBox:confidence:scale:rotationAngle:yawAngle:pitchAngle:mergesCount:hasLabel:label:](self, "initWithBox:defaultBox:confidence:scale:rotationAngle:yawAngle:pitchAngle:mergesCount:hasLabel:label:", *(_QWORD *)&a6, 1, a9, *(_QWORD *)&a10, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, *(_QWORD *)&a5, LODWORD(a8));
}

- (VNShotflowDetection)initWithBox:(CGRect)a3 defaultBox:(CGRect)a4 confidence:(float)a5 scale:(int)a6 rotationAngle:(float)a7 yawAngle:(float)a8 pitchAngle:(float)a9 hasLabel:(BOOL)a10 label:(int)a11
{
  return -[VNShotflowDetection initWithBox:defaultBox:confidence:scale:rotationAngle:yawAngle:pitchAngle:mergesCount:hasLabel:label:](self, "initWithBox:defaultBox:confidence:scale:rotationAngle:yawAngle:pitchAngle:mergesCount:hasLabel:label:", *(_QWORD *)&a6, 1, a10, *(_QWORD *)&a11, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (VNShotflowDetection)initWithBox:(CGRect)a3 defaultBox:(CGRect)a4 confidence:(float)a5 scale:(int)a6 rotationAngle:(float)a7 yawAngle:(float)a8 mergesCount:(int)a9 hasLabel:(BOOL)a10 label:(int)a11
{
  return -[VNShotflowDetection initWithBox:defaultBox:confidence:scale:rotationAngle:yawAngle:pitchAngle:mergesCount:hasLabel:label:](self, "initWithBox:defaultBox:confidence:scale:rotationAngle:yawAngle:pitchAngle:mergesCount:hasLabel:label:", *(_QWORD *)&a6, 1, a10, *(_QWORD *)&a11, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, *(_QWORD *)&a5, LODWORD(a8));
}

- (VNShotflowDetection)initWithBox:(CGRect)a3 defaultBox:(CGRect)a4 confidence:(float)a5 scale:(int)a6 rotationAngle:(float)a7 yawAngle:(float)a8 pitchAngle:(float)a9 mergesCount:(int)a10 hasLabel:(BOOL)a11 label:(int)a12
{
  uint64_t v13;

  LODWORD(v13) = 0;
  return -[VNShotflowDetection initWithBox:defaultBox:confidence:scale:rotationAngle:yawAngle:pitchAngle:mergesCount:hasLabel:label:petFaceScore:associatedX:associatedY:groupId:](self, "initWithBox:defaultBox:confidence:scale:rotationAngle:yawAngle:pitchAngle:mergesCount:hasLabel:label:petFaceScore:associatedX:associatedY:groupId:", *(_QWORD *)&a6, *(_QWORD *)&a10, a11, *(_QWORD *)&a12, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, *(_QWORD *)&a5, *(_QWORD *)&a8, 0,
           v13);
}

- (VNShotflowDetection)initWithBox:(CGRect)a3 defaultBox:(CGRect)a4 confidence:(float)a5 scale:(int)a6 rotationAngle:(float)a7 yawAngle:(float)a8 pitchAngle:(float)a9 hasLabel:(BOOL)a10 label:(int)a11 petFaceScore:(float)a12 associatedX:(float)a13 associatedY:(float)a14
{
  return -[VNShotflowDetection initWithBox:defaultBox:confidence:scale:rotationAngle:yawAngle:pitchAngle:mergesCount:hasLabel:label:petFaceScore:associatedX:associatedY:groupId:](self, "initWithBox:defaultBox:confidence:scale:rotationAngle:yawAngle:pitchAngle:mergesCount:hasLabel:label:petFaceScore:associatedX:associatedY:groupId:", *(_QWORD *)&a6, 1, a10, *(_QWORD *)&a11, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (VNShotflowDetection)initWithBox:(CGRect)a3 defaultBox:(CGRect)a4 confidence:(float)a5 scale:(int)a6 rotationAngle:(float)a7 yawAngle:(float)a8 pitchAngle:(float)a9 mergesCount:(int)a10 hasLabel:(BOOL)a11 label:(int)a12 petFaceScore:(float)a13 associatedX:(float)a14 associatedY:(float)a15 groupId:(int)a16
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  VNShotflowDetection *result;
  float v30;
  objc_super v31;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v25 = a3.size.height;
  v26 = a3.size.width;
  v27 = a3.origin.y;
  v28 = a3.origin.x;
  v31.receiver = self;
  v31.super_class = (Class)VNShotflowDetection;
  result = -[VNShotflowDetection init](&v31, sel_init);
  if (result)
  {
    result->_box.origin.x = v28;
    result->_box.origin.y = v27;
    result->_box.size.width = v26;
    result->_box.size.height = v25;
    result->_defaultBox.origin.x = x;
    result->_defaultBox.origin.y = y;
    result->_defaultBox.size.width = width;
    result->_defaultBox.size.height = height;
    result->_confidence = a5;
    result->_mergesCount = a10;
    result->_scale = a6;
    result->_rotationAngle = a7;
    result->_yawAngle = a8;
    result->_pitchAngle = a9;
    v30 = v26 * v25;
    result->_area = v30;
    result->_hasLabel = a11;
    result->_label = a12;
    result->_petFaceScore = a13;
    result->_associatedX = a14;
    result->_associatedY = a15;
    result->_groupId = a16;
  }
  return result;
}

- (CGPoint)boxCenter
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MidX;
  double MidY;
  double v8;
  CGPoint result;
  CGRect v10;
  CGRect v11;

  -[VNShotflowDetection box](self, "box");
  x = v10.origin.x;
  y = v10.origin.y;
  width = v10.size.width;
  height = v10.size.height;
  MidX = CGRectGetMidX(v10);
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  MidY = CGRectGetMidY(v11);
  v8 = MidX;
  result.y = MidY;
  result.x = v8;
  return result;
}

- (float)distanceToDefaultBox
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  -[VNShotflowDetection boxCenter](self, "boxCenter");
  v4 = v3;
  v6 = v5;
  -[VNShotflowDetection defaultBox](self, "defaultBox");
  *(float *)&v8 = v8 + v7 * 0.5;
  *(float *)&v10 = v10 + v9 * 0.5;
  return sqrt((v4 - *(float *)&v8) / v7 * ((v4 - *(float *)&v8) / v7)+ (v6 - *(float *)&v10) / v9 * ((v6 - *(float *)&v10) / v9));
}

- (float)smartDistance
{
  float v3;
  float v4;
  float v5;

  -[VNShotflowDetection distanceToDefaultBox](self, "distanceToDefaultBox");
  v4 = v3;
  -[VNShotflowDetection confidence](self, "confidence");
  return v4 + (float)(1.0 - v5);
}

- (float)overlap:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  double v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;

  objc_msgSend(a3, "box");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[VNShotflowDetection box](self, "box");
  v15 = v7;
  v16 = v11;
  v17 = v15 + v16;
  v18 = v5;
  v19 = v9;
  v20 = v19 * v16;
  v22 = v12 + v21;
  if ((float)(v18 + v19) < v22)
    v22 = v18 + v19;
  v23 = v12;
  if (v18 >= v23)
    v23 = v5;
  v24 = fmaxf(v22 - v23, 0.0);
  v25 = v13 + v14;
  if (v17 < v25)
    v25 = v17;
  v26 = v13;
  if (v15 >= v26)
    v26 = v7;
  v27 = fmaxf(v25 - v26, 0.0);
  return (float)(v24 * v27) / (float)((float)(v20 + self->_area) - (float)(v24 * v27));
}

- (float)intersectionOverArea:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  double v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;

  objc_msgSend(a3, "box");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[VNShotflowDetection box](self, "box");
  v15 = v7;
  v16 = v11;
  v17 = v15 + v16;
  v18 = v5;
  v19 = v9;
  v20 = v19 * v16;
  v22 = v12 + v21;
  if ((float)(v18 + v19) < v22)
    v22 = v18 + v19;
  v23 = v12;
  if (v18 >= v23)
    v23 = v5;
  v24 = fmaxf(v22 - v23, 0.0);
  v25 = v13 + v14;
  if (v17 < v25)
    v25 = v17;
  v26 = v13;
  if (v15 >= v26)
    v26 = v7;
  return (float)(v24 * fmaxf(v25 - v26, 0.0)) / v20;
}

- (float)intersectionOverMinArea:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;

  objc_msgSend(a3, "box");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[VNShotflowDetection box](self, "box");
  v16 = v7;
  v17 = v11;
  v18 = v16 + v17;
  v19 = v5;
  v20 = v9;
  v21 = v19 + v20;
  v22 = v20 * v17;
  v23 = v12 + v14;
  if (v21 < v23)
    v23 = v21;
  v24 = v12;
  if (v19 >= v24)
    v24 = v5;
  v25 = fmaxf(v23 - v24, 0.0);
  v26 = v13 + v15;
  if (v18 >= v26)
    v18 = v13 + v15;
  v27 = v13;
  if (v16 >= v27)
    v27 = v7;
  v28 = v25 * fmaxf(v18 - v27, 0.0);
  if (v15 * v14 <= v22)
  {
    v29 = v15 * v14;
    v30 = v29;
  }
  else
  {
    v30 = v22;
  }
  return v28 / v30;
}

- (BOOL)isOverlappingSmallFace:(id)a3 withOverlapThreshold:(float)a4 withSizeRatio:(float)a5
{
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  float v13;
  double v14;
  float v15;
  float v16;
  double v17;
  double v18;
  double v19;
  float v20;
  float v21;
  double v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;

  objc_msgSend(a3, "box");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = v13 * v15;
  -[VNShotflowDetection box](self, "box");
  v20 = v11;
  v21 = v9;
  v23 = v17 + v22;
  if ((float)(v21 + v13) < v23)
    v23 = v21 + v13;
  v24 = v17;
  if (v21 >= v24)
    v24 = v9;
  v25 = fmaxf(v23 - v24, 0.0);
  v26 = v18 + v19;
  if ((float)(v20 + v15) < v26)
    v26 = v20 + v15;
  v27 = v18;
  if (v20 >= v27)
    v27 = v11;
  return (float)((float)(v25 * fmaxf(v26 - v27, 0.0)) / v16) > a4 && v16 <= (float)(self->_area * a5);
}

- (BOOL)isOverlappingLowMergeDet:(id)a3 withOverlapThreshold:(float)a4 withMergeCountDelta:(int)a5
{
  id v8;
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
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  double v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  int mergesCount;
  BOOL v34;

  v8 = a3;
  objc_msgSend(v8, "box");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[VNShotflowDetection box](self, "box");
  v20 = v12;
  v21 = v16;
  v22 = v20 + v21;
  v23 = v10;
  v24 = v14;
  v25 = v24 * v21;
  v27 = v17 + v26;
  if ((float)(v23 + v24) < v27)
    v27 = v23 + v24;
  v28 = v17;
  if (v23 >= v28)
    v28 = v10;
  v29 = fmaxf(v27 - v28, 0.0);
  v30 = v18 + v19;
  if (v22 < v30)
    v30 = v22;
  v31 = v18;
  if (v20 >= v31)
    v31 = v12;
  v32 = v29 * fmaxf(v30 - v31, 0.0);
  if ((float)(v32 / (float)((float)(v25 + self->_area) - v32)) <= a4)
  {
    v34 = 0;
  }
  else
  {
    mergesCount = self->_mergesCount;
    v34 = (int)(mergesCount - objc_msgSend(v8, "mergesCount")) > a5;
  }

  return v34;
}

- (id)description
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  uint64_t v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  void *v29;

  -[VNShotflowDetection box](self, "box");
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("[%g, %g, %g, %g]"), v3, v4, v5, v6);
  -[VNShotflowDetection defaultBox](self, "defaultBox");
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("[%g, %g, %g, %g]"), v8, v9, v10, v11);
  -[VNShotflowDetection boxCenter](self, "boxCenter");
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("(%g, %g)"), v13, v14);
  v16 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[VNShotflowDetection confidence](self, "confidence");
  v18 = v17;
  -[VNShotflowDetection rotationAngle](self, "rotationAngle");
  v20 = v19;
  -[VNShotflowDetection yawAngle](self, "yawAngle");
  v22 = v21;
  v23 = -[VNShotflowDetection label](self, "label");
  -[VNShotflowDetection petFaceScore](self, "petFaceScore");
  v25 = v24;
  -[VNShotflowDetection associatedX](self, "associatedX");
  v27 = v26;
  -[VNShotflowDetection associatedY](self, "associatedY");
  v29 = (void *)objc_msgSend(v16, "initWithFormat:", CFSTR("box = %@; default box = %@; confidence = %f; rotationAngle = %f; yawAngle = %f label = %d petFaceScore = %f matchingX = %f matchingY %f; boxCenter = %@"),
                  v7,
                  v12,
                  v18,
                  v20,
                  v22,
                  v23,
                  v25,
                  v27,
                  v28,
                  v15);

  return v29;
}

- (CGRect)box
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_box.origin.x;
  y = self->_box.origin.y;
  width = self->_box.size.width;
  height = self->_box.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setBox:(CGRect)a3
{
  self->_box = a3;
}

- (CGRect)defaultBox
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_defaultBox.origin.x;
  y = self->_defaultBox.origin.y;
  width = self->_defaultBox.size.width;
  height = self->_defaultBox.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setDefaultBox:(CGRect)a3
{
  self->_defaultBox = a3;
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(float)a3
{
  self->_confidence = a3;
}

- (int)mergesCount
{
  return self->_mergesCount;
}

- (void)setMergesCount:(int)a3
{
  self->_mergesCount = a3;
}

- (int)scale
{
  return self->_scale;
}

- (void)setScale:(int)a3
{
  self->_scale = a3;
}

- (float)rotationAngle
{
  return self->_rotationAngle;
}

- (void)setRotationAngle:(float)a3
{
  self->_rotationAngle = a3;
}

- (float)yawAngle
{
  return self->_yawAngle;
}

- (void)setYawAngle:(float)a3
{
  self->_yawAngle = a3;
}

- (float)pitchAngle
{
  return self->_pitchAngle;
}

- (void)setPitchAngle:(float)a3
{
  self->_pitchAngle = a3;
}

- (BOOL)hasLabel
{
  return self->_hasLabel;
}

- (void)setHasLabel:(BOOL)a3
{
  self->_hasLabel = a3;
}

- (int)label
{
  return self->_label;
}

- (void)setLabel:(int)a3
{
  self->_label = a3;
}

- (float)petFaceScore
{
  return self->_petFaceScore;
}

- (void)setPetFaceScore:(float)a3
{
  self->_petFaceScore = a3;
}

- (float)associatedX
{
  return self->_associatedX;
}

- (void)setAssociatedX:(float)a3
{
  self->_associatedX = a3;
}

- (float)associatedY
{
  return self->_associatedY;
}

- (void)setAssociatedY:(float)a3
{
  self->_associatedY = a3;
}

- (int)groupId
{
  return self->_groupId;
}

- (void)setGroupId:(int)a3
{
  self->_groupId = a3;
}

@end
