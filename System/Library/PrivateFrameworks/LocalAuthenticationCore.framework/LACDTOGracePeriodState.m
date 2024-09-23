@implementation LACDTOGracePeriodState

- (LACDTOGracePeriodState)initWithTime:(double)a3 maxThreshold:(double)a4
{
  LACDTOGracePeriodState *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)LACDTOGracePeriodState;
  result = -[LACDTOGracePeriodState init](&v7, sel_init);
  if (result)
  {
    result->_time = a3;
    result->_maxThreshold = a4;
  }
  return result;
}

- (BOOL)isActive
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[LACDTOGracePeriodState maxThreshold](self, "maxThreshold");
  if (v3 <= 0.0)
    return 0;
  -[LACDTOGracePeriodState time](self, "time");
  if (v4 <= 0.0)
    return 0;
  -[LACDTOGracePeriodState time](self, "time");
  v6 = v5;
  -[LACDTOGracePeriodState maxThreshold](self, "maxThreshold");
  return v6 <= v7;
}

- (double)duration
{
  _BOOL4 v3;
  double result;
  double v5;
  double v6;
  double v7;

  v3 = -[LACDTOGracePeriodState isActive](self, "isActive");
  result = 0.0;
  if (v3)
  {
    -[LACDTOGracePeriodState maxThreshold](self, "maxThreshold", 0.0);
    v6 = v5;
    -[LACDTOGracePeriodState time](self, "time");
    return fmax(v6 - v7, 0.0);
  }
  return result;
}

+ (id)nullInstance
{
  return -[LACDTOGracePeriodState initWithTime:maxThreshold:]([LACDTOGracePeriodState alloc], "initWithTime:maxThreshold:", 0.0, 0.0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  id v10;

  v4 = a3;
  -[LACDTOGracePeriodState time](self, "time");
  v6 = v5;
  NSStringFromSelector(sel_time);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeDouble:forKey:", v7, v6);

  -[LACDTOGracePeriodState maxThreshold](self, "maxThreshold");
  v9 = v8;
  NSStringFromSelector(sel_maxThreshold);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeDouble:forKey:", v10, v9);

}

- (LACDTOGracePeriodState)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;

  v4 = a3;
  NSStringFromSelector(sel_time);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", v5);
  v7 = v6;

  NSStringFromSelector(sel_maxThreshold);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", v8);
  v10 = v9;

  return -[LACDTOGracePeriodState initWithTime:maxThreshold:](self, "initWithTime:maxThreshold:", v7, v10);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  BOOL v9;
  double v10;
  double v11;
  double v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[LACDTOGracePeriodState time](self, "time");
    v7 = v6;
    objc_msgSend(v5, "time");
    if (v7 == v8)
    {
      -[LACDTOGracePeriodState maxThreshold](self, "maxThreshold");
      v11 = v10;
      objc_msgSend(v5, "maxThreshold");
      v9 = v11 == v12;
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

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  void *v24;
  _QWORD v25[5];

  v25[4] = *MEMORY[0x24BDAC8D0];
  v24 = (void *)MEMORY[0x24BDD17C8];
  v23 = objc_opt_class();
  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (void *)MEMORY[0x24BDD16E0];
  -[LACDTOGracePeriodState time](self, "time");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("time: %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v6;
  v7 = (void *)MEMORY[0x24BDD17C8];
  v8 = (void *)MEMORY[0x24BDD16E0];
  -[LACDTOGracePeriodState maxThreshold](self, "maxThreshold");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("maxThreshold: %@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v10;
  v11 = (void *)MEMORY[0x24BDD17C8];
  v12 = -[LACDTOGracePeriodState isActive](self, "isActive");
  v13 = CFSTR("NO");
  if (v12)
    v13 = CFSTR("YES");
  objc_msgSend(v11, "stringWithFormat:", CFSTR("isActive: %@"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v14;
  v15 = (void *)MEMORY[0x24BDD17C8];
  v16 = (void *)MEMORY[0x24BDD16E0];
  -[LACDTOGracePeriodState duration](self, "duration");
  objc_msgSend(v16, "numberWithDouble:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("duration: %@"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "componentsJoinedByString:", CFSTR("; "));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringWithFormat:", CFSTR("<%@ %p; %@>"), v23, self, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (double)time
{
  return self->_time;
}

- (double)maxThreshold
{
  return self->_maxThreshold;
}

@end
