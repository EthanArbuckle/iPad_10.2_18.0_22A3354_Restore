@implementation LACDTOBiometryWatchdog

- (LACDTOBiometryWatchdog)initWithIsRunning:(BOOL)a3 time:(double)a4 minThreshold:(double)a5 maxThreshold:(double)a6
{
  LACDTOBiometryWatchdog *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)LACDTOBiometryWatchdog;
  result = -[LACDTOBiometryWatchdog init](&v11, sel_init);
  if (result)
  {
    result->_isRunning = a3;
    result->_time = a4;
    result->_minThreshold = a5;
    result->_maxThreshold = a6;
  }
  return result;
}

+ (id)nullInstance
{
  return -[LACDTOBiometryWatchdog initWithIsRunning:time:minThreshold:maxThreshold:]([LACDTOBiometryWatchdog alloc], "initWithIsRunning:time:minThreshold:maxThreshold:", 0, 0.0, 0.0, 0.0);
}

- (BOOL)isBarking
{
  _BOOL4 v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v3 = -[LACDTOBiometryWatchdog isRunning](self, "isRunning");
  if (v3)
  {
    -[LACDTOBiometryWatchdog time](self, "time");
    v5 = v4;
    -[LACDTOBiometryWatchdog minThreshold](self, "minThreshold");
    if (v5 >= v6)
    {
      -[LACDTOBiometryWatchdog time](self, "time");
      v8 = v7;
      -[LACDTOBiometryWatchdog maxThreshold](self, "maxThreshold");
      LOBYTE(v3) = v8 <= v9;
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _BOOL8 v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  id v15;

  v4 = a3;
  v5 = -[LACDTOBiometryWatchdog isRunning](self, "isRunning");
  NSStringFromSelector(sel_isRunning);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v5, v6);

  -[LACDTOBiometryWatchdog time](self, "time");
  v8 = v7;
  NSStringFromSelector(sel_time);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeDouble:forKey:", v9, v8);

  -[LACDTOBiometryWatchdog minThreshold](self, "minThreshold");
  v11 = v10;
  NSStringFromSelector(sel_minThreshold);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeDouble:forKey:", v12, v11);

  -[LACDTOBiometryWatchdog maxThreshold](self, "maxThreshold");
  v14 = v13;
  NSStringFromSelector(sel_maxThreshold);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeDouble:forKey:", v15, v14);

}

- (LACDTOBiometryWatchdog)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;

  v4 = a3;
  NSStringFromSelector(sel_isRunning);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeBoolForKey:", v5);

  NSStringFromSelector(sel_time);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", v7);
  v9 = v8;

  NSStringFromSelector(sel_minThreshold);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", v10);
  v12 = v11;

  NSStringFromSelector(sel_maxThreshold);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", v13);
  v15 = v14;

  return -[LACDTOBiometryWatchdog initWithIsRunning:time:minThreshold:maxThreshold:](self, "initWithIsRunning:time:minThreshold:maxThreshold:", v6, v9, v12, v15);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  _BOOL4 v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[5];

  v22[4] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = -[LACDTOBiometryWatchdog isRunning](self, "isRunning");
  v7 = CFSTR("NO");
  if (v6)
    v7 = CFSTR("YES");
  objc_msgSend(v5, "stringWithFormat:", CFSTR("isRunning: %@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v8;
  v9 = (void *)MEMORY[0x24BDD17C8];
  -[LACDTOBiometryWatchdog time](self, "time");
  objc_msgSend(v9, "stringWithFormat:", CFSTR("time: %.2f"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v11;
  v12 = (void *)MEMORY[0x24BDD17C8];
  -[LACDTOBiometryWatchdog minThreshold](self, "minThreshold");
  objc_msgSend(v12, "stringWithFormat:", CFSTR("minThreshold: %.2f"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v14;
  v15 = (void *)MEMORY[0x24BDD17C8];
  -[LACDTOBiometryWatchdog maxThreshold](self, "maxThreshold");
  objc_msgSend(v15, "stringWithFormat:", CFSTR("maxThreshold: %.2f"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "componentsJoinedByString:", CFSTR("; "));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p; %@>"), v4, self, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;
  double v15;
  double v16;
  double v17;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[LACDTOBiometryWatchdog isRunning](self, "isRunning");
    if (v6 == objc_msgSend(v5, "isRunning")
      && (-[LACDTOBiometryWatchdog time](self, "time"), v8 = v7, objc_msgSend(v5, "time"), v8 == v9)
      && (-[LACDTOBiometryWatchdog minThreshold](self, "minThreshold"),
          v11 = v10,
          objc_msgSend(v5, "minThreshold"),
          v11 == v12))
    {
      -[LACDTOBiometryWatchdog maxThreshold](self, "maxThreshold");
      v16 = v15;
      objc_msgSend(v5, "maxThreshold");
      v13 = v16 == v17;
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (double)time
{
  return self->_time;
}

- (double)minThreshold
{
  return self->_minThreshold;
}

- (double)maxThreshold
{
  return self->_maxThreshold;
}

@end
