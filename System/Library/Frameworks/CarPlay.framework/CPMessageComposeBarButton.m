@implementation CPMessageComposeBarButton

- (CPMessageComposeBarButton)init
{
  return -[CPMessageComposeBarButton initWithImage:](self, "initWithImage:", 0);
}

- (CPMessageComposeBarButton)initWithImage:(UIImage *)image
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CPMessageComposeBarButton;
  return -[CPBarButton initWithImage:handler:](&v4, sel_initWithImage_handler_, image, 0);
}

@end
