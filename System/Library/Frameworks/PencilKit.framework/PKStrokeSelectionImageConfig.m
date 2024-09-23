@implementation PKStrokeSelectionImageConfig

- (PKStrokeSelectionImageConfig)initWithStrokeBounds:(CGRect)a3 imageViewBounds:(CGRect)a4 scale:(double)a5 imageSize:(CGSize)a6 invertedColors:(BOOL)a7 rotated:(BOOL)a8 sixChannel:(BOOL)a9 highlighted:(BOOL)a10
{
  char height_low;
  char width_low;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  PKStrokeSelectionImageConfig *result;
  CGFloat v23;
  CGFloat v24;

  height_low = LOBYTE(a6.height);
  width_low = LOBYTE(a6.width);
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v18 = a3.size.height;
  v19 = a3.size.width;
  v20 = a3.origin.y;
  v21 = a3.origin.x;
  result = -[PKStrokeSelectionImageConfig init](self, "init", *(_QWORD *)&a6.width, *(_QWORD *)&a6.height, a7, a8, a9, a10);
  if (result)
  {
    result->_strokeBounds.origin.y = v20;
    result->_strokeBounds.size.width = v19;
    result->_strokeBounds.size.height = v18;
    result->_imageViewBounds.origin.x = x;
    result->_imageViewBounds.origin.y = y;
    result->_imageViewBounds.size.width = width;
    result->_imageViewBounds.size.height = height;
    result->_scale = a5;
    result->_imageSize.width = v23;
    result->_imageSize.height = v24;
    result->_strokeBounds.origin.x = v21;
    result->_invertedColors = width_low;
    result->_rotated = height_low;
    result->_sixChannel = a7;
    result->_highlighted = a8;
  }
  return result;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = PKHashBytes((uint64_t)&self->_strokeBounds, 32);
  v4 = PKHashBytes((uint64_t)&self->_imageViewBounds, 32) ^ v3;
  v5 = PKHashBytes((uint64_t)&self->_scale, 8);
  return v4 ^ v5 ^ PKHashBytes((uint64_t)&self->_imageSize, 16) ^ self->_invertedColors ^ (2 * self->_rotated);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  double scale;
  double v15;
  double v16;
  BOOL v17;
  double v18;
  int invertedColors;
  int rotated;
  int sixChannel;
  CGRect v23;
  CGRect v24;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "strokeBounds");
    v23.origin.x = v6;
    v23.origin.y = v7;
    v23.size.width = v8;
    v23.size.height = v9;
    if (!CGRectEqualToRect(self->_strokeBounds, v23))
      goto LABEL_11;
    objc_msgSend(v5, "imageViewBounds");
    v24.origin.x = v10;
    v24.origin.y = v11;
    v24.size.width = v12;
    v24.size.height = v13;
    if (!CGRectEqualToRect(self->_imageViewBounds, v24))
      goto LABEL_11;
    scale = self->_scale;
    objc_msgSend(v5, "scale");
    if (scale != v15)
      goto LABEL_11;
    objc_msgSend(v5, "imageSize");
    v17 = 0;
    if (self->_imageSize.width != v18 || self->_imageSize.height != v16)
      goto LABEL_12;
    invertedColors = self->_invertedColors;
    if (invertedColors == objc_msgSend(v5, "invertedColors")
      && (rotated = self->_rotated, rotated == objc_msgSend(v5, "rotated")))
    {
      sixChannel = self->_sixChannel;
      v17 = sixChannel == objc_msgSend(v5, "sixChannel");
    }
    else
    {
LABEL_11:
      v17 = 0;
    }
LABEL_12:

    goto LABEL_13;
  }
  v17 = 0;
LABEL_13:

  return v17;
}

- (CGRect)strokeBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_strokeBounds.origin.x;
  y = self->_strokeBounds.origin.y;
  width = self->_strokeBounds.size.width;
  height = self->_strokeBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)imageViewBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_imageViewBounds.origin.x;
  y = self->_imageViewBounds.origin.y;
  width = self->_imageViewBounds.size.width;
  height = self->_imageViewBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)scale
{
  return self->_scale;
}

- (CGSize)imageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_imageSize.width;
  height = self->_imageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)invertedColors
{
  return self->_invertedColors;
}

- (BOOL)rotated
{
  return self->_rotated;
}

- (BOOL)sixChannel
{
  return self->_sixChannel;
}

- (BOOL)highlighted
{
  return self->_highlighted;
}

@end
