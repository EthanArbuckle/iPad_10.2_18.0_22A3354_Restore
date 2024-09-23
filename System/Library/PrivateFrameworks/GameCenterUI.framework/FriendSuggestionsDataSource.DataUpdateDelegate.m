@implementation FriendSuggestionsDataSource.DataUpdateDelegate

- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4
{
  uint64_t v4;
  _TtCC12GameCenterUI27FriendSuggestionsDataSourceP33_F815CB2A6384F01E6B425971DC87B4FC18DataUpdateDelegate *v6;

  v4 = *(_QWORD *)&a3;
  sub_1AB7DAEB8();
  v6 = self;
  sub_1AB4F955C(v4);

  swift_bridgeObjectRelease();
}

- (void)dealloc
{
  _TtCC12GameCenterUI27FriendSuggestionsDataSourceP33_F815CB2A6384F01E6B425971DC87B4FC18DataUpdateDelegate *v2;

  v2 = self;
  sub_1AB4A5D94();
}

- (void).cxx_destruct
{
  swift_release();
}

- (_TtCC12GameCenterUI27FriendSuggestionsDataSourceP33_F815CB2A6384F01E6B425971DC87B4FC18DataUpdateDelegate)init
{
  sub_1AB4F963C();
}

@end
