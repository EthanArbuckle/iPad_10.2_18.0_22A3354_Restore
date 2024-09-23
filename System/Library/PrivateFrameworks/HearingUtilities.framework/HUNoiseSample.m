@implementation HUNoiseSample

+ (id)dateFormatter
{
  if (dateFormatter_token != -1)
    dispatch_once(&dateFormatter_token, &__block_literal_global_3);
  return (id)dateFormatter__formatter;
}

uint64_t __30__HUNoiseSample_dateFormatter__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_opt_new();
  v1 = (void *)dateFormatter__formatter;
  dateFormatter__formatter = v0;

  v2 = (void *)dateFormatter__formatter;
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  return objc_msgSend((id)dateFormatter__formatter, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss:SS"));
}

- (HUNoiseSample)initWithSampleDate:(id)a3 splValue:(float)a4 andDuration:(float)a5
{
  id v8;
  HUNoiseSample *v9;
  HUNoiseSample *v10;
  double v11;
  double v12;
  objc_super v14;

  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HUNoiseSample;
  v9 = -[HUNoiseSample init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    -[HUNoiseSample setSampleDate:](v9, "setSampleDate:", v8);
    *(float *)&v11 = a4;
    -[HUNoiseSample setSplValue:](v10, "setSplValue:", v11);
    *(float *)&v12 = a5;
    -[HUNoiseSample setSampleDuration:](v10, "setSampleDuration:", v12);
  }

  return v10;
}

- (id)detailedDescription
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[HUNoiseSample splValue](self, "splValue");
  objc_msgSend(v4, "numberWithFloat:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUNoiseSample dateFormatter](HUNoiseSample, "dateFormatter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNoiseSample sampleDate](self, "sampleDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[HUNoiseSample sampleDuration](self, "sampleDuration");
  objc_msgSend(v9, "numberWithFloat:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("(%@, %@, %@)"), v5, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSDate)sampleDate
{
  return self->_sampleDate;
}

- (void)setSampleDate:(id)a3
{
  objc_storeStrong((id *)&self->_sampleDate, a3);
}

- (float)splValue
{
  return self->_splValue;
}

- (void)setSplValue:(float)a3
{
  self->_splValue = a3;
}

- (float)sampleDuration
{
  return self->_sampleDuration;
}

- (void)setSampleDuration:(float)a3
{
  self->_sampleDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampleDate, 0);
}

@end
