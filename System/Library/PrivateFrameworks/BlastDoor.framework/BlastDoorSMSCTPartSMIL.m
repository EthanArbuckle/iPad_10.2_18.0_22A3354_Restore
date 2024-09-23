@implementation BlastDoorSMSCTPartSMIL

- (NSString)description
{
  void *v2;

  sub_1AD00C45C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorSMSCTPartSMIL_sMSCTPartSMIL));
  swift_bridgeObjectRetain();
  sub_1AD63B798();
  v2 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSAttributedString)contentBody
{
  return (NSAttributedString *)sub_1AD4CB4A4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorSMSCTPartSMIL_sMSCTPartSMIL);
}

- (NSArray)orderedParts
{
  return (NSArray *)sub_1AD4C9C78(self, (uint64_t)a2, (void (*)(void))sub_1AD4C4B88, (void (*)(void))type metadata accessor for _ObjCSMSParserPartWrapper);
}

- (BlastDoorSMSCTPartSMIL)init
{
  BlastDoorSMSCTPartSMIL *result;

  result = (BlastDoorSMSCTPartSMIL *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD0096E4(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorSMSCTPartSMIL_sMSCTPartSMIL));
  swift_bridgeObjectRelease();
}

@end
