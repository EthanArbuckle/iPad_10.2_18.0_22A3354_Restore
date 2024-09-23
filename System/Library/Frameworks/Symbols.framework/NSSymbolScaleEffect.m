@implementation NSSymbolScaleEffect

+ (NSSymbolScaleEffect)effect
{
  _QWORD *v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSSymbolScaleEffect;
  objc_msgSendSuper2(&v4, sel__effectWithType_, 4);
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v2[2] = 0;
  v2[3] = 0;
  return (NSSymbolScaleEffect *)v2;
}

+ (NSSymbolScaleEffect)scaleUpEffect
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "effect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_withScaleLevel:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSymbolScaleEffect *)v3;
}

+ (NSSymbolScaleEffect)scaleDownEffect
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "effect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_withScaleLevel:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSymbolScaleEffect *)v3;
}

- (id)_withScaleLevel:(int64_t)a3
{
  *((_QWORD *)self + 3) = a3;
  return self;
}

- (NSSymbolScaleEffect)effectWithByLayer
{
  _QWORD *v2;

  v2 = -[NSSymbolScaleEffect copyWithZone:](self, "copyWithZone:", 0);
  v2[2] = 1;
  return (NSSymbolScaleEffect *)v2;
}

- (NSSymbolScaleEffect)effectWithWholeSymbol
{
  _QWORD *v2;

  v2 = -[NSSymbolScaleEffect copyWithZone:](self, "copyWithZone:", 0);
  v2[2] = 2;
  return (NSSymbolScaleEffect *)v2;
}

- (id)_rbOptionsMutable
{
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_addLayerBehavior:ToOptions:", self->_layerBehavior, v3);
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NSSymbolScaleEffect;
  result = -[NSSymbolEffect copyWithZone:](&v5, sel_copyWithZone_, a3);
  *((_QWORD *)result + 2) = self->_layerBehavior;
  *((_QWORD *)result + 3) = self->_level;
  return result;
}

- (int64_t)_layerBehavior
{
  return self->_layerBehavior;
}

- (void)set_layerBehavior:(int64_t)a3
{
  self->_layerBehavior = a3;
}

- (int64_t)_level
{
  return self->_level;
}

- (void)set_level:(int64_t)a3
{
  self->_level = a3;
}

@end
