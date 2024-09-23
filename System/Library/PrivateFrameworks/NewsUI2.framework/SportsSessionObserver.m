@implementation SportsSessionObserver

- (void)userInfoDidChangeSportsUserID:(id)a3
{
  id v4;
  _TtC7NewsUI221SportsSessionObserver *v5;

  v4 = a3;
  v5 = self;
  sub_1D5EA11E8(v4);
  sub_1D5EA6244(v4);

}

- (_TtC7NewsUI221SportsSessionObserver)init
{
  _TtC7NewsUI221SportsSessionObserver *result;

  result = (_TtC7NewsUI221SportsSessionObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI221SportsSessionObserver_aggregateStateModeProvider);
  swift_unknownObjectRelease();

  swift_release();
}

- (void)bundleSubscriptionDidChange:(id)a3 previousBundleSubscription:(id)a4
{
  id v6;
  id v7;
  _TtC7NewsUI221SportsSessionObserver *v8;
  id v9;
  id v10;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1D6E169B8();
  *(_QWORD *)(swift_allocObject() + 16) = v6;
  v9 = v6;
  sub_1D6E16C04();
  swift_release();
  swift_release();
  *(_QWORD *)(swift_allocObject() + 16) = v9;
  v10 = v9;
  sub_1D6E16970();

  swift_release();
}

- (void)bundleSubscriptionDidExpire:(id)a3
{
  sub_1D66F489C(self, (uint64_t)a2, a3);
}

- (void)bundleSubscriptionDidSubscribe:(id)a3
{
  sub_1D66F489C(self, (uint64_t)a2, a3);
}

- (void)pushUserSubscriptionContextData
{
  _TtC7NewsUI221SportsSessionObserver *v2;

  v2 = self;
  sub_1D5E9D198();

}

- (void)subscriptionController:(id)a3 didAddTags:(id)a4 changeTags:(id)a5 moveTags:(id)a6 removeTags:(id)a7 subscriptionType:(unint64_t)a8
{
  id v13;
  _TtC7NewsUI221SportsSessionObserver *v14;
  _TtC7NewsUI221SportsSessionObserver *v15;
  id v16;

  if (a4)
  {
    sub_1D6E27038();
    if (!a5)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (a5)
LABEL_3:
    sub_1D6E27038();
LABEL_4:
  if (a6)
    sub_1D6E27038();
  if (a7)
    sub_1D6E27038();
  v13 = a3;
  v14 = self;
  if (v13)
  {
    v15 = v14;
    sub_1D6E169B8();
    *(_QWORD *)(swift_allocObject() + 16) = v13;
    v16 = v13;
    sub_1D6E16C04();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
  }
  else
  {
    __break(1u);
  }
}

@end
