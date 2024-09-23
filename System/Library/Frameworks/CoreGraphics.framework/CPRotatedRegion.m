@implementation CPRotatedRegion

- (CPRotatedRegion)init
{
  CPRotatedRegion *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CPRotatedRegion;
  result = -[CPChunk init](&v3, sel_init);
  if (result)
  {
    result->normalizedBounds = CGRectNull;
    result->dirtyNormalizedBounds = 0;
  }
  return result;
}

- (CGRect)normalizedBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  if (self->dirtyNormalizedBounds)
    -[CPRotatedRegion fitBoundsToChildren](self, "fitBoundsToChildren");
  x = self->normalizedBounds.origin.x;
  y = self->normalizedBounds.origin.y;
  width = self->normalizedBounds.size.width;
  height = self->normalizedBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)left
{
  double result;
  double v4;
  double v5;

  -[CPRotatedRegion normalizedBounds](self, "normalizedBounds");
  if (v4 < 0.0 || v5 < 0.0)
    *(_QWORD *)&result = (unint64_t)CGRectStandardize(*(CGRect *)&result);
  return result;
}

- (double)right
{
  double v2;
  double v4;
  double v5;

  -[CPRotatedRegion normalizedBounds](self, "normalizedBounds");
  if (v4 < 0.0 || v5 < 0.0)
    *(CGRect *)&v2 = CGRectStandardize(*(CGRect *)&v2);
  return v2 + v4;
}

- (double)center
{
  double v2;
  double v3;

  -[CPRotatedRegion normalizedBounds](self, "normalizedBounds");
  return v3 + v2 * 0.5;
}

- (double)top
{
  uint64_t v2;
  double v3;
  double v4;
  double v5;

  -[CPRotatedRegion normalizedBounds](self, "normalizedBounds");
  if (v4 < 0.0 || v5 < 0.0)
    *(CGRect *)(&v3 - 1) = CGRectStandardize(*(CGRect *)&v2);
  return v3 + v5;
}

- (double)bottom
{
  uint64_t v2;
  double v3;
  double v4;
  double v5;

  -[CPRotatedRegion normalizedBounds](self, "normalizedBounds");
  if (v4 < 0.0 || v5 < 0.0)
    *(CGRect *)(&v3 - 1) = CGRectStandardize(*(CGRect *)&v2);
  return v3;
}

- (void)fitBoundsToChildren
{
  CGRect *p_normalizedBounds;
  NSMutableArray *children;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  v20 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)CPRotatedRegion;
  -[CPChunk fitBoundsToChildren](&v18, sel_fitBoundsToChildren);
  if (self->dirtyNormalizedBounds)
  {
    p_normalizedBounds = &self->normalizedBounds;
    self->normalizedBounds = CGRectNull;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    children = self->super.super.super.children;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](children, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(children);
          v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              __assert_rtn("-[CPRotatedRegion fitBoundsToChildren]", "CPRotatedRegion.m", 73, "[child isKindOfClass: [CPRotatedRegion class]] || [child isKindOfClass: [CPTextLine class]]");
          }
          objc_opt_class();
          objc_opt_isKindOfClass();
          objc_msgSend(v9, "normalizedBounds");
          v23.origin.x = v10;
          v23.origin.y = v11;
          v23.size.width = v12;
          v23.size.height = v13;
          v21.origin.x = p_normalizedBounds->origin.x;
          v21.origin.y = self->normalizedBounds.origin.y;
          v21.size.width = self->normalizedBounds.size.width;
          v21.size.height = self->normalizedBounds.size.height;
          v22 = CGRectUnion(v21, v23);
          p_normalizedBounds->origin.x = v22.origin.x;
          self->normalizedBounds.origin.y = v22.origin.y;
          self->normalizedBounds.size.width = v22.size.width;
          self->normalizedBounds.size.height = v22.size.height;
        }
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](children, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      }
      while (v6);
    }
    self->dirtyNormalizedBounds = 0;
  }
}

- (void)resizeWith:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CPRotatedRegion;
  -[CPChunk resizeWith:](&v4, sel_resizeWith_, a3);
  self->dirtyNormalizedBounds = 1;
}

@end
