@implementation MKBenchmark

- (MKBenchmark)initWithLabel:(id)a3 count:(unint64_t)a4 time:(double)a5
{
  id v8;
  MKBenchmark *v9;
  MKBenchmark *v10;
  objc_super v12;

  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MKBenchmark;
  v9 = -[MKBenchmark init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_time = a5;
    v9->_count = a4;
    -[MKBenchmark setLabel:](v9, "setLabel:", v8);
  }

  return v10;
}

- (id)benchmark
{
  id v3;
  void *v4;
  double time;
  const __CFString *v6;
  double v7;
  const __CFString *v8;
  id v9;
  double v10;
  double v11;
  id v12;
  NSString *label;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;

  v3 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLocale:", v4);

  objc_msgSend(v3, "setNumberStyle:", 1);
  objc_msgSend(v3, "setMaximumFractionDigits:", 1);
  objc_msgSend(v3, "setPositiveSuffix:", CFSTR(" assets"));
  objc_msgSend(v3, "setRoundingMode:", 6);
  time = self->_time;
  v6 = CFSTR(" m");
  if (time >= 60.0)
  {
    v7 = time / 60.0;
  }
  else
  {
    v6 = CFSTR(" s");
    v7 = self->_time;
  }
  if (v7 >= 60.0)
    v8 = CFSTR(" h");
  else
    v8 = v6;
  v9 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  objc_msgSend(v9, "setNumberStyle:", 1);
  objc_msgSend(v9, "setMinimumFractionDigits:", 2);
  objc_msgSend(v9, "setMaximumFractionDigits:", 2);
  objc_msgSend(v9, "setPositiveSuffix:", v8);
  objc_msgSend(v9, "setRoundingMode:", 6);
  v10 = self->_time;
  v11 = 0.0;
  if (v10 != 0.0)
    v11 = (double)self->_count / v10;
  if (v7 >= 60.0)
    v7 = v7 / 60.0;
  v12 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  objc_msgSend(v12, "setNumberStyle:", 1);
  objc_msgSend(v12, "setMinimumFractionDigits:", 2);
  objc_msgSend(v12, "setMaximumFractionDigits:", 2);
  objc_msgSend(v12, "setPositiveSuffix:", CFSTR(" assets/sec"));
  objc_msgSend(v12, "setRoundingMode:", 6);
  v22 = (void *)MEMORY[0x24BDD17C8];
  label = self->_label;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_count);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromNumber:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringFromNumber:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringFromNumber:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringWithFormat:", CFSTR("%@: %@, %@ (%@)"), label, v15, v17, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (double)time
{
  return self->_time;
}

- (void)setTime:(double)a3
{
  self->_time = a3;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end
