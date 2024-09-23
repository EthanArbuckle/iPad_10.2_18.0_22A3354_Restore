@implementation NSSymbolEffectOptionsRepeatBehavior

+ (id)behavior
{
  uint64_t v2;
  void *v3;

  v2 = objc_opt_new();
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 24) = 1;
  *(_QWORD *)(v2 + 32) = 0;

  *(_QWORD *)(v2 + 16) = 0;
  *(_BYTE *)(v2 + 8) = 0;
  return (id)v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_opt_class();
  v4 = objc_opt_new();
  *(_QWORD *)(v4 + 24) = -[NSSymbolEffectOptionsRepeatBehavior _repeatCount](self, "_repeatCount");
  -[NSSymbolEffectOptionsRepeatBehavior _repeatDelay](self, "_repeatDelay");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = v5;

  *(_QWORD *)(v4 + 16) = -[NSSymbolEffectOptionsRepeatBehavior _repeatBehavior](self, "_repeatBehavior");
  *(_BYTE *)(v4 + 8) = -[NSSymbolEffectOptionsRepeatBehavior _prefersContinuous](self, "_prefersContinuous");
  return (id)v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", -[NSSymbolEffectOptionsRepeatBehavior _repeatBehavior](self, "_repeatBehavior"), CFSTR("_repeatBehavior"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[NSSymbolEffectOptionsRepeatBehavior _repeatCount](self, "_repeatCount"), CFSTR("_repeatCount"));
  -[NSSymbolEffectOptionsRepeatBehavior _repeatDelay](self, "_repeatDelay");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("_repeatDelay"));

  objc_msgSend(v5, "encodeBool:forKey:", -[NSSymbolEffectOptionsRepeatBehavior _prefersContinuous](self, "_prefersContinuous"), CFSTR("_prefersContinuous"));
}

- (NSSymbolEffectOptionsRepeatBehavior)initWithCoder:(id)a3
{
  id v4;
  NSSymbolEffectOptionsRepeatBehavior *v5;
  void *v6;
  NSSymbolEffectOptionsRepeatBehavior *v7;

  v4 = a3;
  objc_opt_class();
  v5 = (NSSymbolEffectOptionsRepeatBehavior *)objc_opt_new();

  if (v5)
  {
    -[NSSymbolEffectOptionsRepeatBehavior set_repeatBehavior:](v5, "set_repeatBehavior:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_repeatBehavior")));
    -[NSSymbolEffectOptionsRepeatBehavior set_repeatCount:](v5, "set_repeatCount:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_repeatCount")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_repeatDelay"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSSymbolEffectOptionsRepeatBehavior set_repeatDelay:](v5, "set_repeatDelay:", v6);

    -[NSSymbolEffectOptionsRepeatBehavior set_prefersContinuous:](v5, "set_prefersContinuous:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_prefersContinuous")));
    v7 = v5;
  }

  return v5;
}

+ (id)behaviorContinuous
{
  uint64_t v2;
  void *v3;

  objc_msgSend(a1, "behavior");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 24) = 1;
  *(_QWORD *)(v2 + 32) = 0;

  *(_QWORD *)(v2 + 16) = 1;
  *(_BYTE *)(v2 + 8) = 1;
  return (id)v2;
}

+ (id)behaviorPeriodic
{
  uint64_t v2;
  void *v3;

  objc_msgSend(a1, "behavior");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 24) = 1;
  *(_QWORD *)(v2 + 32) = 0;

  *(_QWORD *)(v2 + 16) = 1;
  *(_BYTE *)(v2 + 8) = 0;
  return (id)v2;
}

+ (id)behaviorPeriodicWithCount:(int64_t)a3
{
  uint64_t v4;
  void *v5;

  objc_msgSend(a1, "behavior");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 24) = a3;
  *(_QWORD *)(v4 + 32) = 0;

  *(_QWORD *)(v4 + 16) = 2;
  *(_BYTE *)(v4 + 8) = 0;
  return (id)v4;
}

+ (id)behaviorPeriodicWithDelay:(double)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(a1, "behavior");
  v4 = objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(v4 + 24) = 1;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = v5;

  *(_QWORD *)(v4 + 16) = 1;
  *(_BYTE *)(v4 + 8) = 0;
  return (id)v4;
}

+ (id)behaviorPeriodicWithCount:(int64_t)a3 delay:(double)a4
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a1, "behavior");
  v6 = objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(v6 + 24) = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v7;

  *(_QWORD *)(v6 + 16) = 2;
  *(_BYTE *)(v6 + 8) = 0;
  return (id)v6;
}

- (int64_t)_repeatBehavior
{
  return self->_repeatBehavior;
}

- (void)set_repeatBehavior:(int64_t)a3
{
  self->_repeatBehavior = a3;
}

- (int64_t)_repeatCount
{
  return self->_repeatCount;
}

- (void)set_repeatCount:(int64_t)a3
{
  self->_repeatCount = a3;
}

- (NSNumber)_repeatDelay
{
  return self->_repeatDelay;
}

- (void)set_repeatDelay:(id)a3
{
  objc_storeStrong((id *)&self->_repeatDelay, a3);
}

- (BOOL)_prefersContinuous
{
  return self->_prefersContinuous;
}

- (void)set_prefersContinuous:(BOOL)a3
{
  self->_prefersContinuous = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_repeatDelay, 0);
}

@end
