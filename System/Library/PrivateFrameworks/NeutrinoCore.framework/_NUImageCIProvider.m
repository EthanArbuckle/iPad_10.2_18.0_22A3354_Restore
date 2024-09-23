@implementation _NUImageCIProvider

- (_NUImageCIProvider)initWithImage:(id)a3
{
  id v5;
  _NUImageCIProvider *v6;
  _NUImageCIProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_NUImageCIProvider;
  v6 = -[_NUImageCIProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_image, a3);

  return v7;
}

- (void)dealloc
{
  NUBufferImage *image;
  objc_super v4;

  image = self->_image;
  self->_image = 0;

  v4.receiver = self;
  v4.super_class = (Class)_NUImageCIProvider;
  -[_NUImageCIProvider dealloc](&v4, sel_dealloc);
}

- (void)provideImageData:(void *)a3 bytesPerRow:(unint64_t)a4 origin:(unint64_t)a5 :(unint64_t)a6 size:(unint64_t)a7 :(unint64_t)a8 userInfo:(id)a9
{
  NUBufferImage *image;
  _QWORD v11[4];

  image = self->_image;
  v11[0] = a5;
  v11[1] = a6;
  v11[2] = a7;
  v11[3] = a8;
  +[NUImageUtilities copyPixelsFromImage:rect:destPtr:destPtrRowBytes:](NUImageUtilities, "copyPixelsFromImage:rect:destPtr:destPtrRowBytes:", image, v11, a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
}

@end
