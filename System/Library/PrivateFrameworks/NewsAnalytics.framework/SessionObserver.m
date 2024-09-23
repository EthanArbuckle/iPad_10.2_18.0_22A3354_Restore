@implementation SessionObserver

- (NSString)sceneSessionIdentifier
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR____TtC13NewsAnalytics15SessionObserver_sceneSessionIdentifier;
  swift_beginAccess();
  if (!*((_QWORD *)v2 + 1))
    return (NSString *)0;
  swift_bridgeObjectRetain();
  v3 = (void *)sub_1D5AAE7FC();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)sessionDidStartWithSessionID:(id)a3 sourceApplication:(id)a4 url:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  _TtC13NewsAnalytics15SessionObserver *v18;
  uint64_t v19;

  sub_1D57B1F4C(0, (unint64_t *)&qword_1ED9C6F30, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v19 - v9;
  v11 = sub_1D5AAE820();
  v13 = v12;
  if (!a4)
  {
    v14 = 0;
    if (a5)
      goto LABEL_3;
LABEL_5:
    v17 = sub_1D5AAD668();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v10, 1, 1, v17);
    goto LABEL_6;
  }
  v14 = sub_1D5AAE820();
  a4 = v15;
  if (!a5)
    goto LABEL_5;
LABEL_3:
  sub_1D5AAD650();
  v16 = sub_1D5AAD668();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v10, 0, 1, v16);
LABEL_6:
  v18 = self;
  SessionObserver.sessionDidStart(withSessionID:sourceApplication:url:)(v11, v13, v14, (uint64_t)a4, (uint64_t)v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1D57C03D0((uint64_t)v10, (unint64_t *)&qword_1ED9C6F30, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8]);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  _TtC13NewsAnalytics15SessionObserver *v14;
  void *v15;
  id v16;
  _TtC13NewsAnalytics15SessionObserver *v17;
  _OWORD v18[2];

  if (a3)
  {
    v10 = sub_1D5AAE820();
    v12 = v11;
    if (a4)
      goto LABEL_3;
LABEL_6:
    memset(v18, 0, sizeof(v18));
    v16 = a5;
    v17 = self;
    if (a5)
      goto LABEL_4;
LABEL_7:
    v15 = 0;
    goto LABEL_8;
  }
  v10 = 0;
  v12 = 0;
  if (!a4)
    goto LABEL_6;
LABEL_3:
  swift_unknownObjectRetain();
  v13 = a5;
  v14 = self;
  sub_1D5AAEB20();
  swift_unknownObjectRelease();
  if (!a5)
    goto LABEL_7;
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0);
  sub_1D57C5A30();
  v15 = (void *)sub_1D5AAE790();

LABEL_8:
  SessionObserver.observeValue(forKeyPath:of:change:context:)(v10, v12, (uint64_t)v18, v15, (uint64_t)a6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1D57C5484((uint64_t)v18);
}

- (void)pushOrientationData
{
  _TtC13NewsAnalytics15SessionObserver *v2;

  v2 = self;
  sub_1D57BBBE8();

}

- (void)bundleSubscriptionDidExpire:(id)a3
{
  id v4;
  _TtC13NewsAnalytics15SessionObserver *v5;

  v4 = a3;
  v5 = self;
  _s13NewsAnalytics15SessionObserverC27bundleSubscriptionDidExpireyySo08FCBundleF0CF_0(v4);

}

- (void)bundleSubscriptionDidChange:(id)a3 previousBundleSubscription:(id)a4
{
  id v6;
  id v7;
  _TtC13NewsAnalytics15SessionObserver *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  _s13NewsAnalytics15SessionObserverC27bundleSubscriptionDidExpireyySo08FCBundleF0CF_0(v6);

}

- (void)configurationManagerScienceExperimentFieldsDidChange:(id)a3
{
  _TtC13NewsAnalytics15SessionObserver *v5;
  id v6;
  id v7;
  uint64_t v8;
  _TtC13NewsAnalytics15SessionObserver *v9;

  swift_unknownObjectRetain();
  v5 = self;
  v6 = objc_msgSend(a3, sel_configuration);
  if (v6)
  {
    v7 = v6;
    v8 = swift_allocObject();
    *(_QWORD *)(v8 + 16) = v5;
    *(_QWORD *)(v8 + 24) = v7;
    v9 = v5;
    swift_unknownObjectRetain();
    sub_1D5AADB9C();
    swift_unknownObjectRelease();

    swift_unknownObjectRelease();
    swift_release();
  }
  else
  {
    __break(1u);
  }
}

- (void)pushContentEnvironmentData
{
  _TtC13NewsAnalytics15SessionObserver *v2;

  v2 = self;
  sub_1D57BCFA8();

}

