@implementation CHPolygon

- (CHPolygon)initWithVertices:(CGPoint *)a3 vertexCount:(int64_t)a4
{
  CHPolygon *v6;
  CHPolygon *v7;
  CGPath *Mutable;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CHPolygon;
  v6 = -[CHPolygon init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_vertexCount = a4;
    v6->_vertices = a3;
    Mutable = CGPathCreateMutable();
    v7->_path = Mutable;
    CGPathAddLines(Mutable, 0, a3, a4);
    CGPathCloseSubpath(v7->_path);
  }
  return v7;
}

- (CHPolygon)initWithRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat *v8;
  CGFloat MinX;
  CGFloat MinY;
  CGFloat v11;
  CGFloat MaxY;
  CGFloat MaxX;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (CGFloat *)malloc_type_calloc(4uLL, 0x10uLL, 0x1000040451B5BE8uLL);
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  MinX = CGRectGetMinX(v21);
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  MinY = CGRectGetMinY(v22);
  *v8 = MinX;
  v8[1] = MinY;
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  v11 = CGRectGetMinX(v23);
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  MaxY = CGRectGetMaxY(v24);
  v8[2] = v11;
  v8[3] = MaxY;
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  MaxX = CGRectGetMaxX(v25);
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  v14 = CGRectGetMaxY(v26);
  v8[4] = MaxX;
  v8[5] = v14;
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  v15 = CGRectGetMaxX(v27);
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  v16 = CGRectGetMinY(v28);
  v8[6] = v15;
  v8[7] = v16;
  return (CHPolygon *)objc_msgSend_initWithVertices_vertexCount_(self, v17, (uint64_t)v8, 4, v18, v19);
}

- (void)dealloc
{
  CGPoint *vertices;
  CGPath *path;
  objc_super v5;

  vertices = self->_vertices;
  if (vertices)
  {
    free(vertices);
    self->_vertices = 0;
  }
  path = self->_path;
  if (path)
  {
    CGPathRelease(path);
    self->_path = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)CHPolygon;
  -[CHPolygon dealloc](&v5, sel_dealloc);
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  int64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  objc_msgSend_string(MEMORY[0x1E0CB37A0], a2, v2, v3, v4, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_vertexCount >= 1)
  {
    v12 = 0;
    v13 = 0;
    do
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v7, (uint64_t)CFSTR("{%f, %f}"), v8, v9, v10, *(_QWORD *)&self->_vertices[v12].x, *(_QWORD *)&self->_vertices[v12].y);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v15, (uint64_t)CFSTR("%@, "), v16, v17, v18, v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_appendString_(v11, v20, (uint64_t)v19, v21, v22, v23);

      ++v13;
      ++v12;
    }
    while (v13 < self->_vertexCount);
  }
  return v11;
}

- (double)area
{
  int64_t vertexCount;
  CGPoint *vertices;
  int64_t v4;
  unint64_t v5;
  float64x2_t v6;
  uint64_t v8;
  float64x2_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  float64_t *p_y;
  unint64_t v14;
  unint64_t v15;
  float64x2_t v16;
  float64_t *p_x;
  float64x2_t v18;

  vertexCount = self->_vertexCount;
  if (vertexCount < 1)
    return fabs(0.0) * 0.5;
  vertices = self->_vertices;
  v4 = vertexCount - 1;
  if (vertexCount == 1)
  {
    v5 = 0;
    v6 = 0uLL;
  }
  else
  {
    v8 = 0;
    v5 = vertexCount & 0xFFFFFFFFFFFFFFFELL;
    v9 = (float64x2_t *)&vertices[1];
    v6 = 0uLL;
    do
    {
      if (v4 == v8)
        v10 = 0;
      else
        v10 = v8 + 1;
      v11 = v8 + 2;
      if (vertexCount - 2 == v8)
        v12 = 0;
      else
        v12 = v8 + 2;
      v6 = vaddq_f64(vaddq_f64(v6, vmulq_f64((float64x2_t)vextq_s8((int8x16_t)vertices[v10], (int8x16_t)vertices[v10], 8uLL), v9[-1])), vmulq_f64((float64x2_t)vextq_s8((int8x16_t)vertices[v12], (int8x16_t)vertices[v12], 8uLL), *v9));
      v9 += 2;
      v8 = v11;
    }
    while (v5 != v11);
    if (vertexCount == v5)
      return fabs(vsubq_f64(v6, (float64x2_t)vdupq_laneq_s64((int64x2_t)v6, 1)).f64[0]) * 0.5;
  }
  p_y = &vertices[v5].y;
  do
  {
    if (v4 == v5)
      v14 = 0;
    else
      v14 = v5 + 1;
    v15 = v5 + 1;
    v16.f64[0] = *(p_y - 1);
    p_x = &vertices[v14].x;
    v18.f64[0] = p_x[1];
    v16.f64[1] = *p_x;
    v18.f64[1] = *p_y;
    v6 = vmlaq_f64(v6, v18, v16);
    p_y += 2;
    v5 = v15;
  }
  while (vertexCount != v15);
  return fabs(vsubq_f64(v6, (float64x2_t)vdupq_laneq_s64((int64x2_t)v6, 1)).f64[0]) * 0.5;
}

