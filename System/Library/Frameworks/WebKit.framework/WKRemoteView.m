@implementation WKRemoteView

- (WKRemoteView)initWithFrame:(CGRect)a3 contextID:(unsigned int)a4
{
  uint64_t v4;
  WKRemoteView *v5;
  WKRemoteView *v6;
  objc_super v8;

  v4 = *(_QWORD *)&a4;
  v8.receiver = self;
  v8.super_class = (Class)WKRemoteView;
  v5 = -[WKRemoteView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
    objc_msgSend((id)-[WKRemoteView layer](v5, "layer"), "setContextId:", v4);
  return v6;
}

+ (Class)layerClass
{
  return NSClassFromString(CFSTR("CALayerHost"));
}

@end