- (void)familySharingStatusDidChange:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC13NewsAnalytics15SessionObserver *v8;
  uint64_t v9;

  v4 = sub_1D5AAD530();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D5AAD518();
  v8 = self;
  sub_1D588E7B8();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)contentSizeCategoryDidChange
{
  void *v3;
  id v4;
  void *v5;
  unsigned __int8 v6;
  _TtC13NewsAnalytics15SessionObserver *v7;
  _TtC13NewsAnalytics15SessionObserver *v8;

  v3 = (void *)objc_opt_self();
  v8 = self;
  v4 = objc_msgSend(v3, sel_sharedConnection);
  if (v4
    && (v5 = v4,
        v6 = objc_msgSend(v4, sel_isDiagnosticSubmissionAllowed),
        v5,
        (v6 & 1) != 0))
  {
    *(_QWORD *)(swift_allocObject() + 16) = v8;
    v7 = v8;
    sub_1D5AAE31C();

    swift_release();
  }
  else
  {

  }
}

- (void)dealloc
{
  _TtC13NewsAnalytics15SessionObserver *v2;

  v2 = self;
  SessionObserver.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC13NewsAnalytics15SessionObserver_aggregateStateModeProvider);

  swift_unknownObjectRelease();
  sub_1D57BCEB4((uint64_t)self + OBJC_IVAR____TtC13NewsAnalytics15SessionObserver_appExtensionCommunicator);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC13NewsAnalytics15SessionObserver_tabiDataProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC13NewsAnalytics15SessionObserver_liveActivityCountDataProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC13NewsAnalytics15SessionObserver_userEmbeddingDataProvider);
  swift_release();
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
}

- (void)setSceneSessionIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  if (a3)
  {
    v4 = sub_1D5AAE820();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC13NewsAnalytics15SessionObserver_sceneSessionIdentifier);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (_TtC13NewsAnalytics15SessionObserver)init
{
  _TtC13NewsAnalytics15SessionObserver *result;

  result = (_TtC13NewsAnalytics15SessionObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)sessionWillEndWithEndReason:(id)a3
{
  id v4;
  _TtC13NewsAnalytics15SessionObserver *v5;

  v4 = a3;
  v5 = self;
  SessionObserver.sessionWillEnd(withEndReason:)((NSNumber)v4);

}

- (void)networkReachabilityConnectivityDidChange:(id)a3
{
  _TtC13NewsAnalytics15SessionObserver *v4;

  *(_QWORD *)(swift_allocObject() + 16) = a3;
  swift_unknownObjectRetain_n();
  v4 = self;
  sub_1D5AADF5C();
  swift_unknownObjectRelease();

  swift_release();
}

- (void)pushUserSubscriptionContextData
{
  _TtC13NewsAnalytics15SessionObserver *v2;

  v2 = self;
  sub_1D57BC4D0();

}

- (void)userInfoDidChangeFeldsparID:(id)a3 fromCloud:(BOOL)a4
{
  sub_1D59C630C(self, (uint64_t)a2, a3);
}

- (void)userInfoDidChangeAdsUserID:(id)a3 fromCloud:(BOOL)a4
{
  sub_1D59C630C(self, (uint64_t)a2, a3);
}

- (void)userInfoDidChangePuzzleNotificationsEnabled:(id)a3 fromCloud:(BOOL)a4
{
  id v5;
  _TtC13NewsAnalytics15SessionObserver *v6;

  v5 = a3;
  v6 = self;
  SessionObserver.pushNotificationSettingsData()();

}

- (void)newsletterSubscriptionChangedFromSubscription:(int64_t)a3
{
  _TtC13NewsAnalytics15SessionObserver *v3;

  v3 = self;
  SessionObserver.pushNotificationSettingsData()();

}

- (void)offerDidChange:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC13NewsAnalytics15SessionObserver *v8;
  uint64_t v9;

  v4 = sub_1D5AAD530();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D5AAD518();
  v8 = self;
  sub_1D5A45760();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)subscriptionController:(id)a3 didAddTags:(id)a4 changeTags:(id)a5 moveTags:(id)a6 removeTags:(id)a7 subscriptionType:(unint64_t)a8
{
  id v13;
  _TtC13NewsAnalytics15SessionObserver *v14;
  _TtC13NewsAnalytics15SessionObserver *v15;
  id v16;

  if (a4)
  {
    sub_1D5AAE994();
    if (!a5)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (a5)
LABEL_3:
    sub_1D5AAE994();
LABEL_4:
  if (a6)
    sub_1D5AAE994();
  if (a7)
    sub_1D5AAE994();
  v13 = a3;
  v14 = self;
  if (v13)
  {
    v15 = v14;
    v16 = objc_msgSend(*(id *)((char *)&v14->super.isa + OBJC_IVAR____TtC13NewsAnalytics15SessionObserver_cloudContext), sel_shortcutList);
    sub_1D57BE8B8(v13, v16);

    sub_1D57BE2DC(v13);
    sub_1D57BDDE4(v13);
    SessionObserver.pushNotificationSettingsData()();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

- (void)shortcutList:(id)a3 didAddShortcuts:(id)a4 changedShortcuts:(id)a5 removedShortcuts:(id)a6
{
  void *v7;
  id v8;
  _TtC13NewsAnalytics15SessionObserver *v9;
  id v10;
  id v11;

  v7 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13NewsAnalytics15SessionObserver_cloudContext);
  v8 = a3;
  v9 = self;
  v10 = objc_msgSend(v7, sel_subscriptionController);
  if (v10)
  {
    v11 = v10;
    sub_1D57BE8B8(v10, v8);

  }
  else
  {
    __break(1u);
  }
}

@end
