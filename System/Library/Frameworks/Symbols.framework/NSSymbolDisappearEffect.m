@implementation NSSymbolDisappearEffect

+ (NSSymbolDisappearEffect)effect
{
  _QWORD *v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSSymbolDisappearEffect;
  objc_msgSendSuper2(&v4, sel__effectWithType_, 6);
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v2[2] = 0;
  v2[3] = 0;
  return (NSSymbolDisappearEffect *)v2;
}

+ (NSSymbolDisappearEffect)disappearUpEffect
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "effect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_withStyle:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSymbolDisappearEffect *)v3;
}

+ (NSSymbolDisappearEffect)disappearDownEffect
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "effect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_withStyle:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSymbolDisappearEffect *)v3;
}

- (id)_withStyle:(int64_t)a3
{
  *((_QWORD *)self + 3) = a3;
  return self;
}

- (NSSymbolDisappearEffect)effectWithByLayer
{
  _QWORD *v2;

  v2 = -[NSSymbolDisappearEffect copyWithZone:](self, "copyWithZone:", 0);
  v2[2] = 1;
  return (NSSymbolDisappearEffect *)v2;
}

- (NSSymbolDisappearEffect)effectWithWholeSymbol
{
  _QWORD *v2;

  v2 = -[NSSymbolDisappearEffect copyWithZone:](self, "copyWithZone:", 0);
  v2[2] = 2;
  return (NSSymbolDisappearEffect *)v2;
}

- (id)_rbOptionsMutable
{
  void *v3;
  int64_t style;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_addLayerBehavior:ToOptions:", self->_layerBehavior, v3);
  style = self->_style;
  if (style == 1)
    v5 = 3;
  else
    v5 = 2 * (style == 2);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BE7F310]);

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NSSymbolDisappearEffect;
  result = -[NSSymbolEffect copyWithZone:](&v5, sel_copyWithZone_, a3);
  *((_QWORD *)result + 2) = self->_layerBehavior;
  *((_QWORD *)result + 3) = self->_style;
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

- (int64_t)_style
{
  return self->_style;
}

- (void)set_style:(int64_t)a3
{
  self->_style = a3;
}

@end
