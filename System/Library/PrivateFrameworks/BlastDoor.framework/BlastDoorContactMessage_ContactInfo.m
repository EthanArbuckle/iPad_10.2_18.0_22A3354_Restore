@implementation BlastDoorContactMessage_ContactInfo

- (NSString)description
{
  void *v2;

  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1AD63B798();
  v2 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)familyName
{
  return (NSString *)sub_1AD4D24E8();
}

- (NSString)givenName
{
  return (NSString *)sub_1AD4CFC08();
}

- (NSString)organizationNameTitle
{
  return (NSString *)sub_1AD4CFC9C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorContactMessage_ContactInfo_contactMessage_ContactInfo);
}

- (NSString)contactFormatterTitle
{
  return (NSString *)sub_1AD4CFD0C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorContactMessage_ContactInfo_contactMessage_ContactInfo);
}

- (NSString)contactNameTitle
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)organizationNameSubtitle
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)contactNameSubtitle
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BlastDoorContactMessage_ContactInfo)init
{
  BlastDoorContactMessage_ContactInfo *result;

  result = (BlastDoorContactMessage_ContactInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD4CFFA0();
}

@end
