@implementation _DKEventTypeStatsCounter

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
  +[_DKEventStatsCollection counterWithClass:collectionName:eventName:eventType:eventTypePossibleValues:hasResult:scalar:]((uint64_t)_DKEventStatsCollection, v12, v11, v10, v9, v8, 0, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)incrementCountWithTypeValue:(uint64_t)a1
{
  id v3;
  const char *v4;
  id Property;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    -[_DKEventStatsCounterInternal incrementCountByNumber:typeValue:success:](*(_QWORD *)(a1 + 8), 1, v3, 0);
    if ((_DKEventStatsLogExternally & 1) == 0)
    {
      Property = *(id *)(a1 + 8);
      if (Property)
        Property = objc_getProperty(Property, v4, 64, 1);
      v9 = v3;
      v6 = (void *)MEMORY[0x1E0C99D20];
      v7 = Property;
      objc_msgSend(v6, "arrayWithObjects:count:", &v9, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "trackEventWithPropertyValues:value:", v8, 1, v9, v10);

    }
  }

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

- (void)incrementCountByNumber:(void *)a3 typeValue:
{
  id v5;
  const char *v6;
  id Property;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a1)
  {
    -[_DKEventStatsCounterInternal incrementCountByNumber:typeValue:success:](*(_QWORD *)(a1 + 8), a2, v5, 0);
    if ((_DKEventStatsLogExternally & 1) == 0)
    {
      Property = *(id *)(a1 + 8);
      if (Property)
        Property = objc_getProperty(Property, v6, 64, 1);
      v11 = v5;
      v8 = (void *)MEMORY[0x1E0C99D20];
      v9 = Property;
      objc_msgSend(v8, "arrayWithObjects:count:", &v11, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "trackEventWithPropertyValues:value:", v10, a2, v11, v12);

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
