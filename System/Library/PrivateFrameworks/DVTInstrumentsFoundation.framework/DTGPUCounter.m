@implementation DTGPUCounter

- (DTGPUCounter)initWithName:(id)a3 maxValue:(unint64_t)a4
{
  id v7;
  DTGPUCounter *v8;
  DTGPUCounter *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DTGPUCounter;
  v8 = -[DTGPUCounter init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_name, a3);
    objc_storeStrong((id *)&v9->_functionName, a3);
    v9->_maxValue = a4;
    v9->_multiplier = 1;
    v9->_requiresWeightAccumulation = !-[NSString containsString:](v9->_name, "containsString:", CFSTR("Bandwidth"));
  }

  return v9;
}

- (id)infoArray
{
  unint64_t maxValue;
  void *v4;
  NSString *functionName;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[7];

  v10[6] = *MEMORY[0x24BDAC8D0];
  maxValue = self->_maxValue;
  v10[0] = self->_name;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", maxValue);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  functionName = self->_functionName;
  v10[2] = self->_counterDescription;
  v10[3] = functionName;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_multiplier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[4] = v6;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_groupIndex);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[5] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)maxValue
{
  return self->_maxValue;
}

- (void)setMaxValue:(unint64_t)a3
{
  self->_maxValue = a3;
}

- (unsigned)groupIndex
{
  return self->_groupIndex;
}

- (void)setGroupIndex:(unsigned int)a3
{
  self->_groupIndex = a3;
}

- (BOOL)requiresWeightAccumulation
{
  return self->_requiresWeightAccumulation;
}

- (NSArray)rawCounters
{
  return self->_rawCounters;
}

- (void)setRawCounters:(id)a3
{
  objc_storeStrong((id *)&self->_rawCounters, a3);
}

- (NSString)counterDescription
{
  return self->_counterDescription;
}

- (void)setCounterDescription:(id)a3
{
  objc_storeStrong((id *)&self->_counterDescription, a3);
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_storeStrong((id *)&self->_type, a3);
}

- (NSString)functionName
{
  return self->_functionName;
}

- (void)setFunctionName:(id)a3
{
  objc_storeStrong((id *)&self->_functionName, a3);
}

- (unsigned)multiplier
{
  return self->_multiplier;
}

- (void)setMultiplier:(unsigned int)a3
{
  self->_multiplier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_functionName, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_counterDescription, 0);
  objc_storeStrong((id *)&self->_rawCounters, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
