@implementation _DKEventStatsTimerCounter

+ (id)counterInCollection:(void *)a3 withEventName:
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = a2;
  v6 = objc_opt_self();
  +[_DKEventStatsCollection counterWithClass:collectionName:eventName:eventType:eventTypePossibleValues:hasResult:scalar:]((uint64_t)_DKEventStatsCollection, v6, v5, v4, 0, 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)eventName
{
  _DKEventStatsCounterInternal *internal;

  internal = self->_internal;
  if (internal)
    return internal->_eventName;
  else
    return 0;
}

- (void)addTimingWithTimeInterval:(uint64_t)a1
{
  const char *v4;
  id Property;

  if (a1)
  {
    -[_DKEventStatsCounterInternal incrementCountByNumber:typeValue:success:](*(_QWORD *)(a1 + 8), 1, 0, 0);
    if ((_DKEventStatsLogExternally & 1) == 0)
    {
      Property = *(id *)(a1 + 8);
      if (Property)
        Property = objc_getProperty(Property, v4, 64, 1);
      objc_msgSend(Property, "trackEventWithPropertyValues:value:", MEMORY[0x1E0C9AA60], a2);
    }
  }
}

- (void)addTimingWithStartDate:(void *)a3 endDate:
{
  double v4;

  if (a1)
  {
    objc_msgSend(a3, "timeIntervalSinceDate:", a2);
    -[_DKEventStatsTimerCounter addTimingWithTimeInterval:](a1, v4);
  }
}

- (_DKEventStatsCounterInternal)internal
{
  return (_DKEventStatsCounterInternal *)objc_getProperty(self, a2, 8, 1);
}

- (void)setInternal:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internal, 0);
}

@end
