@implementation NSSymbolBounceEffect

+ (NSSymbolBounceEffect)effect
{
  _QWORD *v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSSymbolBounceEffect;
  objc_msgSendSuper2(&v4, sel__effectWithType_, 3);
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v2[2] = 0;
  v2[3] = 0;
  return (NSSymbolBounceEffect *)v2;
}

+ (NSSymbolBounceEffect)bounceUpEffect
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "effect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_withDirection:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSymbolBounceEffect *)v3;
}

+ (NSSymbolBounceEffect)bounceDownEffect
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "effect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_withDirection:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSymbolBounceEffect *)v3;
}

- (id)_withDirection:(int64_t)a3
{
  *((_QWORD *)self + 3) = a3;
  return self;
}

- (NSSymbolBounceEffect)effectWithByLayer
{
  _QWORD *v2;

  v2 = -[NSSymbolBounceEffect copyWithZone:](self, "copyWithZone:", 0);
  v2[2] = 1;
  return (NSSymbolBounceEffect *)v2;
}

- (NSSymbolBounceEffect)effectWithWholeSymbol
{
  _QWORD *v2;

  v2 = -[NSSymbolBounceEffect copyWithZone:](self, "copyWithZone:", 0);
  v2[2] = 2;
  return (NSSymbolBounceEffect *)v2;
}

- (id)_rbOptionsMutable
{
  void *v3;
  int64_t direction;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_addLayerBehavior:ToOptions:", self->_layerBehavior, v3);
  direction = self->_direction;
  if (direction == 1)
    v5 = 1;
  else
    v5 = 2 * (direction == 2);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BE7F318]);

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NSSymbolBounceEffect;
  result = -[NSSymbolEffect copyWithZone:](&v5, sel_copyWithZone_, a3);
  *((_QWORD *)result + 2) = self->_layerBehavior;
  *((_QWORD *)result + 3) = self->_direction;
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

- (int64_t)_direction
{
  return self->_direction;
}

- (void)set_direction:(int64_t)a3
{
  self->_direction = a3;
}

@end
