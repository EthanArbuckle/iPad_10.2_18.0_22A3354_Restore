@implementation CHSegmentDescriptor

- (CHSegmentDescriptor)initWithSegmentID:(id)a3 startCutPoint:(id)a4 endCutPoint:(id)a5 referenceDrawing:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CHSegmentDescriptor *v15;
  void **p_startCutPoint;
  void **p_endCutPoint;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  double v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  CGSize size;
  objc_super v60;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v60.receiver = self;
  v60.super_class = (Class)CHSegmentDescriptor;
  v15 = -[CHSegmentDescriptor init](&v60, sel_init);
  objc_storeStrong((id *)&v15->_segmentID, a3);
  p_startCutPoint = (void **)&v15->_startCutPoint;
  objc_storeStrong((id *)&v15->_startCutPoint, a4);
  p_endCutPoint = (void **)&v15->_endCutPoint;
  objc_storeStrong((id *)&v15->_endCutPoint, a5);
  objc_msgSend_isSinglePointSegment(v15, v18, v19, v20, v21, v22);
  v28 = objc_msgSend_strokeIndex(v15->_startCutPoint, v23, v24, v25, v26, v27);
  if (v28 == objc_msgSend_strokeIndex(v15->_endCutPoint, v29, v30, v31, v32, v33)
    && objc_msgSend_isStartOfStroke(*p_startCutPoint, v34, v35, v36, v37, v38)
    && objc_msgSend_isEndOfStroke(*p_endCutPoint, v39, v40, v41, v42, v43))
  {
    v49 = objc_msgSend_strokeIndex(*p_startCutPoint, v44, v45, v46, v47, v48);
    objc_msgSend_boundsForStrokeIndex_(v14, v50, v49, v51, v52, v53);
  }
  else
  {
    v54 = sub_1BE68DF44(v14, *p_startCutPoint, *p_endCutPoint);
  }
  v15->_segmentBounds.origin.x = v54;
  v15->_segmentBounds.origin.y = v55;
  v15->_segmentBounds.size.width = v56;
  v15->_segmentBounds.size.height = v57;
  size = v15->_segmentBounds.size;
  v15->_contextBounds.origin = v15->_segmentBounds.origin;
  v15->_contextBounds.size = size;

  return v15;
}

- (id)strokeIndexSet
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;

  objc_msgSend_startCutPoint(self, a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_strokeIndex(v7, v8, v9, v10, v11, v12);

  objc_msgSend_endCutPoint(self, v14, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend_strokeIndex(v19, v20, v21, v22, v23, v24) - v13 + 1;

  return (id)objc_msgSend_indexSetWithIndexesInRange_(MEMORY[0x1E0CB36B8], v26, v13, v25, v27, v28);
}

- (int64_t)strokeCount
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v7 = objc_msgSend_strokeIndex(self->_endCutPoint, a2, v2, v3, v4, v5);
  return v7 - objc_msgSend_strokeIndex(self->_startCutPoint, v8, v9, v10, v11, v12) + 1;
}

- (BOOL)isSinglePointSegment
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;

  objc_msgSend_startCutPoint(self, a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endCutPoint(self, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_compare_(v7, v14, (uint64_t)v13, v15, v16, v17) == 0;

  return v18;
}

+ (id)generateSegmentsFromDrawing:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  unint64_t i;
  CHCutPoint *v16;
  const char *v17;
  uint64_t v18;
  void *isEndOfStroke;
  CHCutPoint *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  CHSegmentDescriptor *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  void *started;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v3 = a3;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v4, v5, v6, v7, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i < objc_msgSend_strokeCount(v3, v9, v10, v11, v12, v13); ++i)
  {
    v16 = [CHCutPoint alloc];
    isEndOfStroke = (void *)objc_msgSend_initWithStrokeIndex_pointIndex_isEndOfStroke_(v16, v17, i, 0, 0, v18);
    v20 = [CHCutPoint alloc];
    v25 = objc_msgSend_pointCountForStrokeIndex_(v3, v21, i, v22, v23, v24);
    v28 = (void *)objc_msgSend_initWithStrokeIndex_pointIndex_isEndOfStroke_(v20, v26, i, v25 - 1, 1, v27);
    v29 = [CHSegmentDescriptor alloc];
    objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v30, i, v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    started = (void *)objc_msgSend_initWithSegmentID_startCutPoint_endCutPoint_referenceDrawing_(v29, v35, (uint64_t)v34, (uint64_t)isEndOfStroke, (uint64_t)v28, (uint64_t)v3);

    objc_msgSend_addObject_(v14, v37, (uint64_t)started, v38, v39, v40);
  }

  return v14;
}

+ (CGRect)boundingBoxFromSegmentID:(int64_t)a3 toSegmentID:(int64_t)a4 withSegments:(id)a5 withSourceDrawing:(id)a6
{
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  CGRect result;

  v9 = a5;
  v10 = a6;
  objc_msgSend_objectAtIndex_(v9, v11, a3, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndex_(v9, v16, a4, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_startCutPoint(v15, v21, v22, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endCutPoint(v20, v27, v28, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = sub_1BE68DF44(v10, v26, v32);
  v35 = v34;
  v37 = v36;
  v39 = v38;

  v40 = v33;
  v41 = v35;
  v42 = v37;
  v43 = v39;
  result.size.height = v43;
  result.size.width = v42;
  result.origin.y = v41;
  result.origin.x = v40;
  return result;
}

+ (int64_t)indexForSegmentID:(id)a3 fromSegments:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  _QWORD v13[4];
  id v14;

  v5 = a3;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1BE68F578;
  v13[3] = &unk_1E77F2D28;
  v14 = v5;
  v6 = v5;
  v11 = objc_msgSend_indexOfObjectPassingTest_(a4, v7, (uint64_t)v13, v8, v9, v10);

  return v11;
}

- (NSNumber)segmentID
{
  return self->_segmentID;
}

- (CHCutPoint)startCutPoint
{
  return self->_startCutPoint;
}

- (CHCutPoint)endCutPoint
{
  return self->_endCutPoint;
}

- (CGRect)segmentBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_segmentBounds.origin.x;
  y = self->_segmentBounds.origin.y;
  width = self->_segmentBounds.size.width;
  height = self->_segmentBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)contextBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contextBounds.origin.x;
  y = self->_contextBounds.origin.y;
  width = self->_contextBounds.size.width;
  height = self->_contextBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setContextBounds:(CGRect)a3
{
  self->_contextBounds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endCutPoint, 0);
  objc_storeStrong((id *)&self->_startCutPoint, 0);
  objc_storeStrong((id *)&self->_segmentID, 0);
}

@end
