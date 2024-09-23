@implementation BlastDoorSMSCTPart

- (NSString)description
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  void *v7;

  v2 = *(_QWORD *)&self->sMSCTPart[OBJC_IVAR___BlastDoorSMSCTPart_sMSCTPart + 40];
  v3 = *(_QWORD *)&self->sMSCTPart[OBJC_IVAR___BlastDoorSMSCTPart_sMSCTPart + 48];
  v4 = *(_QWORD *)&self->sMSCTPart[OBJC_IVAR___BlastDoorSMSCTPart_sMSCTPart + 56];
  v5 = *(_QWORD *)&self->sMSCTPart[OBJC_IVAR___BlastDoorSMSCTPart_sMSCTPart + 64];
  v6 = self->sMSCTPart[OBJC_IVAR___BlastDoorSMSCTPart_sMSCTPart + 72];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1AD00C410(v2, v3, v4, v5, v6);
  sub_1AD63B798();
  v7 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v7;
}

- (NSString)contentType
{
  return (NSString *)sub_1AD4D4828((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorSMSCTPart_sMSCTPart);
}

- (NSString)contentId
{
  return (NSString *)sub_1AD4D4898((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorSMSCTPart_sMSCTPart);
}

- (NSString)contentLocation
{
  return (NSString *)sub_1AD4CFC9C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorSMSCTPart_sMSCTPart);
}

- (BlastDoorSMSCTPartContentWrapper)content
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  objc_class *v7;
  char *v8;
  char *v9;
  objc_super v11;

  v2 = *(_QWORD *)&self->sMSCTPart[OBJC_IVAR___BlastDoorSMSCTPart_sMSCTPart + 40];
  v3 = *(_QWORD *)&self->sMSCTPart[OBJC_IVAR___BlastDoorSMSCTPart_sMSCTPart + 48];
  v4 = *(_QWORD *)&self->sMSCTPart[OBJC_IVAR___BlastDoorSMSCTPart_sMSCTPart + 56];
  v5 = *(_QWORD *)&self->sMSCTPart[OBJC_IVAR___BlastDoorSMSCTPart_sMSCTPart + 64];
  v6 = self->sMSCTPart[OBJC_IVAR___BlastDoorSMSCTPart_sMSCTPart + 72];
  v7 = (objc_class *)type metadata accessor for _ObjCEnumSMSCTPartContentWrapper();
  v8 = (char *)objc_allocWithZone(v7);
  v9 = &v8[OBJC_IVAR___BlastDoorSMSCTPartContentWrapper_sMSCTPart_Content];
  *(_QWORD *)v9 = v2;
  *((_QWORD *)v9 + 1) = v3;
  *((_QWORD *)v9 + 2) = v4;
  *((_QWORD *)v9 + 3) = v5;
  v9[32] = v6;
  sub_1AD00C410(v2, v3, v4, v5, v6);
  v11.receiver = v8;
  v11.super_class = v7;
  return (BlastDoorSMSCTPartContentWrapper *)-[BlastDoorSMSCTPart init](&v11, sel_init);
}

- (BlastDoorSMSCTPart)init
{
  BlastDoorSMSCTPart *result;

  result = (BlastDoorSMSCTPart *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v2 = *(_QWORD *)&self->sMSCTPart[OBJC_IVAR___BlastDoorSMSCTPart_sMSCTPart + 40];
  v3 = *(_QWORD *)&self->sMSCTPart[OBJC_IVAR___BlastDoorSMSCTPart_sMSCTPart + 48];
  v4 = *(_QWORD *)&self->sMSCTPart[OBJC_IVAR___BlastDoorSMSCTPart_sMSCTPart + 56];
  v5 = *(_QWORD *)&self->sMSCTPart[OBJC_IVAR___BlastDoorSMSCTPart_sMSCTPart + 64];
  v6 = self->sMSCTPart[OBJC_IVAR___BlastDoorSMSCTPart_sMSCTPart + 72];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1AD00C4C8(v2, v3, v4, v5, v6);
}

@end
