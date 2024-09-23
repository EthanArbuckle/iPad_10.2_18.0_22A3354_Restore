@implementation ARUIPipelineFactory

- (ARUIPipelineFactory)initWithDeviceSPI:(id)a3 librarySPI:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ARUIPipelineFactory;
  return -[ARUIPipelineFactory init](&v5, sel_init, a3, a4);
}

- (ARUIPipelineFactory)initWithDevice:(id)a3 library:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ARUIPipelineFactory;
  return -[ARUIPipelineFactory init](&v5, sel_init, a3, a4);
}

@end
