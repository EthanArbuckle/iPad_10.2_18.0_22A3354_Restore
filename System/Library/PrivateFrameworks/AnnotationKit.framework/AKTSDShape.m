@implementation AKTSDShape

- (AKTSDShape)init
{
  AKTSDShape *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AKTSDShape;
  result = -[AKTSDShape init](&v3, sel_init);
  if (result)
    *(_WORD *)&result->mShapeInvalidFlags |= 0x3FFu;
  return result;
}

- (void)drawInContext:(CGContext *)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;

  -[AKTSDShape stroke](self, "stroke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKTSDShape clippedPathForLineEnds](self, "clippedPathForLineEnds");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "brushPath:inContext:", v6, a3);

  v7 = *MEMORY[0x24BDBEFB0];
  v8 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  -[AKTSDShape p_drawLineEndForHead:withDelta:inContext:useFastDrawing:](self, "p_drawLineEndForHead:withDelta:inContext:useFastDrawing:", 1, a3, 0, *MEMORY[0x24BDBEFB0], v8);
  -[AKTSDShape p_drawLineEndForHead:withDelta:inContext:useFastDrawing:](self, "p_drawLineEndForHead:withDelta:inContext:useFastDrawing:", 0, a3, 0, v7, v8);
}

- (void)p_drawLineEndForHead:(BOOL)a3 withDelta:(CGPoint)a4 inContext:(CGContext *)a5 useFastDrawing:(BOOL)a6
{
  _BOOL8 v6;
  double x;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  id v25;

  v6 = a6;
  x = a4.x;
  if (a3)
  {
    -[AKTSDShape strokeHeadLineEnd](self, "strokeHeadLineEnd", a4.x, a4.y);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
      return;
    v25 = (id)v10;
    -[AKTSDShape headLineEndPoint](self, "headLineEndPoint");
    v12 = v11;
    v14 = v13;
    -[AKTSDShape headLineEndAngle](self, "headLineEndAngle");
  }
  else
  {
    -[AKTSDShape strokeTailLineEnd](self, "strokeTailLineEnd", a4.x, a4.y);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!v16)
      return;
    v25 = (id)v16;
    -[AKTSDShape tailLineEndPoint](self, "tailLineEndPoint");
    v12 = v17;
    v14 = v18;
    -[AKTSDShape tailLineEndAngle](self, "tailLineEndAngle");
  }
  v19 = v15;
  v20 = sub_22902DEE4(v12, v14, x);
  v22 = v21;
  -[AKTSDShape stroke](self, "stroke");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKTSDShape lineEndScale](self, "lineEndScale");
  objc_msgSend(v23, "paintLineEnd:atPoint:atAngle:withScale:inContext:useFastDrawing:", v25, a5, v6, v20, v22, v19, v24);

}

- (id)strokeHeadLineEnd
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[AKTSDShape headLineEnd](self, "headLineEnd");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[AKTSDShape stroke](self, "stroke");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKTSDShape headLineEnd](self, "headLineEnd");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "strokeLineEnd:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)strokeTailLineEnd
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[AKTSDShape tailLineEnd](self, "tailLineEnd");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[AKTSDShape stroke](self, "stroke");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKTSDShape tailLineEnd](self, "tailLineEnd");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "strokeLineEnd:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (double)lineEndScale
{
  void *v2;
  double v3;
  double v4;
  double result;

  -[AKTSDShape stroke](self, "stroke");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "width");
  v4 = v3;

  result = (v4 + -1.0) * 0.6 + 1.0;
  if (v4 <= 1.0)
    return v4;
  return result;
}

