@implementation NSSymbolMagicReplaceContentTransition

+ (id)transition
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___NSSymbolMagicReplaceContentTransition;
  objc_msgSendSuper2(&v3, sel__transitionWithType_, 11);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)transitionWithFallback:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "transition");
  v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5[2];
  v5[2] = v4;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NSSymbolMagicReplaceContentTransition;
  v5 = -[NSSymbolContentTransition copyWithZone:](&v10, sel_copyWithZone_);
  -[NSSymbolMagicReplaceContentTransition _fallback](self, "_fallback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "copyWithZone:", a3);
  v8 = (void *)v5[2];
  v5[2] = v7;

  return v5;
}

- (id)_rbOptionsMutable
{
  void *v3;
  int64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSymbolEffect _addLayerBehavior:ToOptions:](NSSymbolEffect, "_addLayerBehavior:ToOptions:", -[NSSymbolReplaceContentTransition _layerBehavior](self->_fallback, "_layerBehavior"), v3);
  v4 = -[NSSymbolReplaceContentTransition _style](self->_fallback, "_style");
  if ((unint64_t)(v4 - 1) >= 3)
    v5 = 0;
  else
    v5 = (v4 + 1);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BE7F358]);

  return v3;
}

- (NSSymbolReplaceContentTransition)_fallback
{
  return self->_fallback;
}

- (void)set_fallback:(id)a3
{
  objc_storeStrong((id *)&self->_fallback, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallback, 0);
}

@end
