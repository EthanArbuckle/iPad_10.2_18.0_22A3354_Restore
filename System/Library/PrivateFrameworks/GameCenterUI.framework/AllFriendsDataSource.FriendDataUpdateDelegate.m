@implementation AllFriendsDataSource.FriendDataUpdateDelegate

- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4
{
  uint64_t v4;
  _TtCC12GameCenterUI20AllFriendsDataSourceP33_761C47502D29AA1BE27B103BF361D03024FriendDataUpdateDelegate *v6;

  v4 = *(_QWORD *)&a3;
  sub_1AB7DAEB8();
  v6 = self;
  sub_1AB673A94(v4);

  swift_bridgeObjectRelease();
}

- (void)dealloc
{
  _TtCC12GameCenterUI20AllFriendsDataSourceP33_761C47502D29AA1BE27B103BF361D03024FriendDataUpdateDelegate *v2;

  v2 = self;
  sub_1AB4A5D94();
}

- (void).cxx_destruct
{
  swift_release();
}

- (_TtCC12GameCenterUI20AllFriendsDataSourceP33_761C47502D29AA1BE27B103BF361D03024FriendDataUpdateDelegate)init
{
  sub_1AB673B70();
}

@end
