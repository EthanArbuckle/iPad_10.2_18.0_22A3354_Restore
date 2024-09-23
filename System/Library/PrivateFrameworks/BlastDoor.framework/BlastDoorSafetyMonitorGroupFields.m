@implementation BlastDoorSafetyMonitorGroupFields

- (NSString)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v2 = *(_QWORD *)&self->safetyMonitorGroupFields[OBJC_IVAR___BlastDoorSafetyMonitorGroupFields_safetyMonitorGroupFields
                                                + 16];
  v3 = *(_QWORD *)&self->safetyMonitorGroupFields[OBJC_IVAR___BlastDoorSafetyMonitorGroupFields_safetyMonitorGroupFields
                                                + 24];
  v4 = *(_QWORD *)&self->safetyMonitorGroupFields[OBJC_IVAR___BlastDoorSafetyMonitorGroupFields_safetyMonitorGroupFields
                                                + 32];
  v5 = *(_QWORD *)&self->safetyMonitorGroupFields[OBJC_IVAR___BlastDoorSafetyMonitorGroupFields_safetyMonitorGroupFields
                                                + 40];
  v6 = *(_QWORD *)&self->safetyMonitorGroupFields[OBJC_IVAR___BlastDoorSafetyMonitorGroupFields_safetyMonitorGroupFields
                                                + 64];
  v7 = *(_QWORD *)&self->safetyMonitorGroupFields[OBJC_IVAR___BlastDoorSafetyMonitorGroupFields_safetyMonitorGroupFields
                                                + 72];
  v8 = *(_QWORD *)&self->safetyMonitorGroupFields[OBJC_IVAR___BlastDoorSafetyMonitorGroupFields_safetyMonitorGroupFields
                                                + 96];
  v9 = *(_QWORD *)&self->safetyMonitorGroupFields[OBJC_IVAR___BlastDoorSafetyMonitorGroupFields_safetyMonitorGroupFields
                                                + 104];
  swift_retain();
  sub_1AD003E48(v2, v3);
  sub_1AD00408C(v4, v5);
  swift_retain();
  sub_1AD003E48(v6, v7);
  swift_retain();
  sub_1AD003E48(v8, v9);
  sub_1AD63B798();
  v10 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v10;
}

- (unint64_t)index
{
  return *(unint64_t *)((char *)&self->super.isa
                             + OBJC_IVAR___BlastDoorSafetyMonitorGroupFields_safetyMonitorGroupFields);
}

- (NSString)receiverHandle
{
  return (NSString *)sub_1AD4D40FC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorSafetyMonitorGroupFields_safetyMonitorGroupFields);
}

- (NSData)sharingInvitationData
{
  unint64_t v2;
  void *v3;
  uint64_t v4;

  v2 = *(_QWORD *)&self->safetyMonitorGroupFields[OBJC_IVAR___BlastDoorSafetyMonitorGroupFields_safetyMonitorGroupFields
                                                + 40];
  if (v2 >> 60 == 15)
  {
    v3 = 0;
  }
  else
  {
    v4 = *(_QWORD *)&self->safetyMonitorGroupFields[OBJC_IVAR___BlastDoorSafetyMonitorGroupFields_safetyMonitorGroupFields
                                                  + 32];
    sub_1AD0040A0(v4, v2);
    v3 = (void *)sub_1AD63AFA0();
    sub_1AD004118(v4, v2);
  }
  return (NSData *)v3;
}

- (NSString)shareURL
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  NSString *result;

  v2 = *(_QWORD *)&self->safetyMonitorGroupFields[OBJC_IVAR___BlastDoorSafetyMonitorGroupFields_safetyMonitorGroupFields
                                                + 72];
  if (!v2)
  {
    v3 = 0;
    return (NSString *)v3;
  }
  if (v2 != 1)
  {
    v4 = *(_QWORD *)&self->safetyMonitorGroupFields[OBJC_IVAR___BlastDoorSafetyMonitorGroupFields_safetyMonitorGroupFields
                                                  + 64];
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1AD63B744();
    sub_1AD003F24(v4, v2);
    return (NSString *)v3;
  }
  result = (NSString *)sub_1AD63BE28();
  __break(1u);
  return result;
}

- (NSString)participantID
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  NSString *result;

  v2 = *(_QWORD *)&self->safetyMonitorGroupFields[OBJC_IVAR___BlastDoorSafetyMonitorGroupFields_safetyMonitorGroupFields
                                                + 104];
  if (!v2)
  {
    v3 = 0;
    return (NSString *)v3;
  }
  if (v2 != 1)
  {
    v4 = *(_QWORD *)&self->safetyMonitorGroupFields[OBJC_IVAR___BlastDoorSafetyMonitorGroupFields_safetyMonitorGroupFields
                                                  + 96];
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1AD63B744();
    sub_1AD003F24(v4, v2);
    return (NSString *)v3;
  }
  result = (NSString *)sub_1AD63BE28();
  __break(1u);
  return result;
}

- (BlastDoorSafetyMonitorGroupFields)init
{
  BlastDoorSafetyMonitorGroupFields *result;

  result = (BlastDoorSafetyMonitorGroupFields *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = *(_QWORD *)&self->safetyMonitorGroupFields[OBJC_IVAR___BlastDoorSafetyMonitorGroupFields_safetyMonitorGroupFields
                                                + 16];
  v3 = *(_QWORD *)&self->safetyMonitorGroupFields[OBJC_IVAR___BlastDoorSafetyMonitorGroupFields_safetyMonitorGroupFields
                                                + 24];
  v4 = *(_QWORD *)&self->safetyMonitorGroupFields[OBJC_IVAR___BlastDoorSafetyMonitorGroupFields_safetyMonitorGroupFields
                                                + 32];
  v5 = *(_QWORD *)&self->safetyMonitorGroupFields[OBJC_IVAR___BlastDoorSafetyMonitorGroupFields_safetyMonitorGroupFields
                                                + 40];
  v6 = *(_QWORD *)&self->safetyMonitorGroupFields[OBJC_IVAR___BlastDoorSafetyMonitorGroupFields_safetyMonitorGroupFields
                                                + 64];
  v7 = *(_QWORD *)&self->safetyMonitorGroupFields[OBJC_IVAR___BlastDoorSafetyMonitorGroupFields_safetyMonitorGroupFields
                                                + 72];
  v8 = *(_QWORD *)&self->safetyMonitorGroupFields[OBJC_IVAR___BlastDoorSafetyMonitorGroupFields_safetyMonitorGroupFields
                                                + 96];
  v9 = *(_QWORD *)&self->safetyMonitorGroupFields[OBJC_IVAR___BlastDoorSafetyMonitorGroupFields_safetyMonitorGroupFields
                                                + 104];
  swift_release();
  sub_1AD003F24(v2, v3);
  sub_1AD004118(v4, v5);
  swift_release();
  sub_1AD003F24(v6, v7);
  swift_release();
  sub_1AD003F24(v8, v9);
}

@end
