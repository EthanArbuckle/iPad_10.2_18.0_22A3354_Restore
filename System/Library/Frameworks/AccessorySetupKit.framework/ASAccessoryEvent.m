@implementation ASAccessoryEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASAccessoryEvent)initWithEventType:(int64_t)a3
{
  ASAccessoryEvent *v4;
  ASAccessoryEvent *v5;
  ASAccessoryEvent *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ASAccessoryEvent;
  v4 = -[ASAccessoryEvent init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_eventType = a3;
    v6 = v4;
  }

  return v5;
}

- (ASAccessoryEvent)initWithEventType:(int64_t)a3 error:(id)a4
{
  id v7;
  ASAccessoryEvent *v8;
  ASAccessoryEvent *v9;
  ASAccessoryEvent *v10;

  v7 = a4;
  v8 = -[ASAccessoryEvent initWithEventType:](self, "initWithEventType:", a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_error, a4);
    v10 = v9;
  }

  return v9;
}

- (id)description
{
  return -[ASAccessoryEvent descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  __CFString *v4;
  int64_t eventType;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  void *v10;

  if ((a3 & 0x8000000) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_opt_class();
    CUAppendF();
    v4 = (__CFString *)0;
  }
  eventType = self->_eventType;
  if (eventType)
  {
    ASAccessoryEventTypeToString(eventType);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v6 = v4;

    v4 = v6;
  }
  v7 = &stru_250420148;
  if (v4)
    v7 = v4;
  v8 = v7;

  return v8;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (ASAccessory)accessory
{
  return self->_accessory;
}

- (void)setAccessory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
}

@end
