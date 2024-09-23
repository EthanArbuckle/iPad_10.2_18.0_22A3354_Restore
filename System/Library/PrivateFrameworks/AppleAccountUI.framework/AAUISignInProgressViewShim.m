@implementation AAUISignInProgressViewShim

+ (id)newSignInProgressViewWithFullName:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  void *v9;

  swift_getObjCClassMetadata();
  v3 = a3;
  v6 = sub_1DB62FCE0();
  v7 = v4;
  swift_getObjCClassMetadata();
  v9 = (void *)sub_1DB584B60(v6, v7);
  swift_bridgeObjectRelease();

  return v9;
}

+ (id)newSignInProgressViewWithFullName:(id)a3 forAccount:(id)a4
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  void *v12;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = a4;
  v8 = sub_1DB62FCE0();
  v9 = v6;
  swift_getObjCClassMetadata();
  v12 = (void *)sub_1DB584CC8(v8, v9, a4);
  swift_bridgeObjectRelease();

  return v12;
}

- (AAUISignInProgressViewShim)init
{
  return (AAUISignInProgressViewShim *)SignInProgressViewShim.init()();
}

@end
