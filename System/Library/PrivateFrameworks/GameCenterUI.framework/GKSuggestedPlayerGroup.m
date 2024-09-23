@implementation GKSuggestedPlayerGroup

- (NSArray)players
{
  void *v2;

  sub_1AB7C2D58();
  sub_1AB4797FC();
  v2 = (void *)sub_1AB7DB0E0();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setPlayers:(id)a3
{
  uint64_t v4;
  _TtC12GameCenterUI22GKSuggestedPlayerGroup *v5;

  sub_1AB4797FC();
  v4 = sub_1AB7DB0EC();
  v5 = self;
  sub_1AB7C2DE0(v4);

}

- (NSString)groupName
{
  return (NSString *)sub_1AB7C2EE8((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_1AB7C2E88);
}

- (void)setGroupName:(id)a3
{
  sub_1AB504FB0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1AB7C2EA0);
}

- (NSString)messagesGroupIdentifier
{
  return (NSString *)sub_1AB7C2EE8((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_1AB7C2F2C);
}

- (void)setMessagesGroupIdentifier:(id)a3
{
  sub_1AB504FB0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1AB7C2F44);
}

- (int64_t)source
{
  int64_t result;

  sub_1AB7C2FE0();
  return result;
}

- (void)setSource:(int64_t)a3
{
  sub_1AB7C302C(a3);
}

- (NSString)conversationIdentifier
{
  return (NSString *)sub_1AB7C2EE8((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_1AB7C30A4);
}

- (void)setConversationIdentifier:(id)a3
{
  sub_1AB504FB0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1AB7C30F8);
}

- (BOOL)fromPeopleSuggester
{
  char v2;

  sub_1AB7C31AC();
  return v2 & 1;
}

- (BOOL)isNearby
{
  char v2;

  sub_1AB7C3200();
  return v2 & 1;
}

- (_TtC12GameCenterUI22GKSuggestedPlayerGroup)init
{
  return (_TtC12GameCenterUI22GKSuggestedPlayerGroup *)GKSuggestedPlayerGroup.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_14_5();
  OUTLINED_FUNCTION_14_5();
  swift_bridgeObjectRelease();
}

@end
