@implementation SUUIReviewListPageComponent

- (SUUIReviewListPageComponent)initWithViewElement:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUUIReviewListPageComponent;
  return -[SUUIPageComponent initWithViewElement:](&v4, sel_initWithViewElement_, a3);
}

- (int64_t)componentType
{
  return 21;
}

@end
