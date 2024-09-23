@implementation CKHistoricEvent

- (NSString)identifier
{
  void *v2;

  CKHistoricEvent.identifier.getter();
  v2 = (void *)sub_1A4920D30();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSDate)firstSeen
{
  return (NSDate *)sub_1A48EB234((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_1A48EB21C);
}

- (NSDate)lastSeen
{
  return (NSDate *)sub_1A48EB234((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_1A48EB2B4);
}

- (int64_t)frequency
{
  return sub_1A48EB334();
}

- (double)lastDuration
{
  return sub_1A48EB364();
}

- (double)totalDuration
{
  return sub_1A48EB394();
}

- (NSDictionary)metadata
{
  void *v2;

  sub_1A48EB3F8();
  v2 = (void *)sub_1A4920CE8();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  CKHistoricEvent *v5;

  v4 = a3;
  v5 = self;
  sub_1A48EB528(v4);

}

- (CKHistoricEvent)initWithCoder:(id)a3
{
  return (CKHistoricEvent *)CKHistoricEvent.init(coder:)(a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)init:(id)a3
{
  return CKHistoricEvent.init(_:)(a3);
}

- (id)initFrom:(id)a3 withIdentifier:(id)a4
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = sub_1A4920D3C();
  v6 = v5;
  v7 = sub_1A4920D3C();
  return CKHistoricEvent.init(from:withIdentifier:)(v4, v6, v7, v8);
}

- (id)copyWithZone:(void *)a3
{
  CKHistoricEvent *v3;
  void *v4;
  uint64_t v6[4];

  v3 = self;
  sub_1A48ECE64(v6);

  __swift_project_boxed_opaque_existential_0(v6, v6[3]);
  v4 = (void *)sub_1A492118C();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  return v4;
}

- (CKHistoricEvent)init
{
  CKHistoricEvent.init()();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___CKHistoricEvent__firstSeen;
  v4 = OUTLINED_FUNCTION_47_2();
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR___CKHistoricEvent__lastSeen, v4);
  swift_bridgeObjectRelease();
}

@end
