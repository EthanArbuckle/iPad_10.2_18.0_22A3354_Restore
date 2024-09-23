@implementation MSStickerBrowserViewLayoutSpec

+ (MSStickerBrowserViewLayoutSpec)specWithSizeClass:(int64_t)a3 interfaceOrientation:(int64_t)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_referenceBounds");

  return (MSStickerBrowserViewLayoutSpec *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSize:interfaceOrientation:", a3, a4);
}

- (MSStickerBrowserViewLayoutSpec)initWithSize:(int64_t)a3 interfaceOrientation:(int64_t)a4
{
  MSStickerBrowserViewLayoutSpec *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MSStickerBrowserViewLayoutSpec;
  result = -[MSStickerBrowserViewLayoutSpec init](&v7, sel_init);
  if (result)
  {
    result->_stickerSize = a3;
    result->_interfaceOrientation = a4;
  }
  return result;
}

- (double)minimumInteritemSpacing
{
  return 16.0;
}

- (UIEdgeInsets)sectionInset
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 8.0;
  v3 = 16.0;
  v4 = 8.0;
  v5 = 16.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (int64_t)stickerSize
{
  return self->_stickerSize;
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (CGSize)itemSize
{
  double width;
  double height;
  CGSize result;

  width = self->_itemSize.width;
  height = self->_itemSize.height;
  result.height = height;
  result.width = width;
  return result;
}

@end
