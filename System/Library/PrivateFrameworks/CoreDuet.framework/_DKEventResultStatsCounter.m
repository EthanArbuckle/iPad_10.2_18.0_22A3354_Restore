@implementation _DKEventResultStatsCounter

- (id)eventName
{
  _DKEventStatsCounterInternal *internal;

  internal = self->_internal;
  if (internal)
    return internal->_eventName;
  else
    return 0;
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
