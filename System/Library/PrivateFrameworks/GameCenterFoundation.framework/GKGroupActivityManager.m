@implementation GKGroupActivityManager

- (_TtC20GameCenterFoundation22GKGroupActivityManager)initWithMatchmakingSupport:(id)a3
{
  swift_unknownObjectRetain();
  return (_TtC20GameCenterFoundation22GKGroupActivityManager *)GKGroupActivityManager.init(matchmakingSupport:)((uint64_t)a3);
}

- (BOOL)isEligibleForGroupSession
{
  _TtC20GameCenterFoundation22GKGroupActivityManager *v2;
  char v3;

  v2 = self;
  v3 = sub_1BCEAC7F0();

  return v3 & 1;
}

- (void)applicationWillTerminate
{
  _TtC20GameCenterFoundation22GKGroupActivityManager *v2;

  v2 = self;
  sub_1BCEAC84C();

}

- (void)activateWithGame:(GKGame *)a3 completionHandler:(id)a4
{
  sub_1BCEB16FC(self, (int)a2, a3, a4);
}

- (void)startLookingForSessions
{
  _TtC20GameCenterFoundation22GKGroupActivityManager *v2;

  v2 = self;
  sub_1BCEAD8B4();

}

- (void)startGame
{
  _TtC20GameCenterFoundation22GKGroupActivityManager *v2;

  v2 = self;
  sub_1BCEADA94();

}

- (id)sharingControllerItemProviderWithGame:(id)a3 error:(id *)a4
{
  id v5;
  _TtC20GameCenterFoundation22GKGroupActivityManager *v6;
  id v7;

  v5 = a3;
  v6 = self;
  v7 = sub_1BCEAE26C(v5);

  return v7;
}

- (void)endWithCompletionHandler:(id)a3
{
  sub_1BCEB0AA8(self, (int)a2, a3);
}

- (void)leaveWithCompletionHandler:(id)a3
{
  sub_1BCEB0AA8(self, (int)a2, a3);
}

- (void)resetWithCompletionHandler:(id)a3
{
  sub_1BCEB0AA8(self, (int)a2, a3);
}

- (void)update
{
  _TtC20GameCenterFoundation22GKGroupActivityManager *v2;

  v2 = self;
  sub_1BCEB0B5C();

}

- (void)playerDisconnectWithPlayer:(GKPlayer *)a3 completionHandler:(id)a4
{
  sub_1BCEB16FC(self, (int)a2, a3, a4);
}

- (_TtC20GameCenterFoundation22GKGroupActivityManager)init
{
  GKGroupActivityManager.init()();
}

- (void).cxx_destruct
{
  sub_1BCEB8864((uint64_t)self + OBJC_IVAR____TtC20GameCenterFoundation22GKGroupActivityManager_matchmakingSupport);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC20GameCenterFoundation22GKGroupActivityManager_managerSupport);
  OUTLINED_FUNCTION_251();
  sub_1BCEB8B14((uint64_t)self + OBJC_IVAR____TtC20GameCenterFoundation22GKGroupActivityManager_groupSession, &qword_1EF499980);
  sub_1BCEB8B14((uint64_t)self + OBJC_IVAR____TtC20GameCenterFoundation22GKGroupActivityManager_messenger, &qword_1EF4999A0);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20GameCenterFoundation22GKGroupActivityManager_previousMatchRequest));
  OUTLINED_FUNCTION_251();
  OUTLINED_FUNCTION_251();
  sub_1BCEAC4A4(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC20GameCenterFoundation22GKGroupActivityManager_cachedDevicePushToken), *(_QWORD *)&self->matchmakingSupport[OBJC_IVAR____TtC20GameCenterFoundation22GKGroupActivityManager_cachedDevicePushToken]);
}

@end
