@implementation AVPictureInPictureCALayerHostView

- (AVPictureInPictureCALayerHostView)initWithFrame:(CGRect)a3
{
  AVPictureInPictureCALayerHostView *v3;
  AVPictureInPictureCALayerHostView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVPictureInPictureCALayerHostView;
  v3 = -[AVPictureInPictureCALayerHostView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[AVPictureInPictureCALayerHostView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setInheritsTiming:", 0);

  }
  return v4;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end
