@implementation WKCompositingLayer

- (id)description
{
  WebKit::RemoteLayerTreeNode *v3;
  CALayer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WKCompositingLayer;
  v3 = -[WKCompositingLayer description](&v6, sel_description);
  return (id)WebKit::RemoteLayerTreeNode::appendLayerDescription(v3, (NSString *)&self->super.super.isa, v4);
}

@end
