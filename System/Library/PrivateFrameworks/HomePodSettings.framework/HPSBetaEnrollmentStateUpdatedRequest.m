@implementation HPSBetaEnrollmentStateUpdatedRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)groupID
{
  return (NSString *)sub_22DF397B0((uint64_t)self, (uint64_t)a2, (void (*)(void))BetaEnrollment.StateUpdatedRequest.groupID.getter);
}

- (void)setGroupID:(id)a3
{
  sub_22DF3980C(self, (uint64_t)a2, (uint64_t)a3, BetaEnrollment.StateUpdatedRequest.groupID.setter);
}

- (NSString)groupName
{
  return (NSString *)sub_22DF397B0((uint64_t)self, (uint64_t)a2, (void (*)(void))BetaEnrollment.StateUpdatedRequest.groupName.getter);
}

- (void)setGroupName:(id)a3
{
  sub_22DF3980C(self, (uint64_t)a2, (uint64_t)a3, BetaEnrollment.StateUpdatedRequest.groupName.setter);
}

- (NSString)model
{
  return (NSString *)sub_22DF397B0((uint64_t)self, (uint64_t)a2, (void (*)(void))BetaEnrollment.StateUpdatedRequest.model.getter);
}

- (void)setModel:(id)a3
{
  sub_22DF3980C(self, (uint64_t)a2, (uint64_t)a3, BetaEnrollment.StateUpdatedRequest.model.setter);
}

- (NSString)name
{
  return (NSString *)sub_22DF397B0((uint64_t)self, (uint64_t)a2, (void (*)(void))BetaEnrollment.StateUpdatedRequest.name.getter);
}

- (void)setName:(id)a3
{
  sub_22DF3980C(self, (uint64_t)a2, (uint64_t)a3, BetaEnrollment.StateUpdatedRequest.name.setter);
}

- (NSString)pairID
{
  return (NSString *)sub_22DF397B0((uint64_t)self, (uint64_t)a2, (void (*)(void))BetaEnrollment.StateUpdatedRequest.pairID.getter);
}

- (void)setPairID:(id)a3
{
  sub_22DF3980C(self, (uint64_t)a2, (uint64_t)a3, BetaEnrollment.StateUpdatedRequest.pairID.setter);
}

- (NSString)pairName
{
  return (NSString *)sub_22DF397B0((uint64_t)self, (uint64_t)a2, (void (*)(void))BetaEnrollment.StateUpdatedRequest.pairName.getter);
}

- (void)setPairName:(id)a3
{
  sub_22DF3980C(self, (uint64_t)a2, (uint64_t)a3, BetaEnrollment.StateUpdatedRequest.pairName.setter);
}

- (NSString)roomID
{
  return (NSString *)sub_22DF397B0((uint64_t)self, (uint64_t)a2, (void (*)(void))BetaEnrollment.StateUpdatedRequest.roomID.getter);
}

- (void)setRoomID:(id)a3
{
  sub_22DF3980C(self, (uint64_t)a2, (uint64_t)a3, BetaEnrollment.StateUpdatedRequest.roomID.setter);
}

- (NSString)roomName
{
  return (NSString *)sub_22DF397B0((uint64_t)self, (uint64_t)a2, (void (*)(void))BetaEnrollment.StateUpdatedRequest.roomName.getter);
}

- (void)setRoomName:(id)a3
{
  sub_22DF3980C(self, (uint64_t)a2, (uint64_t)a3, BetaEnrollment.StateUpdatedRequest.roomName.setter);
}

- (HPSBetaEnrollmentStateUpdatedRequest)initWithCoder:(id)a3
{
  return (HPSBetaEnrollmentStateUpdatedRequest *)sub_22DF49150(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  HPSBetaEnrollmentStateUpdatedRequest *v5;

  v4 = a3;
  v5 = self;
  BetaEnrollment.StateUpdatedRequest.encode(with:)((NSCoder)v4);

}

- (BOOL)isEqual:(id)a3
{
  HPSBetaEnrollmentStateUpdatedRequest *v4;
  HPSBetaEnrollmentStateUpdatedRequest *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_22DFDDBB0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = BetaEnrollment.StateUpdatedRequest.isEqual(_:)((uint64_t)v8);

  sub_22DF3A824((uint64_t)v8);
  return v6 & 1;
}

- (HPSBetaEnrollmentStateUpdatedRequest)init
{
  BetaEnrollment.StateUpdatedRequest.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_9_1();
  swift_bridgeObjectRelease();
}

@end
