@implementation WKUIRemoteView

- (WKUIRemoteView)initWithFrame:(CGRect)a3 pid:(int)a4 contextID:(unsigned int)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WKUIRemoteView;
  return -[_UIRemoteView initWithFrame:pid:contextID:](&v6, sel_initWithFrame_pid_contextID_, *(_QWORD *)&a4, *(_QWORD *)&a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (NSString)description
{
  NSString *v3;
  NSString *v4;
  CALayer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WKUIRemoteView;
  v3 = -[WKUIRemoteView description](&v7, sel_description);
  v4 = (NSString *)-[WKUIRemoteView layer](self, "layer");
  return (NSString *)WebKit::RemoteLayerTreeNode::appendLayerDescription((WebKit::RemoteLayerTreeNode *)v3, v4, v5);
}

@end
