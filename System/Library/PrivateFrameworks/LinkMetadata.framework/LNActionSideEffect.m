@implementation LNActionSideEffect

- (LNActionSideEffect)initWithSideEffect:(int64_t)a3 changeEffect:(int64_t)a4
{
  LNActionSideEffect *v6;
  LNActionSideEffect *v7;
  LNActionSideEffect *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)LNActionSideEffect;
  v6 = -[LNActionSideEffect init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_effect = a3;
    v6->_changeEffect = a4;
    v8 = v6;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[LNActionSideEffect effect](self, "effect"), CFSTR("effect"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[LNActionSideEffect changeEffect](self, "changeEffect"), CFSTR("changeEffect"));

}

- (LNActionSideEffect)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("effect"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("changeEffect"));

  return -[LNActionSideEffect initWithSideEffect:changeEffect:](self, "initWithSideEffect:changeEffect:", v5, v6);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  int64_t v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[LNActionSideEffect effect](self, "effect");
  v7 = CFSTR("Unknown");
  if (!v6)
    v7 = CFSTR("None");
  if (v6 == 1)
    v7 = CFSTR("Change");
  v8 = v7;
  LNChangeEffectAsString(-[LNActionSideEffect changeEffect](self, "changeEffect"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, change: %@, effects: %@>"), v5, self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (unint64_t)hash
{
  int64_t v3;

  v3 = -[LNActionSideEffect effect](self, "effect");
  return -[LNActionSideEffect changeEffect](self, "changeEffect") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  LNActionSideEffect *v4;
  LNActionSideEffect *v5;
  LNActionSideEffect *v6;
  int64_t v7;
  int64_t v8;
  BOOL v9;

  v4 = (LNActionSideEffect *)a3;
  v5 = v4;
  if (self == v4)
  {
    v9 = 1;
    goto LABEL_10;
  }
  v6 = v4;
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v6 = 0;
    goto LABEL_7;
  }
  v7 = -[LNActionSideEffect effect](self, "effect");
  if (v7 != -[LNActionSideEffect effect](v6, "effect"))
  {
LABEL_7:
    v9 = 0;
    goto LABEL_8;
  }
  v8 = -[LNActionSideEffect changeEffect](self, "changeEffect");
  v9 = v8 == -[LNActionSideEffect changeEffect](v6, "changeEffect");
LABEL_8:

LABEL_10:
  return v9;
}

- (int64_t)effect
{
  return self->_effect;
}

- (int64_t)changeEffect
{
  return self->_changeEffect;
}

+ (id)unknownSideEffect
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSideEffect:changeEffect:", -1, -1);
}

+ (id)noneSideEffect
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSideEffect:changeEffect:", 0, 0);
}

+ (id)sideEffectWithChangeEffect:(int64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSideEffect:changeEffect:", 1, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
