@implementation AXElementDetection

- (AXElementDetection)initWithBox:(CGRect)a3 defaultBox:(CGRect)a4 confidence:(float)a5 scale:(int)a6
{
  return -[AXElementDetection initWithBox:defaultBox:confidence:scale:mergesCount:](self, "initWithBox:defaultBox:confidence:scale:mergesCount:", *(_QWORD *)&a6, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (AXElementDetection)initWithBox:(CGRect)a3 defaultBox:(CGRect)a4 confidence:(float)a5 scale:(int)a6 mergesCount:(int)a7
{
  return -[AXElementDetection initWithBox:defaultBox:confidence:scale:mergesCount:hasLabel:label:](self, "initWithBox:defaultBox:confidence:scale:mergesCount:hasLabel:label:", *(_QWORD *)&a6, *(_QWORD *)&a7, 0, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (AXElementDetection)initWithBox:(CGRect)a3 defaultBox:(CGRect)a4 confidence:(float)a5 scale:(int)a6 hasLabel:(BOOL)a7 label:(int)a8
{
  return -[AXElementDetection initWithBox:defaultBox:confidence:scale:mergesCount:hasLabel:label:](self, "initWithBox:defaultBox:confidence:scale:mergesCount:hasLabel:label:", *(_QWORD *)&a6, 1, a7, *(_QWORD *)&a8, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (AXElementDetection)initWithBox:(CGRect)a3 defaultBox:(CGRect)a4 confidence:(float)a5 scale:(int)a6 hasLabel:(BOOL)a7 label:(int)a8 labelName:(id)a9
{
  return -[AXElementDetection initWithBox:defaultBox:confidence:scale:mergesCount:hasLabel:label:labelName:](self, "initWithBox:defaultBox:confidence:scale:mergesCount:hasLabel:label:labelName:", *(_QWORD *)&a6, 1, a7, *(_QWORD *)&a8, a9, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (AXElementDetection)initWithBox:(CGRect)a3 defaultBox:(CGRect)a4 confidence:(float)a5 scale:(int)a6 mergesCount:(int)a7 hasLabel:(BOOL)a8 label:(int)a9
{
  return -[AXElementDetection initWithBox:defaultBox:confidence:scale:mergesCount:hasLabel:label:labelName:](self, "initWithBox:defaultBox:confidence:scale:mergesCount:hasLabel:label:labelName:", *(_QWORD *)&a6, *(_QWORD *)&a7, a8, *(_QWORD *)&a9, &stru_1E6260C18, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (AXElementDetection)initWithBox:(CGRect)a3 defaultBox:(CGRect)a4 confidence:(float)a5 scale:(int)a6 mergesCount:(int)a7 hasLabel:(BOOL)a8 label:(int)a9 labelName:(id)a10
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  id v24;
  AXElementDetection *v25;
  AXElementDetection *v26;
  float v27;
  objc_super v29;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v19 = a3.size.height;
  v20 = a3.size.width;
  v21 = a3.origin.y;
  v22 = a3.origin.x;
  v24 = a10;
  v29.receiver = self;
  v29.super_class = (Class)AXElementDetection;
  v25 = -[AXElementDetection init](&v29, sel_init);
  v26 = v25;
  if (v25)
  {
    v25->_box.origin.x = v22;
    v25->_box.origin.y = v21;
    v25->_box.size.width = v20;
    v25->_box.size.height = v19;
    v25->_defaultBox.origin.x = x;
    v25->_defaultBox.origin.y = y;
    v25->_defaultBox.size.width = width;
    v25->_defaultBox.size.height = height;
    v25->_confidence = a5;
    v25->_mergesCount = a7;
    v25->_scale = a6;
    v27 = v20 * v19;
    v25->_area = v27;
    v25->_hasLabel = a8;
    v25->_label = a9;
    objc_storeStrong((id *)&v25->_labelName, a10);
  }

  return v26;
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

  -[AXElementDetection box](self, "box");
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

  -[AXElementDetection boxCenter](self, "boxCenter");
  v4 = v3;
  v6 = v5;
  -[AXElementDetection defaultBox](self, "defaultBox");
  *(float *)&v8 = v8 + v7 * 0.5;
  *(float *)&v10 = v10 + v9 * 0.5;
  return sqrt((v4 - *(float *)&v8) / v7 * ((v4 - *(float *)&v8) / v7)+ (v6 - *(float *)&v10) / v9 * ((v6 - *(float *)&v10) / v9));
}

- (float)smartDistance
{
  float v3;
  float v4;
  float v5;

  -[AXElementDetection distanceToDefaultBox](self, "distanceToDefaultBox");
  v4 = v3;
  -[AXElementDetection confidence](self, "confidence");
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
  double v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;

  objc_msgSend(a3, "box");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[AXElementDetection box](self, "box");
  v15 = v7;
  v16 = v11;
  v17 = v5;
  v18 = v9;
  v20 = v12 + v19;
  if ((float)(v17 + v18) < v20)
    v20 = v17 + v18;
  v21 = v12;
  if (v17 > v21)
    v21 = v5;
  v22 = v20 - v21;
  if (v22 < 0.0)
    v22 = 0.0;
  v23 = v13 + v14;
  if ((float)(v15 + v16) < v23)
    v23 = v15 + v16;
  v24 = v13;
  if (v15 > v24)
    v24 = v7;
  v25 = v23 - v24;
  if (v25 < 0.0)
    v25 = 0.0;
  return (float)(v22 * v25) / (float)((float)((float)(v18 * v16) + self->_area) - (float)(v22 * v25));
}

- (float)iOa:(id)a3
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
  double v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;

  objc_msgSend(a3, "box");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[AXElementDetection box](self, "box");
  v15 = v7;
  v16 = v11;
  v17 = v5;
  v18 = v9;
  v20 = v12 + v19;
  if ((float)(v17 + v18) < v20)
    v20 = v17 + v18;
  v21 = v12;
  if (v17 > v21)
    v21 = v5;
  v22 = v20 - v21;
  if (v22 < 0.0)
    v22 = 0.0;
  v23 = v13 + v14;
  if ((float)(v15 + v16) < v23)
    v23 = v15 + v16;
  v24 = v13;
  if (v15 > v24)
    v24 = v7;
  v25 = v23 - v24;
  if (v25 < 0.0)
    v25 = 0.0;
  return (float)(v22 * v25) / (float)(v18 * v16);
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
  float v28;

  objc_msgSend(a3, "box");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = v13 * v15;
  -[AXElementDetection box](self, "box");
  v20 = v11;
  v21 = v9;
  v23 = v17 + v22;
  if ((float)(v21 + v13) < v23)
    v23 = v21 + v13;
  v24 = v17;
  if (v21 > v24)
    v24 = v9;
  v25 = v23 - v24;
  if (v25 < 0.0)
    v25 = 0.0;
  v26 = v18 + v19;
  if ((float)(v20 + v15) < v26)
    v26 = v20 + v15;
  v27 = v18;
  if (v20 > v27)
    v27 = v11;
  v28 = v26 - v27;
  if (v28 < 0.0)
    v28 = 0.0;
  return (float)((float)(v25 * v28) / v16) > a4 && v16 <= (float)(self->_area * a5);
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
  -[AXElementDetection box](self, "box");
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
  if (v23 > v28)
    v28 = v10;
  v29 = v27 - v28;
  if (v29 < 0.0)
    v29 = 0.0;
  v30 = v18 + v19;
  if (v22 < v30)
    v30 = v22;
  v31 = v18;
  if (v20 > v31)
    v31 = v12;
  v32 = v30 - v31;
  if (v32 < 0.0)
    v32 = 0.0;
  if ((float)((float)(v29 * v32) / (float)((float)(v25 + self->_area) - (float)(v29 * v32))) <= a4)
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
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  objc_super v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v14.receiver = self;
  v14.super_class = (Class)AXElementDetection;
  -[AXElementDetection description](&v14, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3B18];
  -[AXElementDetection box](self, "box");
  v13[0] = v6;
  v13[1] = v7;
  v13[2] = v8;
  v13[3] = v9;
  objc_msgSend(v5, "valueWithBytes:objCType:", v13, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@"), v4, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
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

- (NSString)labelName
{
  return self->_labelName;
}

- (void)setLabelName:(id)a3
{
  objc_storeStrong((id *)&self->_labelName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelName, 0);
}

@end
