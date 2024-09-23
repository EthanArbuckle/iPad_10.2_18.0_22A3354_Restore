@implementation ACCStatInfoAccumulator

- (ACCStatInfoAccumulator)init
{
  ACCStatInfoAccumulator *v2;
  ACCStatInfoAccumulator *v3;
  NSString *name;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACCStatInfoAccumulator;
  v2 = -[ACCStatInfoAccumulator init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    name = v2->_name;
    v2->_name = 0;

    -[ACCStatInfoAccumulator reset](v3, "reset");
  }
  return v3;
}

- (ACCStatInfoAccumulator)initWithName:(id)a3
{
  id v5;
  ACCStatInfoAccumulator *v6;
  ACCStatInfoAccumulator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ACCStatInfoAccumulator;
  v6 = -[ACCStatInfoAccumulator init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    -[ACCStatInfoAccumulator reset](v7, "reset");
  }

  return v7;
}

- (ACCStatInfoAccumulator)initWithName:(id)a3 initValue:(unint64_t)a4
{
  id v7;
  ACCStatInfoAccumulator *v8;
  ACCStatInfoAccumulator *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ACCStatInfoAccumulator;
  v8 = -[ACCStatInfoAccumulator init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_name, a3);
    -[ACCStatInfoAccumulator reset](v9, "reset");
    -[ACCStatInfoAccumulator add:](v9, "add:", a4);
  }

  return v9;
}

- (id)description
{
  const __CFString *name;

  name = &stru_24DD265E0;
  if (self->_name)
    name = (const __CFString *)self->_name;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[ACCStatInfoAccumulator:%@ start %llu, max %llu, last %llu, accum %llu, count %llu, average %llu, startTime=%@, lastUpdateTime=%@]"), name, self->_start, self->_max, self->_last, self->_accum, self->_count, self->_average, self->_startTime, self->_lastUpdateTime);
}

- (void)reset
{
  NSDate *v3;
  NSDate *startTime;
  NSDate *lastUpdateTime;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  startTime = self->_startTime;
  self->_startTime = v3;

  lastUpdateTime = self->_lastUpdateTime;
  self->_lastUpdateTime = 0;

  *(_OWORD *)&self->_last = 0u;
  *(_OWORD *)&self->_count = 0u;
  *(_OWORD *)&self->_start = 0u;
}

- (void)add:(unint64_t)a3
{
  NSDate *v5;
  NSDate *lastUpdateTime;
  unint64_t count;
  unint64_t v8;
  unint64_t v9;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastUpdateTime = self->_lastUpdateTime;
  self->_lastUpdateTime = v5;

  self->_last = a3;
  count = self->_count;
  if (!count)
    self->_start = a3;
  if (self->_max < a3)
    self->_max = a3;
  v8 = self->_accum + a3;
  v9 = count + 1;
  self->_accum = v8;
  self->_count = v9;
  self->_average = v8 / v9;
}

- (void)set:(id)a3
{
  id v4;
  NSDate *v5;
  NSDate *startTime;
  NSDate *v7;
  NSDate *lastUpdateTime;
  unint64_t v9;

  v4 = a3;
  objc_msgSend(v4, "startTime");
  v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
  startTime = self->_startTime;
  self->_startTime = v5;

  objc_msgSend(v4, "lastUpdateTime");
  v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastUpdateTime = self->_lastUpdateTime;
  self->_lastUpdateTime = v7;

  self->_start = objc_msgSend(v4, "start");
  self->_max = objc_msgSend(v4, "max");
  self->_last = objc_msgSend(v4, "last");
  self->_accum = objc_msgSend(v4, "accum");
  self->_count = objc_msgSend(v4, "count");
  v9 = objc_msgSend(v4, "average");

  self->_average = v9;
}

- (double)timeIntervalSinceStart
{
  void *v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", self->_startTime);
  v5 = v4;

  return v5;
}

- (double)timeIntervalSinceLastUpdate
{
  void *v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", self->_lastUpdateTime);
  v5 = v4;

  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (NSDate)lastUpdateTime
{
  return self->_lastUpdateTime;
}

- (unint64_t)start
{
  return self->_start;
}

- (unint64_t)max
{
  return self->_max;
}

- (unint64_t)last
{
  return self->_last;
}

- (unint64_t)accum
{
  return self->_accum;
}

- (unint64_t)count
{
  return self->_count;
}

- (unint64_t)average
{
  return self->_average;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdateTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
