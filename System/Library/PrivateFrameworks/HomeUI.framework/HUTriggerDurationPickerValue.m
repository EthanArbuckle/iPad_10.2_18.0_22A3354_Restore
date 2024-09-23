@implementation HUTriggerDurationPickerValue

+ (id)valueWithDuration:(double)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithDuration:", v5);

  return v6;
}

+ (id)valueWithNoDuration
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithDuration:", 0);
}

- (HUTriggerDurationPickerValue)init
{
  return -[HUTriggerDurationPickerValue initWithDuration:](self, "initWithDuration:", 0);
}

- (HUTriggerDurationPickerValue)initWithDuration:(id)a3
{
  id v5;
  HUTriggerDurationPickerValue *v6;
  HUTriggerDurationPickerValue *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HUTriggerDurationPickerValue;
  v6 = -[HUTriggerDurationPickerValue init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_duration, a3);

  return v7;
}

- (BOOL)hasDuration
{
  void *v2;
  BOOL v3;

  -[HUTriggerDurationPickerValue duration](self, "duration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (NSNumber)duration
{
  return self->_duration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_duration, 0);
}

@end
