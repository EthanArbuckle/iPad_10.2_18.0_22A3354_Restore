@implementation CDPEscapeOffersLedger

- (unint64_t)escapeOffersPresented
{
  return *(unint64_t *)((_BYTE *)&self->super.isa + OBJC_IVAR___CDPEscapeOffersLedger__escapeOffersPresented) & 0xFFFFFFFFFFFFFFE2;
}

- (NSString)description
{
  CDPEscapeOffersLedger *v2;
  void *v3;

  v2 = self;
  CDPEscapeOffersLedger.description.getter();

  v3 = (void *)sub_20DB9F63C();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (BOOL)canOfferRPD
{
  CDPEscapeOffersLedger *v2;
  BOOL v3;

  v2 = self;
  v3 = sub_20DB909E0();

  return v3;
}

- (NSError)rpdBlockingError
{
  CDPEscapeOffersLedger *v2;
  id v3;
  void *v4;

  v2 = self;
  v3 = sub_20DB90BA8();

  if (v3)
  {
    v4 = (void *)sub_20DB9F594();

  }
  else
  {
    v4 = 0;
  }
  return (NSError *)v4;
}

- (CDPEscapeOffersLedger)initWithExpectedEscapeOffers:(unint64_t)a3 recoveryFlowContext:(id)a4 deviceHasPasscode:(BOOL)a5 probationChecker:(id)a6 deviceIsVM:(BOOL)a7
{
  id v11;

  v11 = a4;
  swift_unknownObjectRetain();
  return (CDPEscapeOffersLedger *)sub_20DB91318(a3, v11, a5, (uint64_t)a6, a7);
}

- (void)insert:(unint64_t)a3
{
  CDPEscapeOffersLedger *v4;

  v4 = self;
  sub_20DB91608(a3);

}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

}

- (CDPEscapeOffersLedger)init
{
  CDPEscapeOffersLedger *result;

  result = (CDPEscapeOffersLedger *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
