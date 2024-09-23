@implementation SFStartPageBackgroundUIVisualEffectBackdropView

- (SFStartPageBackgroundUIVisualEffectBackdropView)initWithFrame:(CGRect)a3
{
  SFStartPageBackgroundUIVisualEffectBackdropView *v3;
  SFStartPageBackgroundUIVisualEffectBackdropView *v4;
  void *v5;
  SFStartPageBackgroundUIVisualEffectBackdropView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFStartPageBackgroundUIVisualEffectBackdropView;
  v3 = -[_UIVisualEffectSubview initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[_UIVisualEffectBackdropView captureGroup](v3, "captureGroup");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setGroupName:", CFSTR("start-page-cell"));

    -[_UIVisualEffectBackdropView setRenderMode:](v4, "setRenderMode:", 0);
    v6 = v4;
  }

  return v4;
}

@end
