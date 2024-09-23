@implementation FriendRequestFacilitator

- (_TtC12GameCenterUI24FriendRequestFacilitator)init
{
  return (_TtC12GameCenterUI24FriendRequestFacilitator *)FriendRequestFacilitator.init()();
}

+ (void)makeViewControllerWithRecipients:(NSArray *)a3 chatGUID:(NSString *)a4 completionHandler:(id)a5
{
  void *v8;
  _QWORD *v9;
  NSArray *v10;
  NSString *v11;

  v8 = _Block_copy(a5);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = a1;
  v10 = a3;
  v11 = a4;
  sub_1AB6D6684((uint64_t)&unk_1EEC0F530, (uint64_t)v9);
}

+ (void)makeViewControllerForRemoteInviteWithRecipients:(id)a3 chatGUID:(id)a4 resultHandler:(id)a5
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v6 = _Block_copy(a5);
  sub_1AB476E40(0, (unint64_t *)&qword_1EEC044F0);
  v7 = sub_1AB7DB0EC();
  if (a4)
  {
    v8 = sub_1AB7DAF90();
    a4 = v9;
  }
  else
  {
    v8 = 0;
  }
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v6;
  swift_getObjCClassMetadata();
  static FriendRequestFacilitator.makeViewControllerForRemoteInvite(recipients:chatGUID:resultHandler:)(v7, v8, (uint64_t)a4, (uint64_t)sub_1AB6D984C, v10);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
