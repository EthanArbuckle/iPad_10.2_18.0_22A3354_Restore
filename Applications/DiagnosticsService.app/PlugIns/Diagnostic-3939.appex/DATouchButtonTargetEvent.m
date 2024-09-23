@implementation DATouchButtonTargetEvent

- (DATouchButtonTargetEvent)initWithDictionary:(id)a3
{
  id v4;
  DATouchButtonTargetEvent *v5;
  void *v6;
  uint64_t v7;
  NSNumber *value;
  DAStateRange *v9;
  DAStateRange *range;
  objc_super v12;
  char v13;

  v4 = a3;
  v13 = 0;
  v12.receiver = self;
  v12.super_class = (Class)DATouchButtonTargetEvent;
  v5 = -[DASpecification initWithDictionary:](&v12, "initWithDictionary:", v4);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("eventType"), &off_100011120, &off_100011150, &v13));
    v5->_eventType = (int64_t)objc_msgSend(v6, "integerValue");

    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("value"), &off_100011168, &off_100011180, &v13));
    value = v5->_value;
    v5->_value = (NSNumber *)v7;

    v5->_performHapticOnEvent = objc_msgSend(v4, "dk_BOOLFromKey:defaultValue:failed:", CFSTR("performHapticOnEvent"), 0, &v13);
    v9 = -[DAStateRange initWithDictionary:]([DAStateRange alloc], "initWithDictionary:", v4);
    range = v5->_range;
    v5->_range = v9;

    if (v13)
    {

      v5 = 0;
    }
  }

  return v5;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(int64_t)a3
{
  self->_eventType = a3;
}

- (NSNumber)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (BOOL)performHapticOnEvent
{
  return self->_performHapticOnEvent;
}

- (void)setPerformHapticOnEvent:(BOOL)a3
{
  self->_performHapticOnEvent = a3;
}

- (DAStateRange)range
{
  return self->_range;
}

- (void)setRange:(id)a3
{
  objc_storeStrong((id *)&self->_range, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_range, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

@end
