@implementation HMDThreadNetworkStateChangeEvent

- (HMDThreadNetworkStateChangeEvent)initWithEventType:(int64_t)a3 eventValue:(unint64_t)a4
{
  HMDThreadNetworkStateChangeEvent *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMDThreadNetworkStateChangeEvent;
  result = -[HMDThreadNetworkStateChangeEvent init](&v7, sel_init);
  if (result)
  {
    result->_eventType = a3;
    result->_eventValue = a4;
  }
  return result;
}

- (id)_eventTypeToString
{
  int64_t v2;
  const __CFString *v3;

  v2 = -[HMDThreadNetworkStateChangeEvent eventType](self, "eventType");
  v3 = CFSTR("unknown");
  if (v2 == 1)
    v3 = CFSTR("nodeType");
  if (v2)
    return (id)v3;
  else
    return CFSTR("connectionState");
}

- (id)_connectionStateValueToString
{
  unint64_t v2;

  v2 = -[HMDThreadNetworkStateChangeEvent eventValue](self, "eventValue");
  if (v2 > 3)
    return CFSTR("unknown");
  else
    return off_1E89A64E8[v2];
}

- (id)_nodeTypeValueToString
{
  int64_t v2;

  v2 = -[HMDThreadNetworkStateChangeEvent eventValue](self, "eventValue");
  if ((unint64_t)(v2 - 1) > 6)
    return CFSTR("unknown");
  else
    return off_1E89A6508[v2 - 1];
}

- (id)_eventValueToString
{
  int64_t v3;
  __CFString *v4;

  v3 = -[HMDThreadNetworkStateChangeEvent eventType](self, "eventType");
  if (v3 == 1)
  {
    -[HMDThreadNetworkStateChangeEvent _nodeTypeValueToString](self, "_nodeTypeValueToString");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else if (v3)
  {
    v4 = CFSTR("unknown");
  }
  else
  {
    -[HMDThreadNetworkStateChangeEvent _connectionStateValueToString](self, "_connectionStateValueToString");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)HMDThreadNetworkStateChangeEvent;
  -[HMDThreadNetworkStateChangeEvent description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDThreadNetworkStateChangeEvent _eventTypeToString](self, "_eventTypeToString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDThreadNetworkStateChangeEvent _eventValueToString](self, "_eventValueToString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ [%@/%@]"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (int64_t)eventValue
{
  return self->_eventValue;
}

@end
