@implementation AXEventTapPair

- (void)dealloc
{
  __IOHIDEventSystemClient *systemClient;
  objc_super v4;

  systemClient = self->_systemClient;
  if (systemClient)
  {
    CFRelease(systemClient);
    self->_systemClient = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)AXEventTapPair;
  -[AXEventTapPair dealloc](&v4, sel_dealloc);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[AXEventTapPair priority](self, "priority");
  -[AXEventTapPair identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("EventTap: %d - %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)handler
{
  return self->handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)identifier
{
  return self->identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int)priority
{
  return self->priority;
}

- (void)setPriority:(int)a3
{
  self->priority = a3;
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (__IOHIDEventSystemClient)systemClient
{
  return self->_systemClient;
}

- (void)setSystemClient:(__IOHIDEventSystemClient *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (id)matchingServiceHandler
{
  return self->_matchingServiceHandler;
}

- (void)setMatchingServiceHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)failedToHandleInTime
{
  return self->_failedToHandleInTime;
}

- (void)setFailedToHandleInTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_failedToHandleInTime, 0);
  objc_storeStrong(&self->_matchingServiceHandler, 0);
  objc_storeStrong((id *)&self->identifier, 0);
  objc_storeStrong(&self->handler, 0);
}

@end