- (CGPoint)headLineEndPoint
{
  double x;
  double y;
  CGPoint result;

  -[AKTSDShape p_validateHeadLineEnd](self, "p_validateHeadLineEnd");
  x = self->mHeadLineEndPoint.x;
  y = self->mHeadLineEndPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)tailLineEndPoint
{
  double x;
  double y;
  CGPoint result;

  -[AKTSDShape p_validateTailLineEnd](self, "p_validateTailLineEnd");
  x = self->mTailLineEndPoint.x;
  y = self->mTailLineEndPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (double)headLineEndAngle
{
  -[AKTSDShape p_validateHeadLineEnd](self, "p_validateHeadLineEnd");
  return self->mHeadLineEndAngle;
}

- (double)tailLineEndAngle
{
  -[AKTSDShape p_validateTailLineEnd](self, "p_validateTailLineEnd");
  return self->mTailLineEndAngle;
}

- (id)clippedPathForLineEnds
{
  AKTSDBezierPath *v3;
  AKTSDBezierPath *mCachedClippedPath;

  if ((*(_WORD *)&self->mShapeInvalidFlags & 0x200) != 0)
  {
    v3 = -[AKTSDShape _newClippedPath](self, "_newClippedPath");
    mCachedClippedPath = self->mCachedClippedPath;
    self->mCachedClippedPath = v3;

    *(_WORD *)&self->mShapeInvalidFlags &= ~0x200u;
  }
  return self->mCachedClippedPath;
}

- (void)p_invalidateHead
{
  *(_WORD *)&self->mShapeInvalidFlags |= 0xC0u;
  MEMORY[0x24BEDD108](self, sel_p_invalidateClippedPath);
}

- (void)p_invalidateTail
{
  *(_WORD *)&self->mShapeInvalidFlags |= 0x140u;
  MEMORY[0x24BEDD108](self, sel_p_invalidateClippedPath);
}

- (void)p_invalidateClippedPath
{
  AKTSDBezierPath *mCachedClippedPath;

  *(_WORD *)&self->mShapeInvalidFlags |= 0x200u;
  mCachedClippedPath = self->mCachedClippedPath;
  self->mCachedClippedPath = 0;

}

- (void)p_validateHeadAndTail
{
  __int16 mShapeInvalidFlags;
  id v4;

  mShapeInvalidFlags = (__int16)self->mShapeInvalidFlags;
  if ((mShapeInvalidFlags & 0x40) != 0)
  {
    *(_WORD *)&self->mShapeInvalidFlags = mShapeInvalidFlags & 0xFFBF;
    -[AKTSDShape path](self, "path");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "getStartPoint:andEndPoint:", &self->mTailPoint, &self->mHeadPoint);

  }
}

- (void)p_validateHeadLineEnd
{
  __int16 mShapeInvalidFlags;

  -[AKTSDShape p_validateHeadAndTail](self, "p_validateHeadAndTail");
  mShapeInvalidFlags = (__int16)self->mShapeInvalidFlags;
  if ((mShapeInvalidFlags & 0x80) != 0)
  {
    *(_WORD *)&self->mShapeInvalidFlags = mShapeInvalidFlags & 0xFF7F;
    MEMORY[0x24BEDD108](self, sel_p_computeAngle_point_cutSegment_cutT_forLineEndAtHead_);
  }
}

- (void)p_validateTailLineEnd
{
  if ((*(_WORD *)&self->mShapeInvalidFlags & 0x100) != 0)
  {
    *(_WORD *)&self->mShapeInvalidFlags &= ~0x100u;
    MEMORY[0x24BEDD108](self, sel_p_computeAngle_point_cutSegment_cutT_forLineEndAtHead_);
  }
}

- (void)p_computeAngle:(double *)a3 point:(CGPoint *)a4 cutSegment:(int64_t *)a5 cutT:(double *)a6 forLineEndAtHead:(BOOL)a7
{
  _BOOL8 v7;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  char v19;
  double MaxY;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  double x;
  double y;
  double v31;
  double v32;
  double v33;
  long double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CGFloat v40;
  uint64_t v41;
  void *v42;
  CGRect BoundingBox;

  v7 = a7;
  -[AKTSDShape p_validateHeadAndTail](self, "p_validateHeadAndTail");
  v13 = 40;
  if (v7)
    v13 = 24;
  v14 = 32;
  if (v7)
    v14 = 16;
  v15 = *(double *)((char *)&self->super.isa + v14);
  v16 = *(double *)((char *)&self->super.isa + v13);
  if (v7)
    -[AKTSDShape strokeHeadLineEnd](self, "strokeHeadLineEnd");
  else
    -[AKTSDShape strokeTailLineEnd](self, "strokeTailLineEnd");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17 && (v42 = v17, v19 = objc_msgSend(v17, "isNone"), v18 = v42, (v19 & 1) == 0))
  {
    BoundingBox = CGPathGetBoundingBox((CGPathRef)objc_msgSend(v42, "path"));
    MaxY = CGRectGetMaxY(BoundingBox);
    objc_msgSend(v42, "endPoint");
    v22 = MaxY - v21;
    if (!objc_msgSend(v42, "isFilled"))
      v22 = v22 + 0.75;
    -[AKTSDShape lineEndScale](self, "lineEndScale");
    v24 = v23 * v22;
    +[AKTSDBezierPath bezierPathWithOvalInRect:](AKTSDBezierPath, "bezierPathWithOvalInRect:", v15 - v24, v16 - v24, v24 + v24, v24 + v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[AKTSDShape path](self, "path");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addIntersectionsWithPath:to:allIntersections:reversed:", v25, v26, 0, v7);

    if (objc_msgSend(v26, "count"))
    {
      objc_msgSend(v26, "sortUsingSelector:", sel_compareSegmentAndT_);
      if (v7)
        objc_msgSend(v26, "lastObject");
      else
        objc_msgSend(v26, "objectAtIndex:", 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "point");
      x = v31;
      y = v32;
    }
    else if (v7)
    {
      v28 = 0;
      x = self->mTailPoint.x;
      y = self->mTailPoint.y;
    }
    else
    {
      v28 = 0;
      x = self->mHeadPoint.x;
      y = self->mHeadPoint.y;
    }
    v33 = sub_22902DEF0(v15, v16, x);
    *a3 = sub_22902DF68(v33, v34) + -1.57079633;
    v35 = sub_22902DEF0(x, y, v15);
    v37 = *MEMORY[0x24BDBEFB0];
    if (v35 != *MEMORY[0x24BDBEFB0] || v36 != *(double *)(MEMORY[0x24BDBEFB0] + 8))
    {
      v38 = sub_22902DF3C(v35, v36);
      v37 = sub_22902DEFC(v38, v39, v24);
    }
    a4->x = sub_22902DEE4(v15, v16, v37);
    a4->y = v40;
    if (v28)
    {
      *a5 = objc_msgSend(v28, "segment");
      objc_msgSend(v28, "t");
    }
    else
    {
      *a5 = 0;
      v41 = 0;
    }
    *(_QWORD *)a6 = v41;

    v18 = v42;
  }
  else
  {
    *a3 = 1.57079633;
    a4->x = v15;
    a4->y = v16;
    *a5 = -1;
    *a6 = 0.0;
  }

}

