@implementation HMMInterval

- (id)initFromStart:(id)a3 toEnd:(id)a4
{
  id v7;
  id v8;
  HMMInterval *v9;
  id *p_isa;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMMInterval;
  v9 = -[HMMInterval init](&v12, sel_init);
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_start, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

- (NSString)standardIntervalString
{
  return (NSString *)&stru_1E898A970;
}

- (NSString)negativeInfinityIntervalString
{
  return (NSString *)&stru_1E898A970;
}

- (NSString)positiveInfinityIntervalString
{
  return (NSString *)&stru_1E898A970;
}

- (NSString)allNumbersIntervalString
{
  return (NSString *)CFSTR("All");
}

- (id)labelString
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;

  -[HMMInterval start](self, "start");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMInterval end](self, "end");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToNumber:", v4);

  -[HMMInterval start](self, "start");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v5)
  {
    v9 = objc_msgSend(v6, "isEqualToNumber:", _HMMNegativeInfinity);

    -[HMMInterval end](self, "end");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToNumber:", _HMMPositiveInfinity);

    if (v9)
    {
      if (v11)
      {
        -[HMMInterval allNumbersIntervalString](self, "allNumbersIntervalString");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        return v8;
      }
      v12 = (void *)MEMORY[0x1E0CB3940];
      -[HMMInterval negativeInfinityIntervalString](self, "negativeInfinityIntervalString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMInterval end](self, "end");
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      if (!v11)
      {
        -[HMMInterval standardIntervalString](self, "standardIntervalString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMInterval start](self, "start");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMInterval end](self, "end");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithValidatedFormat:validFormatSpecifiers:error:", v13, CFSTR("%@ %@"), 0, v15, v16);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_11;
      }
      -[HMMInterval positiveInfinityIntervalString](self, "positiveInfinityIntervalString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMInterval start](self, "start");
      v14 = objc_claimAutoreleasedReturnValue();
    }
    v15 = (void *)v14;
    objc_msgSend(v12, "stringWithValidatedFormat:validFormatSpecifiers:error:", v13, CFSTR("%@"), 0, v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

    return v8;
  }
  objc_msgSend(v6, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSNumber)start
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (NSNumber)end
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_end, 0);
  objc_storeStrong((id *)&self->_start, 0);
}

+ (void)initialize
{
  id v3;
  void *v4;
  void *v5;

  objc_opt_self();
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
  {
    v4 = (void *)_HMMPositiveInfinity;
    _HMMPositiveInfinity = (uint64_t)&unk_1E8991E80;

    v5 = (void *)_HMMNegativeInfinity;
    _HMMNegativeInfinity = (uint64_t)&unk_1E8991E90;

  }
}

+ (NSNumber)negativeInfinityStart
{
  return (NSNumber *)(id)_HMMNegativeInfinity;
}

+ (NSNumber)positiveInfinityEnd
{
  return (NSNumber *)(id)_HMMPositiveInfinity;
}

+ (id)openOpenIntervalFromStart:(id)a3 toEnd:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = -[HMMInterval initFromStart:toEnd:]([HMMOpenOpenInterval alloc], "initFromStart:toEnd:", v6, v5);

  return v7;
}

+ (id)openClosedIntervalFromStart:(id)a3 toEnd:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = -[HMMInterval initFromStart:toEnd:]([HMMOpenClosedInterval alloc], "initFromStart:toEnd:", v6, v5);

  return v7;
}

+ (id)closedOpenIntervalFromStart:(id)a3 toEnd:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = -[HMMInterval initFromStart:toEnd:]([HMMClosedOpenInterval alloc], "initFromStart:toEnd:", v6, v5);

  return v7;
}

+ (id)closedClosedIntervalFromStart:(id)a3 toEnd:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = -[HMMInterval initFromStart:toEnd:]([HMMClosedClosedInterval alloc], "initFromStart:toEnd:", v6, v5);

  return v7;
}

+ (id)intervalForSingleValue:(id)a3
{
  return (id)objc_msgSend(a1, "closedClosedIntervalFromStart:toEnd:", a3, a3);
}

@end
