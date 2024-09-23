@implementation NSSymbolVariableColorEffect

+ (NSSymbolVariableColorEffect)effect
{
  _QWORD *v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSSymbolVariableColorEffect;
  objc_msgSendSuper2(&v4, sel__effectWithType_, 1);
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v2[2] = 0;
  v2[3] = 0;
  v2[4] = 0;
  return (NSSymbolVariableColorEffect *)v2;
}

- (NSSymbolVariableColorEffect)effectWithIterative
{
  _QWORD *v2;

  v2 = -[NSSymbolVariableColorEffect copyWithZone:](self, "copyWithZone:", 0);
  v2[4] = 1;
  return (NSSymbolVariableColorEffect *)v2;
}

- (NSSymbolVariableColorEffect)effectWithCumulative
{
  _QWORD *v2;

  v2 = -[NSSymbolVariableColorEffect copyWithZone:](self, "copyWithZone:", 0);
  v2[4] = 2;
  return (NSSymbolVariableColorEffect *)v2;
}

- (NSSymbolVariableColorEffect)effectWithReversing
{
  _QWORD *v2;

  v2 = -[NSSymbolVariableColorEffect copyWithZone:](self, "copyWithZone:", 0);
  v2[3] = 1;
  return (NSSymbolVariableColorEffect *)v2;
}

- (NSSymbolVariableColorEffect)effectWithNonReversing
{
  _QWORD *v2;

  v2 = -[NSSymbolVariableColorEffect copyWithZone:](self, "copyWithZone:", 0);
  v2[3] = 2;
  return (NSSymbolVariableColorEffect *)v2;
}

- (NSSymbolVariableColorEffect)effectWithHideInactiveLayers
{
  _QWORD *v2;

  v2 = -[NSSymbolVariableColorEffect copyWithZone:](self, "copyWithZone:", 0);
  v2[2] = 1;
  return (NSSymbolVariableColorEffect *)v2;
}

- (NSSymbolVariableColorEffect)effectWithDimInactiveLayers
{
  _QWORD *v2;

  v2 = -[NSSymbolVariableColorEffect copyWithZone:](self, "copyWithZone:", 0);
  v2[2] = 2;
  return (NSSymbolVariableColorEffect *)v2;
}

- (id)_rbOptionsMutable
{
  void *v3;
  unsigned int v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self->_fillStyle == 1;
  if (self->_playbackStyle == 1)
    v4 |= 8u;
  if (self->_inactiveStyle == 1)
    v5 = v4 | 2;
  else
    v5 = v4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BE7F378]);

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NSSymbolVariableColorEffect;
  result = -[NSSymbolEffect copyWithZone:](&v5, sel_copyWithZone_, a3);
  *((_QWORD *)result + 2) = self->_inactiveStyle;
  *((_QWORD *)result + 3) = self->_playbackStyle;
  *((_QWORD *)result + 4) = self->_fillStyle;
  return result;
}

- (int64_t)_inactiveStyle
{
  return self->_inactiveStyle;
}

- (void)set_inactiveStyle:(int64_t)a3
{
  self->_inactiveStyle = a3;
}

- (int64_t)_playbackStyle
{
  return self->_playbackStyle;
}

- (void)set_playbackStyle:(int64_t)a3
{
  self->_playbackStyle = a3;
}

- (int64_t)_fillStyle
{
  return self->_fillStyle;
}

- (void)set_fillStyle:(int64_t)a3
{
  self->_fillStyle = a3;
}

@end
