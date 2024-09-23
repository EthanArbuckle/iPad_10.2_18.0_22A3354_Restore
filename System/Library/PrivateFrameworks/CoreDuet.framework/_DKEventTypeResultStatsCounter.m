@implementation _DKEventTypeResultStatsCounter

+ (id)counterInCollection:(void *)a3 withEventName:(void *)a4 eventType:(void *)a5 eventTypePossibleValues:
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = a2;
  v12 = objc_opt_self();
  +[_DKEventStatsCollection counterWithClass:collectionName:eventName:eventType:eventTypePossibleValues:hasResult:scalar:]((uint64_t)_DKEventStatsCollection, v12, v11, v10, v9, v8, 1, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
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

- (id)eventType
{
  _DKEventStatsCounterInternal *internal;

  internal = self->_internal;
  if (internal)
    return internal->_eventType;
  else
    return 0;
}

- (id)typeValues
{
  _DKEventStatsCounterInternal *internal;

  internal = self->_internal;
  if (internal)
    return internal->_typeValues;
  else
    return 0;
}

- (void)incrementCountWithTypeValue:(unsigned int)a3 success:
{
  id v5;
  const char *v6;
  id Property;
  const __CFString *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    -[_DKEventStatsCounterInternal incrementCountByNumber:typeValue:success:](*(_QWORD *)(a1 + 8), 1, v5, a3);
    if ((_DKEventStatsLogExternally & 1) == 0)
    {
      Property = *(id *)(a1 + 8);
      if (Property)
        Property = objc_getProperty(Property, v6, 64, 1);
      v8 = CFSTR("false");
      if (a3)
        v8 = CFSTR("true");
      v12[0] = v5;
      v12[1] = v8;
      v9 = (void *)MEMORY[0x1E0C99D20];
      v10 = Property;
      objc_msgSend(v9, "arrayWithObjects:count:", v12, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "trackEventWithPropertyValues:value:", v11, 1);

    }
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
