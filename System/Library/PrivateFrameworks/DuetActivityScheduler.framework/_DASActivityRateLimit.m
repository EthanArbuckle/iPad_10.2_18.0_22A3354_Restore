@implementation _DASActivityRateLimit

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_DASActivityRateLimit)initWithMaximum:(unint64_t)a3 perWindow:(double)a4
{
  _DASActivityRateLimit *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_DASActivityRateLimit;
  result = -[_DASActivityRateLimit init](&v7, sel_init);
  if (result)
  {
    result->_maximum = a3;
    result->_window = a4;
  }
  return result;
}

+ (id)rateLimitWithMaximum:(unint64_t)a3 perWindow:(double)a4
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithMaximum:perWindow:", a3, a4);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<Limit: %llu per %lfs>"), self->_maximum, *(_QWORD *)&self->_window);
}

- (BOOL)isEqual:(id)a3
{
  _DASActivityRateLimit *v4;
  _DASActivityRateLimit *v5;
  unint64_t maximum;
  double window;
  double v8;
  BOOL v9;

  v4 = (_DASActivityRateLimit *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      maximum = self->_maximum;
      if (maximum == -[_DASActivityRateLimit maximum](v5, "maximum"))
      {
        window = self->_window;
        -[_DASActivityRateLimit window](v5, "window");
        v9 = window == v8;
      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  unint64_t maximum;
  id v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  maximum = self->_maximum;
  v6 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", maximum);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("maximum"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_window);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("window"));

}

- (_DASActivityRateLimit)initWithCoder:(id)a3
{
  id v4;
  _DASActivityRateLimit *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  double v10;
  _DASActivityRateLimit *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_DASActivityRateLimit;
  v5 = -[_DASActivityRateLimit init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("maximum"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("window"));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v6)
      v9 = v7 == 0;
    else
      v9 = 1;
    if (v9)
    {
      v11 = 0;
    }
    else
    {
      v5->_maximum = objc_msgSend(v6, "unsignedIntValue");
      objc_msgSend(v8, "doubleValue");
      v5->_window = v10;
      v11 = v5;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)maximum
{
  return self->_maximum;
}

- (void)setMaximum:(unint64_t)a3
{
  self->_maximum = a3;
}

- (double)window
{
  return self->_window;
}

- (void)setWindow:(double)a3
{
  self->_window = a3;
}

@end
