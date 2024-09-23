@implementation CIBurstFaceInfo

- (CIBurstFaceInfo)init
{
  CIBurstFaceInfo *v2;
  CIBurstFaceInfo *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CIBurstFaceInfo;
  v2 = -[CIBurstFaceInfo init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CIBurstFaceInfo setSwFaceId:](v2, "setSwFaceId:", 0xFFFFFFFFLL);
    v4 = *MEMORY[0x1E0C9D538];
    v5 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    -[CIBurstFaceInfo setSwCenter:](v3, "setSwCenter:", *MEMORY[0x1E0C9D538], v5);
    v6 = *MEMORY[0x1E0C9D820];
    v7 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    -[CIBurstFaceInfo setSwSize:](v3, "setSwSize:", *MEMORY[0x1E0C9D820], v7);
    -[CIBurstFaceInfo setSwLastFrameSeen:](v3, "setSwLastFrameSeen:", 0xFFFFFFFFLL);
    -[CIBurstFaceInfo setHwFaceId:](v3, "setHwFaceId:", 0xFFFFFFFFLL);
    -[CIBurstFaceInfo setHwCenter:](v3, "setHwCenter:", v4, v5);
    -[CIBurstFaceInfo setHwSize:](v3, "setHwSize:", v6, v7);
    -[CIBurstFaceInfo setHwLastFrameSeen:](v3, "setHwLastFrameSeen:", 0xFFFFFFFFLL);
  }
  return v3;
}

- (CGRect)hwFaceRect
{
  double v3;
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
  double v16;
  double v17;
  CGRect result;

  -[CIBurstFaceInfo hwCenter](self, "hwCenter");
  v4 = v3;
  -[CIBurstFaceInfo hwSize](self, "hwSize");
  v6 = v4 - v5 * 0.5;
  -[CIBurstFaceInfo hwCenter](self, "hwCenter");
  v8 = v7;
  -[CIBurstFaceInfo hwSize](self, "hwSize");
  v10 = v8 - v9 * 0.5;
  -[CIBurstFaceInfo hwSize](self, "hwSize");
  v12 = v11;
  -[CIBurstFaceInfo hwSize](self, "hwSize");
  v14 = v13;
  v15 = v6;
  v16 = v10;
  v17 = v12;
  result.size.height = v14;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)swFaceRect
{
  double v3;
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
  double v16;
  double v17;
  CGRect result;

  -[CIBurstFaceInfo swCenter](self, "swCenter");
  v4 = v3;
  -[CIBurstFaceInfo swSize](self, "swSize");
  v6 = v4 - v5 * 0.5;
  -[CIBurstFaceInfo swCenter](self, "swCenter");
  v8 = v7;
  -[CIBurstFaceInfo swSize](self, "swSize");
  v10 = v8 - v9 * 0.5;
  -[CIBurstFaceInfo swSize](self, "swSize");
  v12 = v11;
  -[CIBurstFaceInfo swSize](self, "swSize");
  v14 = v13;
  v15 = v6;
  v16 = v10;
  v17 = v12;
  result.size.height = v14;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (float)overlapWithHwRect:(CGRect)a3
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  float result;
  CGRect v11;
  CGRect v12;
  CGRect v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[CIBurstFaceInfo hwFaceId](self, "hwFaceId") == -1)
    return 0.0;
  -[CIBurstFaceInfo hwFaceRect](self, "hwFaceRect");
  v8 = v11.size.width;
  v9 = v11.size.height;
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  v12 = CGRectIntersection(v11, v13);
  *(float *)&v12.origin.y = v12.size.width * v12.size.height / (width * height);
  result = v12.size.width * v12.size.height / (v8 * v9);
  if (*(float *)&v12.origin.y > result)
    return v12.size.width * v12.size.height / (width * height);
  return result;
}

- (float)overlapWithSwRect:(CGRect)a3
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  float result;
  CGRect v11;
  CGRect v12;
  CGRect v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[CIBurstFaceInfo swFaceId](self, "swFaceId") == -1)
    return 0.0;
  -[CIBurstFaceInfo swFaceRect](self, "swFaceRect");
  v8 = v11.size.width;
  v9 = v11.size.height;
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  v12 = CGRectIntersection(v11, v13);
  *(float *)&v12.origin.y = v12.size.width * v12.size.height / (width * height);
  result = v12.size.width * v12.size.height / (v8 * v9);
  if (*(float *)&v12.origin.y > result)
    return v12.size.width * v12.size.height / (width * height);
  return result;
}

- (int)swFaceId
{
  return self->swFaceId;
}

- (void)setSwFaceId:(int)a3
{
  self->swFaceId = a3;
}

- (CGPoint)swCenter
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->swCenter, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setSwCenter:(CGPoint)a3
{
  CGPoint v3;

  v3 = a3;
  objc_copyStruct(&self->swCenter, &v3, 16, 1, 0);
}

- (CGSize)swSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->swSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setSwSize:(CGSize)a3
{
  CGSize v3;

  v3 = a3;
  objc_copyStruct(&self->swSize, &v3, 16, 1, 0);
}

- (int)swLastFrameSeen
{
  return self->swLastFrameSeen;
}

- (void)setSwLastFrameSeen:(int)a3
{
  self->swLastFrameSeen = a3;
}

- (int)hwFaceId
{
  return self->hwFaceId;
}

- (void)setHwFaceId:(int)a3
{
  self->hwFaceId = a3;
}

- (CGPoint)hwCenter
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->hwCenter, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setHwCenter:(CGPoint)a3
{
  CGPoint v3;

  v3 = a3;
  objc_copyStruct(&self->hwCenter, &v3, 16, 1, 0);
}

- (CGSize)hwSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->hwSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setHwSize:(CGSize)a3
{
  CGSize v3;

  v3 = a3;
  objc_copyStruct(&self->hwSize, &v3, 16, 1, 0);
}

- (int)hwLastFrameSeen
{
  return self->hwLastFrameSeen;
}

- (void)setHwLastFrameSeen:(int)a3
{
  self->hwLastFrameSeen = a3;
}

@end
