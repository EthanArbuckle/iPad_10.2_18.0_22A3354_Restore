@implementation NSPortMessage

- (NSPortMessage)initWithSendPort:(NSPort *)sendPort receivePort:(NSPort *)replyPort components:(NSArray *)components
{
  self->localPort = replyPort;
  self->remotePort = sendPort;
  self->components = (NSMutableArray *)components;
  return self;
}

- (NSPortMessage)initWithReceivePort:(id)a3 sendPort:(id)a4 components:(id)a5
{
  return -[NSPortMessage initWithSendPort:receivePort:components:](self, "initWithSendPort:receivePort:components:", a4, a3, a5);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSPortMessage;
  -[NSPortMessage dealloc](&v3, sel_dealloc);
}

- (NSPort)sendPort
{
  return self->remotePort;
}

- (NSPort)receivePort
{
  return self->localPort;
}

- (uint32_t)msgid
{
  return self->msgid;
}

- (void)setMsgid:(uint32_t)msgid
{
  self->msgid = msgid;
}

- (NSArray)components
{
  return (NSArray *)self->components;
}

- (BOOL)sendBeforeDate:(NSDate *)date
{
  return -[NSPort sendBeforeDate:msgid:components:from:reserved:](self->remotePort, "sendBeforeDate:msgid:components:from:reserved:", date, self->msgid, self->components, self->localPort, 0);
}

@end
