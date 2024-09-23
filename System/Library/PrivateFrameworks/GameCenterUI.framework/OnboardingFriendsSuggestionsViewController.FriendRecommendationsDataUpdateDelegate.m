@implementation OnboardingFriendsSuggestionsViewController.FriendRecommendationsDataUpdateDelegate

- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4
{
  uint64_t v4;
  uint64_t v6;
  _TtCC12GameCenterUI42OnboardingFriendsSuggestionsViewControllerP33_48F72ACA40F78B09E808C26EC55289D339FriendRecommendationsDataUpdateDelegate *v7;

  v4 = *(_QWORD *)&a3;
  v6 = sub_1AB7DAEB8();
  v7 = self;
  sub_1AB4A5CEC(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)dealloc
{
  _TtCC12GameCenterUI42OnboardingFriendsSuggestionsViewControllerP33_48F72ACA40F78B09E808C26EC55289D339FriendRecommendationsDataUpdateDelegate *v2;

  v2 = self;
  sub_1AB4A5D94();
}

- (void).cxx_destruct
{
  swift_release();
}

- (_TtCC12GameCenterUI42OnboardingFriendsSuggestionsViewControllerP33_48F72ACA40F78B09E808C26EC55289D339FriendRecommendationsDataUpdateDelegate)init
{
  sub_1AB4A5E4C();
}

@end
