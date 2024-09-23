@implementation NSSymbolReplaceContentTransition

+ (NSSymbolReplaceContentTransition)transition
{
  _QWORD *v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSSymbolReplaceContentTransition;
  objc_msgSendSuper2(&v4, sel__transitionWithType_, 7);
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v2[2] = 0;
  v2[3] = 0;
  return (NSSymbolReplaceContentTransition *)v2;
}

+ (NSSymbolReplaceContentTransition)replaceDownUpTransition
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "transition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_withStyle:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSymbolReplaceContentTransition *)v3;
}

+ (NSSymbolReplaceContentTransition)replaceUpUpTransition
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "transition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_withStyle:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSymbolReplaceContentTransition *)v3;
}

+ (NSSymbolReplaceContentTransition)replaceOffUpTransition
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "transition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_withStyle:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSymbolReplaceContentTransition *)v3;
}

- (id)_withStyle:(int64_t)a3
{
  *((_QWORD *)self + 3) = a3;
  return self;
}

- (NSSymbolReplaceContentTransition)transitionWithByLayer
{
  _QWORD *v2;

  v2 = -[NSSymbolReplaceContentTransition copyWithZone:](self, "copyWithZone:", 0);
  v2[2] = 1;
  return (NSSymbolReplaceContentTransition *)v2;
}

- (NSSymbolReplaceContentTransition)transitionWithWholeSymbol
{
  _QWORD *v2;

  v2 = -[NSSymbolReplaceContentTransition copyWithZone:](self, "copyWithZone:", 0);
  v2[2] = 2;
  return (NSSymbolReplaceContentTransition *)v2;
}

+ (id)magicTransitionWithFallback:(id)a3
{
  return +[NSSymbolMagicReplaceContentTransition transitionWithFallback:](NSSymbolMagicReplaceContentTransition, "transitionWithFallback:", a3);
}

- (id)_rbOptionsMutable
{
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSymbolEffect _addLayerBehavior:ToOptions:](NSSymbolEffect, "_addLayerBehavior:ToOptions:", self->_layerBehavior, v3);
  if ((unint64_t)(self->_style - 1) >= 3)
  {
    if (dyld_program_sdk_at_least())
      v4 = 0;
    else
      v4 = 96;
  }
  else
  {
    v4 = (LODWORD(self->_style) + 97);
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BE7F358]);

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NSSymbolReplaceContentTransition;
  result = -[NSSymbolContentTransition copyWithZone:](&v5, sel_copyWithZone_, a3);
  *((_QWORD *)result + 3) = self->_style;
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

- (int64_t)_style
{
  return self->_style;
}

- (void)set_style:(int64_t)a3
{
  self->_style = a3;
}

@end
