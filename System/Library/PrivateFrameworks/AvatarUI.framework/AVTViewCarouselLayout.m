@implementation AVTViewCarouselLayout

+ (id)adaptativeLayoutWithAVTViewAspectRatio:(CGSize)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithAVTViewAspectRatio:", a3.width, a3.height);
}

- (AVTViewCarouselLayout)initWithAVTViewAspectRatio:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  AVTViewCarouselLayout *result;
  objc_super v6;

  height = a3.height;
  width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)AVTViewCarouselLayout;
  result = -[AVTViewCarouselLayout init](&v6, sel_init);
  if (result)
  {
    result->_avtViewAspectRatio.width = width;
    result->_avtViewAspectRatio.height = height;
    result->_fillContainer = 0;
  }
  return result;
}

- (CGSize)avatarViewSizeForAvailableContentSize:(CGSize)a3
{
  double height;
  double width;
  double v5;
  double v6;
  _BOOL4 v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = *MEMORY[0x1E0C9D820];
  v6 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (width != *MEMORY[0x1E0C9D820] || height != v6)
  {
    v9 = -[AVTViewCarouselLayout fillContainer](self, "fillContainer");
    v10 = (void *)objc_opt_class();
    v11 = v10;
    if (v9)
    {
      objc_msgSend(v10, "fullSizeForBounds:", width, height);
    }
    else
    {
      -[AVTViewCarouselLayout avtViewAspectRatio](self, "avtViewAspectRatio");
      objc_msgSend(v11, "severalItemsSizeForBounds:aspectRatio:", width, height, v12, v13);
    }
  }
  result.height = v6;
  result.width = v5;
  return result;
}

+ (CGSize)severalItemsSizeForBounds:(CGSize)a3 aspectRatio:(CGSize)a4
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a4.height;
  width = a4.width;
  _UIScaleTransformForAspectFitOfSizeInTargetSize();
  v6 = height * v10 + v8 * width;
  v7 = height * v11 + v9 * width;
  result.height = v7;
  result.width = v6;
  return result;
}

- (BOOL)fillContainer
{
  return self->_fillContainer;
}

- (void)setFillContainer:(BOOL)a3
{
  self->_fillContainer = a3;
}

- (CGSize)avtViewAspectRatio
{
  double width;
  double height;
  CGSize result;

  width = self->_avtViewAspectRatio.width;
  height = self->_avtViewAspectRatio.height;
  result.height = height;
  result.width = width;
  return result;
}

@end
