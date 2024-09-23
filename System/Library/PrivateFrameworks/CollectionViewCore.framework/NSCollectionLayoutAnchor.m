@implementation NSCollectionLayoutAnchor

+ (NSCollectionLayoutAnchor)layoutAnchorWithEdges:(NSDirectionalRectEdge)edges
{
  int8x16_t v4;
  id v11;
  int8x16_t v13;

  v4 = (int8x16_t)vdupq_n_s64(edges);
  __asm
  {
    FMOV            V3.2D, #0.5
    FMOV            V4.2D, #1.0
  }
  v13 = vbslq_s8((int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v4, (int8x16_t)xmmword_1DD786640)), vbslq_s8((int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v4, (int8x16_t)xmmword_1DD786650)), _Q3, _Q4), vandq_s8(_Q3, (int8x16_t)vceqq_s64((int64x2_t)vandq_s8(v4, (int8x16_t)xmmword_1DD786660), (int64x2_t)xmmword_1DD786660)));
  v11 = objc_alloc((Class)a1);
  return (NSCollectionLayoutAnchor *)(id)objc_msgSend(v11, "initWithEdges:offset:anchorPoint:offsetIsUnitOffset:", edges, 0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), *(_OWORD *)&v13);
}

+ (NSCollectionLayoutAnchor)layoutAnchorWithEdges:(NSDirectionalRectEdge)edges absoluteOffset:(CGPoint)absoluteOffset
{
  double x;
  int8x16_t v5;

  x = absoluteOffset.x;
  v5 = (int8x16_t)vdupq_n_s64(edges);
  __asm
  {
    FMOV            V3.2D, #0.5
    FMOV            V4.2D, #1.0
  }
  return (NSCollectionLayoutAnchor *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithEdges:offset:anchorPoint:offsetIsUnitOffset:", edges, 0, x, absoluteOffset.y, vbslq_s8((int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v5, (int8x16_t)xmmword_1DD786640)), vbslq_s8((int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v5, (int8x16_t)xmmword_1DD786650)), _Q3, _Q4), vandq_s8(_Q3, (int8x16_t)vceqq_s64((int64x2_t)vandq_s8(v5, (int8x16_t)xmmword_1DD786660), (int64x2_t)xmmword_1DD786660))));
}

- (NSCollectionLayoutAnchor)initWithEdges:(unint64_t)a3 offset:(CGPoint)a4 anchorPoint:(CGPoint)a5 offsetIsUnitOffset:(BOOL)a6
{
  CGFloat y;
  CGFloat x;
  CGFloat v9;
  CGFloat v10;
  NSCollectionLayoutAnchor *result;
  objc_super v13;

  y = a5.y;
  x = a5.x;
  v9 = a4.y;
  v10 = a4.x;
  v13.receiver = self;
  v13.super_class = (Class)NSCollectionLayoutAnchor;
  result = -[NSCollectionLayoutAnchor init](&v13, sel_init);
  if (result)
  {
    result->_edges = a3;
    result->_offset.x = v10;
    result->_offset.y = v9;
    result->_anchorPoint.x = x;
    result->_anchorPoint.y = y;
    result->_offsetIsUnitOffset = a6;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  NSCollectionLayoutAnchor *v4;
  NSDirectionalRectEdge v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _BOOL4 v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  _BOOL4 v19;

  v4 = (NSCollectionLayoutAnchor *)a3;
  if (self == v4)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v5 = -[NSCollectionLayoutAnchor edges](self, "edges"), v5 == -[NSCollectionLayoutAnchor edges](v4, "edges")))
    {
      -[NSCollectionLayoutAnchor anchorPoint](self, "anchorPoint");
      v7 = v6;
      v9 = v8;
      -[NSCollectionLayoutAnchor anchorPoint](v4, "anchorPoint");
      LOBYTE(v11) = 0;
      if (v7 == v12 && v9 == v10)
      {
        -[NSCollectionLayoutAnchor offset](self, "offset");
        v14 = v13;
        v16 = v15;
        -[NSCollectionLayoutAnchor offset](v4, "offset");
        LOBYTE(v11) = 0;
        if (v14 == v18 && v16 == v17)
        {
          v19 = -[NSCollectionLayoutAnchor offsetIsUnitOffset](self, "offsetIsUnitOffset");
          v11 = v19 ^ -[NSCollectionLayoutAnchor offsetIsUnitOffset](v4, "offsetIsUnitOffset") ^ 1;
        }
      }
    }
    else
    {
      LOBYTE(v11) = 0;
    }
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  NSDirectionalRectEdge v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = -[NSCollectionLayoutAnchor edges](self, "edges");
  -[NSCollectionLayoutAnchor offset](self, "offset");
  v7 = v6;
  v9 = v8;
  -[NSCollectionLayoutAnchor anchorPoint](self, "anchorPoint");
  return (id)objc_msgSend(v4, "initWithEdges:offset:anchorPoint:offsetIsUnitOffset:", v5, -[NSCollectionLayoutAnchor offsetIsUnitOffset](self, "offsetIsUnitOffset"), v7, v9, v10, v11);
}

