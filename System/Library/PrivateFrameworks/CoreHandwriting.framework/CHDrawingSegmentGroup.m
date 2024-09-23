@implementation CHDrawingSegmentGroup

- (CHDrawingSegmentGroup)initWithSegmentGroupIndex:(int64_t)a3 segments:(id)a4
{
  id v7;
  CHDrawingSegmentGroup *v8;
  CHDrawingSegmentGroup *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CHDrawingSegmentGroup;
  v8 = -[CHDrawingSegmentGroup init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_segmentGroupIndex = a3;
    objc_storeStrong((id *)&v8->_segments, a4);
  }

  return v9;
}

- (CGRect)bounds
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGRect v35;
  CGRect v36;
  CGRect result;
  CGRect v38;

  x = *MEMORY[0x1E0C9D628];
  y = *(double *)(MEMORY[0x1E0C9D628] + 8);
  width = *(double *)(MEMORY[0x1E0C9D628] + 16);
  height = *(double *)(MEMORY[0x1E0C9D628] + 24);
  if (objc_msgSend_count(self->_segments, a2, v2, v3, v4, v5))
  {
    v15 = 0;
    do
    {
      objc_msgSend_objectAtIndexedSubscript_(self->_segments, v11, v15, v12, v13, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_segmentBounds(v16, v17, v18, v19, v20, v21);
      v38.origin.x = v22;
      v38.origin.y = v23;
      v38.size.width = v24;
      v38.size.height = v25;
      v35.origin.x = x;
      v35.origin.y = y;
      v35.size.width = width;
      v35.size.height = height;
      v36 = CGRectUnion(v35, v38);
      x = v36.origin.x;
      y = v36.origin.y;
      width = v36.size.width;
      height = v36.size.height;

      ++v15;
    }
    while (v15 < objc_msgSend_count(self->_segments, v26, v27, v28, v29, v30));
  }
  v31 = x;
  v32 = y;
  v33 = width;
  v34 = height;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (int64_t)totalSegmentCount
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  return objc_msgSend_count(self->_segments, a2, v2, v3, v4, v5);
}

- (int64_t)segmentGroupIndex
{
  return self->_segmentGroupIndex;
}

- (NSArray)segments
{
  return self->_segments;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segments, 0);
}

@end
