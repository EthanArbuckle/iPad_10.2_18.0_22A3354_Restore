@implementation NSSymbolPulseEffect

+ (NSSymbolPulseEffect)effect
{
  _QWORD *v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSSymbolPulseEffect;
  objc_msgSendSuper2(&v4, sel__effectWithType_, 2);
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v2[2] = 0;
  return (NSSymbolPulseEffect *)v2;
}

- (NSSymbolPulseEffect)effectWithByLayer
{
  _QWORD *v2;

  v2 = -[NSSymbolPulseEffect copyWithZone:](self, "copyWithZone:", 0);
  v2[2] = 1;
  return (NSSymbolPulseEffect *)v2;
}

- (NSSymbolPulseEffect)effectWithWholeSymbol
{
  _QWORD *v2;

  v2 = -[NSSymbolPulseEffect copyWithZone:](self, "copyWithZone:", 0);
  v2[2] = 2;
  return (NSSymbolPulseEffect *)v2;
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
  v5.super_class = (Class)NSSymbolPulseEffect;
  result = -[NSSymbolEffect copyWithZone:](&v5, sel_copyWithZone_, a3);
  *((_QWORD *)result + 2) = self->_layerBehavior;
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

@end
