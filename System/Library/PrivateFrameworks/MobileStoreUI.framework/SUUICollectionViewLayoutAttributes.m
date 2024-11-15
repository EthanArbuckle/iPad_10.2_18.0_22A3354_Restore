@implementation SUUICollectionViewLayoutAttributes

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUUICollectionViewLayoutAttributes;
  v4 = -[UICollectionViewLayoutAttributes copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 44, self->_backgroundColor);
  v4[45] = (id)self->_position;
  v4[46] = *(id *)&self->_zoomingImageAlpha;
  v4[49] = *(id *)&self->_zoomingImageLambda;
  v4[47] = *(id *)&self->_zoomingImageWidth;
  v4[48] = *(id *)&self->_zoomingImageImposedAlphaOfOtherViews;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SUUICollectionViewLayoutAttributes *v4;
  UIColor *backgroundColor;
  BOOL v6;
  objc_super v8;

  v4 = (SUUICollectionViewLayoutAttributes *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ((backgroundColor = v4->_backgroundColor, backgroundColor == self->_backgroundColor)
       || -[UIColor isEqual:](backgroundColor, "isEqual:"))
      && v4->_position == self->_position
      && v4->_zoomingImageAlpha == self->_zoomingImageAlpha
      && v4->_zoomingImageLambda == self->_zoomingImageLambda
      && v4->_zoomingImageWidth == self->_zoomingImageWidth
      && v4->_zoomingImageImposedAlphaOfOtherViews == self->_zoomingImageImposedAlphaOfOtherViews)
    {
      v8.receiver = self;
      v8.super_class = (Class)SUUICollectionViewLayoutAttributes;
      v6 = -[UICollectionViewLayoutAttributes isEqual:](&v8, sel_isEqual_, v4);
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 352);
}

- (int64_t)position
{
  return self->_position;
}

- (void)setPosition:(int64_t)a3
{
  self->_position = a3;
}

- (double)zoomingImageAlpha
{
  return self->_zoomingImageAlpha;
}

- (void)setZoomingImageAlpha:(double)a3
{
  self->_zoomingImageAlpha = a3;
}

- (double)zoomingImageWidth
{
  return self->_zoomingImageWidth;
}

- (void)setZoomingImageWidth:(double)a3
{
  self->_zoomingImageWidth = a3;
}

- (double)zoomingImageImposedAlphaOfOtherViews
{
  return self->_zoomingImageImposedAlphaOfOtherViews;
}

- (void)setZoomingImageImposedAlphaOfOtherViews:(double)a3
{
  self->_zoomingImageImposedAlphaOfOtherViews = a3;
}

- (double)_zoomingImageLambda
{
  return self->_zoomingImageLambda;
}

- (void)_setZoomingImageLambda:(double)a3
{
  self->_zoomingImageLambda = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
