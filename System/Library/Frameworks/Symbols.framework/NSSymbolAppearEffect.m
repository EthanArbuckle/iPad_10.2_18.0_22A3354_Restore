@implementation NSSymbolAppearEffect

+ (NSSymbolAppearEffect)effect
{
  _QWORD *v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSSymbolAppearEffect;
  objc_msgSendSuper2(&v4, sel__effectWithType_, 5);
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v2[2] = 0;
  v2[3] = 0;
  return (NSSymbolAppearEffect *)v2;
}

+ (NSSymbolAppearEffect)appearUpEffect
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "effect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_withStyle:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSymbolAppearEffect *)v3;
}

+ (NSSymbolAppearEffect)appearDownEffect
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "effect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_withStyle:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSymbolAppearEffect *)v3;
}

- (id)_withStyle:(int64_t)a3
{
  *((_QWORD *)self + 3) = a3;
  return self;
}

- (NSSymbolAppearEffect)effectWithByLayer
{
  _QWORD *v2;

  v2 = -[NSSymbolAppearEffect copyWithZone:](self, "copyWithZone:", 0);
  v2[2] = 1;
  return (NSSymbolAppearEffect *)v2;
}

- (NSSymbolAppearEffect)effectWithWholeSymbol
{
  _QWORD *v2;

  v2 = -[NSSymbolAppearEffect copyWithZone:](self, "copyWithZone:", 0);
  v2[2] = 2;
  return (NSSymbolAppearEffect *)v2;
}

- (id)_rbOptionsMutable
{
  void *v3;
  int64_t style;
  unsigned int v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_addLayerBehavior:ToOptions:", self->_layerBehavior, v3);
  style = self->_style;
  if (style == 2)
    v5 = 3;
  else
    v5 = 0;
  if (style == 1)
    v6 = 2;
  else
    v6 = v5;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BE7F310]);

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NSSymbolAppearEffect;
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
