@implementation JSTimeoutManager

- (void)setTimeout:(id)a3 :(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC19AppStoreKitInternal16JSTimeoutManager *v10;

  v6 = sub_1D892ADB4();
  v8 = v7;
  v9 = a3;
  v10 = self;
  sub_1D833C554(v9, v6, v8);

  swift_bridgeObjectRelease();
}

- (_TtC19AppStoreKitInternal16JSTimeoutManager)init
{
  return (_TtC19AppStoreKitInternal16JSTimeoutManager *)sub_1D834A654();
}

- (id)makePromise:(id)a3 :(id)a4
{
  id v6;
  _TtC19AppStoreKitInternal16JSTimeoutManager *v7;
  void *v8;
  void *v9;

  sub_1D892ADB4();
  sub_1D832F5B8(0, (unint64_t *)&qword_1EDA3AFB0);
  v6 = a4;
  v7 = self;
  v8 = (void *)sub_1D892B870();
  v9 = (void *)sub_1D892B87C();

  swift_bridgeObjectRelease();
  return v9;
}

- (void).cxx_destruct
{

  swift_release();
}

@end
