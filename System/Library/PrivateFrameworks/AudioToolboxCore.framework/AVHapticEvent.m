@implementation AVHapticEvent

- (unint64_t)eventType
{
  return self->_u._eventType;
}

- (AVHapticPlayerFixedParameter)fixedParams
{
  return self->_fixedParams;
}

- (int64_t)fixedParamCount
{
  return self->_fixedParamCount;
}

- (unint64_t)eventCategory
{
  return self->_eventCategory;
}

- (double)duration
{
  return self->_duration;
}

- (double)time
{
  return self->_time;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paramCurve, 0);
}

+ (id)eventWithEventType:(unint64_t)a3 time:(double)a4 parameters:(const AVHapticPlayerFixedParameter *)a5 count:(int64_t)a6 duration:(double)a7
{
  return -[AVHapticEvent initWithEventType:time:parameters:count:duration:]([AVHapticEvent alloc], "initWithEventType:time:parameters:count:duration:", a3, a5, a6, a4, a7);
}

- (AVHapticEvent)initWithEventType:(unint64_t)a3 time:(double)a4 parameters:(const AVHapticPlayerFixedParameter *)a5 count:(int64_t)a6 duration:(double)a7
{
  AVHapticEvent *v12;
  AVHapticEvent *v13;
  double v14;
  double v15;
  AVHapticPlayerParameterCurve *paramCurve;
  int64_t v17;
  unint64_t v18;
  AVHapticPlayerFixedParameter *fixedParams;
  unint64_t v20;
  AVHapticPlayerFixedParameter v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)AVHapticEvent;
  v12 = -[AVHapticEvent init](&v23, sel_init);
  v13 = v12;
  if (v12)
  {
    v14 = 0.0;
    v15 = fmax(a4, 0.0);
    if (a7 >= 0.0)
      v14 = a7;
    v12->_time = v15;
    v12->_duration = v14;
    v12->_eventCategory = 0;
    v12->_u._eventType = a3;
    paramCurve = v12->_paramCurve;
    v12->_paramCurve = 0;

    v17 = 0;
    if (a5)
    {
      v18 = a6 - 1;
      if (a6 >= 1)
      {
        fixedParams = v13->_fixedParams;
        if (v18 >= 7)
          v18 = 7;
        v20 = v18 + 1;
        do
        {
          v21 = *a5++;
          *fixedParams++ = v21;
          --v20;
        }
        while (v20);
        v17 = v18 + 1;
      }
    }
    v13->_fixedParamCount = v17;
  }
  return v13;
}

- (AVHapticEvent)initWithEventType:(unint64_t)a3 time:(double)a4 duration:(double)a5
{
  AVHapticEvent *v8;
  AVHapticEvent *v9;
  double v10;
  double v11;
  AVHapticPlayerParameterCurve *paramCurve;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)AVHapticEvent;
  v8 = -[AVHapticEvent init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    v10 = 0.0;
    v11 = fmax(a4, 0.0);
    if (a5 >= 0.0)
      v10 = a5;
    v8->_time = v11;
    v8->_duration = v10;
    v8->_eventCategory = 0;
    v8->_u._eventType = a3;
    paramCurve = v8->_paramCurve;
    v8->_paramCurve = 0;
    v8->_fixedParamCount = 0;

  }
  return v9;
}

- (AVHapticEvent)initWithParameter:(unint64_t)a3 value:(float)a4 time:(double)a5
{
  AVHapticEvent *v8;
  AVHapticEvent *v9;
  AVHapticPlayerParameterCurve *paramCurve;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AVHapticEvent;
  v8 = -[AVHapticEvent init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_time = fmax(a5, 0.0);
    v8->_duration = 0.0;
    v8->_eventCategory = 1;
    v8->_u._eventType = a3;
    v8->_value = a4;
    paramCurve = v8->_paramCurve;
    v8->_paramCurve = 0;

  }
  return v9;
}

