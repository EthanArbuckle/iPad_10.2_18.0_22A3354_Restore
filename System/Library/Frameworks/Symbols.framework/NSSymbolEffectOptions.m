@implementation NSSymbolEffectOptions

+ (NSSymbolEffectOptions)options
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "set_speed:", 1.0);
  objc_msgSend(v2, "set_repeatBehavior:", 0);
  objc_msgSend(v2, "set_prefersContinuous:", 0);
  objc_msgSend(v2, "set_repeatCount:", 1);
  objc_msgSend(v2, "set_repeatDelay:", 0);
  return (NSSymbolEffectOptions *)v2;
}

+ (NSSymbolEffectOptions)optionsWithRepeating
{
  void *v2;

  objc_msgSend(a1, "options");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "set_repeatBehavior:", 1);
  return (NSSymbolEffectOptions *)v2;
}

- (NSSymbolEffectOptions)optionsWithRepeating
{
  id v2;

  v2 = -[NSSymbolEffectOptions copyWithZone:](self, "copyWithZone:", 0);
  objc_msgSend(v2, "set_repeatBehavior:", 1);
  objc_msgSend(v2, "set_prefersContinuous:", 0);
  return (NSSymbolEffectOptions *)v2;
}

+ (NSSymbolEffectOptions)optionsWithNonRepeating
{
  void *v2;

  objc_msgSend(a1, "options");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "set_repeatBehavior:", 2);
  return (NSSymbolEffectOptions *)v2;
}

- (NSSymbolEffectOptions)optionsWithNonRepeating
{
  id v2;

  v2 = -[NSSymbolEffectOptions copyWithZone:](self, "copyWithZone:", 0);
  objc_msgSend(v2, "set_repeatBehavior:", 2);
  objc_msgSend(v2, "set_repeatCount:", 1);
  objc_msgSend(v2, "set_prefersContinuous:", 0);
  return (NSSymbolEffectOptions *)v2;
}

+ (NSSymbolEffectOptions)optionsWithRepeatCount:(NSInteger)count
{
  void *v4;

  objc_msgSend(a1, "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "set_repeatBehavior:", 2);
  objc_msgSend(v4, "set_repeatCount:", count);
  return (NSSymbolEffectOptions *)v4;
}

- (NSSymbolEffectOptions)optionsWithRepeatCount:(NSInteger)count
{
  id v4;

  v4 = -[NSSymbolEffectOptions copyWithZone:](self, "copyWithZone:", 0);
  objc_msgSend(v4, "set_repeatBehavior:", 2);
  objc_msgSend(v4, "set_repeatCount:", count);
  objc_msgSend(v4, "set_prefersContinuous:", 0);
  return (NSSymbolEffectOptions *)v4;
}

+ (NSSymbolEffectOptions)optionsWithSpeed:(double)speed
{
  void *v4;

  objc_msgSend(a1, "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "set_speed:", speed);
  return (NSSymbolEffectOptions *)v4;
}

- (NSSymbolEffectOptions)optionsWithSpeed:(double)speed
{
  id v4;

  v4 = -[NSSymbolEffectOptions copyWithZone:](self, "copyWithZone:", 0);
  objc_msgSend(v4, "set_speed:", speed);
  return (NSSymbolEffectOptions *)v4;
}

+ (NSSymbolEffectOptions)optionsWithRepeatingDelay:(double)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "set_repeatBehavior:", 1);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "set_repeatDelay:", v5);

  objc_msgSend(v4, "set_prefersContinuous:", 0);
  return (NSSymbolEffectOptions *)v4;
}

- (NSSymbolEffectOptions)optionsWithRepeatingDelay:(double)a3
{
  id v4;
  void *v5;

  v4 = -[NSSymbolEffectOptions copyWithZone:](self, "copyWithZone:", 0);
  objc_msgSend(v4, "set_repeatBehavior:", 1);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "set_repeatDelay:", v5);

  objc_msgSend(v4, "set_prefersContinuous:", 0);
  return (NSSymbolEffectOptions *)v4;
}

+ (NSSymbolEffectOptions)optionsWithRepeatCount:(int64_t)a3 delay:(double)a4
{
  void *v6;
  void *v7;

  objc_msgSend(a1, "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "set_repeatBehavior:", 2);
  objc_msgSend(v6, "set_repeatCount:", a3);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "set_repeatDelay:", v7);

  objc_msgSend(v6, "set_prefersContinuous:", 0);
  return (NSSymbolEffectOptions *)v6;
}

