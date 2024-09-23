@implementation FigCaptionRowLayer

- (void)setNeedsDisplay
{
  double v3;
  double v4;
  objc_super v5;

  if (getDisplayScale_onceToken != -1)
    dispatch_once(&getDisplayScale_onceToken, &__block_literal_global_2);
  v3 = *(double *)&sMaxDisplayScale;
  -[FigCaptionRowLayer contentsScale](self, "contentsScale");
  if (v4 != v3)
    -[FigCaptionRowLayer setContentsScale:](self, "setContentsScale:", v3);
  v5.receiver = self;
  v5.super_class = (Class)FigCaptionRowLayer;
  -[FigBaseCALayer setNeedsDisplay](&v5, sel_setNeedsDisplay);
}

@end
