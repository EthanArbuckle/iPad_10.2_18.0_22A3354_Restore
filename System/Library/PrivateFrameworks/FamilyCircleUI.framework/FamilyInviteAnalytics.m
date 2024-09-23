@implementation FamilyInviteAnalytics

+ (_TtC14FamilyCircleUI21FamilyInviteAnalytics)shared
{
  if (qword_2549F5FC8 != -1)
    swift_once();
  return (_TtC14FamilyCircleUI21FamilyInviteAnalytics *)(id)qword_2549FBE88;
}

- (void)sendTapInviteOnSuggestedContactEvent
{
  sub_20DF428E4(13, 0xD000000000000013, 0x800000020E0A0090);
}

- (void)sendTapInviteOthersEvent
{
  sub_20DF428E4(14, 0x7469766E49706154, 0xEF73726568744F65);
}

- (void)sendSuggestedContactInvitedEventWithInviteCompletionStatus:(int64_t)a3
{
  sub_20DF42B74(a3);
}

- (void)sendFamilySuggestionsEventWithFamilySuggestionsProactiveCount:(int64_t)a3 familySuggestionsDisplayedCount:(int64_t)a4 hasBoostedContacts:(BOOL)a5 proactiveModelUsed:(int64_t)a6 serverRequestedModel:(id)a7
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _TtC14FamilyCircleUI21FamilyInviteAnalytics *v15;

  v12 = sub_20E07D5D4();
  v14 = v13;
  v15 = self;
  sub_20DF42C60(a3, a4, a5, a6, v12, v14);

  swift_bridgeObjectRelease();
}

- (void)sendOtherContactInvitedEventWithInviteTransport:(id)a3 inviteCompletionStatus:(int64_t)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC14FamilyCircleUI21FamilyInviteAnalytics *v9;

  v6 = sub_20E07D5D4();
  v8 = v7;
  v9 = self;
  sub_20DF42E20(v6, v8, a4);

  swift_bridgeObjectRelease();
}

- (void)sendFamilyInviteInteractionEventWithAction:(id)a3 inviteState:(id)a4 isReceiver:(BOOL)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _TtC14FamilyCircleUI21FamilyInviteAnalytics *v13;

  v7 = sub_20E07D5D4();
  v9 = v8;
  v10 = sub_20E07D5D4();
  v12 = v11;
  v13 = self;
  sub_20DF42F60(v7, v9, v10, v12, a5);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)sendFamilyInviteStatusUpdateEventWithUpdateStatus:(id)a3 success:(BOOL)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC14FamilyCircleUI21FamilyInviteAnalytics *v9;

  v6 = sub_20E07D5D4();
  v8 = v7;
  v9 = self;
  sub_20DF430D8(v6, v8, a4);

  swift_bridgeObjectRelease();
}

- (_TtC14FamilyCircleUI21FamilyInviteAnalytics)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FamilyInviteAnalytics();
  return -[FamilyInviteAnalytics init](&v3, sel_init);
}

@end
