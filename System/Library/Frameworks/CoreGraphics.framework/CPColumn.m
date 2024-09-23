@implementation CPColumn

- (CPColumn)init
{
  CPColumn *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CPColumn;
  result = -[CPRotatedRegion init](&v3, sel_init);
  if (result)
  {
    *(&result->super.dirtyNormalizedBounds + 1) = 0;
    *(&result->super.dirtyNormalizedBounds + 2) = 0;
    result->maxLeftPad = 0.0;
    *(_QWORD *)&result->hasCentredParagraph = 0;
    result->maxRight = 0.0;
    result->maxRightPad = 0.0;
    LOBYTE(result->minLeft) = 0;
  }
  return result;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CPColumn;
  -[CPRegion dealloc](&v2, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CPColumn;
  return -[CPRegion copyWithZone:](&v4, sel_copyWithZone_, a3);
}

- (void)accept:(id)a3
{
  objc_msgSend(a3, "visitColumn:", self);
}

- (void)setHasColumnBreak:(BOOL)a3
{
  *(&self->super.dirtyNormalizedBounds + 2) = a3;
}

- (BOOL)isBoxRegion
{
  return 0;
}

- (BOOL)isGraphicalRegion
{
  return 0;
}

- (BOOL)isRowRegion
{
  return 0;
}

- (BOOL)isImageRegion
{
  return 0;
}

- (BOOL)isShapeRegion
{
  return 0;
}

- (double)bottomBaseline
{
  id v3;
  double result;

  if (!-[CPObject count](self, "count"))
    return 0.0;
  v3 = -[CPObject lastChild](self, "lastChild");
  if (!v3)
    return 0.0;
  objc_msgSend((id)objc_msgSend(v3, "lastChild"), "baseline");
  return result;
}

- (BOOL)hasCentredParagraph
{
  return *(&self->super.dirtyNormalizedBounds + 1);
}

- (void)setHasCentredParagraph:(BOOL)a3
{
  *(&self->super.dirtyNormalizedBounds + 1) = a3;
}

- (double)leftPad
{
  return round(*(double *)&self->hasCentredParagraph * 0.5);
}

- (double)rightPad
{
  double v3;
  double v5;
  double v6;

  -[CPChunk bounds](self, "bounds");
  if (v5 < 0.0 || v6 < 0.0)
    *(CGRect *)&v3 = CGRectStandardize(*(CGRect *)&v3);
  return round((self->maxRightPad - (v3 + v5)) * 0.5);
}

- (double)maxLeftPad
{
  return *(double *)&self->hasCentredParagraph;
}

- (void)setMaxLeftPad:(double)a3
{
  double v5;
  double v7;
  double v8;

  -[CPChunk bounds](self, "bounds");
  if (v7 < 0.0 || v8 < 0.0)
    *(_QWORD *)&v5 = (unint64_t)CGRectStandardize(*(CGRect *)&v5);
  self->maxRight = v5 - a3;
  *(double *)&self->hasCentredParagraph = a3;
}

- (double)maxRightPad
{
  return self->maxLeftPad;
}

- (void)setMaxRightPad:(double)a3
{
  double v5;
  double v7;
  double v8;

  self->maxLeftPad = a3;
  -[CPChunk bounds](self, "bounds");
  if (v7 < 0.0 || v8 < 0.0)
    *(CGRect *)&v5 = CGRectStandardize(*(CGRect *)&v5);
  self->maxRightPad = v5 + v7 + a3;
}

- (CGRect)paddedBounds
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
  double v18;
  double v19;
  CGRect result;

  -[CPColumn columnBounds](self, "columnBounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CPColumn leftPad](self, "leftPad");
  v12 = v4 - v11;
  -[CPColumn leftPad](self, "leftPad");
  v14 = v13;
  -[CPColumn rightPad](self, "rightPad");
  v16 = v8 + v14 + v15;
  v17 = v12;
  v18 = v6;
  v19 = v10;
  result.size.height = v19;
  result.size.width = v16;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (double)selectionBottom
{
  double result;

  if (!-[CPObject count](self, "count"))
    return 0.0;
  objc_msgSend(-[CPObject lastChild](self, "lastChild"), "selectionBottom");
  return result;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Column[%@...]"), objc_msgSend(-[CPObject firstChild](self, "firstChild"), "description"));
}

- (BOOL)complete
{
  return LOBYTE(self->minLeft) & 1;
}

- (void)setComplete:(BOOL)a3
{
  LOBYTE(self->minLeft) = a3;
}

- (int)outOrder
{
  return objc_msgSend((id)objc_msgSend(-[CPObject lastChild](self, "lastChild"), "flowProperties"), "outOrder");
}

- (int)inOrder
{
  return objc_msgSend((id)objc_msgSend(-[CPObject firstChild](self, "firstChild"), "flowProperties"), "inOrder");
}

@end