- (id)_newClippedPath
{
  void *v3;
  double v4;
  double v5;
  AKTSDBezierPath *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double x;
  double y;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  int64_t mTailCutSegment;
  int64_t mHeadCutSegment;
  void *v24;

  -[AKTSDShape p_validateHeadLineEnd](self, "p_validateHeadLineEnd");
  -[AKTSDShape p_validateTailLineEnd](self, "p_validateTailLineEnd");
  if ((self->mHeadCutSegment & 0x8000000000000000) == 0 || (self->mTailCutSegment & 0x8000000000000000) == 0)
  {
    -[AKTSDShape stroke](self, "stroke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "width");
    v5 = v4;

    v6 = objc_alloc_init(AKTSDBezierPath);
    v7 = sub_22902DF78(self->mTailLineEndAngle + 1.57079633);
    v8 = v5 * 0.0;
    v10 = sub_22902DEFC(v7, v9, v8);
    x = self->mTailLineEndPoint.x;
    y = self->mTailLineEndPoint.y;
    v13 = sub_22902DEE4(x, y, v10);
    v15 = v14;
    v16 = sub_22902DF78(self->mHeadLineEndAngle + 1.57079633);
    v18 = sub_22902DEFC(v16, v17, v8);
    v19 = sub_22902DEE4(self->mHeadLineEndPoint.x, self->mHeadLineEndPoint.y, v18);
    v21 = v20;
    mHeadCutSegment = self->mHeadCutSegment;
    mTailCutSegment = self->mTailCutSegment;
    if ((mHeadCutSegment < 0 || mHeadCutSegment >= mTailCutSegment)
      && (mHeadCutSegment != mTailCutSegment || self->mHeadCutT >= self->mTailCutT))
    {
      if (mTailCutSegment < 0)
      {
        -[AKTSDBezierPath moveToPoint:](v6, "moveToPoint:", x, y);
      }
      else
      {
        -[AKTSDBezierPath moveToPoint:](v6, "moveToPoint:", v13, v15);
        -[AKTSDBezierPath lineToPoint:](v6, "lineToPoint:", self->mTailLineEndPoint.x, self->mTailLineEndPoint.y);
      }
      -[AKTSDShape path](self, "path");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKTSDBezierPath appendBezierPath:fromSegment:t:toSegment:t:withoutMove:](v6, "appendBezierPath:fromSegment:t:toSegment:t:withoutMove:", v24, self->mTailCutSegment, self->mHeadCutSegment, 1, self->mTailCutT, self->mHeadCutT);

      if (self->mHeadCutSegment < 0)
        goto LABEL_14;
    }
    else
    {
      -[AKTSDBezierPath moveToPoint:](v6, "moveToPoint:", v13, v15);
    }
    -[AKTSDBezierPath lineToPoint:](v6, "lineToPoint:", v19, v21);
LABEL_14:

    return v6;
  }
  -[AKTSDShape path](self, "path");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (AKTSDBezierPath)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_storeStrong((id *)&self->_path, a3);
}

- (AKTSDBrushStroke)stroke
{
  return self->_stroke;
}

- (void)setStroke:(id)a3
{
  objc_storeStrong((id *)&self->_stroke, a3);
}

- (AKTSDLineEnd)headLineEnd
{
  return self->_headLineEnd;
}

- (void)setHeadLineEnd:(id)a3
{
  objc_storeStrong((id *)&self->_headLineEnd, a3);
}

- (AKTSDLineEnd)tailLineEnd
{
  return self->_tailLineEnd;
}

- (void)setTailLineEnd:(id)a3
{
  objc_storeStrong((id *)&self->_tailLineEnd, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tailLineEnd, 0);
  objc_storeStrong((id *)&self->_headLineEnd, 0);
  objc_storeStrong((id *)&self->_stroke, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->mCachedClippedPath, 0);
}

@end
