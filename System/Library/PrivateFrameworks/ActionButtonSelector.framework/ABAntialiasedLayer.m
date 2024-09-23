@implementation ABAntialiasedLayer

- (ABAntialiasedLayer)init
{
  ABAntialiasedLayer *v2;
  ABAntialiasedLayer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ABAntialiasedLayer;
  v2 = -[ABAntialiasedLayer init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[ABAntialiasedLayer setAllowsEdgeAntialiasing:](v2, "setAllowsEdgeAntialiasing:", 1);
  return v3;
}

- (ABAntialiasedLayer)initWithLayer:(id)a3
{
  ABAntialiasedLayer *v3;
  ABAntialiasedLayer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ABAntialiasedLayer;
  v3 = -[ABAntialiasedLayer initWithLayer:](&v6, sel_initWithLayer_, a3);
  v4 = v3;
  if (v3)
    -[ABAntialiasedLayer setAllowsEdgeAntialiasing:](v3, "setAllowsEdgeAntialiasing:", 1);
  return v4;
}

- (void)setAllowsEdgeAntialiasing:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ABAntialiasedLayer;
  -[ABAntialiasedLayer setAllowsEdgeAntialiasing:](&v3, sel_setAllowsEdgeAntialiasing_, 1);
}

@end
