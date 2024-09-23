@implementation GameCenterFriendRequestCoordinator

- (_TtC19AppStoreKitInternal34GameCenterFriendRequestCoordinator)init
{
  uint64_t v3;
  _TtC19AppStoreKitInternal34GameCenterFriendRequestCoordinator *v4;
  objc_super v6;

  v3 = OBJC_IVAR____TtC19AppStoreKitInternal34GameCenterFriendRequestCoordinator_onFriendRequestCountDidUpdate;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDA48F30);
  swift_allocObject();
  v4 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)sub_1D892AC1C();
  *(Class *)((char *)&v4->super.isa
           + OBJC_IVAR____TtC19AppStoreKitInternal34GameCenterFriendRequestCoordinator_currentFriendRequestCount) = 0;

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for GameCenterFriendRequestCoordinator();
  return -[GameCenterFriendRequestCoordinator init](&v6, sel_init);
}

- (void)dealloc
{
  void *v3;
  _TtC19AppStoreKitInternal34GameCenterFriendRequestCoordinator *v4;
  id v5;
  objc_super v6;

  v3 = (void *)objc_opt_self();
  v4 = self;
  v5 = objc_msgSend(v3, sel_defaultCenter);
  objc_msgSend(v5, sel_removeObserver_, v4);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for GameCenterFriendRequestCoordinator();
  -[GameCenterFriendRequestCoordinator dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_release();
}

- (void)accountsDidChangeWithNotification:(id)a3
{
  id v4;
  _TtC19AppStoreKitInternal34GameCenterFriendRequestCoordinator *v5;

  v4 = a3;
  v5 = self;
  sub_1D858D6E8(v4);

}

- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4
{
  _TtC19AppStoreKitInternal34GameCenterFriendRequestCoordinator *v5;

  v5 = self;
  sub_1D858DAB4(a3);

}

@end
