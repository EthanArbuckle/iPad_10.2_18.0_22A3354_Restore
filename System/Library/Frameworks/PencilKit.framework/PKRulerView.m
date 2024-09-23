@implementation PKRulerView

- (void)setRulerLayer:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 424), a2);
}

- (id)accessibilityIdentifier
{
  return CFSTR("com.apple.pencilkit.rulerView");
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  PKRulerView *v4;
  PKRulerView *v5;

  v4 = self;
  if (self)
    self = (PKRulerView *)self->_rulerLayer;
  if (-[PKRulerView viewPointInRuler:](self, "viewPointInRuler:", a4, a3.x, a3.y))
    v5 = v4;
  else
    v5 = 0;
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rulerLayer, 0);
}

@end
