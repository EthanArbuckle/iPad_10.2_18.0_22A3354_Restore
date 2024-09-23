@implementation PKSelectionTileProperties

- (PKSelectionTileProperties)initWithFrame:(CGRect)a3 strokes:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v9;
  PKSelectionTileProperties *v10;
  PKSelectionTileProperties *v11;
  uint64_t v12;
  NSArray *strokes;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PKSelectionTileProperties;
  v10 = -[PKSelectionTileProperties init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_frame.origin.x = x;
    v10->_frame.origin.y = y;
    v10->_frame.size.width = width;
    v10->_frame.size.height = height;
    v12 = objc_msgSend(v9, "copy");
    strokes = v11->_strokes;
    v11->_strokes = (NSArray *)v12;

  }
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  PKSelectionTileProperties *v4;
  PKSelectionTileProperties *v5;
  char v6;

  v4 = (PKSelectionTileProperties *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (CGRectEqualToRect(self->_frame, v5->_frame))
        v6 = -[NSArray isEqual:](self->_strokes, "isEqual:", v5->_strokes);
      else
        v6 = 0;

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = PKHashBytes((uint64_t)&self->_frame, 32);
  return -[NSArray hash](self->_strokes, "hash") ^ v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  CGRect v9;

  v8.receiver = self;
  v8.super_class = (Class)PKSelectionTileProperties;
  -[PKSelectionTileProperties description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionTileProperties frame](self, "frame");
  NSStringFromCGRect(v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionTileProperties strokes](self, "strokes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" %@, numStrokes: %lu"), v4, objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (NSArray)strokes
{
  return self->_strokes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokes, 0);
}

@end
