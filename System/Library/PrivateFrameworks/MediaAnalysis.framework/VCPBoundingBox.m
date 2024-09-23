@implementation VCPBoundingBox

- (VCPBoundingBox)initWithXYAndSize:(float)a3 y:(float)a4 width:(float)a5 height:(float)a6 confidence:(float)a7
{
  VCPBoundingBox *v12;
  double v13;
  VCPBoundingBox *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  VCPBoundingBox *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)VCPBoundingBox;
  v12 = -[VCPBoundingBox init](&v21, sel_init);
  v14 = v12;
  if (v12)
  {
    *(float *)&v13 = a3;
    -[VCPBoundingBox setMinX:](v12, "setMinX:", v13);
    *(float *)&v15 = a4;
    -[VCPBoundingBox setMinY:](v14, "setMinY:", v15);
    *(float *)&v16 = a3 + a5;
    -[VCPBoundingBox setMaxX:](v14, "setMaxX:", v16);
    *(float *)&v17 = a4 + a6;
    -[VCPBoundingBox setMaxY:](v14, "setMaxY:", v17);
    *(float *)&v18 = a7;
    -[VCPBoundingBox setConfidence:](v14, "setConfidence:", v18);
    -[VCPBoundingBox setTrackID:](v14, "setTrackID:", 0xFFFFFFFFLL);
    -[VCPBoundingBox setGroupID:](v14, "setGroupID:", 0xFFFFFFFFLL);
    v19 = v14;
  }

  return v14;
}

- (VCPBoundingBox)initWithCenterAndSize:(float)a3 y:(float)a4 width:(float)a5 height:(float)a6 confidence:(float)a7
{
  VCPBoundingBox *v12;
  VCPBoundingBox *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  VCPBoundingBox *v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)VCPBoundingBox;
  v12 = -[VCPBoundingBox init](&v25, sel_init);
  v13 = v12;
  if (v12)
  {
    v14 = a3;
    v15 = a5;
    v16 = v14 + v15 * -0.5;
    *(float *)&v16 = v16;
    -[VCPBoundingBox setMinX:](v12, "setMinX:", v16);
    v17 = a4;
    v18 = a6;
    v19 = v17 + v18 * -0.5;
    *(float *)&v19 = v19;
    -[VCPBoundingBox setMinY:](v13, "setMinY:", v19);
    v20 = v14 + v15 * 0.5;
    *(float *)&v20 = v20;
    -[VCPBoundingBox setMaxX:](v13, "setMaxX:", v20);
    v21 = v17 + v18 * 0.5;
    *(float *)&v21 = v21;
    -[VCPBoundingBox setMaxY:](v13, "setMaxY:", v21);
    *(float *)&v22 = a7;
    -[VCPBoundingBox setConfidence:](v13, "setConfidence:", v22);
    -[VCPBoundingBox setTrackID:](v13, "setTrackID:", 0xFFFFFFFFLL);
    -[VCPBoundingBox setGroupID:](v13, "setGroupID:", 0xFFFFFFFFLL);
    v23 = v13;
  }

  return v13;
}

- (float)area
{
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;

  -[VCPBoundingBox maxX](self, "maxX");
  v4 = v3;
  -[VCPBoundingBox minX](self, "minX");
  v6 = v4 - v5;
  -[VCPBoundingBox maxY](self, "maxY");
  v8 = v7;
  -[VCPBoundingBox minY](self, "minY");
  return v6 * (float)(v8 - v9);
}

- (id)intersect:(id)a3
{
  id v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  VCPBoundingBox *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  VCPBoundingBox *v25;

  v4 = a3;
  -[VCPBoundingBox minX](self, "minX");
  v6 = v5;
  objc_msgSend(v4, "minX");
  if (v6 < v7)
    v6 = v7;
  -[VCPBoundingBox minY](self, "minY");
  v9 = v8;
  objc_msgSend(v4, "minY");
  if (v9 < v10)
    v9 = v10;
  -[VCPBoundingBox maxX](self, "maxX");
  v12 = v11;
  objc_msgSend(v4, "maxX");
  if (v13 >= v12)
    v14 = v12;
  else
    v14 = v13;
  -[VCPBoundingBox maxY](self, "maxY");
  v16 = v15;
  objc_msgSend(v4, "maxY");
  if (v17 < v16)
    v16 = v17;
  if (v14 <= v6 || v16 <= v9)
  {
    v25 = 0;
  }
  else
  {
    v19 = [VCPBoundingBox alloc];
    *(float *)&v20 = v14 - v6;
    *(float *)&v21 = v16 - v9;
    LODWORD(v22) = 0;
    *(float *)&v23 = v6;
    *(float *)&v24 = v9;
    v25 = -[VCPBoundingBox initWithXYAndSize:y:width:height:confidence:](v19, "initWithXYAndSize:y:width:height:confidence:", v23, v24, v20, v21, v22);
  }

  return v25;
}

- (id)union:(id)a3
{
  id v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  VCPBoundingBox *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  VCPBoundingBox *v25;

  v4 = a3;
  -[VCPBoundingBox minX](self, "minX");
  v6 = v5;
  objc_msgSend(v4, "minX");
  if (v7 < v6)
    v6 = v7;
  -[VCPBoundingBox minY](self, "minY");
  v9 = v8;
  objc_msgSend(v4, "minY");
  if (v10 < v9)
    v9 = v10;
  -[VCPBoundingBox maxX](self, "maxX");
  v12 = v11;
  objc_msgSend(v4, "maxX");
  if (v12 >= v13)
    v14 = v12;
  else
    v14 = v13;
  -[VCPBoundingBox maxY](self, "maxY");
  v16 = v15;
  objc_msgSend(v4, "maxY");
  v18 = v17;
  v19 = [VCPBoundingBox alloc];
  if (v16 >= v18)
    *(float *)&v20 = v16;
  else
    *(float *)&v20 = v18;
  *(float *)&v22 = v14 - v6;
  *(float *)&v23 = *(float *)&v20 - v9;
  LODWORD(v24) = 0;
  *(float *)&v20 = v6;
  *(float *)&v21 = v9;
  v25 = -[VCPBoundingBox initWithXYAndSize:y:width:height:confidence:](v19, "initWithXYAndSize:y:width:height:confidence:", v20, v21, v22, v23, v24);

  return v25;
}

