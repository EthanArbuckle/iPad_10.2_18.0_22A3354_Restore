@implementation WKInspectorIndicationView

- (WKInspectorIndicationView)initWithFrame:(CGRect)a3
{
  WKInspectorIndicationView *v3;
  WKInspectorIndicationView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WKInspectorIndicationView;
  v3 = -[WKInspectorIndicationView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[WKInspectorIndicationView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    -[WKInspectorIndicationView setBackgroundColor:](v4, "setBackgroundColor:", objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.435294118, 0.658823529, 0.862745098, 0.660000026));
  }
  return v4;
}

@end
