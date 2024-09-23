@implementation BlastDoorBasicTapBack

- (NSString)description
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  __int128 v6;

  v2 = *(_QWORD *)&self->basicTapBack[OBJC_IVAR___BlastDoorBasicTapBack_basicTapBack + 72];
  v3 = *(_QWORD *)&self->basicTapBack[OBJC_IVAR___BlastDoorBasicTapBack_basicTapBack + 80];
  v6 = *(_OWORD *)&self->basicTapBack[OBJC_IVAR___BlastDoorBasicTapBack_basicTapBack + 88];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1AD14145C(v2, v3, v6);
  swift_bridgeObjectRetain();
  sub_1AD63B798();
  v4 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (int64_t)associatedMessageType
{
  int64_t result;
  char v3;

  result = sub_1AD4D959C(qword_1AD68D900[*((char *)&self->super.isa + OBJC_IVAR___BlastDoorBasicTapBack_basicTapBack)]);
  if ((v3 & 1) != 0)
    __break(1u);
  return result;
}

- (NSString)associatedMessageGUID
{
  return (NSString *)sub_1AD4C918C();
}

- (NSString)associatedMessageFallbackHash
{
  return (NSString *)sub_1AD4C9220((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorBasicTapBack_basicTapBack);
}

- (_NSRange)associatedMessageRange
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = sub_1AD4C9290((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorBasicTapBack_basicTapBack);
  result.length = v3;
  result.location = v2;
  return result;
}

- (NSArray)participantDestinationIdentifiers
{
  return (NSArray *)sub_1AD4C92E0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorBasicTapBack_basicTapBack);
}

- (BlastDoorBasicTapBack_MessageSummaryInfo)messageSummaryInfo
{
  char *v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  objc_class *v7;
  char *v8;
  char *v9;
  objc_super v10;

  v2 = (char *)self + OBJC_IVAR___BlastDoorBasicTapBack_basicTapBack;
  v3 = *(_QWORD *)&self->basicTapBack[OBJC_IVAR___BlastDoorBasicTapBack_basicTapBack + 88];
  if (v3 == 1)
    return (BlastDoorBasicTapBack_MessageSummaryInfo *)0;
  v6 = *((_QWORD *)v2 + 10);
  v5 = *((_QWORD *)v2 + 11);
  v7 = (objc_class *)type metadata accessor for _ObjCBasicTapBack_MessageSummaryInfoWrapper();
  v8 = (char *)objc_allocWithZone(v7);
  v9 = &v8[OBJC_IVAR___BlastDoorBasicTapBack_MessageSummaryInfo_basicTapBack_MessageSummaryInfo];
  *v9 = v6;
  *((_QWORD *)v9 + 1) = v5;
  *((_QWORD *)v9 + 2) = v3;
  v10.receiver = v8;
  v10.super_class = v7;
  swift_bridgeObjectRetain();
  return (BlastDoorBasicTapBack_MessageSummaryInfo *)-[BlastDoorBasicTapBack init](&v10, sel_init);
}

- (NSString)plainTextBody
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BlastDoorBasicTapBack)init
{
  BlastDoorBasicTapBack *result;

  result = (BlastDoorBasicTapBack *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)&self->basicTapBack[OBJC_IVAR___BlastDoorBasicTapBack_basicTapBack + 72];
  v3 = *(_QWORD *)&self->basicTapBack[OBJC_IVAR___BlastDoorBasicTapBack_basicTapBack + 80];
  v4 = *(_QWORD *)&self->basicTapBack[OBJC_IVAR___BlastDoorBasicTapBack_basicTapBack + 88];
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1AD1416EC(v2, v3, v4);
  swift_bridgeObjectRelease();
}

@end
