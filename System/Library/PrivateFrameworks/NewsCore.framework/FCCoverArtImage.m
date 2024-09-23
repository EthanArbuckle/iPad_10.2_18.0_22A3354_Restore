@implementation FCCoverArtImage

- (FCCoverArtImage)initWithDimensions:(CGSize)a3 URL:(id)a4
{
  CGFloat height;
  CGFloat width;
  id v8;
  FCCoverArtImage *v9;
  FCCoverArtImage *v10;
  objc_super v12;

  height = a3.height;
  width = a3.width;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FCCoverArtImage;
  v9 = -[FCCoverArtImage init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_dimensions.width = width;
    v9->_dimensions.height = height;
    objc_storeStrong((id *)&v9->_URL, a4);
  }

  return v10;
}

- (CGSize)dimensions
{
  double width;
  double height;
  CGSize result;

  width = self->_dimensions.width;
  height = self->_dimensions.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
