@implementation FriendsFeedPresenter

- (_TtC12GameCenterUI20FriendsFeedPresenter)initWithGame:(id)a3
{
  id v4;

  v4 = a3;
  return (_TtC12GameCenterUI20FriendsFeedPresenter *)sub_1AB534160(a3);
}

- (void)updateSnapshot
{
  _TtC12GameCenterUI20FriendsFeedPresenter *v2;

  v2 = self;
  sub_1AB535424();

}

- (void)loadMoreActivityFeedWithContinuationToken:(id)a3
{
  _TtC12GameCenterUI20FriendsFeedPresenter *v4;

  sub_1AB7DAF90();
  v4 = self;
  sub_1AB53558C();

  swift_bridgeObjectRelease();
}

- (_TtC12GameCenterUI20FriendsFeedPresenter)initWithPlayerId:(id)a3
{
  if (a3)
    sub_1AB7DAF90();
  sub_1AB53563C();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1AB473FBC((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI20FriendsFeedPresenter_requiredData, &qword_1EEBFC5B0);

  swift_release();
}

@end