- (CGRect)_itemFrameForContainerRect:(CGRect)a3 itemSize:(CGSize)a4 itemLayoutAnchor:(id)a5
{
  double height;
  double width;
  CGFloat v7;
  CGFloat v8;
  CGFloat y;
  CGFloat x;
  NSCollectionLayoutAnchor *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  NSCollectionLayoutAnchor *v17;
  NSCollectionLayoutAnchor *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  _BOOL4 v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGFloat v35;
  double v36;
  double v37;
  _BOOL4 v39;
  double v40;
  double v41;
  double v42;
  double v43;
  CGFloat v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect result;

  height = a4.height;
  width = a4.width;
  v7 = a3.size.height;
  v8 = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = (NSCollectionLayoutAnchor *)a5;
  -[NSCollectionLayoutAnchor anchorPoint](self, "anchorPoint");
  v14 = _CVCRectAnchorPointForUnitAnchorPoint(x, y, v8, v7, v13) - width * 0.5;
  v16 = v15 - height * 0.5;
  if (v12)
    v17 = v12;
  else
    v17 = self;
  v18 = v17;
  -[NSCollectionLayoutAnchor anchorPoint](v18, "anchorPoint");
  v20 = _CVCRectAdjustWithAnchorPoint(v14, v16, width, height, v19);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v27 = -[NSCollectionLayoutAnchor offsetIsUnitOffset](self, "offsetIsUnitOffset");
  -[NSCollectionLayoutAnchor offset](self, "offset");
  v29 = v28;
  v31 = v30;
  if (v27)
  {
    v53.origin.x = v20;
    v53.origin.y = v22;
    v53.size.width = v24;
    v53.size.height = v26;
    v29 = v29 * CGRectGetWidth(v53);
    v54.origin.x = v20;
    v54.origin.y = v22;
    v54.size.width = v24;
    v54.size.height = v26;
    v31 = v31 * CGRectGetHeight(v54);
  }
  v32 = *MEMORY[0x1E0C9D538];
  v33 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  if (*MEMORY[0x1E0C9D538] != v29 || v33 != v31)
  {
    v52 = v20 + v29;
    v55.origin.x = v20;
    v55.origin.y = v22;
    v55.size.width = v24;
    v55.size.height = v26;
    v35 = CGRectGetWidth(v55);
    v56.origin.x = v20;
    v56.origin.y = v22;
    v56.size.width = v24;
    v56.size.height = v26;
    v26 = CGRectGetHeight(v56);
    v24 = v35;
    v22 = v22 + v31;
    v20 = v52;
  }
  if (v12)
  {
    -[NSCollectionLayoutAnchor offset](v12, "offset");
    if (v32 != v37 || v33 != v36)
    {
      v39 = -[NSCollectionLayoutAnchor offsetIsUnitOffset](v12, "offsetIsUnitOffset");
      -[NSCollectionLayoutAnchor offset](v12, "offset");
      v41 = v40;
      v43 = v42;
      if (v39)
      {
        v57.origin.x = v20;
        v57.origin.y = v22;
        v57.size.width = v24;
        v57.size.height = v26;
        v41 = v41 * CGRectGetWidth(v57);
        v58.origin.x = v20;
        v58.origin.y = v22;
        v58.size.width = v24;
        v58.size.height = v26;
        v43 = v43 * CGRectGetHeight(v58);
      }
      v44 = v20;
      v45 = v22;
      v46 = v41;
      v47 = v24;
      v20 = v20 + v46;
      v22 = v22 + v43;
      v59.origin.x = v44;
      v59.origin.y = v45;
      v59.size.width = v24;
      v59.size.height = v26;
      v24 = CGRectGetWidth(v59);
      v60.origin.x = v44;
      v60.origin.y = v45;
      v60.size.width = v47;
      v60.size.height = v26;
      v26 = CGRectGetHeight(v60);
    }
  }

  v48 = v20;
  v49 = v22;
  v50 = v24;
  v51 = v26;
  result.size.height = v51;
  result.size.width = v50;
  result.origin.y = v49;
  result.origin.x = v48;
  return result;
}

