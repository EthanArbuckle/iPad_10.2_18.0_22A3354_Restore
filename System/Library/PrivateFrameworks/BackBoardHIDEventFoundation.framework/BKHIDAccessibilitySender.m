@implementation BKHIDAccessibilitySender

- (BOOL)isPencilDigitizer
{
  return -[BKHIDAccessibilitySender senderID](self, "senderID") == 0x8000000817319379;
}

- (BKHIDAccessibilitySender)initWithSenderID:(unint64_t)a3
{
  BKHIDAccessibilitySender *v4;
  BKHIDAccessibilitySender *v5;
  uint64_t v6;
  BKSHIDEventSenderDescriptor *senderDescriptor;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BKHIDAccessibilitySender;
  v4 = -[BKHIDAccessibilitySender init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_senderID = a3;
    objc_msgSend(MEMORY[0x1E0D00D30], "wildcard");
    v6 = objc_claimAutoreleasedReturnValue();
    senderDescriptor = v5->_senderDescriptor;
    v5->_senderDescriptor = (BKSHIDEventSenderDescriptor *)v6;

  }
  return v5;
}

- (id)senderDescriptorForEventType:(unsigned int)a3
{
  return self->_senderDescriptor;
}

- (NSString)displayUUID
{
  return self->_displayUUID;
}

- (void)setDisplayUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int)eventSource
{
  return self->_eventSource;
}

- (void)setEventSource:(int)a3
{
  self->_eventSource = a3;
}

- (unint64_t)senderID
{
  return self->_senderID;
}

- (void)setSenderID:(unint64_t)a3
{
  self->_senderID = a3;
}

- (unsigned)primaryUsagePage
{
  return self->_primaryUsagePage;
}

- (void)setPrimaryUsagePage:(unsigned int)a3
{
  self->_primaryUsagePage = a3;
}

- (unsigned)primaryUsage
{
  return self->_primaryUsage;
}

- (void)setPrimaryUsage:(unsigned int)a3
{
  self->_primaryUsage = a3;
}

- (BOOL)isAuthenticated
{
  return self->_authenticated;
}

- (void)setAuthenticated:(BOOL)a3
{
  self->_authenticated = a3;
}

- (BOOL)isBuiltIn
{
  return self->_builtIn;
}

- (void)setBuiltIn:(BOOL)a3
{
  self->_builtIn = a3;
}

- (BKSHIDEventSenderDescriptor)senderDescriptor
{
  return self->_senderDescriptor;
}

- (void)setSenderDescriptor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderDescriptor, 0);
  objc_storeStrong((id *)&self->_displayUUID, 0);
}

+ (id)accessibilityHIDServices
{
  BKHIDAccessibilitySender *v2;
  BKHIDAccessibilitySender *v3;
  BKHIDAccessibilitySender *v4;
  BKHIDAccessibilitySender *v5;
  BKHIDAccessibilitySender *v6;
  BKHIDAccessibilitySender *v7;
  BKHIDAccessibilitySender *v8;
  BKHIDAccessibilitySender *v9;
  void *v10;
  _QWORD v12[9];

  v12[8] = *MEMORY[0x1E0C80C00];
  v2 = -[BKHIDAccessibilitySender initWithSenderID:]([BKHIDAccessibilitySender alloc], "initWithSenderID:", 0x8000000817319371);
  v3 = -[BKHIDAccessibilitySender initWithSenderID:]([BKHIDAccessibilitySender alloc], "initWithSenderID:", 0x8000000817319372);
  v4 = -[BKHIDAccessibilitySender initWithSenderID:]([BKHIDAccessibilitySender alloc], "initWithSenderID:", 0x8000000817319373);
  v5 = -[BKHIDAccessibilitySender initWithSenderID:]([BKHIDAccessibilitySender alloc], "initWithSenderID:", 0x8000000817319374);
  v6 = -[BKHIDAccessibilitySender initWithSenderID:]([BKHIDAccessibilitySender alloc], "initWithSenderID:", 0x8000000817319375);
  v7 = -[BKHIDAccessibilitySender initWithSenderID:]([BKHIDAccessibilitySender alloc], "initWithSenderID:", 0x8000000817319376);
  v8 = -[BKHIDAccessibilitySender initWithSenderID:]([BKHIDAccessibilitySender alloc], "initWithSenderID:", 0x8000000817319379);
  v9 = -[BKHIDAccessibilitySender initWithSenderID:]([BKHIDAccessibilitySender alloc], "initWithSenderID:", 0x8000000817319378);
  v12[0] = v2;
  v12[1] = v3;
  v12[2] = v4;
  v12[3] = v5;
  v12[4] = v6;
  v12[5] = v7;
  v12[6] = v8;
  v12[7] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
