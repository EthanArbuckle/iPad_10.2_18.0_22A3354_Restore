@implementation SVSHighlightButton

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SVSHighlightButton;
  -[SVSHighlightButton setHighlighted:](&v6, "setHighlighted:");
  v5 = 1.0;
  if (v3)
    v5 = 0.5;
  -[SVSHighlightButton setAlpha:](self, "setAlpha:", v5);
}

@end
