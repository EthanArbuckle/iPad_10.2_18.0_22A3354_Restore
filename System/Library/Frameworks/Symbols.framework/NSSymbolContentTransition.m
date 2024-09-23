@implementation NSSymbolContentTransition

+ (id)_transitionWithType:(int64_t)a3
{
  _QWORD *v4;

  v4 = (_QWORD *)objc_opt_new();
  v4[1] = a3;
  return v4;
}

- (id)_rbAnimation
{
  int64_t v2;
  void *v3;

  v2 = -[NSSymbolContentTransition _effectType](self, "_effectType");
  if (v2 == 11 || v2 == 7)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)_rbOptionsMutable
{
  return (id)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
}

- (id)_rbOptionsWithEffectOptions:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[NSSymbolContentTransition _rbOptionsMutable](self, "_rbOptionsMutable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSSymbolEffect _mergeEffectOptions:intoRBOptions:forEffect:](NSSymbolEffect, "_mergeEffectOptions:intoRBOptions:forEffect:", v4, v5, -[NSSymbolContentTransition _effectType](self, "_effectType"));

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;

  objc_opt_class();
  v4 = (_QWORD *)objc_opt_new();
  v4[1] = -[NSSymbolContentTransition _effectType](self, "_effectType");
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[NSSymbolContentTransition _effectType](self, "_effectType"), CFSTR("_effectType"));

}

- (NSSymbolContentTransition)initWithCoder:(id)a3
{
  id v4;
  NSSymbolContentTransition *v5;

  v4 = a3;
  objc_opt_class();
  v5 = (NSSymbolContentTransition *)objc_opt_new();

  if (v5)
    v5->_effectType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_effectType"));

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)_effectType
{
  return self->_effectType;
}

@end
