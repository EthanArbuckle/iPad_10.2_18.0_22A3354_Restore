@implementation MKImageTextAttachment

- (MKImageTextAttachment)initWithImage:(id)a3 verticalOffset:(double)a4
{
  id v6;
  MKImageTextAttachment *v7;
  MKImageTextAttachment *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MKImageTextAttachment;
  v7 = -[MKImageTextAttachment initWithData:ofType:](&v10, sel_initWithData_ofType_, 0, 0);
  v8 = v7;
  if (v7)
  {
    v7->_verticalOffset = a4;
    -[MKImageTextAttachment setImage:](v7, "setImage:", v6);
  }

  return v8;
}

- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(unint64_t)a6
{
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double verticalOffset;
  double v16;
  double v17;
  double v18;
  CGRect result;

  -[MKImageTextAttachment image](self, "image", a3, a6, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5.x, a5.y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "size");
  v9 = v8;
  v11 = v10;

  -[MKImageTextAttachment maxHeight](self, "maxHeight");
  if (v12 > 0.0)
  {
    -[MKImageTextAttachment maxHeight](self, "maxHeight");
    if (v13 < v11)
    {
      -[MKImageTextAttachment maxHeight](self, "maxHeight");
      v9 = v9 / v11 * v14;
      v11 = v14;
    }
  }
  verticalOffset = self->_verticalOffset;
  v16 = 0.0;
  v17 = v9;
  v18 = v11;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = verticalOffset;
  result.origin.x = v16;
  return result;
}

- (void)setVerticalOffset:(double)a3
{
  if (self->_verticalOffset != a3)
    self->_verticalOffset = a3;
}

- (double)verticalOffset
{
  return self->_verticalOffset;
}

- (double)maxHeight
{
  return self->_maxHeight;
}

- (void)setMaxHeight:(double)a3
{
  self->_maxHeight = a3;
}

@end
