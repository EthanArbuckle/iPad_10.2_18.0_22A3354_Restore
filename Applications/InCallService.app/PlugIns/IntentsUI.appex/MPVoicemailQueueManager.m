@implementation MPVoicemailQueueManager

- (MPVoicemailQueueManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for VoicemailQueueManager();
  return -[MPVoicemailQueueManager init](&v3, "init");
}

+ (OS_dispatch_queue_serial)serialQueue
{
  return (OS_dispatch_queue_serial *)sub_10004A09C((uint64_t)a1, (uint64_t)a2, &qword_100091060, (id *)&qword_100092E50, (uint64_t)sub_10004A038);
}

@end
