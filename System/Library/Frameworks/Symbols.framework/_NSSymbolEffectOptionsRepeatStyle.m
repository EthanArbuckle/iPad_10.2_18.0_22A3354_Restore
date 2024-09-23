@implementation _NSSymbolEffectOptionsRepeatStyle

+ (id)style
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;

  v2 = (_QWORD *)objc_opt_new();
  +[NSSymbolEffectOptionsRepeatBehavior behavior](NSSymbolEffectOptionsRepeatBehavior, "behavior");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v2[1];
  v2[1] = v3;

  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;

  objc_opt_class();
  v4 = (_QWORD *)objc_opt_new();
  v5 = -[NSSymbolEffectOptionsRepeatBehavior copy](self->_backing, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  NSSymbolEffectOptionsRepeatBehavior *backing;
  void *v5;
  id v6;

  backing = self->_backing;
  v6 = a3;
  objc_msgSend(v6, "encodeInteger:forKey:", -[NSSymbolEffectOptionsRepeatBehavior _repeatBehavior](backing, "_repeatBehavior"), CFSTR("_repeatBehavior"));
  objc_msgSend(v6, "encodeInteger:forKey:", -[NSSymbolEffectOptionsRepeatBehavior _repeatCount](self->_backing, "_repeatCount"), CFSTR("_repeatCount"));
  -[NSSymbolEffectOptionsRepeatBehavior _repeatDelay](self->_backing, "_repeatDelay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("_repeatDelay"));

  objc_msgSend(v6, "encodeBool:forKey:", -[NSSymbolEffectOptionsRepeatBehavior _prefersContinuous](self->_backing, "_prefersContinuous"), CFSTR("_prefersContinuous"));
}

- (_NSSymbolEffectOptionsRepeatStyle)initWithCoder:(id)a3
{
  id v4;
  _QWORD *v5;
  NSSymbolEffectOptionsRepeatBehavior *v6;
  void *v7;
  _NSSymbolEffectOptionsRepeatStyle *v8;

  v4 = a3;
  objc_opt_class();
  v5 = (_QWORD *)objc_opt_new();

  if (v5
    && (v6 = -[NSSymbolEffectOptionsRepeatBehavior initWithCoder:]([NSSymbolEffectOptionsRepeatBehavior alloc], "initWithCoder:", v4)) != 0)
  {
    v7 = (void *)v5[1];
    v5[1] = v6;

    v8 = v5;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)styleContinuous
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;

  v2 = (_QWORD *)objc_opt_new();
  +[NSSymbolEffectOptionsRepeatBehavior behaviorContinuous](NSSymbolEffectOptionsRepeatBehavior, "behaviorContinuous");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v2[1];
  v2[1] = v3;

  return v2;
}

+ (id)stylePeriodic
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;

  v2 = (_QWORD *)objc_opt_new();
  +[NSSymbolEffectOptionsRepeatBehavior behaviorPeriodic](NSSymbolEffectOptionsRepeatBehavior, "behaviorPeriodic");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v2[1];
  v2[1] = v3;

  return v2;
}

+ (id)stylePeriodicWithCount:(int64_t)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;

  v4 = (_QWORD *)objc_opt_new();
  +[NSSymbolEffectOptionsRepeatBehavior behaviorPeriodicWithCount:](NSSymbolEffectOptionsRepeatBehavior, "behaviorPeriodicWithCount:", a3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

+ (id)stylePeriodicWithDelay:(double)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;

  v4 = (_QWORD *)objc_opt_new();
  +[NSSymbolEffectOptionsRepeatBehavior behaviorPeriodicWithDelay:](NSSymbolEffectOptionsRepeatBehavior, "behaviorPeriodicWithDelay:", a3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

+ (id)stylePeriodicWithCount:(int64_t)a3 delay:(double)a4
{
  _QWORD *v6;
  uint64_t v7;
  void *v8;

  v6 = (_QWORD *)objc_opt_new();
  +[NSSymbolEffectOptionsRepeatBehavior behaviorPeriodicWithCount:delay:](NSSymbolEffectOptionsRepeatBehavior, "behaviorPeriodicWithCount:delay:", a3, a4);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (NSSymbolEffectOptionsRepeatBehavior)_backing
{
  return self->_backing;
}

- (void)set_backing:(id)a3
{
  objc_storeStrong((id *)&self->_backing, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backing, 0);
}

@end
