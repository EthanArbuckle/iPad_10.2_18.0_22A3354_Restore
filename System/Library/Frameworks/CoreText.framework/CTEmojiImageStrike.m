@implementation CTEmojiImageStrike

- (CTEmojiImageStrike)initWithImage:(CGImage *)a3 alignmentInset:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  CTEmojiImageStrike *v7;
  objc_super v9;

  height = a4.height;
  width = a4.width;
  v9.receiver = self;
  v9.super_class = (Class)CTEmojiImageStrike;
  v7 = -[CTEmojiImageStrike init](&v9, sel_init);
  if (v7)
  {
    v7->_cgImage = CGImageRetain(a3);
    v7->_alignmentInset.width = width;
    v7->_alignmentInset.height = height;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  CGImageRelease(self->_cgImage);
  v3.receiver = self;
  v3.super_class = (Class)CTEmojiImageStrike;
  -[CTEmojiImageStrike dealloc](&v3, sel_dealloc);
}

- (CGImage)cgImage
{
  return self->_cgImage;
}

- (CGSize)alignmentInset
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_alignmentInset, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

@end
