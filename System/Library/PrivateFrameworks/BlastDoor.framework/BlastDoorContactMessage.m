@implementation BlastDoorContactMessage

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

- (BlastDoorContactMessage_ContactInfo)contactInfo
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_class *v11;
  char *v12;
  char *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  objc_super v20;

  v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorContactMessage_contactMessage);
  v2 = *(_QWORD *)&self->contactMessage[OBJC_IVAR___BlastDoorContactMessage_contactMessage];
  v5 = *(_QWORD *)&self->contactMessage[OBJC_IVAR___BlastDoorContactMessage_contactMessage + 8];
  v4 = *(_QWORD *)&self->contactMessage[OBJC_IVAR___BlastDoorContactMessage_contactMessage + 16];
  v6 = *(_QWORD *)&self->contactMessage[OBJC_IVAR___BlastDoorContactMessage_contactMessage + 32];
  v7 = *(_QWORD *)&self->contactMessage[OBJC_IVAR___BlastDoorContactMessage_contactMessage + 48];
  v18 = *(_QWORD *)&self->contactMessage[OBJC_IVAR___BlastDoorContactMessage_contactMessage + 40];
  v19 = *(_QWORD *)&self->contactMessage[OBJC_IVAR___BlastDoorContactMessage_contactMessage + 24];
  v8 = *(_QWORD *)&self->contactMessage[OBJC_IVAR___BlastDoorContactMessage_contactMessage + 64];
  v9 = *(_QWORD *)&self->contactMessage[OBJC_IVAR___BlastDoorContactMessage_contactMessage + 80];
  v16 = *(_QWORD *)&self->contactMessage[OBJC_IVAR___BlastDoorContactMessage_contactMessage + 72];
  v17 = *(_QWORD *)&self->contactMessage[OBJC_IVAR___BlastDoorContactMessage_contactMessage + 56];
  v10 = *(_QWORD *)&self->contactMessage[OBJC_IVAR___BlastDoorContactMessage_contactMessage + 96];
  v15 = *(_QWORD *)&self->contactMessage[OBJC_IVAR___BlastDoorContactMessage_contactMessage + 88];
  v11 = (objc_class *)type metadata accessor for _ObjCContactMessage_ContactInfoWrapper();
  v12 = (char *)objc_allocWithZone(v11);
  v13 = &v12[OBJC_IVAR___BlastDoorContactMessage_ContactInfo_contactMessage_ContactInfo];
  *(_QWORD *)v13 = v3;
  *((_QWORD *)v13 + 1) = v2;
  *((_QWORD *)v13 + 2) = v5;
  *((_QWORD *)v13 + 3) = v4;
  *((_QWORD *)v13 + 4) = v19;
  *((_QWORD *)v13 + 5) = v6;
  *((_QWORD *)v13 + 6) = v18;
  *((_QWORD *)v13 + 7) = v7;
  *((_QWORD *)v13 + 8) = v17;
  *((_QWORD *)v13 + 9) = v8;
  *((_QWORD *)v13 + 10) = v16;
  *((_QWORD *)v13 + 11) = v9;
  *((_QWORD *)v13 + 12) = v15;
  *((_QWORD *)v13 + 13) = v10;
  v20.receiver = v12;
  v20.super_class = v11;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return (BlastDoorContactMessage_ContactInfo *)-[BlastDoorContactMessage init](&v20, sel_init);
}

- (BlastDoorContactMessage)init
{
  BlastDoorContactMessage *result;

  result = (BlastDoorContactMessage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD4CFFA0();
}

@end
