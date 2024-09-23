@implementation NSSymbolBreatheEffect

- (id)_withStyle:(int64_t)a3
{
  *((_QWORD *)self + 3) = a3;
  return self;
}

+ (id)effect
{
  _QWORD *v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSSymbolBreatheEffect;
  objc_msgSendSuper2(&v4, sel__effectWithType_, 12);
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v2[2] = 0;
  v2[3] = 0;
  return v2;
}

+ (id)breatheByDimmingEffect
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "effect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_withStyle:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)breatheByScalingEffect
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "effect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_withStyle:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSSymbolBreatheEffect)effectWithByLayer
{
  _QWORD *v2;

  v2 = -[NSSymbolBreatheEffect copyWithZone:](self, "copyWithZone:", 0);
  v2[2] = 1;
  return (NSSymbolBreatheEffect *)v2;
}

- (NSSymbolBreatheEffect)effectWithWholeSymbol
{
  _QWORD *v2;

  v2 = -[NSSymbolBreatheEffect copyWithZone:](self, "copyWithZone:", 0);
  v2[2] = 2;
  return (NSSymbolBreatheEffect *)v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NSSymbolBreatheEffect;
  result = -[NSSymbolEffect copyWithZone:](&v5, sel_copyWithZone_, a3);
  *((_QWORD *)result + 2) = self->_layerBehavior;
  *((_QWORD *)result + 3) = self->_style;
  return result;
}

- (id)_rbOptionsMutable
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_addLayerBehavior:ToOptions:", self->_layerBehavior, v3);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_style == 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("breatheOptions"));

  return v3;
}

- (int64_t)_layerBehavior
{
  return self->_layerBehavior;
}

- (void)set_layerBehavior:(int64_t)a3
{
  self->_layerBehavior = a3;
}

- (int64_t)_style
{
  return self->_style;
}

- (void)set_style:(int64_t)a3
{
  self->_style = a3;
}

@end