- (float)computeIntersectionOverUnion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;

  v4 = a3;
  -[VCPBoundingBox intersect:](self, "intersect:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPBoundingBox union:](self, "union:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0.0;
  v8 = 0.0;
  if (v5)
  {
    objc_msgSend(v5, "area");
    v8 = v9;
  }
  if (v6)
  {
    objc_msgSend(v6, "area");
    v7 = v10;
  }
  if (v7 == 0.0)
    v11 = 0.0;
  else
    v11 = v8 / v7;

  return v11;
}

- (CGRect)getCGRectWithClipWidth:(float)a3 height:(float)a4
{
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect result;

  -[VCPBoundingBox minX](self, "minX");
  if (v7 < a3)
    v8 = v7;
  else
    v8 = a3;
  if (v7 <= 0.0)
    v9 = 0.0;
  else
    v9 = v8;
  -[VCPBoundingBox minY](self, "minY");
  if (v10 < a4)
    v11 = v10;
  else
    v11 = a4;
  if (v10 <= 0.0)
    v12 = 0.0;
  else
    v12 = v11;
  -[VCPBoundingBox maxX](self, "maxX");
  if (v13 < a3)
    v14 = v13;
  else
    v14 = a3;
  if (v13 <= 0.0)
    v15 = 0.0;
  else
    v15 = v14;
  -[VCPBoundingBox maxY](self, "maxY");
  if (v16 < a4)
    v17 = v16;
  else
    v17 = a4;
  if (v16 <= 0.0)
    v18 = 0.0;
  else
    v18 = v17;
  v19 = (float)(v9 / a3);
  v20 = (float)(v12 / a4);
  v21 = (float)((float)(v15 - v9) / a3);
  v22 = (float)((float)(v18 - v12) / a4);
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (int)extendBoxBy:(float)a3 scaleX:(float)a4 scaleY:(float)a5
{
  int result;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
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
  double v26;
  double v27;
  double v28;

  result = -50;
  if (a4 > 0.0 && a5 > 0.0)
  {
    v9 = 1.0;
    if (a3 < 1.0)
      v9 = a3;
    if (a3 <= 0.0)
      v10 = 0.0;
    else
      v10 = v9;
    -[VCPBoundingBox maxX](self, "maxX");
    v12 = v11;
    -[VCPBoundingBox minX](self, "minX");
    v14 = (float)(v12 - v13) * 0.5;
    -[VCPBoundingBox maxY](self, "maxY");
    v16 = v15;
    -[VCPBoundingBox minY](self, "minY");
    v18 = (float)(v16 - v17) * 0.5;
    -[VCPBoundingBox minX](self, "minX");
    v20 = v14 + v19;
    -[VCPBoundingBox minY](self, "minY");
    v22 = *(float *)&v21 + v18;
    if (v14 >= v18)
      v23 = v14;
    else
      v23 = v18;
    v24 = v10 * v14;
    v25 = v10 * v18;
    *(float *)&v21 = (float)((float)(v20 - v23) - v24) / a4;
    if (*(float *)&v21 < 0.0)
      *(float *)&v21 = 0.0;
    -[VCPBoundingBox setMinX:](self, "setMinX:", v21);
    *(float *)&v26 = (float)(v24 + (float)(v20 + v23)) / a4;
    if (*(float *)&v26 > 1.0)
      *(float *)&v26 = 1.0;
    -[VCPBoundingBox setMaxX:](self, "setMaxX:", v26);
    *(float *)&v27 = (float)((float)(v22 - v23) - v25) / a5;
    if (*(float *)&v27 < 0.0)
      *(float *)&v27 = 0.0;
    -[VCPBoundingBox setMinY:](self, "setMinY:", v27);
    *(float *)&v28 = (float)(v25 + (float)(v22 + v23)) / a5;
    if (*(float *)&v28 > 1.0)
      *(float *)&v28 = 1.0;
    -[VCPBoundingBox setMaxY:](self, "setMaxY:", v28);
    return 0;
  }
  return result;
}

- (float)minX
{
  return self->_minX;
}

- (void)setMinX:(float)a3
{
  self->_minX = a3;
}

- (float)maxX
{
  return self->_maxX;
}

- (void)setMaxX:(float)a3
{
  self->_maxX = a3;
}

- (float)minY
{
  return self->_minY;
}

- (void)setMinY:(float)a3
{
  self->_minY = a3;
}

- (float)maxY
{
  return self->_maxY;
}

- (void)setMaxY:(float)a3
{
  self->_maxY = a3;
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(float)a3
{
  self->_confidence = a3;
}

- (float)flag
{
  return self->_flag;
}

- (void)setFlag:(float)a3
{
  self->_flag = a3;
}

- (int)classIndex
{
  return self->_classIndex;
}

- (void)setClassIndex:(int)a3
{
  self->_classIndex = a3;
}

- (int)trackID
{
  return self->_trackID;
}

- (void)setTrackID:(int)a3
{
  self->_trackID = a3;
}

- (int)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(int)a3
{
  self->_groupID = a3;
}

@end