- (id)polygonDrawing
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CHDrawing *v8;
  uint64_t v9;
  int64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v8 = objc_alloc_init(CHDrawing);
  if (self->_vertexCount >= 1)
  {
    v9 = 0;
    v10 = 0;
    do
    {
      objc_msgSend_addPoint_(v8, v3, v4, v5, v6, v7, self->_vertices[v9].x, self->_vertices[v9].y);
      ++v10;
      ++v9;
    }
    while (v10 < self->_vertexCount);
  }
  objc_msgSend_addPoint_(v8, v3, v4, v5, v6, v7, self->_vertices->x, self->_vertices->y);
  objc_msgSend_endStroke(v8, v11, v12, v13, v14, v15);
  return v8;
}

- (BOOL)containsPoint:(CGPoint)a3
{
  return CGPathContainsPoint(self->_path, 0, a3, 0);
}

- (id)polygonByIntersectingWithClipPolygon:(id)a3
{
  CHPolygon *v4;
  id v5;
  CHPolygon *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  CHPolygon *v19;

  v4 = self;
  v5 = a3;
  objc_opt_self();
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_1BE7DF2AC;
  v18 = sub_1BE7DF2BC;
  v6 = v4;
  v19 = v6;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1BE7DF2C4;
  v13[3] = &unk_1E77F54E8;
  v13[4] = &v14;
  objc_msgSend_enumerateEdgesWithBlock_(v5, v7, (uint64_t)v13, v8, v9, v10);
  v11 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v11;
}

- (int64_t)edgeCountIntersectingLineSegment:(CHLineSegment)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  _QWORD v8[5];
  CHLineSegment v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1BE7DEEC8;
  v8[3] = &unk_1E77F54C0;
  v9 = a3;
  v8[4] = &v10;
  objc_msgSend_enumerateEdgesWithBlock_(self, a2, (uint64_t)v8, v3, v4, v5);
  v6 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v6;
}

- (void)enumerateEdgesWithBlock:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (**v9)(id, uint64_t, _BYTE *, double, double, double, double);
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double *v31;
  double v32;
  double v33;
  char v34;

  v9 = (void (**)(id, uint64_t, _BYTE *, double, double, double, double))a3;
  v10 = 0;
  v11 = 0;
  do
  {
    if (v11 >= objc_msgSend_vertexCount(self, v4, v5, v6, v7, v8))
      break;
    v17 = objc_msgSend_vertexCount(self, v12, v13, v14, v15, v16);
    v23 = objc_msgSend_vertices(self, v18, v19, v20, v21, v22);
    v24 = *(double *)(v23 + v10);
    v25 = *(double *)(v23 + v10 + 8);
    v31 = (double *)(objc_msgSend_vertices(self, v26, v27, v28, v29, v30) + 16 * ((v11 + 1) % v17));
    v32 = *v31;
    v33 = v31[1];
    v34 = 0;
    v9[2](v9, v11, &v34, v24, v25, v32, v33);
    v10 += 16;
    ++v11;
  }
  while (!v34);

}

- (void)setArea:(double)a3
{
  self->_area = a3;
}

- (int64_t)vertexCount
{
  return self->_vertexCount;
}

- (CGPoint)vertices
{
  return self->_vertices;
}

@end
