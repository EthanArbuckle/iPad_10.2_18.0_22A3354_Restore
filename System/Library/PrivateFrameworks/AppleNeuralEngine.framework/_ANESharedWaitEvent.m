@implementation _ANESharedWaitEvent

+ (id)waitEventWithValue:(unint64_t)a3 sharedEvent:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithValue:sharedEvent:eventType:", a3, v6, 0);

  return v7;
}

- (_ANESharedWaitEvent)initWithValue:(unint64_t)a3 sharedEvent:(id)a4 eventType:(unint64_t)a5
{
  id v9;
  _ANESharedWaitEvent *v10;
  _ANESharedWaitEvent *v11;
  objc_super v13;

  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_ANESharedWaitEvent;
  v10 = -[_ANESharedWaitEvent init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_value = a3;
    objc_storeStrong((id *)&v10->_sharedEvent, a4);
    v11->_eventType = a5;
  }

  return v11;
}

+ (id)new
{
  return 0;
}

- (_ANESharedWaitEvent)init
{

  return 0;
}

+ (id)waitEventWithValue:(unint64_t)a3 sharedEvent:(id)a4 eventType:(unint64_t)a5
{
  id v8;
  void *v9;

  v8 = a4;
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithValue:sharedEvent:eventType:", a3, v8, a5);

  return v9;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_ANESharedWaitEvent value](self, "value");
  -[_ANESharedWaitEvent sharedEvent](self, "sharedEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { value=%llu : sharedEvent=%@ } "), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)value
{
  return self->_value;
}

- (void)setValue:(unint64_t)a3
{
  self->_value = a3;
}

- (unint64_t)eventType
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
