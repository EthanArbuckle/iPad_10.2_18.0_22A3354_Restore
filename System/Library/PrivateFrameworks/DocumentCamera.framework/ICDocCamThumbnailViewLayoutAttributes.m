@implementation ICDocCamThumbnailViewLayoutAttributes

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICDocCamThumbnailViewLayoutAttributes;
  v4 = -[UICollectionViewLayoutAttributes copyWithZone:](&v6, sel_copyWithZone_, a3);
  -[ICDocCamThumbnailViewLayoutAttributes imageWidth](self, "imageWidth");
  objc_msgSend(v4, "setImageWidth:");
  -[ICDocCamThumbnailViewLayoutAttributes imageHeight](self, "imageHeight");
  objc_msgSend(v4, "setImageHeight:");
  objc_msgSend(v4, "setRenderShadow:", -[ICDocCamThumbnailViewLayoutAttributes renderShadow](self, "renderShadow"));
  objc_msgSend(v4, "setRenderBorder:", -[ICDocCamThumbnailViewLayoutAttributes renderBorder](self, "renderBorder"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int v11;
  int v12;
  BOOL v13;
  objc_super v15;

  v4 = a3;
  -[ICDocCamThumbnailViewLayoutAttributes imageWidth](self, "imageWidth");
  v6 = v5;
  objc_msgSend(v4, "imageWidth");
  if (v6 == v7
    && (-[ICDocCamThumbnailViewLayoutAttributes imageHeight](self, "imageHeight"),
        v9 = v8,
        objc_msgSend(v4, "imageHeight"),
        v9 == v10)
    && (v11 = -[ICDocCamThumbnailViewLayoutAttributes renderShadow](self, "renderShadow"),
        v11 == objc_msgSend(v4, "renderShadow"))
    && (v12 = -[ICDocCamThumbnailViewLayoutAttributes renderBorder](self, "renderBorder"),
        v12 == objc_msgSend(v4, "renderBorder")))
  {
    v15.receiver = self;
    v15.super_class = (Class)ICDocCamThumbnailViewLayoutAttributes;
    v13 = -[UICollectionViewLayoutAttributes isEqual:](&v15, sel_isEqual_, v4);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (double)imageWidth
{
  return self->_imageWidth;
}

- (void)setImageWidth:(double)a3
{
  self->_imageWidth = a3;
}

- (double)imageHeight
{
  return self->_imageHeight;
}

- (void)setImageHeight:(double)a3
{
  self->_imageHeight = a3;
}

- (BOOL)renderShadow
{
  return self->_renderShadow;
}

- (void)setRenderShadow:(BOOL)a3
{
  self->_renderShadow = a3;
}

- (BOOL)renderBorder
{
  return self->_renderBorder;
}

- (void)setRenderBorder:(BOOL)a3
{
  self->_renderBorder = a3;
}

@end
