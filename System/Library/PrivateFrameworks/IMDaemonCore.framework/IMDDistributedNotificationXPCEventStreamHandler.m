@implementation IMDDistributedNotificationXPCEventStreamHandler

+ (id)sharedInstance
{
  if (qword_1ED935EC0 != -1)
    dispatch_once(&qword_1ED935EC0, &unk_1E92295F0);
  return (id)qword_1ED935F58;
}

- (IMDDistributedNotificationXPCEventStreamHandler)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IMDDistributedNotificationXPCEventStreamHandler;
  return -[IMDXPCEventStreamHandler initWithEventStreamName:](&v3, sel_initWithEventStreamName_, "com.apple.distnoted.matching");
}

- (IMDDistributedNotificationXPCEventStreamHandler)initWithEventStreamName:(const char *)a3
{
  -[IMDDistributedNotificationXPCEventStreamHandler doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

@end
