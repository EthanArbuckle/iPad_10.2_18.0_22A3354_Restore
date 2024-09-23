@implementation VoicemailActor

+ (OS_dispatch_queue_serial)MPVoicemailSerialDispatchQueue
{
  return (OS_dispatch_queue_serial *)sub_10004A09C((uint64_t)a1, (uint64_t)a2, &qword_100091058, (id *)&qword_100092E48, (uint64_t)sub_100049D9C);
}

@end
