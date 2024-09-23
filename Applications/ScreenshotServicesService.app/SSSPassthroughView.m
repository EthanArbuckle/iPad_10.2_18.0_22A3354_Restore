@implementation SSSPassthroughView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  id v5;
  SSSPassthroughView *v6;
  SSSPassthroughView *v7;
  SSSPassthroughView *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SSSPassthroughView;
  v5 = -[SSSPassthroughView hitTest:withEvent:](&v10, "hitTest:withEvent:", a4, a3.x, a3.y);
  v6 = (SSSPassthroughView *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v6 == self)
    v8 = 0;
  else
    v8 = v6;

  return v8;
}

@end