- (NSSymbolEffectOptions)optionsWithRepeatCount:(int64_t)a3 delay:(double)a4
{
  id v6;
  void *v7;

  v6 = -[NSSymbolEffectOptions copyWithZone:](self, "copyWithZone:", 0);
  objc_msgSend(v6, "set_repeatBehavior:", 2);
  objc_msgSend(v6, "set_repeatCount:", a3);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "set_repeatDelay:", v7);

  objc_msgSend(v6, "set_prefersContinuous:", 0);
  return (NSSymbolEffectOptions *)v6;
}

+ (id)_optionsWithRepeatStyle:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "_backing");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "optionsWithRepeatBehavior:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_optionsWithRepeatStyle:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "_backing");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSSymbolEffectOptions optionsWithRepeatBehavior:](self, "optionsWithRepeatBehavior:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (NSSymbolEffectOptions)optionsWithRepeatBehavior:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a1, "options");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "set_repeatBehavior:", objc_msgSend(v4, "_repeatBehavior"));
  objc_msgSend(v5, "set_repeatCount:", objc_msgSend(v4, "_repeatCount"));
  objc_msgSend(v4, "_repeatDelay");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "set_repeatDelay:", v6);

  v7 = objc_msgSend(v4, "_prefersContinuous");
  objc_msgSend(v5, "set_prefersContinuous:", v7);
  return (NSSymbolEffectOptions *)v5;
}

- (NSSymbolEffectOptions)optionsWithRepeatBehavior:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  v5 = (void *)-[NSSymbolEffectOptions copy](self, "copy");
  objc_msgSend(v5, "set_repeatBehavior:", objc_msgSend(v4, "_repeatBehavior"));
  objc_msgSend(v5, "set_repeatCount:", objc_msgSend(v4, "_repeatCount"));
  objc_msgSend(v4, "_repeatDelay");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "set_repeatDelay:", v6);

  v7 = objc_msgSend(v4, "_prefersContinuous");
  objc_msgSend(v5, "set_prefersContinuous:", v7);
  return (NSSymbolEffectOptions *)v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend((id)objc_opt_class(), "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSSymbolEffectOptions _speed](self, "_speed");
  objc_msgSend(v4, "set_speed:");
  objc_msgSend(v4, "set_prefersContinuous:", -[NSSymbolEffectOptions _prefersContinuous](self, "_prefersContinuous"));
  objc_msgSend(v4, "set_repeatBehavior:", -[NSSymbolEffectOptions _repeatBehavior](self, "_repeatBehavior"));
  objc_msgSend(v4, "set_repeatCount:", -[NSSymbolEffectOptions _repeatCount](self, "_repeatCount"));
  -[NSSymbolEffectOptions _repeatDelay](self, "_repeatDelay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copyWithZone:", 0);
  objc_msgSend(v4, "set_repeatDelay:", v6);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[NSSymbolEffectOptions _speed](self, "_speed");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_speed"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[NSSymbolEffectOptions _repeatBehavior](self, "_repeatBehavior"), CFSTR("_repeatBehavior"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[NSSymbolEffectOptions _repeatCount](self, "_repeatCount"), CFSTR("_repeatCount"));
  -[NSSymbolEffectOptions _repeatDelay](self, "_repeatDelay");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("_repeatDelay"));

  objc_msgSend(v5, "encodeBool:forKey:", -[NSSymbolEffectOptions _prefersContinuous](self, "_prefersContinuous"), CFSTR("_prefersContinuous"));
}

- (NSSymbolEffectOptions)initWithCoder:(id)a3
{
  id v4;
  NSSymbolEffectOptions *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_opt_class();
  v5 = (NSSymbolEffectOptions *)objc_opt_new();

  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_speed"));
    -[NSSymbolEffectOptions set_speed:](v5, "set_speed:");
    -[NSSymbolEffectOptions set_repeatBehavior:](v5, "set_repeatBehavior:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_repeatBehavior")));
    -[NSSymbolEffectOptions set_repeatCount:](v5, "set_repeatCount:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_repeatCount")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_repeatDelay"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSSymbolEffectOptions set_repeatDelay:](v5, "set_repeatDelay:", v6);

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("_prefersContinuous")))
      v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_prefersContinuous"));
    else
      v7 = 0;
    -[NSSymbolEffectOptions set_prefersContinuous:](v5, "set_prefersContinuous:", v7);
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (double)_speed
{
  return self->_speed;
}

- (void)set_speed:(double)a3
{
  self->_speed = a3;
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
