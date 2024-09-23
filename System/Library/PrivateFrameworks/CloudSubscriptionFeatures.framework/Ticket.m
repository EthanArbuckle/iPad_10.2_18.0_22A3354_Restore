@implementation Ticket

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  _TtC25CloudSubscriptionFeatures6Ticket *v2;
  void *v3;

  v2 = self;
  sub_1A5B966B0();

  v3 = (void *)sub_1A5BC9B3C();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSString)ticket
{
  void *v2;

  if (*(_QWORD *)&self->ticket[OBJC_IVAR____TtC25CloudSubscriptionFeatures6Ticket_ticket])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1A5BC9B3C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (_TtC25CloudSubscriptionFeatures12TicketStatus)status
{
  return (_TtC25CloudSubscriptionFeatures12TicketStatus *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                                  + OBJC_IVAR____TtC25CloudSubscriptionFeatures6Ticket_status));
}

- (_TtC25CloudSubscriptionFeatures6Ticket)initWithCoder:(id)a3
{
  return (_TtC25CloudSubscriptionFeatures6Ticket *)Ticket.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC25CloudSubscriptionFeatures6Ticket *v5;

  v4 = a3;
  v5 = self;
  sub_1A5B96E18(v4);

}

- (_TtC25CloudSubscriptionFeatures6Ticket)init
{
  _TtC25CloudSubscriptionFeatures6Ticket *result;

  result = (_TtC25CloudSubscriptionFeatures6Ticket *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

}

@end
