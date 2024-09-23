@implementation FigPhotoTiledLayer

- (CGSize)imageSize
{
  double v2;
  double v3;
  CGSize result;

  -[CMPhotoTiledLayer imageSize](self->_tiledLayer, "imageSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (int64_t)imageOrientation
{
  return -[CMPhotoTiledLayer imageOrientation](self->_tiledLayer, "imageOrientation");
}

- (FigPhotoTiledLayer)initWithContainerData:(id)a3 containerImageIndex:(int64_t)a4 backgroundImageSize:(CGSize)a5 screenSize:(CGSize)a6
{
  double height;
  double width;
  double v8;
  double v9;
  FigPhotoTiledLayer *v12;
  objc_super v14;

  height = a6.height;
  width = a6.width;
  v8 = a5.height;
  v9 = a5.width;
  v14.receiver = self;
  v14.super_class = (Class)FigPhotoTiledLayer;
  v12 = -[FigPhotoTiledLayer init](&v14, sel_init);
  if (v12)
    v12->_tiledLayer = (CMPhotoTiledLayer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D09248]), "initWithContainerData:containerImageIndex:backgroundImageSize:screenSize:", a3, a4, v9, v8, width, height);
  return v12;
}

- (FigPhotoTiledLayer)initWithContainerURL:(id)a3 containerImageIndex:(int64_t)a4 backgroundImageSize:(CGSize)a5 screenSize:(CGSize)a6
{
  double height;
  double width;
  double v8;
  double v9;
  FigPhotoTiledLayer *v12;
  objc_super v14;

  height = a6.height;
  width = a6.width;
  v8 = a5.height;
  v9 = a5.width;
  v14.receiver = self;
  v14.super_class = (Class)FigPhotoTiledLayer;
  v12 = -[FigPhotoTiledLayer init](&v14, sel_init);
  if (v12)
    v12->_tiledLayer = (CMPhotoTiledLayer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D09248]), "initWithContainerURL:containerImageIndex:backgroundImageSize:screenSize:", a3, a4, v9, v8, width, height);
  return v12;
}

- (FigPhotoTiledLayer)initWithContainerData:(id)a3 containerImageIndex:(int64_t)a4 placeholderImage:(CGImage *)a5 screenSize:(CGSize)a6
{
  double height;
  double width;
  FigPhotoTiledLayer *v11;
  objc_super v13;

  height = a6.height;
  width = a6.width;
  v13.receiver = self;
  v13.super_class = (Class)FigPhotoTiledLayer;
  v11 = -[FigPhotoTiledLayer init](&v13, sel_init);
  if (v11)
    v11->_tiledLayer = (CMPhotoTiledLayer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D09248]), "initWithContainerData:containerImageIndex:placeholderImage:screenSize:", a3, a4, a5, width, height);
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigPhotoTiledLayer;
  -[FigPhotoTiledLayer dealloc](&v3, sel_dealloc);
}

- (void)flushCache
{
  -[CMPhotoTiledLayer flushCache](self->_tiledLayer, "flushCache");
}

- (void)setVisibleRectangle:(CGRect)a3 zoomScale:(double)a4
{
  -[CMPhotoTiledLayer setVisibleRectangle:zoomScale:](self->_tiledLayer, "setVisibleRectangle:zoomScale:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4);
}

- (void)sizeToFit
{
  -[CMPhotoTiledLayer sizeToFit](self->_tiledLayer, "sizeToFit");
}

@end
