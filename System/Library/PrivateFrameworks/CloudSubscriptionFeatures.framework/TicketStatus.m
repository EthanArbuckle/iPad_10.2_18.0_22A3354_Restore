@implementation TicketStatus

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (_TtC25CloudSubscriptionFeatures12TicketStatus)notYetQueued
{
  return (_TtC25CloudSubscriptionFeatures12TicketStatus *)sub_1A5BC7D04((uint64_t)a1, (uint64_t)a2, 0x7551746559746F6ELL, 0xEC00000064657565);
}

+ (_TtC25CloudSubscriptionFeatures12TicketStatus)enqueued
{
  return (_TtC25CloudSubscriptionFeatures12TicketStatus *)sub_1A5BC7D04((uint64_t)a1, (uint64_t)a2, 0x6465756575716E65, 0xE800000000000000);
}

+ (_TtC25CloudSubscriptionFeatures12TicketStatus)active
{
  return (_TtC25CloudSubscriptionFeatures12TicketStatus *)sub_1A5BC7D04((uint64_t)a1, (uint64_t)a2, 0x657669746361, 0xE600000000000000);
}

- (NSString)rawValue
{
  void *v2;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A5BC9B3C();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setRawValue:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  v4 = sub_1A5BC9B60();
  v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC25CloudSubscriptionFeatures12TicketStatus_rawValue);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (NSString)description
{
  _TtC25CloudSubscriptionFeatures12TicketStatus *v3;
  void *v4;

  swift_beginAccess();
  v3 = self;
  swift_bridgeObjectRetain();
  sub_1A5BC9BE4();

  swift_bridgeObjectRelease();
  v4 = (void *)sub_1A5BC9B3C();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (_TtC25CloudSubscriptionFeatures12TicketStatus)initWithCoder:(id)a3
{
  return (_TtC25CloudSubscriptionFeatures12TicketStatus *)TicketStatus.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  _TtC25CloudSubscriptionFeatures12TicketStatus *v6;
  void *v7;
  void *v8;

  swift_beginAccess();
  v5 = a3;
  v6 = self;
  swift_bridgeObjectRetain();
  v7 = (void *)sub_1A5BC9B3C();
  swift_bridgeObjectRelease();
  v8 = (void *)sub_1A5BC9B3C();
  objc_msgSend(v5, sel_encodeObject_forKey_, v7, v8);

}

- (BOOL)isEqual:(id)a3
{
  _TtC25CloudSubscriptionFeatures12TicketStatus *v4;
  _TtC25CloudSubscriptionFeatures12TicketStatus *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1A5BC9E3C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_1A5BC8C0C((uint64_t)v8);

  sub_1A5B8A7C0((uint64_t)v8);
  return v6 & 1;
}

- (_TtC25CloudSubscriptionFeatures12TicketStatus)init
{
  _TtC25CloudSubscriptionFeatures12TicketStatus *result;

  result = (_TtC25CloudSubscriptionFeatures12TicketStatus *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
