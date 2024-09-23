@implementation ActivityAuthorizationClient

- (_TtC11ActivityKit27ActivityAuthorizationClient)init
{
  return (_TtC11ActivityKit27ActivityAuthorizationClient *)sub_232E1492C();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();

}

- (void)activityAuthorizationLevelDidChangeForBundleIdentifier:(id)a3 authorizationCount:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC11ActivityKit27ActivityAuthorizationClient *v10;

  v6 = sub_232E6F1EC();
  v8 = v7;
  v9 = a4;
  v10 = self;
  sub_232E166DC(v6, v8, v9);

  swift_bridgeObjectRelease();
}

- (void)activityAuthorizationDidChangeWithOptions:(id)a3
{
  id v4;
  _TtC11ActivityKit27ActivityAuthorizationClient *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  _BYTE v10[2];

  v4 = a3;
  v5 = self;
  v6 = sub_232E6EE44();
  v8 = v7;

  v9 = (void *)sub_232E6EE2C();
  sub_232E1408C((uint64_t)v9, v10);

  sub_232E6EF94();
  sub_232DE8D98(v6, v8);

}

- (void)frequentUpdatesAuthorizationDidChangeWithOptions:(id)a3
{
  id v4;
  _TtC11ActivityKit27ActivityAuthorizationClient *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  _BYTE v10[2];

  v4 = a3;
  v5 = self;
  v6 = sub_232E6EE44();
  v8 = v7;

  v9 = (void *)sub_232E6EE2C();
  sub_232E1408C((uint64_t)v9, v10);

  sub_232E6EF94();
  sub_232DE8D98(v6, v8);

}

@end