- (AVHapticEvent)initWithParameterCurve:(id)a3
{
  id v5;
  AVHapticEvent *v6;
  double v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVHapticEvent;
  v6 = -[AVHapticEvent init](&v9, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "time");
    v6->_time = v7;
    v6->_duration = 0.0;
    v6->_eventCategory = 2;
    v6->_u._eventType = objc_msgSend(v5, "type");
    v6->_value = 0.0;
    v6->_fixedParamCount = 0;
    objc_storeStrong((id *)&v6->_paramCurve, a3);
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t v4;
  int64_t v5;
  float *p_value;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  double v11;
  double v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "encodeDouble:forKey:", CFSTR("time"), self->_time);
  objc_msgSend(v13, "encodeInt32:forKey:", LODWORD(self->_eventCategory), CFSTR("eventCategory"));
  v4 = -[AVHapticEvent eventCategory](self, "eventCategory");
  if (v4)
  {
    if (v4 == 1)
    {
      objc_msgSend(v13, "encodeInteger:forKey:", self->_u._eventType, CFSTR("paramType"));
      *(float *)&v12 = self->_value;
      objc_msgSend(v13, "encodeFloat:forKey:", CFSTR("value"), v12);
    }
    else if (v4 == 2)
    {
      objc_msgSend(v13, "encodeObject:forKey:", self->_paramCurve, CFSTR("parameterCurve"));
    }
  }
  else
  {
    objc_msgSend(v13, "encodeDouble:forKey:", CFSTR("duration"), self->_duration);
    objc_msgSend(v13, "encodeInteger:forKey:", self->_u._eventType, CFSTR("eventType"));
    if (self->_fixedParamCount >= 1)
    {
      v5 = 0;
      p_value = &self->_fixedParams[0].value;
      do
      {
        v7 = *((_QWORD *)p_value - 1);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("fixedParam%dType"), v5);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "encodeInteger:forKey:", v7, v8);

        v9 = *(_DWORD *)p_value;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("fixedParam%dValue"), v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v11) = v9;
        objc_msgSend(v13, "encodeFloat:forKey:", v10, v11);

        ++v5;
        p_value += 4;
      }
      while (v5 < self->_fixedParamCount);
    }
    objc_msgSend(v13, "encodeInteger:forKey:");
  }

}

- (AVHapticEvent)initWithCoder:(id)a3
{
  id v4;
  double v5;
  unint64_t v6;
  AVHapticPlayerParameterCurve *v7;
  AVHapticPlayerParameterCurve *paramCurve;
  double v9;
  uint64_t v10;
  int64_t v11;
  int64_t v12;
  float *p_value;
  void *v14;
  void *v15;
  int v16;
  float v17;

  v4 = a3;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("time"));
  self->_time = v5;
  self->_eventCategory = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("eventCategory"));
  v6 = -[AVHapticEvent eventCategory](self, "eventCategory");
  if (v6)
  {
    if (v6 == 1)
    {
      self->_u._eventType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("paramType"));
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("value"));
      self->_value = v17;
    }
    else if (v6 == 2)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parameterCurve"));
      v7 = (AVHapticPlayerParameterCurve *)objc_claimAutoreleasedReturnValue();
      paramCurve = self->_paramCurve;
      self->_paramCurve = v7;

    }
  }
  else
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("duration"));
    self->_duration = v9;
    self->_u._eventType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("eventType"));
    v10 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("fixedParamCount"));
    v11 = 8;
    if (v10 < 8)
      v11 = v10;
    self->_fixedParamCount = v11;
    if (v10 >= 1)
    {
      v12 = 0;
      p_value = &self->_fixedParams[0].value;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("fixedParam%dType"), v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *((_QWORD *)p_value - 1) = objc_msgSend(v4, "decodeIntegerForKey:", v14);

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("fixedParam%dValue"), v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "decodeFloatForKey:", v15);
        *(_DWORD *)p_value = v16;
        p_value += 4;

        ++v12;
      }
      while (v12 < self->_fixedParamCount);
    }
  }

  return self;
}

- (unint64_t)paramType
{
  return self->_u._eventType;
}

- (AVHapticPlayerParameterCurve)parameterCurve
{
  return self->_paramCurve;
}

- (float)value
{
  return self->_value;
}

+ (id)eventWithEventType:(unint64_t)a3 time:(double)a4
{
  return +[AVHapticEvent eventWithEventType:time:duration:](AVHapticEvent, "eventWithEventType:time:duration:", a3, a4, 0.0);
}

+ (id)eventWithEventType:(unint64_t)a3 time:(double)a4 duration:(double)a5
{
  return -[AVHapticEvent initWithEventType:time:duration:]([AVHapticEvent alloc], "initWithEventType:time:duration:", a3, a4, a5);
}

+ (id)eventWithEventType:(unint64_t)a3 time:(double)a4 parameters:(const AVHapticPlayerFixedParameter *)a5 count:(int64_t)a6
{
  return +[AVHapticEvent eventWithEventType:time:parameters:count:duration:](AVHapticEvent, "eventWithEventType:time:parameters:count:duration:", a3, a5, a6, a4, 0.0);
}

+ (id)eventWithParameter:(unint64_t)a3 value:(float)a4 time:(double)a5
{
  AVHapticEvent *v8;
  double v9;

  v8 = [AVHapticEvent alloc];
  *(float *)&v9 = a4;
  return -[AVHapticEvent initWithParameter:value:time:](v8, "initWithParameter:value:time:", a3, v9, a5);
}

+ (id)eventWithParameterCurve:(id)a3
{
  id v3;
  AVHapticEvent *v4;

  v3 = a3;
  v4 = -[AVHapticEvent initWithParameterCurve:]([AVHapticEvent alloc], "initWithParameterCurve:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
