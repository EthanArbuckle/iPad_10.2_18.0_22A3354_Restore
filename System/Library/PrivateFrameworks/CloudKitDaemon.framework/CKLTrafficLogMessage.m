@implementation CKLTrafficLogMessage

- (NSString)uuid
{
  void *v2;

  TrafficLogMessage.uuid.getter();
  v2 = (void *)MEMORY[0x1C3B822A0]();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSDate)requestTime
{
  return (NSDate *)sub_1BEA05B38((uint64_t)self, (uint64_t)a2, (uint64_t *)&unk_1EF570DB0, (void (*)(uint64_t))TrafficLogMessage.requestTime.getter, (uint64_t (*)(_QWORD))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB06B8]);
}

- (NSString)requestMethod
{
  uint64_t v2;
  void *v3;

  TrafficLogMessage.requestMethod.getter();
  if (v2)
  {
    v3 = (void *)MEMORY[0x1C3B822A0]();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (NSURL)requestURL
{
  return (NSURL *)sub_1BEA05B38((uint64_t)self, (uint64_t)a2, &qword_1EF5709C8, (void (*)(uint64_t))TrafficLogMessage.requestURL.getter, (uint64_t (*)(_QWORD))MEMORY[0x1E0CAFFF8], (uint64_t (*)(void))MEMORY[0x1E0CAFE38]);
}

- (NSDictionary)requestHeaders
{
  return (NSDictionary *)sub_1BEA05C24(self, (uint64_t)a2, TrafficLogMessage.requestHeaders.getter);
}

- (int64_t)bodyStreamResetCount
{
  return TrafficLogMessage.bodyStreamResetCount.getter();
}

- (NSArray)requestObjects
{
  return (NSArray *)sub_1BEA05C88(self, (uint64_t)a2, TrafficLogMessage.requestObjects.getter);
}

- (int64_t)responseStatus
{
  return TrafficLogMessage.responseStatus.getter();
}

- (NSDate)responseTime
{
  return (NSDate *)sub_1BEA05B38((uint64_t)self, (uint64_t)a2, (uint64_t *)&unk_1EF570DB0, (void (*)(uint64_t))TrafficLogMessage.responseTime.getter, (uint64_t (*)(_QWORD))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB06B8]);
}

- (NSDictionary)responseHeaders
{
  return (NSDictionary *)sub_1BEA05C24(self, (uint64_t)a2, TrafficLogMessage.responseHeaders.getter);
}

- (NSArray)responseObjects
{
  return (NSArray *)sub_1BEA05C88(self, (uint64_t)a2, TrafficLogMessage.responseObjects.getter);
}

- (CKLTrafficLogMessage)initWithUuid:(id)a3 requestMetadata:(id)a4 requestObjects:(id)a5 bodyStreamResetCount:(int64_t)a6 responseMetadata:(id)a7 responseObjects:(id)a8
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;

  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v15 = v14;
  if (a5)
  {
    sub_1BE9BEF38(&qword_1EF5709D8);
    a5 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  if (a8)
  {
    sub_1BE9BEF38(&qword_1EF5709D8);
    a8 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  v16 = a7;
  v17 = a4;
  return (CKLTrafficLogMessage *)TrafficLogMessage.init(uuid:requestMetadata:requestObjects:bodyStreamResetCount:responseMetadata:responseObjects:)(v13, v15, (char *)a4, (uint64_t)a5, a6, (char *)a7, (uint64_t)a8);
}

- (NSString)bundleIdentifier
{
  return (NSString *)sub_1BEA06174(self, (uint64_t)a2, sub_1BEA0615C);
}

- (NSString)containerIdentifier
{
  return (NSString *)sub_1BEA06174(self, (uint64_t)a2, sub_1BEA061D4);
}

- (NSString)description
{
  CKLTrafficLogMessage *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = sub_1BEA06294();
  v5 = v4;

  v6 = (void *)MEMORY[0x1C3B822A0](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (CKLTrafficLogMessage)init
{
  TrafficLogMessage.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1BE9BEF00((uint64_t)self + OBJC_IVAR___CKLTrafficLogMessage_requestTime, (uint64_t *)&unk_1EF570DB0);
  swift_bridgeObjectRelease();
  sub_1BE9BEF00((uint64_t)self + OBJC_IVAR___CKLTrafficLogMessage_requestURL, &qword_1EF5709C8);
  sub_1BE9BE174();
  sub_1BE9BE174();
  sub_1BE9BEF00((uint64_t)self + OBJC_IVAR___CKLTrafficLogMessage_responseTime, (uint64_t *)&unk_1EF570DB0);
  sub_1BE9BE174();
  swift_bridgeObjectRelease();
}

@end
