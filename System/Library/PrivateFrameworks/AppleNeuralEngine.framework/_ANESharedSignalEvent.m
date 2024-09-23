@implementation _ANESharedSignalEvent

+ (id)signalEventWithValue:(unint64_t)a3 symbolIndex:(unsigned int)a4 eventType:(int64_t)a5 sharedEvent:(id)a6
{
  uint64_t v7;
  id v10;
  void *v11;

  v7 = *(_QWORD *)&a4;
  v10 = a6;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithValue:symbolIndex:eventType:sharedEvent:agentMask:", a3, v7, a5, v10, 0);

  return v11;
}

- (_ANESharedSignalEvent)initWithValue:(unint64_t)a3 symbolIndex:(unsigned int)a4 eventType:(int64_t)a5 sharedEvent:(id)a6 agentMask:(unint64_t)a7
{
  id v13;
  _ANESharedSignalEvent *v14;
  _ANESharedSignalEvent *v15;
  objc_super v17;

  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)_ANESharedSignalEvent;
  v14 = -[_ANESharedSignalEvent init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_symbolIndex = a4;
    v14->_agentMask = a7;
    v14->_eventType = a5;
    v14->_value = a3;
    objc_storeStrong((id *)&v14->_sharedEvent, a6);
  }

  return v15;
}

+ (id)new
{
  return 0;
}

- (_ANESharedSignalEvent)init
{

  return 0;
}

- (id)waitEvent
{
  unint64_t v3;
  void *v4;
  void *v5;

  v3 = -[_ANESharedSignalEvent value](self, "value");
  -[_ANESharedSignalEvent sharedEvent](self, "sharedEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ANESharedWaitEvent waitEventWithValue:sharedEvent:eventType:](_ANESharedWaitEvent, "waitEventWithValue:sharedEvent:eventType:", v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setAgentMask:(unint64_t)a3
{
  self->_agentMask = a3;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  int64_t v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_ANESharedSignalEvent value](self, "value");
  v7 = -[_ANESharedSignalEvent symbolIndex](self, "symbolIndex");
  v8 = -[_ANESharedSignalEvent eventType](self, "eventType");
  -[_ANESharedSignalEvent sharedEvent](self, "sharedEvent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { value=%llu : symbolIndex=%u : eventType=%lu : sharedEvent=%@ agentMask=%llu } "), v5, v6, v7, v8, v9, -[_ANESharedSignalEvent agentMask](self, "agentMask"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[_ANESharedSignalEvent value](self, "value"), CFSTR("value"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[_ANESharedSignalEvent symbolIndex](self, "symbolIndex"), CFSTR("symbolIndex"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[_ANESharedSignalEvent eventType](self, "eventType"), CFSTR("eventType"));
  -[_ANESharedSignalEvent sharedEvent](self, "sharedEvent");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("sharedEvent"));

}

- (_ANESharedSignalEvent)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _ANESharedSignalEvent *v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("value"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("symbolIndex"));
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("eventType"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sharedEvent"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("agentMask"));

  v10 = -[_ANESharedSignalEvent initWithValue:symbolIndex:eventType:sharedEvent:agentMask:](self, "initWithValue:symbolIndex:eventType:sharedEvent:agentMask:", v5, v6, v7, v8, v9);
  return v10;
}

- (unint64_t)value
{
  return self->_value;
}

- (void)setValue:(unint64_t)a3
{
  self->_value = a3;
}

- (unsigned)symbolIndex
{
  return self->_symbolIndex;
}

- (unint64_t)agentMask
{
  return self->_agentMask;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (IOSurfaceSharedEvent)sharedEvent
{
  return self->_sharedEvent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedEvent, 0);
}

@end
