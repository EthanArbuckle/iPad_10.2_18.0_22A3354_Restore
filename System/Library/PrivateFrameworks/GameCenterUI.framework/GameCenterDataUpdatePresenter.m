@implementation GameCenterDataUpdatePresenter

- (_TtC12GameCenterUI29GameCenterDataUpdatePresenter)init
{
  return (_TtC12GameCenterUI29GameCenterDataUpdatePresenter *)sub_1AB57E1EC();
}

- (void)dealloc
{
  _TtC12GameCenterUI29GameCenterDataUpdatePresenter *v2;

  v2 = self;
  sub_1AB57E3E4();
}

- (void).cxx_destruct
{
  swift_release();
}

- (void)refreshFriendContents:(id)a3
{
  id v4;
  _TtC12GameCenterUI29GameCenterDataUpdatePresenter *v5;

  v4 = a3;
  v5 = self;
  sub_1AB57E4C0();

}

- (void)refreshFriendSuggestionContents:(id)a3
{
  id v4;
  _TtC12GameCenterUI29GameCenterDataUpdatePresenter *v5;

  v4 = a3;
  v5 = self;
  sub_1AB57E55C(v4);

}

- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4
{
  uint64_t v6;
  _TtC12GameCenterUI29GameCenterDataUpdatePresenter *v7;

  v6 = sub_1AB7DAEB8();
  v7 = self;
  sub_1AB57E608(a3, v6);

  swift_bridgeObjectRelease();
}

@end
