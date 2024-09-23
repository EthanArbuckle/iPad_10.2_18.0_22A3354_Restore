@implementation HMIConfidence

- (HMIConfidence)initWithValue:(double)a3 levelThresholds:(id)a4
{
  id v7;
  HMIConfidence *v8;
  HMIConfidence *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMIConfidence;
  v8 = -[HMIConfidence init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_value = a3;
    objc_storeStrong((id *)&v8->_levelThresholds, a4);
  }

  return v9;
}

- (int64_t)level
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  int64_t v14;

  -[HMIConfidence value](self, "value");
  v4 = v3;
  -[HMIConfidence levelThresholds](self, "levelThresholds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  if (v4 >= v8)
    return 2;
  -[HMIConfidence value](self, "value");
  v10 = v9;
  -[HMIConfidence levelThresholds](self, "levelThresholds");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v14 = v10 >= v13;

  return v14;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.4f"), *(_QWORD *)&self->_value);
}

- (id)shortDescription
{
  void *v2;
  double value;
  int64_t v4;
  const __CFString *v5;
  __CFString *v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  value = self->_value;
  v4 = -[HMIConfidence level](self, "level");
  v5 = CFSTR("Low");
  if (v4 == 1)
    v5 = CFSTR("Medium");
  if (v4 == 2)
    v6 = CFSTR("High");
  else
    v6 = (__CFString *)v5;
  return (id)objc_msgSend(v2, "stringWithFormat:", CFSTR("%.2f[%c]"), *(_QWORD *)&value, -[__CFString characterAtIndex:](v6, "characterAtIndex:", 0));
}

- (BOOL)isEqual:(id)a3
{
  HMIConfidence *v4;
  HMIConfidence *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;

  v4 = (HMIConfidence *)a3;
  if (v4 == self)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[HMIConfidence value](self, "value");
      v7 = v6;
      -[HMIConfidence value](v5, "value");
      v9 = v8;
      -[HMIConfidence levelThresholds](self, "levelThresholds");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMIConfidence levelThresholds](v5, "levelThresholds");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = HMFEqualObjects();
      if (v7 == v9)
        v13 = v12;
      else
        v13 = 0;
    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  double v2;
  double v3;
  long double v4;
  double v5;
  double v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  -[HMIConfidence value](self, "value");
  v3 = -v2;
  if (v2 >= 0.0)
    v3 = v2;
  v4 = floor(v3 + 0.5);
  v5 = (v3 - v4) * 1.84467441e19;
  v6 = fmod(v4, 1.84467441e19);
  v7 = 2654435761u * (unint64_t)v6;
  v8 = v7 + (unint64_t)v5;
  if (v5 <= 0.0)
    v8 = 2654435761u * (unint64_t)v6;
  v9 = v7 - (unint64_t)fabs(v5);
  if (v5 < 0.0)
    return v9;
  else
    return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMIConfidence)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMIConfidence *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  NSStringFromSelector(sel_value);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", v5);
  v7 = v6;

  v8 = (void *)MEMORY[0x24BDBCF20];
  v15[0] = objc_opt_class();
  v15[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_levelThresholds);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[HMIConfidence initWithValue:levelThresholds:]([HMIConfidence alloc], "initWithValue:levelThresholds:", v12, v7);
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[HMIConfidence value](self, "value");
  v6 = v5;
  NSStringFromSelector(sel_value);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeDouble:forKey:", v7, v6);

  -[HMIConfidence levelThresholds](self, "levelThresholds");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_levelThresholds);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, v8);

}

- (double)value
{
  return self->_value;
}

- (NSArray)levelThresholds
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_levelThresholds, 0);
}

@end
