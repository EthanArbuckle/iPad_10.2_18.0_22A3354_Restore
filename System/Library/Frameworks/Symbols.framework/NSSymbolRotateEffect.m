@implementation NSSymbolRotateEffect

- (id)_withClockwise:(int64_t)a3
{
  *((_QWORD *)self + 3) = a3;
  return self;
}

+ (id)effect
{
  _QWORD *v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSSymbolRotateEffect;
  objc_msgSendSuper2(&v4, sel__effectWithType_, 10);
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v2[2] = 0;
  v2[3] = 0;
  return v2;
}

+ (id)rotateClockwiseEffect
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "effect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_withClockwise:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)rotateCounterClockwiseEffect
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "effect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_withClockwise:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSSymbolRotateEffect)effectWithByLayer
{
  _QWORD *v2;

  v2 = -[NSSymbolRotateEffect copyWithZone:](self, "copyWithZone:", 0);
  v2[2] = 1;
  return (NSSymbolRotateEffect *)v2;
}

- (NSSymbolRotateEffect)effectWithWholeSymbol
{
  _QWORD *v2;

  v2 = -[NSSymbolRotateEffect copyWithZone:](self, "copyWithZone:", 0);
  v2[2] = 2;
  return (NSSymbolRotateEffect *)v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NSSymbolRotateEffect;
  result = -[NSSymbolEffect copyWithZone:](&v5, sel_copyWithZone_, a3);
  *((_QWORD *)result + 2) = self->_layerBehavior;
  *((_QWORD *)result + 3) = self->_isClockwise;
  return result;
}

- (id)_rbOptionsMutable
{
  void *v3;
  int64_t isClockwise;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_addLayerBehavior:ToOptions:", self->_layerBehavior, v3);
  isClockwise = self->_isClockwise;
  if (isClockwise == 1)
    v5 = 1;
  else
    v5 = 2 * (isClockwise == 2);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BE7F360]);

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

- (int64_t)_isClockwise
{
  return self->_isClockwise;
}

- (void)set_isClockwise:(int64_t)a3
{
  self->_isClockwise = a3;
}

@end
