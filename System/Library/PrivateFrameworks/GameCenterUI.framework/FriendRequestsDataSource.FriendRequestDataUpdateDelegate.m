@implementation FriendRequestsDataSource.FriendRequestDataUpdateDelegate

- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4
{
  uint64_t v4;
  _TtCC12GameCenterUI24FriendRequestsDataSourceP33_EC238EB52926426EF919E35F59F47DC431FriendRequestDataUpdateDelegate *v6;

  v4 = *(_QWORD *)&a3;
  sub_1AB7DAEB8();
  v6 = self;
  sub_1AB7AD410(v4);

  swift_bridgeObjectRelease();
}

- (void)dealloc
{
  _TtCC12GameCenterUI24FriendRequestsDataSourceP33_EC238EB52926426EF919E35F59F47DC431FriendRequestDataUpdateDelegate *v2;

  v2 = self;
  sub_1AB4A5D94();
}

- (void).cxx_destruct
{
  swift_release();
}

- (_TtCC12GameCenterUI24FriendRequestsDataSourceP33_EC238EB52926426EF919E35F59F47DC431FriendRequestDataUpdateDelegate)init
{
  sub_1AB7AD4EC();
}

@end
