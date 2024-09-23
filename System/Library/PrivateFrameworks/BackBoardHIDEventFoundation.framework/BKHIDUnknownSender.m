@implementation BKHIDUnknownSender

- (BKHIDUnknownSender)init
{
  BKHIDUnknownSender *v2;
  uint64_t v3;
  BKSHIDEventSenderDescriptor *senderDescriptor;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKHIDUnknownSender;
  v2 = -[BKHIDUnknownSender init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D00D30], "wildcard");
    v3 = objc_claimAutoreleasedReturnValue();
    senderDescriptor = v2->_senderDescriptor;
    v2->_senderDescriptor = (BKSHIDEventSenderDescriptor *)v3;

  }
  return v2;
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

+ (id)unknownSenderInfo
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__BKHIDUnknownSender_unknownSenderInfo__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (unknownSenderInfo_onceToken != -1)
    dispatch_once(&unknownSenderInfo_onceToken, block);
  return (id)unknownSenderInfo_unknownSender;
}

void __39__BKHIDUnknownSender_unknownSenderInfo__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)unknownSenderInfo_unknownSender;
  unknownSenderInfo_unknownSender = (uint64_t)v1;

}

@end
