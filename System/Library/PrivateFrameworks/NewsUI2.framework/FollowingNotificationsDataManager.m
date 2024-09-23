@implementation FollowingNotificationsDataManager

- (void)determineSystemNotificationSettingsStatus
{
  _TtC7NewsUI233FollowingNotificationsDataManager *v3;
  void *v4;
  void *v5;

  swift_getObjectType();
  type metadata accessor for NotificationSettings();
  v3 = self;
  sub_1D6E1AE1C();
  v4 = (void *)sub_1D6E1AB4C();
  sub_1D6E1AC3C();
  swift_release();

  v5 = (void *)sub_1D6E1AB4C();
  sub_1D6E1AC6C();

  swift_release();
  swift_release();

}

- (_TtC7NewsUI233FollowingNotificationsDataManager)init
{
  _TtC7NewsUI233FollowingNotificationsDataManager *result;

  result = (_TtC7NewsUI233FollowingNotificationsDataManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1D5FF43C0((uint64_t)self + OBJC_IVAR____TtC7NewsUI233FollowingNotificationsDataManager_delegate);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI233FollowingNotificationsDataManager_notificationService);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI233FollowingNotificationsDataManager_sportsOnboardingManager);
}

- (void)userInfoDidChangeMarketingNotificationsEnabled:(id)a3 fromCloud:(BOOL)a4
{
  id v5;
  _TtC7NewsUI233FollowingNotificationsDataManager *v6;

  v5 = a3;
  v6 = self;
  sub_1D66C2558(v5);

}

- (void)userInfoDidChangeNewIssueNotificationsEnabled:(id)a3 fromCloud:(BOOL)a4
{
  id v5;
  _TtC7NewsUI233FollowingNotificationsDataManager *v6;

  v5 = a3;
  v6 = self;
  sub_1D66C2664(v5);

}

- (void)userInfoDidChangeEndOfAudioTrackNotificationsEnabled:(id)a3 fromCloud:(BOOL)a4
{
  id v5;
  _TtC7NewsUI233FollowingNotificationsDataManager *v6;

  v5 = a3;
  v6 = self;
  sub_1D66C2770(v5);

}

- (void)userInfoDidChangePuzzleNotificationsEnabled:(id)a3 fromCloud:(BOOL)a4
{
  id v6;
  _TtC7NewsUI233FollowingNotificationsDataManager *v7;

  v6 = a3;
  v7 = self;
  sub_1D66C1BB0(v6, a4);

}

- (void)userInfoDidChangeSportsTopicNotificationsEnabledState:(id)a3 fromCloud:(BOOL)a4
{
  id v5;
  _TtC7NewsUI233FollowingNotificationsDataManager *v6;

  v5 = a3;
  v6 = self;
  sub_1D66C29B4(v5);

}

- (void)newsletterSubscriptionChangedFromSubscription:(int64_t)a3
{
  char *v4;
  uint64_t v5;
  void (*v6)(void);
  _TtC7NewsUI233FollowingNotificationsDataManager *v7;

  v4 = (char *)self + OBJC_IVAR____TtC7NewsUI233FollowingNotificationsDataManager_delegate;
  if (MEMORY[0x1D82919D4]((char *)self + OBJC_IVAR____TtC7NewsUI233FollowingNotificationsDataManager_delegate, a2, a3))
  {
    v5 = *((_QWORD *)v4 + 1);
    swift_getObjectType();
    v6 = *(void (**)(void))(v5 + 24);
    v7 = self;
    v6();

    swift_unknownObjectRelease();
  }
}

@end
