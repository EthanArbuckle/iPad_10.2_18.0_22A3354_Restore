@implementation DeviceModelCoderContainer

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)groupID
{
  return (NSString *)sub_22DF397B0((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_22DF39780);
}

- (void)setGroupID:(id)a3
{
  sub_22DF3980C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_22DF39798);
}

- (NSString)groupName
{
  return (NSString *)sub_22DF397B0((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_22DF397F4);
}

- (void)setGroupName:(id)a3
{
  sub_22DF3980C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_22DF3987C);
}

- (NSString)model
{
  return (NSString *)sub_22DF397B0((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_22DF39894);
}

- (void)setModel:(id)a3
{
  sub_22DF3980C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_22DF398AC);
}

- (NSString)name
{
  return (NSString *)sub_22DF397B0((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_22DF398C4);
}

- (void)setName:(id)a3
{
  sub_22DF3980C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_22DF398DC);
}

- (NSString)pairID
{
  return (NSString *)sub_22DF397B0((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_22DF398F4);
}

- (void)setPairID:(id)a3
{
  sub_22DF3980C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_22DF3990C);
}

- (NSString)pairName
{
  return (NSString *)sub_22DF397B0((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_22DF39924);
}

- (void)setPairName:(id)a3
{
  sub_22DF3980C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_22DF3993C);
}

- (NSString)roomID
{
  return (NSString *)sub_22DF397B0((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_22DF39954);
}

- (void)setRoomID:(id)a3
{
  sub_22DF3980C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_22DF3996C);
}

- (NSString)roomName
{
  return (NSString *)sub_22DF397B0((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_22DF39984);
}

- (void)setRoomName:(id)a3
{
  sub_22DF3980C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_22DF399D0);
}

- (DeviceModelCoderContainer)init
{
  return (DeviceModelCoderContainer *)sub_22DF399F4();
}

- (DeviceModelCoderContainer)initWithCoder:(id)a3
{
  return (DeviceModelCoderContainer *)sub_22DF39AAC(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  DeviceModelCoderContainer *v5;

  v4 = a3;
  v5 = self;
  sub_22DF39C74(v4);

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
