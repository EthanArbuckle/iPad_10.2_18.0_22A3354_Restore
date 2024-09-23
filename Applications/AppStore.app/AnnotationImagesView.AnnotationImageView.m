@implementation AnnotationImagesView.AnnotationImageView

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[AnnotationImagesView.AnnotationImageView frame](self, "frame", a3.width, a3.height);
  v4 = v3;
  v6 = v5;
  result.height = v6;
  result.width = v4;
  return result;
}

- (_TtCC8AppStore20AnnotationImagesViewP33_BF6C5C54A8EE0938638694F5E53171EB19AnnotationImageView)initWithImage:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self, a2);
  return -[AnnotationImagesView.AnnotationImageView initWithImage:](&v5, "initWithImage:", a3);
}

- (_TtCC8AppStore20AnnotationImagesViewP33_BF6C5C54A8EE0938638694F5E53171EB19AnnotationImageView)initWithImage:(id)a3 highlightedImage:(id)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType(self, a2);
  return -[AnnotationImagesView.AnnotationImageView initWithImage:highlightedImage:](&v7, "initWithImage:highlightedImage:", a3, a4);
}

- (_TtCC8AppStore20AnnotationImagesViewP33_BF6C5C54A8EE0938638694F5E53171EB19AnnotationImageView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType(self, a2);
  return -[AnnotationImagesView.AnnotationImageView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtCC8AppStore20AnnotationImagesViewP33_BF6C5C54A8EE0938638694F5E53171EB19AnnotationImageView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self, a2);
  return -[AnnotationImagesView.AnnotationImageView initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
