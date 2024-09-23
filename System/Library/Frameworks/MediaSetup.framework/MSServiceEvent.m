@implementation MSServiceEvent

- (MSServiceEvent)initWithEventType:(int)a3 serviceID:(id)a4 didSucceed:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v6;
  id v8;
  MSServiceEvent *v9;
  MSServiceEvent *v10;
  NSObject *v11;
  MSServiceEvent *v12;
  MSStopwatch *v13;
  uint8_t v15[16];
  objc_super v16;

  v5 = a5;
  v6 = *(_QWORD *)&a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MSServiceEvent;
  v9 = -[MSServiceEvent init](&v16, sel_init);
  v10 = v9;
  if (!v9)
    goto LABEL_8;
  if ((_DWORD)v6 != 2 || !v8)
  {
    -[MSServiceEvent setEventType:](v9, "setEventType:", v6);
    -[MSServiceEvent setServiceID:](v10, "setServiceID:", v8);
    -[MSServiceEvent setDidSucceed:](v10, "setDidSucceed:", v5);
    v13 = objc_alloc_init(MSStopwatch);
    -[MSServiceEvent setStopwatch:](v10, "setStopwatch:", v13);

LABEL_8:
    v12 = v10;
    goto LABEL_9;
  }
  _MSLogingFacility();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_219CD8000, v11, OS_LOG_TYPE_DEFAULT, "Failed to create MSServiceEvent. Tried to log batched update for a particular serviceID", v15, 2u);
  }

  v12 = 0;
LABEL_9:

  return v12;
}

- (MSServiceEvent)initWithEventType:(int)a3 serviceID:(id)a4
{
  return -[MSServiceEvent initWithEventType:serviceID:didSucceed:](self, "initWithEventType:serviceID:didSucceed:", *(_QWORD *)&a3, a4, 0);
}

- (MSServiceEvent)initWithEventType:(int)a3
{
  return -[MSServiceEvent initWithEventType:serviceID:didSucceed:](self, "initWithEventType:serviceID:didSucceed:", *(_QWORD *)&a3, 0, 0);
}

- (NSString)eventName
{
  uint64_t eventType;

  eventType = self->_eventType;
  if (eventType > 2)
    return 0;
  else
    return &off_24DBD54F0[eventType]->isa;
}

- (int)eventType
{
  return self->_eventType;
}

- (void)setEventType:(int)a3
{
  self->_eventType = a3;
}

- (NSUUID)serviceID
{
  return self->_serviceID;
}

- (void)setServiceID:(id)a3
{
  objc_storeStrong((id *)&self->_serviceID, a3);
}

- (BOOL)didSucceed
{
  return self->_didSucceed;
}

- (void)setDidSucceed:(BOOL)a3
{
  self->_didSucceed = a3;
}

- (MSStopwatch)stopwatch
{
  return self->_stopwatch;
}

- (void)setStopwatch:(id)a3
{
  objc_storeStrong((id *)&self->_stopwatch, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stopwatch, 0);
  objc_storeStrong((id *)&self->_serviceID, 0);
}

@end
