@implementation WKCompositingView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (NSString)description
{
  NSString *v3;
  NSString *v4;
  CALayer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WKCompositingView;
  v3 = -[WKCompositingView description](&v7, sel_description);
  v4 = (NSString *)-[WKCompositingView layer](self, "layer");
  return (NSString *)WebKit::RemoteLayerTreeNode::appendLayerDescription((WebKit::RemoteLayerTreeNode *)v3, v4, v5);
}

@end