- (CGPoint)anchorPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_anchorPoint.x;
  y = self->_anchorPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)offset
{
  double x;
  double y;
  CGPoint result;

  x = self->_offset.x;
  y = self->_offset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (BOOL)offsetIsUnitOffset
{
  return self->_offsetIsUnitOffset;
}

- (NSDirectionalRectEdge)edges
{
  return self->_edges;
}

+ (NSCollectionLayoutAnchor)layoutAnchorWithAnchorPoint:(CGPoint)a3
{
  double y;
  double x;
  id v5;

  y = a3.y;
  x = a3.x;
  v5 = objc_alloc((Class)a1);
  return (NSCollectionLayoutAnchor *)(id)objc_msgSend(v5, "initWithEdges:offset:anchorPoint:offsetIsUnitOffset:", 0, 0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), x, y);
}

+ (NSCollectionLayoutAnchor)layoutAnchorWithEdges:(NSDirectionalRectEdge)edges fractionalOffset:(CGPoint)fractionalOffset
{
  double x;
  int8x16_t v5;

  x = fractionalOffset.x;
  v5 = (int8x16_t)vdupq_n_s64(edges);
  __asm
  {
    FMOV            V3.2D, #0.5
    FMOV            V4.2D, #1.0
  }
  return (NSCollectionLayoutAnchor *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithEdges:offset:anchorPoint:offsetIsUnitOffset:", edges, 1, x, fractionalOffset.y, vbslq_s8((int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v5, (int8x16_t)xmmword_1DD786640)), vbslq_s8((int8x16_t)vceqzq_s64((int64x2_t)vandq_s8(v5, (int8x16_t)xmmword_1DD786650)), _Q3, _Q4), vandq_s8(_Q3, (int8x16_t)vceqq_s64((int64x2_t)vandq_s8(v5, (int8x16_t)xmmword_1DD786660), (int64x2_t)xmmword_1DD786660))));
}

+ (NSCollectionLayoutAnchor)layoutAnchorWithAnchorPoint:(CGPoint)a3 offset:(CGPoint)a4
{
  return (NSCollectionLayoutAnchor *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithEdges:offset:anchorPoint:offsetIsUnitOffset:", 0, 0, a4.x, a4.y, a3.x, a3.y);
}

+ (NSCollectionLayoutAnchor)layoutAnchorWithAnchorPoint:(CGPoint)a3 unitOffset:(CGPoint)a4
{
  return (NSCollectionLayoutAnchor *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithEdges:offset:anchorPoint:offsetIsUnitOffset:", 0, 1, a4.x, a4.y, a3.x, a3.y);
}

- (BOOL)isAbsoluteOffset
{
  return !-[NSCollectionLayoutAnchor offsetIsUnitOffset](self, "offsetIsUnitOffset");
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  __CFString *v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSCollectionLayoutAnchor edges](self, "edges"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCollectionLayoutAnchor offset](self, "offset");
  v9 = (__CFString *)CFStringCreateWithFormat(0, 0, CFSTR("{%.*g, %.*g}"), 17, v7, 17, v8);
  -[NSCollectionLayoutAnchor anchorPoint](self, "anchorPoint");
  v12 = (__CFString *)CFStringCreateWithFormat(0, 0, CFSTR("{%.*g, %.*g}"), 17, v10, 17, v11);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p: edges=%@; offset=%@; anchorPoint=%@>"), v5, self, v6, v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)setEdges:(unint64_t)a3
{
  self->_edges = a3;
}

- (void)setOffset:(CGPoint)a3
{
  self->_offset = a3;
}

- (void)setAnchorPoint:(CGPoint)a3
{
  self->_anchorPoint = a3;
}

- (void)setOffsetIsUnitOffset:(BOOL)a3
{
  self->_offsetIsUnitOffset = a3;
}

@end
